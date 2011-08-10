
.namespace []
.sub "_block1000"  :anon :subid("10_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313007597.81655" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313007597.81655" 
    capture_lex $P1003
    $P106 = $P1003()
.annotate 'line', 1
    .return ($P106)
    .const 'Sub' $P2069 = "114_1313007597.81655" 
    .return ($P2069)
.end


.namespace []
.sub "" :load :init :subid("post115") :outer("10_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313007597.81655" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2071 = get_root_global ["parrot"], "P6metaclass"
    new $P101, "ResizablePMCArray"
    push $P101, "%!symtable"
    $P2071."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P101 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1313007597.81655") :outer("10_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1944 = "111_1313007597.81655" 
    capture_lex $P1944
    .const 'Sub' $P1927 = "108_1313007597.81655" 
    capture_lex $P1927
    .const 'Sub' $P1906 = "106_1313007597.81655" 
    capture_lex $P1906
    .const 'Sub' $P1901 = "105_1313007597.81655" 
    capture_lex $P1901
    .const 'Sub' $P1895 = "104_1313007597.81655" 
    capture_lex $P1895
    .const 'Sub' $P1873 = "102_1313007597.81655" 
    capture_lex $P1873
    .const 'Sub' $P1851 = "99_1313007597.81655" 
    capture_lex $P1851
    .const 'Sub' $P1836 = "98_1313007597.81655" 
    capture_lex $P1836
    .const 'Sub' $P1820 = "96_1313007597.81655" 
    capture_lex $P1820
    .const 'Sub' $P1804 = "94_1313007597.81655" 
    capture_lex $P1804
    .const 'Sub' $P1745 = "88_1313007597.81655" 
    capture_lex $P1745
    .const 'Sub' $P1729 = "87_1313007597.81655" 
    capture_lex $P1729
    .const 'Sub' $P1719 = "86_1313007597.81655" 
    capture_lex $P1719
    .const 'Sub' $P1707 = "85_1313007597.81655" 
    capture_lex $P1707
    .const 'Sub' $P1688 = "83_1313007597.81655" 
    capture_lex $P1688
    .const 'Sub' $P1676 = "82_1313007597.81655" 
    capture_lex $P1676
    .const 'Sub' $P1651 = "79_1313007597.81655" 
    capture_lex $P1651
    .const 'Sub' $P1632 = "78_1313007597.81655" 
    capture_lex $P1632
    .const 'Sub' $P1618 = "76_1313007597.81655" 
    capture_lex $P1618
    .const 'Sub' $P1613 = "75_1313007597.81655" 
    capture_lex $P1613
    .const 'Sub' $P1608 = "74_1313007597.81655" 
    capture_lex $P1608
    .const 'Sub' $P1593 = "72_1313007597.81655" 
    capture_lex $P1593
    .const 'Sub' $P1566 = "70_1313007597.81655" 
    capture_lex $P1566
    .const 'Sub' $P1561 = "69_1313007597.81655" 
    capture_lex $P1561
    .const 'Sub' $P1556 = "68_1313007597.81655" 
    capture_lex $P1556
    .const 'Sub' $P1551 = "67_1313007597.81655" 
    capture_lex $P1551
    .const 'Sub' $P1528 = "66_1313007597.81655" 
    capture_lex $P1528
    .const 'Sub' $P1497 = "65_1313007597.81655" 
    capture_lex $P1497
    .const 'Sub' $P1492 = "64_1313007597.81655" 
    capture_lex $P1492
    .const 'Sub' $P1443 = "60_1313007597.81655" 
    capture_lex $P1443
    .const 'Sub' $P1438 = "59_1313007597.81655" 
    capture_lex $P1438
    .const 'Sub' $P1413 = "57_1313007597.81655" 
    capture_lex $P1413
    .const 'Sub' $P1391 = "56_1313007597.81655" 
    capture_lex $P1391
    .const 'Sub' $P1374 = "55_1313007597.81655" 
    capture_lex $P1374
    .const 'Sub' $P1271 = "45_1313007597.81655" 
    capture_lex $P1271
    .const 'Sub' $P1235 = "41_1313007597.81655" 
    capture_lex $P1235
    .const 'Sub' $P1221 = "40_1313007597.81655" 
    capture_lex $P1221
    .const 'Sub' $P1202 = "38_1313007597.81655" 
    capture_lex $P1202
    .const 'Sub' $P1190 = "37_1313007597.81655" 
    capture_lex $P1190
    .const 'Sub' $P1185 = "36_1313007597.81655" 
    capture_lex $P1185
    .const 'Sub' $P1180 = "35_1313007597.81655" 
    capture_lex $P1180
    .const 'Sub' $P1173 = "34_1313007597.81655" 
    capture_lex $P1173
    .const 'Sub' $P1166 = "33_1313007597.81655" 
    capture_lex $P1166
    .const 'Sub' $P1160 = "32_1313007597.81655" 
    capture_lex $P1160
    .const 'Sub' $P1154 = "31_1313007597.81655" 
    capture_lex $P1154
    .const 'Sub' $P1149 = "30_1313007597.81655" 
    capture_lex $P1149
    .const 'Sub' $P1142 = "29_1313007597.81655" 
    capture_lex $P1142
    .const 'Sub' $P1088 = "22_1313007597.81655" 
    capture_lex $P1088
    .const 'Sub' $P1083 = "21_1313007597.81655" 
    capture_lex $P1083
    .const 'Sub' $P1069 = "20_1313007597.81655" 
    capture_lex $P1069
    .const 'Sub' $P1060 = "19_1313007597.81655" 
    capture_lex $P1060
    .const 'Sub' $P1052 = "18_1313007597.81655" 
    capture_lex $P1052
    .const 'Sub' $P1046 = "17_1313007597.81655" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "16_1313007597.81655" 
    capture_lex $P1039
    .const 'Sub' $P1022 = "14_1313007597.81655" 
    capture_lex $P1022
    .const 'Sub' $P1009 = "12_1313007597.81655" 
    capture_lex $P1009
.annotate 'line', 43
    get_global $P1004, "%piropsig"
    unless_null $P1004, vivify_208
    $P1004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1004
  vivify_208:
.annotate 'line', 44
    get_global $P1005, "%valflags"
    unless_null $P1005, vivify_209
    $P1005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1005
  vivify_209:
.annotate 'line', 45
    get_global $P1006, "%controltypes"
    unless_null $P1006, vivify_210
    $P1006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1006
  vivify_210:
.annotate 'line', 46
    get_global $P100, "$serno"
    unless_null $P100, vivify_211
    new $P100, "Undef"
    set_global "$serno", $P100
  vivify_211:
.annotate 'line', 49
    get_global $P101, "$TEMPREG_BASE"
    unless_null $P101, vivify_212
    new $P101, "Undef"
    set_global "$TEMPREG_BASE", $P101
  vivify_212:
.annotate 'line', 50
    get_global $P102, "$UNIQUE_BASE"
    unless_null $P102, vivify_213
    new $P102, "Undef"
    set_global "$UNIQUE_BASE", $P102
  vivify_213:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_214
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_214:
.annotate 'line', 967
    .const 'Sub' $P1009 = "12_1313007597.81655" 
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
.annotate 'line', 1998
    .const 'Sub' $P1944 = "111_1313007597.81655" 
    newclosure $P1973, $P1944
.annotate 'line', 41
    .return ($P1973)
    .const 'Sub' $P1975 = "113_1313007597.81655" 
    .return ($P1975)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post116") :outer("11_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1313007597.81655" 
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
    get_global $P1977, "%piropsig"
    unless_null $P1977, vivify_117
    $P1977 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1977
  vivify_117:
    set $P1977["add"], $P106
.annotate 'line', 59
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1978, "%piropsig"
    unless_null $P1978, vivify_118
    $P1978 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1978
  vivify_118:
    set $P1978["band"], $P106
.annotate 'line', 60
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1979, "%piropsig"
    unless_null $P1979, vivify_119
    $P1979 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1979
  vivify_119:
    set $P1979["bxor"], $P106
.annotate 'line', 61
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1980, "%piropsig"
    unless_null $P1980, vivify_120
    $P1980 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1980
  vivify_120:
    set $P1980["bnot"], $P106
.annotate 'line', 62
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1981, "%piropsig"
    unless_null $P1981, vivify_121
    $P1981 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1981
  vivify_121:
    set $P1981["bor"], $P106
.annotate 'line', 63
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P1982, "%piropsig"
    unless_null $P1982, vivify_122
    $P1982 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1982
  vivify_122:
    set $P1982["can"], $P106
.annotate 'line', 64
    new $P106, "String"
    assign $P106, "Si"
    get_global $P1983, "%piropsig"
    unless_null $P1983, vivify_123
    $P1983 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1983
  vivify_123:
    set $P1983["chr"], $P106
.annotate 'line', 65
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1984, "%piropsig"
    unless_null $P1984, vivify_124
    $P1984 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1984
  vivify_124:
    set $P1984["clone"], $P106
.annotate 'line', 66
    new $P106, "String"
    assign $P106, "PP~"
    get_global $P1985, "%piropsig"
    unless_null $P1985, vivify_125
    $P1985 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1985
  vivify_125:
    set $P1985["concat"], $P106
.annotate 'line', 67
    new $P106, "String"
    assign $P106, "0PP"
    get_global $P1986, "%piropsig"
    unless_null $P1986, vivify_126
    $P1986 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1986
  vivify_126:
    set $P1986["copy"], $P106
.annotate 'line', 68
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1987, "%piropsig"
    unless_null $P1987, vivify_127
    $P1987 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1987
  vivify_127:
    set $P1987["defined"], $P106
.annotate 'line', 69
    new $P106, "String"
    assign $P106, "vQ*"
    get_global $P1988, "%piropsig"
    unless_null $P1988, vivify_128
    $P1988 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1988
  vivify_128:
    set $P1988["delete"], $P106
.annotate 'line', 70
    new $P106, "String"
    assign $P106, "v~"
    get_global $P1989, "%piropsig"
    unless_null $P1989, vivify_129
    $P1989 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1989
  vivify_129:
    set $P1989["die"], $P106
.annotate 'line', 71
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1990, "%piropsig"
    unless_null $P1990, vivify_130
    $P1990 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1990
  vivify_130:
    set $P1990["div"], $P106
.annotate 'line', 72
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P1991, "%piropsig"
    unless_null $P1991, vivify_131
    $P1991 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1991
  vivify_131:
    set $P1991["does"], $P106
.annotate 'line', 73
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P1992, "%piropsig"
    unless_null $P1992, vivify_132
    $P1992 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1992
  vivify_132:
    set $P1992["downcase"], $P106
.annotate 'line', 74
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1993, "%piropsig"
    unless_null $P1993, vivify_133
    $P1993 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1993
  vivify_133:
    set $P1993["elements"], $P106
.annotate 'line', 75
    new $P106, "String"
    assign $P106, "IQ*"
    get_global $P1994, "%piropsig"
    unless_null $P1994, vivify_134
    $P1994 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1994
  vivify_134:
    set $P1994["exists"], $P106
.annotate 'line', 76
    new $P106, "String"
    assign $P106, "vi"
    get_global $P1995, "%piropsig"
    unless_null $P1995, vivify_135
    $P1995 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1995
  vivify_135:
    set $P1995["exit"], $P106
.annotate 'line', 77
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1996, "%piropsig"
    unless_null $P1996, vivify_136
    $P1996 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1996
  vivify_136:
    set $P1996["fdiv"], $P106
.annotate 'line', 78
    new $P106, "String"
    assign $P106, "Is"
    get_global $P1997, "%piropsig"
    unless_null $P1997, vivify_137
    $P1997 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1997
  vivify_137:
    set $P1997["find_codepoint"], $P106
.annotate 'line', 79
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P1998, "%piropsig"
    unless_null $P1998, vivify_138
    $P1998 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1998
  vivify_138:
    set $P1998["find_dynamic_lex"], $P106
.annotate 'line', 80
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P1999, "%piropsig"
    unless_null $P1999, vivify_139
    $P1999 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1999
  vivify_139:
    set $P1999["find_name"], $P106
.annotate 'line', 81
    new $P106, "String"
    assign $P106, "P"
    get_global $P2000, "%piropsig"
    unless_null $P2000, vivify_140
    $P2000 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2000
  vivify_140:
    set $P2000["getinterp"], $P106
.annotate 'line', 82
    new $P106, "String"
    assign $P106, "P~P"
    get_global $P2001, "%piropsig"
    unless_null $P2001, vivify_141
    $P2001 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2001
  vivify_141:
    set $P2001["getprop"], $P106
.annotate 'line', 83
    new $P106, "String"
    assign $P106, "P"
    get_global $P2002, "%piropsig"
    unless_null $P2002, vivify_142
    $P2002 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2002
  vivify_142:
    set $P2002["getstderr"], $P106
.annotate 'line', 84
    new $P106, "String"
    assign $P106, "P"
    get_global $P2003, "%piropsig"
    unless_null $P2003, vivify_143
    $P2003 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2003
  vivify_143:
    set $P2003["getstdin"], $P106
.annotate 'line', 85
    new $P106, "String"
    assign $P106, "P"
    get_global $P2004, "%piropsig"
    unless_null $P2004, vivify_144
    $P2004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2004
  vivify_144:
    set $P2004["getstdout"], $P106
.annotate 'line', 86
    new $P106, "String"
    assign $P106, "Issi"
    get_global $P2005, "%piropsig"
    unless_null $P2005, vivify_145
    $P2005 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2005
  vivify_145:
    set $P2005["index"], $P106
.annotate 'line', 87
    new $P106, "String"
    assign $P106, "IP~"
    get_global $P2006, "%piropsig"
    unless_null $P2006, vivify_146
    $P2006 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2006
  vivify_146:
    set $P2006["isa"], $P106
.annotate 'line', 88
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2007, "%piropsig"
    unless_null $P2007, vivify_147
    $P2007 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2007
  vivify_147:
    set $P2007["isfalse"], $P106
.annotate 'line', 89
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2008, "%piropsig"
    unless_null $P2008, vivify_148
    $P2008 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2008
  vivify_148:
    set $P2008["isnull"], $P106
.annotate 'line', 90
    new $P106, "String"
    assign $P106, "IPP"
    get_global $P2009, "%piropsig"
    unless_null $P2009, vivify_149
    $P2009 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2009
  vivify_149:
    set $P2009["issame"], $P106
.annotate 'line', 91
    new $P106, "String"
    assign $P106, "IP"
    get_global $P2010, "%piropsig"
    unless_null $P2010, vivify_150
    $P2010 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2010
  vivify_150:
    set $P2010["istrue"], $P106
.annotate 'line', 92
    new $P106, "String"
    assign $P106, "SsP"
    get_global $P2011, "%piropsig"
    unless_null $P2011, vivify_151
    $P2011 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2011
  vivify_151:
    set $P2011["join"], $P106
.annotate 'line', 93
    new $P106, "String"
    assign $P106, "Is"
    get_global $P2012, "%piropsig"
    unless_null $P2012, vivify_152
    $P2012 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2012
  vivify_152:
    set $P2012["length"], $P106
.annotate 'line', 94
    new $P106, "String"
    assign $P106, "vs"
    get_global $P2013, "%piropsig"
    unless_null $P2013, vivify_153
    $P2013 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2013
  vivify_153:
    set $P2013["load_bytecode"], $P106
.annotate 'line', 95
    new $P106, "String"
    assign $P106, "vs"
    get_global $P2014, "%piropsig"
    unless_null $P2014, vivify_154
    $P2014 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2014
  vivify_154:
    set $P2014["load_language"], $P106
.annotate 'line', 96
    new $P106, "String"
    assign $P106, "P~"
    get_global $P2015, "%piropsig"
    unless_null $P2015, vivify_155
    $P2015 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2015
  vivify_155:
    set $P2015["loadlib"], $P106
.annotate 'line', 97
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2016, "%piropsig"
    unless_null $P2016, vivify_156
    $P2016 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2016
  vivify_156:
    set $P2016["mod"], $P106
.annotate 'line', 98
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2017, "%piropsig"
    unless_null $P2017, vivify_157
    $P2017 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2017
  vivify_157:
    set $P2017["mul"], $P106
.annotate 'line', 99
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2018, "%piropsig"
    unless_null $P2018, vivify_158
    $P2018 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2018
  vivify_158:
    set $P2018["neg"], $P106
.annotate 'line', 100
    new $P106, "String"
    assign $P106, "P~"
    get_global $P2019, "%piropsig"
    unless_null $P2019, vivify_159
    $P2019 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2019
  vivify_159:
    set $P2019["new"], $P106
.annotate 'line', 101
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2020, "%piropsig"
    unless_null $P2020, vivify_160
    $P2020 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2020
  vivify_160:
    set $P2020["newclosure"], $P106
.annotate 'line', 102
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2021, "%piropsig"
    unless_null $P2021, vivify_161
    $P2021 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2021
  vivify_161:
    set $P2021["not"], $P106
.annotate 'line', 103
    new $P106, "String"
    assign $P106, "Isi"
    get_global $P2022, "%piropsig"
    unless_null $P2022, vivify_162
    $P2022 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2022
  vivify_162:
    set $P2022["ord"], $P106
.annotate 'line', 104
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2023, "%piropsig"
    unless_null $P2023, vivify_163
    $P2023 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2023
  vivify_163:
    set $P2023["pop"], $P106
.annotate 'line', 105
    new $P106, "String"
    assign $P106, "NN+"
    get_global $P2024, "%piropsig"
    unless_null $P2024, vivify_164
    $P2024 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2024
  vivify_164:
    set $P2024["pow"], $P106
.annotate 'line', 106
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2025, "%piropsig"
    unless_null $P2025, vivify_165
    $P2025 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2025
  vivify_165:
    set $P2025["print"], $P106
.annotate 'line', 107
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2026, "%piropsig"
    unless_null $P2026, vivify_166
    $P2026 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2026
  vivify_166:
    set $P2026["printerr"], $P106
.annotate 'line', 108
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P2027, "%piropsig"
    unless_null $P2027, vivify_167
    $P2027 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2027
  vivify_167:
    set $P2027["push"], $P106
.annotate 'line', 109
    new $P106, "String"
    assign $P106, "Ssi"
    get_global $P2028, "%piropsig"
    unless_null $P2028, vivify_168
    $P2028 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2028
  vivify_168:
    set $P2028["repeat"], $P106
.annotate 'line', 110
    new $P106, "String"
    assign $P106, "Ssiis"
    get_global $P2029, "%piropsig"
    unless_null $P2029, vivify_169
    $P2029 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2029
  vivify_169:
    set $P2029["replace"], $P106
.annotate 'line', 111
    new $P106, "String"
    assign $P106, "v*"
    get_global $P2030, "%piropsig"
    unless_null $P2030, vivify_170
    $P2030 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2030
  vivify_170:
    set $P2030["say"], $P106
.annotate 'line', 112
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2031, "%piropsig"
    unless_null $P2031, vivify_171
    $P2031 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2031
  vivify_171:
    set $P2031["set"], $P106
.annotate 'line', 113
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P2032, "%piropsig"
    unless_null $P2032, vivify_172
    $P2032 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2032
  vivify_172:
    set $P2032["setprop"], $P106
.annotate 'line', 114
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P2033, "%piropsig"
    unless_null $P2033, vivify_173
    $P2033 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2033
  vivify_173:
    set $P2033["setattribute"], $P106
.annotate 'line', 115
    new $P106, "String"
    assign $P106, "PP"
    get_global $P2034, "%piropsig"
    unless_null $P2034, vivify_174
    $P2034 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2034
  vivify_174:
    set $P2034["shift"], $P106
.annotate 'line', 116
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2035, "%piropsig"
    unless_null $P2035, vivify_175
    $P2035 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2035
  vivify_175:
    set $P2035["shl"], $P106
.annotate 'line', 117
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2036, "%piropsig"
    unless_null $P2036, vivify_176
    $P2036 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2036
  vivify_176:
    set $P2036["shr"], $P106
.annotate 'line', 118
    new $P106, "String"
    assign $P106, "v+"
    get_global $P2037, "%piropsig"
    unless_null $P2037, vivify_177
    $P2037 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2037
  vivify_177:
    set $P2037["sleep"], $P106
.annotate 'line', 119
    new $P106, "String"
    assign $P106, "0PPii"
    get_global $P2038, "%piropsig"
    unless_null $P2038, vivify_178
    $P2038 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2038
  vivify_178:
    set $P2038["splice"], $P106
.annotate 'line', 120
    new $P106, "String"
    assign $P106, "Pss"
    get_global $P2039, "%piropsig"
    unless_null $P2039, vivify_179
    $P2039 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2039
  vivify_179:
    set $P2039["split"], $P106
.annotate 'line', 121
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P2040, "%piropsig"
    unless_null $P2040, vivify_180
    $P2040 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2040
  vivify_180:
    set $P2040["sub"], $P106
.annotate 'line', 122
    new $P106, "String"
    assign $P106, "Ssii"
    get_global $P2041, "%piropsig"
    unless_null $P2041, vivify_181
    $P2041 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2041
  vivify_181:
    set $P2041["substr"], $P106
.annotate 'line', 123
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P2042, "%piropsig"
    unless_null $P2042, vivify_182
    $P2042 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2042
  vivify_182:
    set $P2042["titlecase"], $P106
.annotate 'line', 124
    new $P106, "String"
    assign $P106, "vi"
    get_global $P2043, "%piropsig"
    unless_null $P2043, vivify_183
    $P2043 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2043
  vivify_183:
    set $P2043["trace"], $P106
.annotate 'line', 125
    new $P106, "String"
    assign $P106, "SP"
    get_global $P2044, "%piropsig"
    unless_null $P2044, vivify_184
    $P2044 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2044
  vivify_184:
    set $P2044["typeof"], $P106
.annotate 'line', 126
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P2045, "%piropsig"
    unless_null $P2045, vivify_185
    $P2045 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2045
  vivify_185:
    set $P2045["unshift"], $P106
.annotate 'line', 127
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P2046, "%piropsig"
    unless_null $P2046, vivify_186
    $P2046 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P2046
  vivify_186:
    set $P2046["upcase"], $P106
.annotate 'line', 132
    new $P106, "String"
    assign $P106, "s~*:e"
    get_global $P2047, "%valflags"
    unless_null $P2047, vivify_187
    $P2047 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2047
  vivify_187:
    set $P2047["String"], $P106
.annotate 'line', 133
    new $P106, "String"
    assign $P106, "i+*:"
    get_global $P2048, "%valflags"
    unless_null $P2048, vivify_188
    $P2048 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2048
  vivify_188:
    set $P2048["Integer"], $P106
.annotate 'line', 134
    new $P106, "String"
    assign $P106, "n+*:"
    get_global $P2049, "%valflags"
    unless_null $P2049, vivify_189
    $P2049 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2049
  vivify_189:
    set $P2049["Float"], $P106
.annotate 'line', 135
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2050, "%valflags"
    unless_null $P2050, vivify_190
    $P2050 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2050
  vivify_190:
    set $P2050["!macro_const"], $P106
.annotate 'line', 136
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2051, "%valflags"
    unless_null $P2051, vivify_191
    $P2051 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2051
  vivify_191:
    set $P2051["!cclass"], $P106
.annotate 'line', 137
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2052, "%valflags"
    unless_null $P2052, vivify_192
    $P2052 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2052
  vivify_192:
    set $P2052["!except_severity"], $P106
.annotate 'line', 138
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2053, "%valflags"
    unless_null $P2053, vivify_193
    $P2053 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2053
  vivify_193:
    set $P2053["!except_types"], $P106
.annotate 'line', 139
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2054, "%valflags"
    unless_null $P2054, vivify_194
    $P2054 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2054
  vivify_194:
    set $P2054["!iterator"], $P106
.annotate 'line', 140
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2055, "%valflags"
    unless_null $P2055, vivify_195
    $P2055 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2055
  vivify_195:
    set $P2055["!socket"], $P106
.annotate 'line', 144
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2056, "%controltypes"
    unless_null $P2056, vivify_196
    $P2056 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2056
  vivify_196:
    set $P2056["CONTROL"], $P106
.annotate 'line', 145
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN"
    get_global $P2057, "%controltypes"
    unless_null $P2057, vivify_197
    $P2057 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2057
  vivify_197:
    set $P2057["RETURN"], $P106
.annotate 'line', 146
    new $P106, "String"
    assign $P106, ".CONTROL_OK"
    get_global $P2058, "%controltypes"
    unless_null $P2058, vivify_198
    $P2058 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2058
  vivify_198:
    set $P2058["OK"], $P106
.annotate 'line', 147
    new $P106, "String"
    assign $P106, ".CONTROL_BREAK"
    get_global $P2059, "%controltypes"
    unless_null $P2059, vivify_199
    $P2059 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2059
  vivify_199:
    set $P2059["BREAK"], $P106
.annotate 'line', 148
    new $P106, "String"
    assign $P106, ".CONTROL_CONTINUE"
    get_global $P2060, "%controltypes"
    unless_null $P2060, vivify_200
    $P2060 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2060
  vivify_200:
    set $P2060["CONTINUE"], $P106
.annotate 'line', 149
    new $P106, "String"
    assign $P106, ".CONTROL_ERROR"
    get_global $P2061, "%controltypes"
    unless_null $P2061, vivify_201
    $P2061 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2061
  vivify_201:
    set $P2061["ERROR"], $P106
.annotate 'line', 150
    new $P106, "String"
    assign $P106, ".CONTROL_TAKE"
    get_global $P2062, "%controltypes"
    unless_null $P2062, vivify_202
    $P2062 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2062
  vivify_202:
    set $P2062["GATHER"], $P106
.annotate 'line', 151
    new $P106, "String"
    assign $P106, ".CONTROL_LEAVE"
    get_global $P2063, "%controltypes"
    unless_null $P2063, vivify_203
    $P2063 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2063
  vivify_203:
    set $P2063["LEAVE"], $P106
.annotate 'line', 152
    new $P106, "String"
    assign $P106, ".CONTROL_EXIT"
    get_global $P2064, "%controltypes"
    unless_null $P2064, vivify_204
    $P2064 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2064
  vivify_204:
    set $P2064["EXIT"], $P106
.annotate 'line', 153
    new $P106, "String"
    assign $P106, ".CONTROL_NEXT"
    get_global $P2065, "%controltypes"
    unless_null $P2065, vivify_205
    $P2065 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2065
  vivify_205:
    set $P2065["NEXT"], $P106
.annotate 'line', 154
    new $P106, "String"
    assign $P106, ".CONTROL_LAST"
    get_global $P2066, "%controltypes"
    unless_null $P2066, vivify_206
    $P2066 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2066
  vivify_206:
    set $P2066["LAST"], $P106
.annotate 'line', 155
    new $P106, "String"
    assign $P106, ".CONTROL_REDO"
    get_global $P2067, "%controltypes"
    unless_null $P2067, vivify_207
    $P2067 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2067
  vivify_207:
    set $P2067["REDO"], $P106
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
.sub "shallow_clone_hash"  :subid("12_1313007597.81655") :outer("11_1313007597.81655")
    .param pmc param_1012
.annotate 'file', "Compiler.pm"
.annotate 'line', 967
    .const 'Sub' $P1016 = "13_1313007597.81655" 
    capture_lex $P1016
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "%to_clone", param_1012
.annotate 'line', 968
    $P1014 = root_new ['parrot';'Hash']
    set $P1013, $P1014
    .lex "%ret", $P1013
.annotate 'line', 967
    find_lex $P103, "%ret"
.annotate 'line', 969
    find_lex $P104, "%to_clone"
    defined $I100, $P104
    unless $I100, for_undef_215
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1020_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1020_test:
    unless $P103, loop1020_done
    shift $P105, $P103
  loop1020_redo:
    .const 'Sub' $P1016 = "13_1313007597.81655" 
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
  for_undef_215:
.annotate 'line', 967
    find_lex $P103, "%ret"
    .return ($P103)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1015"  :anon :subid("13_1313007597.81655") :outer("12_1313007597.81655")
    .param pmc param_1017
.annotate 'file', "Compiler.pm"
.annotate 'line', 969
    .lex "$_", param_1017
.annotate 'line', 970
    find_lex $P106, "$_"
    find_lex $P1018, "%to_clone"
    unless_null $P1018, vivify_216
    $P1018 = root_new ['parrot';'Hash']
  vivify_216:
    set $P107, $P1018[$P106]
    unless_null $P107, vivify_217
    new $P107, "Undef"
  vivify_217:
    find_lex $P108, "$_"
    find_lex $P1019, "%ret"
    unless_null $P1019, vivify_218
    $P1019 = root_new ['parrot';'Hash']
    store_lex "%ret", $P1019
  vivify_218:
    set $P1019[$P108], $P107
.annotate 'line', 969
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("14_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 174
    .const 'Sub' $P1035 = "15_1313007597.81655" 
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
    unless_null $P106, vivify_219
    get_hll_global $P106, "$SUB"
    unless_null $P106, vivify_220
    die "Contextual $*SUB not found"
  vivify_220:
  vivify_219:
.annotate 'line', 183
    find_dynamic_lex $P106, "%*TEMPREGS"
    store_lex "%tempregs", $P106
.annotate 'line', 185
    .const 'Sub' $P1035 = "15_1313007597.81655" 
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
.sub "_block1034"  :anon :subid("15_1313007597.81655") :outer("14_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 186
    $P1037 = root_new ['parrot';'Hash']
    set $P1036, $P1037
    .lex "%*TEMPREGS", $P1036
.annotate 'line', 185
    find_lex $P106, "%*TEMPREGS"
    unless_null $P106, vivify_221
    get_hll_global $P106, "%TEMPREGS"
    unless_null $P106, vivify_222
    die "Contextual %*TEMPREGS not found"
  vivify_222:
  vivify_221:
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
.sub "escape"  :subid("16_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1042
.annotate 'file', "Compiler.pm"
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
    isgt $I103, $N101, 0.0
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
.sub "unique"  :subid("17_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1049 :optional
    .param int has_param_1049 :opt_flag
.annotate 'file', "Compiler.pm"
.annotate 'line', 217
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
    if has_param_1049, optparam_223
    new $P105, "Undef"
    set param_1049, $P105
  optparam_223:
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
.sub "uniquereg"  :subid("18_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1055
.annotate 'file', "Compiler.pm"
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
.sub "tempreg_frame"  :subid("19_1313007597.81655") :method :outer("11_1313007597.81655")
.annotate 'file', "Compiler.pm"
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
.annotate 'line', 245
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1065, "%tempregs"
    unless_null $P1065, vivify_224
    $P1065 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1065
  vivify_224:
    set $P1065["I"], $P105
.annotate 'line', 246
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1066, "%tempregs"
    unless_null $P1066, vivify_225
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1066
  vivify_225:
    set $P1066["N"], $P105
.annotate 'line', 247
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1067, "%tempregs"
    unless_null $P1067, vivify_226
    $P1067 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1067
  vivify_226:
    set $P1067["S"], $P105
.annotate 'line', 248
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1068, "%tempregs"
    unless_null $P1068, vivify_227
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1068
  vivify_227:
    set $P1068["P"], $P105
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
.sub "tempreg"  :subid("20_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1072
.annotate 'file', "Compiler.pm"
.annotate 'line', 267
    new $P1071, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1071, control_1070
    push_eh $P1071
    .lex "self", self
    .lex "$rtype", param_1072
.annotate 'line', 272
    new $P105, "Undef"
    set $P1073, $P105
    .lex "$I0", $P1073
.annotate 'line', 279
    new $P106, "Undef"
    set $P1074, $P106
    .lex "$reg", $P1074
.annotate 'line', 280
    new $P107, "Undef"
    set $P1075, $P107
    .lex "$rnum", $P1075
.annotate 'line', 268
    find_lex $P108, "$rtype"
    if $P108, unless_1076_end
    find_lex $P109, "self"
    $P109."panic"("rtype not set")
  unless_1076_end:
.annotate 'line', 270
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
.annotate 'line', 272
    find_lex $P108, "$rtype"
    set $S100, $P108
    index $I100, "Ss~Nn+Ii", $S100
    new $P109, 'Integer'
    set $P109, $I100
    store_lex "$I0", $P109
.annotate 'line', 273
    new $P108, "String"
    assign $P108, "P"
    store_lex "$rtype", $P108
.annotate 'line', 274
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
.annotate 'line', 277
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_228
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_229
    die "Contextual %*TEMPREGS not found"
  vivify_229:
  vivify_228:
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
.annotate 'line', 267
    find_lex $P108, "$reg"
.annotate 'line', 280
    find_lex $P108, "$rtype"
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_230
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_231
    die "Contextual %*TEMPREGS not found"
  vivify_231:
  vivify_230:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_232
    new $P110, "Undef"
  vivify_232:
    store_lex "$rnum", $P110
.annotate 'line', 281
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1082_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
    goto loop1082_redo
  loop1082_test:
    find_lex $P108, "$reg"
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_233
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_234
    die "Contextual %*TEMPREGS not found"
  vivify_234:
  vivify_233:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_235
    new $P110, "Undef"
  vivify_235:
    unless $P110, loop1082_done
  loop1082_redo:
.annotate 'line', 283
    find_lex $P111, "$rnum"
    set $N100, $P111
    get_global $P112, "$UNIQUE_BASE"
    set $N101, $P112
    isge $I100, $N100, $N101
    unless $I100, if_1080_end
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "self"
    new $P115, "String"
    assign $P115, "$"
    find_lex $P116, "$rtype"
    concat $P117, $P115, $P116
    $P118 = $P114."unique"($P117)
    setattribute $P113, 'payload', $P118
    throw $P113
  if_1080_end:
.annotate 'line', 281
    find_lex $P111, "$rnum"
    clone $P1081, $P111
    inc $P111
.annotate 'line', 286
    find_lex $P111, "$rnum"
    find_lex $P112, "$rtype"
    find_dynamic_lex $P113, "%*TEMPREGS"
    unless_null $P113, vivify_236
    get_hll_global $P113, "%TEMPREGS"
    unless_null $P113, vivify_237
    die "Contextual %*TEMPREGS not found"
  vivify_237:
    store_dynamic_lex "%*TEMPREGS", $P113
  vivify_236:
    set $P113[$P112], $P111
.annotate 'line', 287
    new $P111, "String"
    assign $P111, "$"
    find_lex $P112, "$rtype"
    concat $P113, $P111, $P112
    find_lex $P114, "$rnum"
    concat $P115, $P113, $P114
    store_lex "$reg", $P115
  loop1082_next:
.annotate 'line', 281
    goto loop1082_test
  loop1082_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1082_next
    eq $P112, .CONTROL_LOOP_REDO, loop1082_redo
  loop1082_done:
    pop_eh 
.annotate 'line', 267
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
.sub "coerce"  :subid("21_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1086
    .param pmc param_1087
.annotate 'file', "Compiler.pm"
.annotate 'line', 299
    new $P1085, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1085, control_1084
    push_eh $P1085
    .lex "self", self
    .lex "$post", param_1086
    .lex "$rtype", param_1087
.annotate 'line', 300

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
    
.annotate 'line', 299
    .return ()
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("22_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1091
    .param pmc param_1092 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 439
    .const 'Sub' $P1129 = "27_1313007597.81655" 
    capture_lex $P1129
    .const 'Sub' $P1109 = "23_1313007597.81655" 
    capture_lex $P1109
    new $P1090, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1090, control_1089
    push_eh $P1090
    .lex "self", self
    .lex "$node", param_1091
    .lex "%options", param_1092
.annotate 'line', 440
    new $P105, "Undef"
    set $P1093, $P105
    .lex "$ops", $P1093
.annotate 'line', 442
    new $P106, "Undef"
    set $P1094, $P106
    .lex "$pushop", $P1094
.annotate 'line', 445
    new $P107, "Undef"
    set $P1095, $P107
    .lex "$signature", $P1095
.annotate 'line', 446
    new $P108, "Undef"
    set $P1096, $P108
    .lex "$sigmax", $P1096
.annotate 'line', 450
    $P1098 = root_new ['parrot';'ResizablePMCArray']
    set $P1097, $P1098
    .lex "@posargs", $P1097
.annotate 'line', 451
    $P1100 = root_new ['parrot';'ResizablePMCArray']
    set $P1099, $P1100
    .lex "@namedargs", $P1099
.annotate 'line', 453
    new $P109, "Undef"
    set $P1101, $P109
    .lex "$sigidx", $P1101
.annotate 'line', 454
    new $P110, "Undef"
    set $P1102, $P110
    .lex "$rtype", $P1102
.annotate 'line', 455
    new $P111, "Undef"
    set $P1103, $P111
    .lex "$iter", $P1103
.annotate 'line', 440
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 442
    find_lex $P113, "$node"
    $S100 = $P113."childorder"()
    iseq $I100, $S100, "right"
    if $I100, if_1104
    new $P115, "String"
    assign $P115, "push"
    set $P112, $P115
    goto if_1104_end
  if_1104:
    new $P114, "String"
    assign $P114, "unshift"
    set $P112, $P114
  if_1104_end:
    store_lex "$pushop", $P112
.annotate 'line', 445
    find_lex $P1106, "%options"
    unless_null $P1106, vivify_238
    $P1106 = root_new ['parrot';'Hash']
  vivify_238:
    set $P113, $P1106["signature"]
    unless_null $P113, vivify_239
    new $P113, "Undef"
  vivify_239:
    unless $P113, unless_1105
    set $P112, $P113
    goto unless_1105_end
  unless_1105:
    new $P114, "String"
    assign $P114, "**"
    set $P112, $P114
  unless_1105_end:
    store_lex "$signature", $P112
.annotate 'line', 446
    find_lex $P112, "$signature"
    set $S100, $P112
    length $I100, $S100
    new $P113, 'Integer'
    set $P113, $I100
    sub $P114, $P113, 1
    store_lex "$sigmax", $P114
.annotate 'line', 439
    find_lex $P112, "@posargs"
    find_lex $P112, "@namedargs"
.annotate 'line', 453
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$sigidx", $P112
.annotate 'line', 454
    find_lex $P112, "$signature"
    set $S100, $P112
    find_lex $P113, "$sigidx"
    set $I100, $P113
    substr $S101, $S100, $I100, 1
    new $P114, 'String'
    set $P114, $S101
    store_lex "$rtype", $P114
.annotate 'line', 455
    find_lex $P112, "$node"
    $P113 = $P112."iterator"()
    store_lex "$iter", $P113
.annotate 'line', 456
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1141_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1141_test:
    find_lex $P112, "$iter"
    unless $P112, loop1141_done
  loop1141_redo:
.annotate 'line', 457
    find_lex $P113, "$rtype"
    set $S100, $P113
    isne $I100, $S100, "Q"
    if $I100, if_1107
.annotate 'line', 496
    .const 'Sub' $P1129 = "27_1313007597.81655" 
    capture_lex $P1129
    $P1129()
    goto if_1107_end
  if_1107:
.annotate 'line', 457
    .const 'Sub' $P1109 = "23_1313007597.81655" 
    capture_lex $P1109
    $P1109()
  if_1107_end:
.annotate 'line', 517
    find_lex $P113, "$sigidx"
    set $N100, $P113
    find_lex $P114, "$sigmax"
    set $N101, $P114
    islt $I100, $N100, $N101
    unless $I100, if_1139_end
    find_lex $P115, "$sigidx"
    clone $P1140, $P115
    inc $P115
.annotate 'line', 519
    find_lex $P115, "$signature"
    set $S100, $P115
    find_lex $P116, "$sigidx"
    set $I101, $P116
    substr $S101, $S100, $I101, 1
    new $P117, 'String'
    set $P117, $S101
    store_lex "$rtype", $P117
  if_1139_end:
  loop1141_next:
.annotate 'line', 456
    goto loop1141_test
  loop1141_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1141_next
    eq $P114, .CONTROL_LOOP_REDO, loop1141_redo
  loop1141_done:
    pop_eh 
.annotate 'line', 523

        .local pmc ops, posargs, namedargs
        ops = find_lex '$ops'
        posargs = find_lex '@posargs'
        namedargs = find_lex '@namedargs'

        .return (ops, posargs, namedargs)
    
.annotate 'line', 439
    .return ()
  control_1089:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1128"  :anon :subid("27_1313007597.81655") :outer("22_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 496
    .const 'Sub' $P1134 = "28_1313007597.81655" 
    capture_lex $P1134
.annotate 'line', 499
    new $P117, "Undef"
    set $P1130, $P117
    .lex "$cpast", $P1130
.annotate 'line', 500
    new $P118, "Undef"
    set $P1131, $P118
    .lex "$cpost", $P1131
.annotate 'line', 499
    find_lex $P119, "$iter"
    shift $P120, $P119
    store_lex "$cpast", $P120
.annotate 'line', 500
    find_lex $P119, "self"
    find_lex $P120, "$cpast"
    $P121 = $P119."as_post"($P120, "P" :named("rtype"))
    store_lex "$cpost", $P121
.annotate 'line', 501
    find_lex $P119, "self"
    find_lex $P120, "$cpost"
    $P121 = $P119."coerce"($P120, "P")
    store_lex "$cpost", $P121
.annotate 'line', 503
    find_lex $P120, "$iter"
    if $P120, if_1132
    set $P119, $P120
    goto if_1132_end
  if_1132:
    .const 'Sub' $P1134 = "28_1313007597.81655" 
    capture_lex $P1134
    $P124 = $P1134()
    set $P119, $P124
  if_1132_end:
.annotate 'line', 496
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1133"  :anon :subid("28_1313007597.81655") :outer("27_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 504
    new $P121, "Undef"
    set $P1135, $P121
    .lex "$kpast", $P1135
.annotate 'line', 507
    new $P122, "Undef"
    set $P1136, $P122
    .lex "$kpost", $P1136
.annotate 'line', 510
    new $P123, "Undef"
    set $P1137, $P123
    .lex "$S0", $P1137
.annotate 'line', 504
    find_lex $P124, "$iter"
    shift $P125, $P124
    store_lex "$kpast", $P125
.annotate 'line', 503
    find_lex $P124, "$sigidx"
    clone $P1138, $P124
    inc $P124
.annotate 'line', 506
    find_lex $P124, "$signature"
    set $S101, $P124
    find_lex $P125, "$sigidx"
    set $I101, $P125
    substr $S102, $S101, $I101, 1
    new $P126, 'String'
    set $P126, $S102
    store_lex "$rtype", $P126
.annotate 'line', 507
    find_lex $P124, "self"
    find_lex $P125, "$kpast"
    find_lex $P126, "$rtype"
    $P127 = $P124."as_post"($P125, $P126 :named("rtype"))
    store_lex "$kpost", $P127
.annotate 'line', 508
    find_lex $P124, "self"
    find_lex $P125, "$kpost"
    find_lex $P126, "$rtype"
    $P127 = $P124."coerce"($P125, $P126)
    store_lex "$kpost", $P127
.annotate 'line', 510
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
.annotate 'line', 511
    find_lex $P124, "$ops"
    find_lex $P125, "$kpost"
    $P126 = $P124."new"($P125)
    store_lex "$kpost", $P126
.annotate 'line', 512
    find_lex $P124, "$kpost"
    find_lex $P125, "$cpost"
    $P124."push"($P125)
.annotate 'line', 513
    find_lex $P124, "$ops"
    find_lex $P125, "$kpost"
    find_lex $P126, "$pushop"
    set $S101, $P126
    $P124.$S101($P125)
.annotate 'line', 514
    find_lex $P124, "@posargs"
    find_lex $P125, "$S0"
    $P126 = $P124."push"($P125)
.annotate 'line', 503
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1108"  :anon :subid("23_1313007597.81655") :outer("22_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 457
    .const 'Sub' $P1114 = "24_1313007597.81655" 
    capture_lex $P1114
.annotate 'line', 458
    new $P114, "Undef"
    set $P1110, $P114
    .lex "$cpast", $P1110
.annotate 'line', 459
    new $P115, "Undef"
    set $P1111, $P115
    .lex "$cpost", $P1111
.annotate 'line', 458
    find_lex $P116, "$iter"
    shift $P117, $P116
    store_lex "$cpast", $P117
.annotate 'line', 459
    find_lex $P116, "self"
    find_lex $P117, "$cpast"
    find_lex $P118, "$rtype"
    $P119 = $P116."as_post"($P117, $P118 :named("rtype"))
    store_lex "$cpost", $P119
.annotate 'line', 460
    find_lex $P116, "self"
    find_lex $P117, "$cpost"
    find_lex $P118, "$rtype"
    $P119 = $P116."coerce"($P117, $P118)
    store_lex "$cpost", $P119
.annotate 'line', 462
    get_hll_global $P117, ["PAST"], "Node"
    find_lex $P118, "$cpast"
    $P119 = $P117."ACCEPTS"($P118)
    if $P119, if_1112
.annotate 'line', 493
    find_lex $P125, "$ops"
    find_lex $P126, "$cpost"
    find_lex $P127, "$pushop"
    set $S101, $P127
    $P125.$S101($P126)
.annotate 'line', 494
    find_lex $P125, "@posargs"
    find_lex $P126, "$cpost"
    $P127 = $P125."push"($P126)
.annotate 'line', 492
    set $P116, $P127
.annotate 'line', 462
    goto if_1112_end
  if_1112:
    .const 'Sub' $P1114 = "24_1313007597.81655" 
    capture_lex $P1114
    $P124 = $P1114()
    set $P116, $P124
  if_1112_end:
.annotate 'line', 457
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1113"  :anon :subid("24_1313007597.81655") :outer("23_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 462
    .const 'Sub' $P1121 = "25_1313007597.81655" 
    capture_lex $P1121
.annotate 'line', 463
    new $P120, "Undef"
    set $P1115, $P120
    .lex "$isflat", $P1115
.annotate 'line', 464
    new $P121, "Undef"
    set $P1116, $P121
    .lex "$npast", $P1116
.annotate 'line', 465
    new $P122, "Undef"
    set $P1117, $P122
    .lex "$npost", $P1117
.annotate 'line', 463
    find_lex $P123, "$cpast"
    $P124 = $P123."flat"()
    store_lex "$isflat", $P124
.annotate 'line', 464
    find_lex $P123, "$cpast"
    $P124 = $P123."named"()
    store_lex "$npast", $P124
.annotate 'line', 462
    find_lex $P123, "$npost"
.annotate 'line', 466
    find_lex $P125, "$rtype"
    set $S101, $P125
    iseq $I101, $S101, ":"
    if $I101, if_1119
    new $P124, 'Integer'
    set $P124, $I101
    goto if_1119_end
  if_1119:
    find_lex $P126, "$npast"
    set $P124, $P126
  if_1119_end:
    if $P124, if_1118
.annotate 'line', 482
    find_lex $P131, "$isflat"
    if $P131, if_1127
.annotate 'line', 487
    find_lex $P132, "$ops"
    find_lex $P133, "$cpost"
    find_lex $P134, "$pushop"
    set $S102, $P134
    $P132.$S102($P133)
.annotate 'line', 488
    find_lex $P132, "@posargs"
    find_lex $P133, "$cpost"
    $P134 = $P132."push"($P133)
.annotate 'line', 486
    set $P129, $P134
.annotate 'line', 482
    goto if_1127_end
  if_1127:
.annotate 'line', 483
    find_lex $P132, "$ops"
    find_lex $P133, "$cpost"
    find_lex $P134, "$pushop"
    set $S102, $P134
    $P132.$S102($P133)
.annotate 'line', 484
    find_lex $P132, "@posargs"
    find_lex $P133, "$cpost"
    set $S102, $P133
    new $P134, 'String'
    set $P134, $S102
    concat $P135, $P134, " :flat"
    $P136 = $P132."push"($P135)
.annotate 'line', 482
    set $P129, $P136
  if_1127_end:
.annotate 'line', 481
    set $P123, $P129
.annotate 'line', 466
    goto if_1118_end
  if_1118:
    .const 'Sub' $P1121 = "25_1313007597.81655" 
    capture_lex $P1121
    $P128 = $P1121()
    set $P123, $P128
  if_1118_end:
.annotate 'line', 462
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1120"  :anon :subid("25_1313007597.81655") :outer("24_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 466
    .const 'Sub' $P1125 = "26_1313007597.81655" 
    capture_lex $P1125
.annotate 'line', 467
    new $P127, "Undef"
    set $P1122, $P127
    .lex "$S0", $P1122
    find_lex $P128, "$cpost"
    set $S102, $P128
    new $P129, 'String'
    set $P129, $S102
    store_lex "$S0", $P129
.annotate 'line', 468
    find_lex $P128, "$isflat"
    if $P128, if_1123
.annotate 'line', 471
    .const 'Sub' $P1125 = "26_1313007597.81655" 
    capture_lex $P1125
    $P1125()
    goto if_1123_end
  if_1123:
.annotate 'line', 469
    find_lex $P129, "$S0"
    concat $P130, $P129, " :named :flat"
    store_lex "$S0", $P130
  if_1123_end:
.annotate 'line', 478
    find_lex $P128, "$ops"
    find_lex $P129, "$cpost"
    find_lex $P130, "$pushop"
    set $S102, $P130
    $P128.$S102($P129)
.annotate 'line', 479
    find_lex $P128, "@namedargs"
    find_lex $P129, "$S0"
    $P130 = $P128."push"($P129)
.annotate 'line', 466
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1124"  :anon :subid("26_1313007597.81655") :outer("25_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 475
    new $P129, "Undef"
    set $P1126, $P129
    .lex "$S1", $P1126
.annotate 'line', 472
    find_lex $P130, "self"
    find_lex $P131, "$npast"
    $P132 = $P130."as_post"($P131, "~" :named("rtype"))
    store_lex "$npost", $P132
.annotate 'line', 473
    find_lex $P130, "$ops"
    find_lex $P131, "$cpost"
    $P132 = $P130."new"($P131)
    store_lex "$cpost", $P132
.annotate 'line', 474
    find_lex $P130, "$cpost"
    find_lex $P131, "$npost"
    $P130."push"($P131)
.annotate 'line', 475
    find_lex $P130, "$npost"
    set $S102, $P130
    new $P131, 'String'
    set $P131, $S102
    store_lex "$S1", $P131
.annotate 'line', 476
    find_lex $P130, "$S0"
    concat $P131, $P130, " :named("
    find_lex $P132, "$S1"
    concat $P133, $P131, $P132
    concat $P134, $P133, ")"
    store_lex "$S0", $P134
.annotate 'line', 471
    .return ($P134)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("29_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,_)
    .param pmc param_1145
    .param pmc param_1146 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 549
    new $P1144, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1144, control_1143
    push_eh $P1144
    .lex "self", self
    .lex "$node", param_1145
    .lex "%options", param_1146
.annotate 'line', 550
    new $P105, "Undef"
    set $P1147, $P105
    .lex "$what", $P1147
.annotate 'line', 549
    find_lex $P106, "$what"
.annotate 'line', 552
    find_lex $P106, "$node"
    isnull $I100, $P106
    if $I100, if_1148
.annotate 'line', 556
    new $P107, "String"
    assign $P107, "node of type "
    find_lex $P108, "$node"
    typeof $S100, $P108
    concat $P109, $P107, $S100
    store_lex "$what", $P109
.annotate 'line', 555
    goto if_1148_end
  if_1148:
.annotate 'line', 553
    new $P107, "String"
    assign $P107, "a null node"
    store_lex "$what", $P107
  if_1148_end:
.annotate 'line', 559
    find_lex $P106, "self"
    new $P107, "String"
    assign $P107, "PAST::Compiler can't compile "
    find_lex $P108, "$what"
    concat $P109, $P107, $P108
    $P110 = $P106."panic"($P109)
.annotate 'line', 549
    .return ($P110)
  control_1143:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["Undef"])
    .param pmc param_1152
    .param pmc param_1153 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 565
    new $P1151, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1151, control_1150
    push_eh $P1151
    .lex "self", self
    .lex "$node", param_1152
    .lex "%options", param_1153
.annotate 'line', 566
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "self"
    $P107 = $P106."tempreg"("P")
    $P108 = $P105."new"($P107 :named("result"))
.annotate 'line', 565
    .return ($P108)
  control_1150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("31_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["Integer"])
    .param pmc param_1157
    .param pmc param_1158 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 576
    new $P1156, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1156, control_1155
    push_eh $P1156
    .lex "self", self
    .lex "$node", param_1157
    .lex "%options", param_1158
.annotate 'line', 577
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1159, "%options"
    unless_null $P1159, vivify_240
    $P1159 = root_new ['parrot';'Hash']
  vivify_240:
    set $P109, $P1159["rtype"]
    unless_null $P109, vivify_241
    new $P109, "Undef"
  vivify_241:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 576
    .return ($P110)
  control_1155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["Float"])
    .param pmc param_1163
    .param pmc param_1164 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 580
    new $P1162, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1162, control_1161
    push_eh $P1162
    .lex "self", self
    .lex "$node", param_1163
    .lex "%options", param_1164
.annotate 'line', 581
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1165, "%options"
    unless_null $P1165, vivify_242
    $P1165 = root_new ['parrot';'Hash']
  vivify_242:
    set $P109, $P1165["rtype"]
    unless_null $P109, vivify_243
    new $P109, "Undef"
  vivify_243:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 580
    .return ($P110)
  control_1161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("33_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["String"])
    .param pmc param_1169
    .param pmc param_1170 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 584
    new $P1168, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1168, control_1167
    push_eh $P1168
    .lex "self", self
    .lex "$node", param_1169
    .lex "%options", param_1170
.annotate 'line', 585
    new $P105, "Undef"
    set $P1171, $P105
    .lex "$value", $P1171
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P106."escape"($P107)
    store_lex "$value", $P108
.annotate 'line', 586
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$value"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1172, "%options"
    unless_null $P1172, vivify_244
    $P1172 = root_new ['parrot';'Hash']
  vivify_244:
    set $P110, $P1172["rtype"]
    unless_null $P110, vivify_245
    new $P110, "Undef"
  vivify_245:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 584
    .return ($P111)
  control_1167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("34_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["String"])
    .param pmc param_1176
    .param pmc param_1177 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 595
    new $P1175, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1175, control_1174
    push_eh $P1175
    .lex "self", self
    .lex "$node", param_1176
    .lex "%options", param_1177
.annotate 'line', 596
    new $P105, "Undef"
    set $P1178, $P105
    .lex "$result", $P1178
.annotate 'line', 597
    new $P106, "Undef"
    set $P1179, $P106
    .lex "$s", $P1179
.annotate 'line', 596
    find_lex $P107, "self"
    $P108 = $P107."tempreg"("P")
    store_lex "$result", $P108
.annotate 'line', 597
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P107."escape"($P108)
    store_lex "$s", $P109
.annotate 'line', 598
    get_hll_global $P107, ["POST"], "Op"
    find_lex $P108, "$result"
    find_lex $P109, "$s"
    find_lex $P110, "$result"
    $P111 = $P107."new"($P108, $P109, "new" :named("pirop"), $P110 :named("result"))
.annotate 'line', 595
    .return ($P111)
  control_1174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("35_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,_)
    .param pmc param_1183
    .param pmc param_1184 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 603
    new $P1182, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1182, control_1181
    push_eh $P1182
    .lex "self", self
    .lex "$node", param_1183
    .lex "%options", param_1184
.annotate 'line', 604
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."as_post"($P106, $P107 :flat)
.annotate 'line', 603
    .return ($P108)
  control_1181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("36_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Node"])
    .param pmc param_1188
    .param pmc param_1189 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 619
    new $P1187, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1187, control_1186
    push_eh $P1187
    .lex "self", self
    .lex "$node", param_1188
    .lex "%options", param_1189
.annotate 'line', 620
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 619
    .return ($P108)
  control_1186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("37_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1193
    .param pmc param_1194
.annotate 'file', "Compiler.pm"
.annotate 'line', 624
    new $P1192, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1192, control_1191
    push_eh $P1192
    .lex "self", self
    .lex "$node", param_1193
    .lex "%options", param_1194
.annotate 'line', 625
    new $P105, "Undef"
    set $P1195, $P105
    .lex "$rtype", $P1195
.annotate 'line', 627
    new $P106, "Undef"
    set $P1196, $P106
    .lex "$signature", $P1196
.annotate 'line', 630
    new $P107, "Undef"
    set $P1197, $P107
    .lex "$ops", $P1197
.annotate 'line', 633
    new $P108, "Undef"
    set $P1198, $P108
    .lex "$eh", $P1198
.annotate 'line', 625
    find_lex $P1199, "%options"
    unless_null $P1199, vivify_246
    $P1199 = root_new ['parrot';'Hash']
  vivify_246:
    set $P109, $P1199["rtype"]
    unless_null $P109, vivify_247
    new $P109, "Undef"
  vivify_247:
    store_lex "$rtype", $P109
.annotate 'line', 627
    find_lex $P109, "$node"
    $P110 = $P109."list"()
    set $N100, $P110
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P111, 'String'
    set $P111, $S100
    store_lex "$signature", $P111
.annotate 'line', 628
    find_lex $P109, "$signature"
    find_lex $P110, "$rtype"
    concat $P111, $P109, $P110
    store_lex "$signature", $P111
.annotate 'line', 630
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "$signature"
    $P112 = $P109."post_children"($P110, $P111 :named("signature"))
    store_lex "$ops", $P112
.annotate 'line', 631
    find_lex $P109, "$ops"
    find_lex $P1200, "$ops"
    unless_null $P1200, vivify_248
    $P1200 = root_new ['parrot';'ResizablePMCArray']
  vivify_248:
    set $P110, $P1200[-1]
    unless_null $P110, vivify_249
    new $P110, "Undef"
  vivify_249:
    $P109."result"($P110)
.annotate 'line', 633
    find_lex $P109, "$node"
    $P110 = $P109."handlers"()
    store_lex "$eh", $P110
.annotate 'line', 634
    find_lex $P109, "$eh"
    unless $P109, if_1201_end
    find_lex $P110, "self"
    find_lex $P111, "$ops"
    find_lex $P112, "$eh"
    find_lex $P113, "$rtype"
    $P114 = $P110."wrap_handlers"($P111, $P112, $P113 :named("rtype"))
    store_lex "$ops", $P114
  if_1201_end:
.annotate 'line', 624
    find_lex $P109, "$ops"
    .return ($P109)
  control_1191:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("38_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Stmt"])
    .param pmc param_1205
    .param pmc param_1206 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 646
    .const 'Sub' $P1212 = "39_1313007597.81655" 
    capture_lex $P1212
    new $P1204, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1204, control_1203
    push_eh $P1204
    .lex "self", self
    .lex "$node", param_1205
    .lex "%options", param_1206
.annotate 'line', 647
    $P1208 = root_new ['parrot';'Hash']
    set $P1207, $P1208
    .lex "%outerregs", $P1207
.annotate 'line', 648
    new $P105, "Undef"
    set $P1209, $P105
    .lex "$post", $P1209
.annotate 'line', 656
    new $P106, "Undef"
    set $P1210, $P106
    .lex "$result", $P1210
.annotate 'line', 647
    find_dynamic_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_250
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_251
    die "Contextual %*TEMPREGS not found"
  vivify_251:
  vivify_250:
    store_lex "%outerregs", $P107
.annotate 'line', 646
    find_lex $P107, "$post"
.annotate 'line', 650
    .const 'Sub' $P1212 = "39_1313007597.81655" 
    capture_lex $P1212
    $P1212()
.annotate 'line', 656
    find_lex $P107, "$post"
    $P108 = $P107."result"()
    store_lex "$result", $P108
.annotate 'line', 658
    find_lex $P109, "%outerregs"
    if $P109, if_1218
    set $P108, $P109
    goto if_1218_end
  if_1218:
    find_lex $P1219, "%options"
    unless_null $P1219, vivify_254
    $P1219 = root_new ['parrot';'Hash']
  vivify_254:
    set $P110, $P1219["rtype"]
    unless_null $P110, vivify_255
    new $P110, "Undef"
  vivify_255:
    set $S100, $P110
    isne $I100, $S100, "v"
    new $P108, 'Integer'
    set $P108, $I100
  if_1218_end:
    if $P108, if_1217
    set $P107, $P108
    goto if_1217_end
  if_1217:
.annotate 'line', 659
    find_lex $P111, "$result"
    set $S101, $P111
    substr $S102, $S101, 0, 1
    iseq $I101, $S102, "$"
    new $P107, 'Integer'
    set $P107, $I101
  if_1217_end:
    unless $P107, if_1216_end
.annotate 'line', 661
    new $P112, "Integer"
    assign $P112, 1
    find_lex $P113, "$result"
    find_lex $P1220, "%outerregs"
    unless_null $P1220, vivify_256
    $P1220 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1220
  vivify_256:
    set $P1220[$P113], $P112
  if_1216_end:
.annotate 'line', 646
    find_lex $P107, "$post"
    .return ($P107)
  control_1203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1211"  :anon :subid("39_1313007597.81655") :outer("38_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 651
    $P1214 = root_new ['parrot';'Hash']
    set $P1213, $P1214
    .lex "%*TEMPREGS", $P1213
.annotate 'line', 650
    find_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_252
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_253
    die "Contextual %*TEMPREGS not found"
  vivify_253:
  vivify_252:
.annotate 'line', 652
    find_lex $P107, "%outerregs"
    unless $P107, if_1215_end
    find_lex $P108, "%outerregs"
    clone $P109, $P108
    store_lex "%*TEMPREGS", $P109
  if_1215_end:
.annotate 'line', 653
    find_lex $P107, "self"
    find_lex $P108, "$node"
    find_lex $P109, "%options"
    $P110 = $P107."node_as_post"($P108, $P109)
    store_lex "$post", $P110
.annotate 'line', 650
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("40_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Control"])
    .param pmc param_1224
    .param pmc param_1225 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 673
    new $P1223, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1223, control_1222
    push_eh $P1223
    .lex "self", self
    .lex "$node", param_1224
    .lex "%options", param_1225
.annotate 'line', 675
    $P1227 = root_new ['parrot';'Hash']
    set $P1226, $P1227
    .lex "%*TEMPREGS", $P1226
.annotate 'line', 677
    new $P105, "Undef"
    set $P1228, $P105
    .lex "$ishandled", $P1228
.annotate 'line', 678
    new $P106, "Undef"
    set $P1229, $P106
    .lex "$nothandled", $P1229
.annotate 'line', 680
    new $P107, "Undef"
    set $P1230, $P107
    .lex "$ops", $P1230
.annotate 'line', 682
    new $P108, "Undef"
    set $P1231, $P108
    .lex "$signature", $P1231
.annotate 'line', 687
    new $P109, "Undef"
    set $P1232, $P109
    .lex "$children", $P1232
.annotate 'line', 689
    new $P110, "Undef"
    set $P1233, $P110
    .lex "$handled", $P1233
.annotate 'line', 673
    find_lex $P111, "%*TEMPREGS"
    unless_null $P111, vivify_257
    get_hll_global $P111, "%TEMPREGS"
    unless_null $P111, vivify_258
    die "Contextual %*TEMPREGS not found"
  vivify_258:
  vivify_257:
.annotate 'line', 677
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("handled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$ishandled", $P114
.annotate 'line', 678
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("nothandled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$nothandled", $P114
.annotate 'line', 680
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 682
    find_lex $P111, "$node"
    $P112 = $P111."list"()
    set $N100, $P112
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P113, 'String'
    set $P113, $S100
    store_lex "$signature", $P113
.annotate 'line', 683
    find_lex $P111, "$signature"
    find_lex $P1234, "%options"
    unless_null $P1234, vivify_259
    $P1234 = root_new ['parrot';'Hash']
  vivify_259:
    set $P112, $P1234["rtype"]
    unless_null $P112, vivify_260
    new $P112, "Undef"
  vivify_260:
    concat $P113, $P111, $P112
    store_lex "$signature", $P113
.annotate 'line', 685
    find_lex $P111, "$ops"
    $P111."push_pirop"(".local pmc exception")
.annotate 'line', 686
    find_lex $P111, "$ops"
    $P111."push_pirop"(".get_results (exception)")
.annotate 'line', 687
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$signature"
    $P114 = $P111."post_children"($P112, $P113 :named("signature"))
    store_lex "$children", $P114
.annotate 'line', 688
    find_lex $P111, "$ops"
    find_lex $P112, "$children"
    $P111."push"($P112)
.annotate 'line', 689
    find_lex $P111, "self"
    $P112 = $P111."uniquereg"("I")
    store_lex "$handled", $P112
.annotate 'line', 691
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    $P111."push_pirop"("set", $P112, "exception[\"handled\"]")
.annotate 'line', 692
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    find_lex $P113, "$nothandled"
    $P111."push_pirop"("ne", $P112, 1, $P113)
.annotate 'line', 693
    find_lex $P111, "$ops"
    find_lex $P112, "$ishandled"
    $P111."push"($P112)
.annotate 'line', 694
    find_lex $P111, "$ops"
    $P111."push_pirop"("return", "exception")
.annotate 'line', 695
    find_lex $P111, "$ops"
    find_lex $P112, "$nothandled"
    $P111."push"($P112)
.annotate 'line', 696
    find_lex $P111, "$ops"
    $P111."push_pirop"("rethrow", "exception")
.annotate 'line', 673
    find_lex $P111, "$ops"
    .return ($P111)
  control_1222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("41_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1238
    .param pmc param_1239
    .param pmc param_1240 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 700
    .const 'Sub' $P1250 = "42_1313007597.81655" 
    capture_lex $P1250
    new $P1237, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1237, control_1236
    push_eh $P1237
    .lex "self", self
    .lex "$child", param_1238
    .lex "$ehs", param_1239
    .lex "%options", param_1240
.annotate 'line', 701
    new $P105, "Undef"
    set $P1241, $P105
    .lex "$rtype", $P1241
.annotate 'line', 704
    $P1243 = root_new ['parrot';'Hash']
    set $P1242, $P1243
    .lex "%*TEMPREGS", $P1242
.annotate 'line', 706
    new $P106, "Undef"
    set $P1244, $P106
    .lex "$ops", $P1244
.annotate 'line', 707
    new $P107, "Undef"
    set $P1245, $P107
    .lex "$pops", $P1245
.annotate 'line', 708
    new $P108, "Undef"
    set $P1246, $P108
    .lex "$tail", $P1246
.annotate 'line', 709
    new $P109, "Undef"
    set $P1247, $P109
    .lex "$skip", $P1247
.annotate 'line', 701
    find_lex $P1248, "%options"
    unless_null $P1248, vivify_261
    $P1248 = root_new ['parrot';'Hash']
  vivify_261:
    set $P110, $P1248["rtype"]
    unless_null $P110, vivify_262
    new $P110, "Undef"
  vivify_262:
    store_lex "$rtype", $P110
.annotate 'line', 700
    find_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_263
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_264
    die "Contextual %*TEMPREGS not found"
  vivify_264:
  vivify_263:
.annotate 'line', 706
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$ops", $P111
.annotate 'line', 707
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$pops", $P111
.annotate 'line', 708
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$tail", $P111
.annotate 'line', 709
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("skip_handler_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$skip", $P113
.annotate 'line', 711
    find_lex $P111, "$ehs"
    defined $I100, $P111
    unless $I100, for_undef_265
    iter $P110, $P111
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1270_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1270_test:
    unless $P110, loop1270_done
    shift $P112, $P110
  loop1270_redo:
    .const 'Sub' $P1250 = "42_1313007597.81655" 
    capture_lex $P1250
    $P1250($P112)
  loop1270_next:
    goto loop1270_test
  loop1270_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1270_next
    eq $P118, .CONTROL_LOOP_REDO, loop1270_redo
  loop1270_done:
    pop_eh 
  for_undef_265:
.annotate 'line', 744
    find_lex $P110, "$ops"
    find_lex $P111, "$child"
    $P110."push"($P111)
.annotate 'line', 746
    find_lex $P110, "$ops"
    find_lex $P111, "$pops"
    $P110."push"($P111)
.annotate 'line', 747
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push_pirop"("goto", $P111)
.annotate 'line', 748
    find_lex $P110, "$ops"
    find_lex $P111, "$tail"
    $P110."push"($P111)
.annotate 'line', 749
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push"($P111)
.annotate 'line', 700
    find_lex $P110, "$ops"
    .return ($P110)
  control_1236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1249"  :anon :subid("42_1313007597.81655") :outer("41_1313007597.81655")
    .param pmc param_1255
.annotate 'file', "Compiler.pm"
.annotate 'line', 711
    .const 'Sub' $P1267 = "44_1313007597.81655" 
    capture_lex $P1267
    .const 'Sub' $P1260 = "43_1313007597.81655" 
    capture_lex $P1260
.annotate 'line', 712
    new $P113, "Undef"
    set $P1251, $P113
    .lex "$node", $P1251
.annotate 'line', 713
    new $P114, "Undef"
    set $P1252, $P114
    .lex "$label", $P1252
.annotate 'line', 714
    new $P115, "Undef"
    set $P1253, $P115
    .lex "$ehreg", $P1253
.annotate 'line', 719
    new $P116, "Undef"
    set $P1254, $P116
    .lex "$type", $P1254
    .lex "$_", param_1255
.annotate 'line', 712
    find_lex $P117, "$_"
    store_lex "$node", $P117
.annotate 'line', 713
    get_hll_global $P117, ["POST"], "Label"
    find_lex $P118, "self"
    $P119 = $P118."unique"("control_")
    $P120 = $P117."new"($P119 :named("result"))
    store_lex "$label", $P120
.annotate 'line', 714
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$ehreg", $P118
.annotate 'line', 716
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("new", $P118, "'ExceptionHandler'")
.annotate 'line', 717
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    find_lex $P119, "$label"
    $P117."push_pirop"("set_label", $P118, $P119)
.annotate 'line', 719
    find_lex $P117, "$node"
    $P118 = $P117."handle_types"()
    store_lex "$type", $P118
.annotate 'line', 720
    find_lex $P118, "$type"
    if $P118, if_1257
    set $P117, $P118
    goto if_1257_end
  if_1257:
    find_lex $P119, "$type"
    get_global $P1258, "%controltypes"
    unless_null $P1258, vivify_266
    $P1258 = root_new ['parrot';'Hash']
  vivify_266:
    set $P120, $P1258[$P119]
    unless_null $P120, vivify_267
    new $P120, "Undef"
  vivify_267:
    store_lex "$type", $P120
    set $P117, $P120
  if_1257_end:
    unless $P117, if_1256_end
    .const 'Sub' $P1260 = "43_1313007597.81655" 
    capture_lex $P1260
    $P1260()
  if_1256_end:
.annotate 'line', 726
    find_lex $P117, "$node"
    $P118 = $P117."handle_types_except"()
    store_lex "$type", $P118
.annotate 'line', 727
    find_lex $P118, "$type"
    if $P118, if_1264
    set $P117, $P118
    goto if_1264_end
  if_1264:
    find_lex $P119, "$type"
    get_global $P1265, "%controltypes"
    unless_null $P1265, vivify_270
    $P1265 = root_new ['parrot';'Hash']
  vivify_270:
    set $P120, $P1265[$P119]
    unless_null $P120, vivify_271
    new $P120, "Undef"
  vivify_271:
    store_lex "$type", $P120
    set $P117, $P120
  if_1264_end:
    unless $P117, if_1263_end
    .const 'Sub' $P1267 = "44_1313007597.81655" 
    capture_lex $P1267
    $P1267()
  if_1263_end:
.annotate 'line', 734
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("push_eh", $P118)
.annotate 'line', 737
    find_lex $P117, "$pops"
    $P117."push_pirop"("pop_eh")
.annotate 'line', 740
    find_lex $P117, "$tail"
    find_lex $P118, "$label"
    $P117."push"($P118)
.annotate 'line', 741
    find_lex $P117, "$tail"
    find_lex $P118, "self"
    find_lex $P119, "$node"
    find_lex $P120, "$rtype"
    $P121 = $P118."as_post"($P119, $P120 :named("rtype"))
    $P122 = $P117."push"($P121)
.annotate 'line', 711
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1259"  :anon :subid("43_1313007597.81655") :outer("42_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 721
    $P1262 = root_new ['parrot';'ResizablePMCArray']
    set $P1261, $P1262
    .lex "@types", $P1261
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 722
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types\"", $P122, $P123 :flat)
.annotate 'line', 723
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_268
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_269
    die "Contextual $*SUB not found"
  vivify_269:
  vivify_268:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 720
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1266"  :anon :subid("44_1313007597.81655") :outer("42_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 728
    $P1269 = root_new ['parrot';'ResizablePMCArray']
    set $P1268, $P1269
    .lex "@types", $P1268
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 729
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types_except\"", $P122, $P123 :flat)
.annotate 'line', 731
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_272
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_273
    die "Contextual $*SUB not found"
  vivify_273:
  vivify_272:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 727
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("45_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Block"])
    .param pmc param_1274
    .param pmc param_1275 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 759
    .const 'Sub' $P1299 = "46_1313007597.81655" 
    capture_lex $P1299
    new $P1273, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1273, control_1272
    push_eh $P1273
    .lex "self", self
    .lex "$node", param_1274
    .lex "%options", param_1275
.annotate 'line', 763
    new $P105, "Undef"
    set $P1276, $P105
    .lex "$name", $P1276
.annotate 'line', 764
    new $P106, "Undef"
    set $P1277, $P106
    .lex "$pirflags", $P1277
.annotate 'line', 765
    new $P107, "Undef"
    set $P1278, $P107
    .lex "$blocktype", $P1278
.annotate 'line', 766
    new $P108, "Undef"
    set $P1279, $P108
    .lex "$nsentry", $P1279
.annotate 'line', 767
    new $P109, "Undef"
    set $P1280, $P109
    .lex "$subid", $P1280
.annotate 'line', 768
    new $P110, "Undef"
    set $P1281, $P110
    .lex "$ns", $P1281
.annotate 'line', 769
    new $P111, "Undef"
    set $P1282, $P111
    .lex "$hll", $P1282
.annotate 'line', 770
    new $P112, "Undef"
    set $P1283, $P112
    .lex "$multi", $P1283
.annotate 'line', 771
    new $P113, "Undef"
    set $P1284, $P113
    .lex "$loadlibs", $P1284
.annotate 'line', 796
    new $P114, "Undef"
    set $P1285, $P114
    .lex "$bpost", $P1285
.annotate 'line', 804
    new $P115, "Undef"
    set $P1286, $P115
    .lex "$blockreg", $P1286
.annotate 'line', 805
    new $P116, "Undef"
    set $P1287, $P116
    .lex "$blockref", $P1287
.annotate 'line', 810
    new $P117, "Undef"
    set $P1288, $P117
    .lex "$outerpost", $P1288
.annotate 'line', 761
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_274
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_275
    die "Contextual @*BLOCKPAST not found"
  vivify_275:
  vivify_274:
    find_lex $P119, "$node"
    unshift $P118, $P119
.annotate 'line', 763
    find_lex $P118, "$node"
    $P119 = $P118."name"()
    store_lex "$name", $P119
.annotate 'line', 764
    find_lex $P118, "$node"
    $P119 = $P118."pirflags"()
    store_lex "$pirflags", $P119
.annotate 'line', 765
    find_lex $P118, "$node"
    $P119 = $P118."blocktype"()
    store_lex "$blocktype", $P119
.annotate 'line', 766
    find_lex $P118, "$node"
    $P119 = $P118."nsentry"()
    store_lex "$nsentry", $P119
.annotate 'line', 767
    find_lex $P118, "$node"
    $P119 = $P118."subid"()
    store_lex "$subid", $P119
.annotate 'line', 768
    find_lex $P118, "$node"
    $P119 = $P118."namespace"()
    store_lex "$ns", $P119
.annotate 'line', 769
    find_lex $P118, "$node"
    $P119 = $P118."hll"()
    store_lex "$hll", $P119
.annotate 'line', 770
    find_lex $P118, "$node"
    $P119 = $P118."multi"()
    store_lex "$multi", $P119
.annotate 'line', 771
    find_lex $P118, "$node"
    $P119 = $P118."loadlibs"()
    store_lex "$loadlibs", $P119
.annotate 'line', 774
    find_lex $P118, "$name"
    defined $I100, $P118
    if $I100, unless_1289_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$name", $P119
  unless_1289_end:
.annotate 'line', 775
    find_lex $P118, "$pirflags"
    defined $I100, $P118
    if $I100, unless_1290_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$pirflags", $P119
  unless_1290_end:
.annotate 'line', 776
    find_lex $P118, "$blocktype"
    defined $I100, $P118
    if $I100, unless_1291_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$blocktype", $P119
  unless_1291_end:
.annotate 'line', 779
    find_lex $P118, "$nsentry"
    defined $I100, $P118
    unless $I100, if_1292_end
.annotate 'line', 780
    find_lex $P119, "$nsentry"
    if $P119, if_1293
.annotate 'line', 785
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :anon"
    store_lex "$pirflags", $P121
.annotate 'line', 784
    goto if_1293_end
  if_1293:
.annotate 'line', 782
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :nsentry("
    find_lex $P122, "self"
    find_lex $P123, "$nsentry"
    $S100 = $P122."escape"($P123)
    concat $P124, $P121, $S100
    concat $P125, $P124, ")"
    store_lex "$pirflags", $P125
  if_1293_end:
  if_1292_end:
.annotate 'line', 790
    find_lex $P118, "$name"
    if $P118, unless_1294_end
.annotate 'line', 791
    find_lex $P119, "self"
    $P120 = $P119."unique"("_block")
    store_lex "$name", $P120
.annotate 'line', 792
    find_lex $P120, "$ns"
    unless $P120, unless_1296
    set $P119, $P120
    goto unless_1296_end
  unless_1296:
    find_lex $P121, "$nsentry"
    set $P119, $P121
  unless_1296_end:
    if $P119, unless_1295_end
    find_lex $P122, "$pirflags"
    concat $P123, $P122, " :anon"
    store_lex "$pirflags", $P123
  unless_1295_end:
  unless_1294_end:
.annotate 'line', 796
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
.annotate 'line', 801
    find_lex $P118, "$pirflags"
    unless $P118, if_1297_end
    find_lex $P119, "$bpost"
    find_lex $P120, "$pirflags"
    $P119."pirflags"($P120)
  if_1297_end:
.annotate 'line', 804
    find_lex $P118, "self"
    $P119 = $P118."uniquereg"("P")
    store_lex "$blockreg", $P119
.annotate 'line', 805
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
.annotate 'line', 810
    find_dynamic_lex $P118, "$*SUB"
    unless_null $P118, vivify_276
    get_hll_global $P118, "$SUB"
    unless_null $P118, vivify_277
    die "Contextual $*SUB not found"
  vivify_277:
  vivify_276:
    store_lex "$outerpost", $P118
.annotate 'line', 811
    .const 'Sub' $P1299 = "46_1313007597.81655" 
    capture_lex $P1299
    $P1299()
.annotate 'line', 963
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_300
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_301
    die "Contextual @*BLOCKPAST not found"
  vivify_301:
  vivify_300:
    shift $P119, $P118
.annotate 'line', 759
    find_lex $P118, "$bpost"
    .return ($P118)
  control_1272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1298"  :anon :subid("46_1313007597.81655") :outer("45_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 811
    .const 'Sub' $P1372 = "54_1313007597.81655" 
    capture_lex $P1372
    .const 'Sub' $P1361 = "53_1313007597.81655" 
    capture_lex $P1361
    .const 'Sub' $P1355 = "52_1313007597.81655" 
    capture_lex $P1355
    .const 'Sub' $P1329 = "49_1313007597.81655" 
    capture_lex $P1329
    .const 'Sub' $P1320 = "48_1313007597.81655" 
    capture_lex $P1320
    .const 'Sub' $P1313 = "47_1313007597.81655" 
    capture_lex $P1313
.annotate 'line', 812
    new $P118, "Undef"
    set $P1300, $P118
    .lex "$*SUB", $P1300
.annotate 'line', 814
    new $P119, "Undef"
    set $P1301, $P119
    .lex "$islexical", $P1301
.annotate 'line', 828
    $P1303 = root_new ['parrot';'Hash']
    set $P1302, $P1303
    .lex "%outersym", $P1302
.annotate 'line', 829
    $P1305 = root_new ['parrot';'Hash']
    set $P1304, $P1305
    .lex "%symtable", $P1304
.annotate 'line', 847
    $P1307 = root_new ['parrot';'Hash']
    set $P1306, $P1307
    .lex "%outerregs", $P1306
.annotate 'line', 849
    new $P120, "Undef"
    set $P1308, $P120
    .lex "$compiler", $P1308
.annotate 'line', 933
    new $P121, "Undef"
    set $P1309, $P121
    .lex "$rtype", $P1309
.annotate 'line', 812
    find_lex $P122, "$bpost"
    store_lex "$*SUB", $P122
.annotate 'line', 814
    find_lex $P122, "$node"
    $P123 = $P122."lexical"()
    store_lex "$islexical", $P123
.annotate 'line', 815
    find_lex $P122, "$islexical"
    unless $P122, if_1310_end
.annotate 'line', 816
    find_lex $P123, "$bpost"
    find_lex $P124, "$outerpost"
    $P123."outer"($P124)
.annotate 'line', 819
    find_lex $P123, "$outerpost"
    defined $I100, $P123
    unless $I100, if_1311_end
    .const 'Sub' $P1313 = "47_1313007597.81655" 
    capture_lex $P1313
    $P1313()
  if_1311_end:
  if_1310_end:
.annotate 'line', 828
    find_lex $P122, "self"
    getattribute $P1315, $P122, "%!symtable"
    unless_null $P1315, vivify_278
    $P1315 = root_new ['parrot';'Hash']
  vivify_278:
    store_lex "%outersym", $P1315
.annotate 'line', 829
    find_lex $P122, "%outersym"
    store_lex "%symtable", $P122
.annotate 'line', 831
    find_lex $P122, "$node"
    $P123 = $P122."symtable"()
    unless $P123, if_1316_end
.annotate 'line', 834
    find_lex $P124, "$node"
    $P125 = $P124."symtable"()
    store_lex "%symtable", $P125
.annotate 'line', 835
    find_lex $P1318, "%symtable"
    unless_null $P1318, vivify_279
    $P1318 = root_new ['parrot';'Hash']
  vivify_279:
    set $P124, $P1318[""]
    unless_null $P124, vivify_280
    new $P124, "Undef"
  vivify_280:
    defined $I100, $P124
    if $I100, unless_1317_end
.annotate 'line', 837
    find_lex $P125, "%symtable"
    $P126 = "shallow_clone_hash"($P125)
    store_lex "%symtable", $P126
.annotate 'line', 838
    find_lex $P126, "%outersym"
    defined $I101, $P126
    unless $I101, for_undef_281
    iter $P125, $P126
    new $P128, 'ExceptionHandler'
    set_label $P128, loop1325_handler
    $P128."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P128
  loop1325_test:
    unless $P125, loop1325_done
    shift $P127, $P125
  loop1325_redo:
    .const 'Sub' $P1320 = "48_1313007597.81655" 
    capture_lex $P1320
    $P1320($P127)
  loop1325_next:
    goto loop1325_test
  loop1325_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, 'type'
    eq $P130, .CONTROL_LOOP_NEXT, loop1325_next
    eq $P130, .CONTROL_LOOP_REDO, loop1325_redo
  loop1325_done:
    pop_eh 
  for_undef_281:
  unless_1317_end:
  if_1316_end:
.annotate 'line', 844
    find_lex $P122, "%symtable"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 847
    find_dynamic_lex $P122, "%*TEMPREGS"
    unless_null $P122, vivify_285
    get_hll_global $P122, "%TEMPREGS"
    unless_null $P122, vivify_286
    die "Contextual %*TEMPREGS not found"
  vivify_286:
  vivify_285:
    store_lex "%outerregs", $P122
.annotate 'line', 849
    find_lex $P122, "$node"
    $P123 = $P122."compiler"()
    store_lex "$compiler", $P123
.annotate 'line', 850
    find_lex $P122, "$compiler"
    if $P122, if_1326
.annotate 'line', 857
    .const 'Sub' $P1329 = "49_1313007597.81655" 
    capture_lex $P1329
    $P1329()
    goto if_1326_end
  if_1326:
.annotate 'line', 853
    find_lex $P123, "$bpost"
    find_lex $P124, "$compiler"
    $P123."compiler"($P124)
.annotate 'line', 854
    find_lex $P123, "$bpost"
    find_lex $P124, "$node"
    $P125 = $P124."compiler_args"()
    $P123."compiler_args"($P125)
.annotate 'line', 855
    find_lex $P123, "$bpost"
    find_lex $P1327, "$node"
    unless_null $P1327, vivify_293
    $P1327 = root_new ['parrot';'ResizablePMCArray']
  vivify_293:
    set $P124, $P1327[0]
    unless_null $P124, vivify_294
    new $P124, "Undef"
  vivify_294:
    $P123."push"($P124)
  if_1326_end:
.annotate 'line', 920
    find_lex $P122, "$node"
    exists $I100, $P122["loadinit"]
    unless $I100, if_1353_end
    .const 'Sub' $P1355 = "52_1313007597.81655" 
    capture_lex $P1355
    $P1355()
  if_1353_end:
.annotate 'line', 930
    find_lex $P122, "%outersym"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 933
    find_lex $P1358, "%options"
    unless_null $P1358, vivify_296
    $P1358 = root_new ['parrot';'Hash']
  vivify_296:
    set $P122, $P1358["rtype"]
    unless_null $P122, vivify_297
    new $P122, "Undef"
  vivify_297:
    store_lex "$rtype", $P122
.annotate 'line', 935
    find_lex $P123, "$blocktype"
    set $S100, $P123
    iseq $I100, $S100, "immediate"
    if $I100, if_1359
.annotate 'line', 944
    find_lex $P127, "$rtype"
    set $S101, $P127
    isne $I101, $S101, "v"
    if $I101, if_1368
    new $P126, 'Integer'
    set $P126, $I101
    goto if_1368_end
  if_1368:
.annotate 'line', 945
    get_hll_global $P128, ["POST"], "Ops"
    find_lex $P130, "$bpost"
    find_lex $P131, "$node"
    find_lex $P132, "$blockreg"
    $P133 = $P128."new"($P130, $P131 :named("node"), $P132 :named("result"))
    store_lex "$bpost", $P133
.annotate 'line', 946
    find_lex $P128, "$bpost"
    find_lex $P130, "$blockref"
    find_lex $P131, "$blockreg"
    $P128."push_pirop"($P130, $P131 :named("result"))
.annotate 'line', 947
    find_lex $P130, "$islexical"
    if $P130, if_1369
    set $P128, $P130
    goto if_1369_end
  if_1369:
.annotate 'line', 948
    find_lex $P132, "$node"
    $P133 = $P132."closure"()
    if $P133, if_1370
.annotate 'line', 956
    find_lex $P136, "$bpost"
    find_lex $P138, "$blockreg"
    $P139 = $P136."push_pirop"("capture_lex", $P138)
.annotate 'line', 955
    set $P131, $P139
.annotate 'line', 948
    goto if_1370_end
  if_1370:
    .const 'Sub' $P1372 = "54_1313007597.81655" 
    capture_lex $P1372
    $P135 = $P1372()
    set $P131, $P135
  if_1370_end:
.annotate 'line', 947
    set $P128, $P131
  if_1369_end:
.annotate 'line', 944
    set $P126, $P128
  if_1368_end:
    set $P122, $P126
.annotate 'line', 935
    goto if_1359_end
  if_1359:
    .const 'Sub' $P1361 = "53_1313007597.81655" 
    capture_lex $P1361
    $P125 = $P1361()
    set $P122, $P125
  if_1359_end:
.annotate 'line', 811
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1312"  :anon :subid("47_1313007597.81655") :outer("46_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 820
    new $P124, "Undef"
    set $P1314, $P124
    .lex "$cpost", $P1314
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$blockreg"
    $P127 = $P125."new"($P126 :named("result"))
    store_lex "$cpost", $P127
.annotate 'line', 821
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 822
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("capture_lex", $P126)
.annotate 'line', 823
    find_lex $P125, "$outerpost"
    find_lex $P126, "$cpost"
    $P127 = $P125."unshift"($P126)
.annotate 'line', 819
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1319"  :anon :subid("48_1313007597.81655") :outer("46_1313007597.81655")
    .param pmc param_1321
.annotate 'file', "Compiler.pm"
.annotate 'line', 838
    .lex "$_", param_1321
.annotate 'line', 839
    find_lex $P129, "$_"
    find_lex $P128, "%symtable"
    exists $I102, $P128[$P129]
    unless $I102, if_1322_end
    die 0, .CONTROL_LOOP_NEXT
  if_1322_end:
.annotate 'line', 840
    find_lex $P128, "$_"
    find_lex $P1323, "%outersym"
    unless_null $P1323, vivify_282
    $P1323 = root_new ['parrot';'Hash']
  vivify_282:
    set $P129, $P1323[$P128]
    unless_null $P129, vivify_283
    new $P129, "Undef"
  vivify_283:
    find_lex $P130, "$_"
    find_lex $P1324, "%symtable"
    unless_null $P1324, vivify_284
    $P1324 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1324
  vivify_284:
    set $P1324[$P130], $P129
.annotate 'line', 838
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1328"  :anon :subid("49_1313007597.81655") :outer("46_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 857
    .const 'Sub' $P1350 = "51_1313007597.81655" 
    capture_lex $P1350
    .const 'Sub' $P1341 = "50_1313007597.81655" 
    capture_lex $P1341
.annotate 'line', 860
    $P1331 = root_new ['parrot';'Hash']
    set $P1330, $P1331
    .lex "%*TEMPREGS", $P1330
.annotate 'line', 869
    new $P123, "Undef"
    set $P1332, $P123
    .lex "$ctrlpast", $P1332
.annotate 'line', 870
    new $P124, "Undef"
    set $P1333, $P124
    .lex "$ctrllabel", $P1333
.annotate 'line', 883
    new $P125, "Undef"
    set $P1334, $P125
    .lex "$sig", $P1334
.annotate 'line', 885
    new $P126, "Undef"
    set $P1335, $P126
    .lex "$ops", $P1335
.annotate 'line', 887
    new $P127, "Undef"
    set $P1336, $P127
    .lex "$retval", $P1336
.annotate 'line', 889
    new $P128, "Undef"
    set $P1337, $P128
    .lex "$eh", $P1337
.annotate 'line', 857
    find_lex $P129, "%*TEMPREGS"
    unless_null $P129, vivify_287
    get_hll_global $P129, "%TEMPREGS"
    unless_null $P129, vivify_288
    die "Contextual %*TEMPREGS not found"
  vivify_288:
  vivify_287:
.annotate 'line', 861
    find_lex $P129, "$node"
    $P130 = $P129."tempregs"()
    if $P130, if_1338
.annotate 'line', 865
    find_lex $P131, "%outerregs"
    store_lex "%*TEMPREGS", $P131
.annotate 'line', 864
    goto if_1338_end
  if_1338:
.annotate 'line', 862
    find_lex $P131, "self"
    $P132 = $P131."tempreg_frame"()
    store_lex "%*TEMPREGS", $P132
  if_1338_end:
.annotate 'line', 869
    find_lex $P129, "$node"
    $P130 = $P129."control"()
    store_lex "$ctrlpast", $P130
.annotate 'line', 857
    find_lex $P129, "$ctrllabel"
.annotate 'line', 872
    find_lex $P129, "$ctrlpast"
    unless $P129, if_1339_end
    .const 'Sub' $P1341 = "50_1313007597.81655" 
    capture_lex $P1341
    $P1341()
  if_1339_end:
.annotate 'line', 883
    find_lex $P129, "$node"
    $P130 = $P129."list"()
    elements $I100, $P130
    repeat $S100, "v", $I100
    new $P131, 'String'
    set $P131, $S100
    concat $P132, $P131, "*"
    store_lex "$sig", $P132
.annotate 'line', 885
    find_lex $P129, "self"
    find_lex $P130, "$node"
    find_lex $P131, "$sig"
    $P132 = $P129."post_children"($P130, $P131 :named("signature"))
    store_lex "$ops", $P132
.annotate 'line', 887
    find_lex $P1343, "$ops"
    unless_null $P1343, vivify_289
    $P1343 = root_new ['parrot';'ResizablePMCArray']
  vivify_289:
    set $P129, $P1343[-1]
    unless_null $P129, vivify_290
    new $P129, "Undef"
  vivify_290:
    store_lex "$retval", $P129
.annotate 'line', 889
    find_lex $P129, "$node"
    $P130 = $P129."handlers"()
    store_lex "$eh", $P130
.annotate 'line', 890
    find_lex $P129, "$eh"
    unless $P129, if_1344_end
.annotate 'line', 891
    find_lex $P130, "self"
    find_lex $P131, "$ops"
    find_lex $P132, "$eh"
    find_lex $P1345, "%options"
    unless_null $P1345, vivify_291
    $P1345 = root_new ['parrot';'Hash']
  vivify_291:
    set $P133, $P1345["rtype"]
    unless_null $P133, vivify_292
    new $P133, "Undef"
  vivify_292:
    $P134 = $P130."wrap_handlers"($P131, $P132, $P133 :named("rtype"))
    store_lex "$ops", $P134
  if_1344_end:
.annotate 'line', 893
    find_lex $P129, "$bpost"
    find_lex $P130, "$ops"
    $P129."push"($P130)
.annotate 'line', 894
    find_lex $P129, "$ops"
    $P130 = $P129."list"()
    set $N100, $P130
    isgt $I100, $N100, 0.0
    unless $I100, if_1346_end
.annotate 'line', 896
    find_lex $P131, "$bpost"
    find_lex $P132, "$retval"
    $P131."push_pirop"("return", $P132)
  if_1346_end:
.annotate 'line', 899
    find_lex $P130, "$ctrlpast"
    if $P130, if_1347
    set $P129, $P130
    goto if_1347_end
  if_1347:
.annotate 'line', 900
    find_lex $P131, "$bpost"
    find_lex $P132, "$ctrllabel"
    $P131."push"($P132)
.annotate 'line', 901
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".local pmc exception")
.annotate 'line', 902
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".get_results (exception)")
.annotate 'line', 903
    find_lex $P132, "$ctrlpast"
    set $S100, $P132
    iseq $I100, $S100, "return_pir"
    if $I100, if_1348
.annotate 'line', 910
    find_lex $P137, "$ctrlpast"
    get_hll_global $P138, ["PAST"], "Node"
    $P139 = $P137."isa"($P138)
    if $P139, if_1352
.annotate 'line', 914
    find_lex $P140, "self"
    new $P141, 'String'
    set $P141, "Unrecognized control handler '"
    find_lex $P142, "$ctrlpast"
    concat $P143, $P141, $P142
    concat $P145, $P143, "'"
    $P146 = $P140."panic"($P145)
.annotate 'line', 913
    set $P135, $P146
.annotate 'line', 910
    goto if_1352_end
  if_1352:
.annotate 'line', 911
    find_lex $P140, "$bpost"
    find_lex $P141, "self"
    find_lex $P142, "$ctrlpast"
    $P143 = $P141."as_post"($P142, "*" :named("rtype"))
    $P144 = $P140."push"($P143)
.annotate 'line', 910
    set $P135, $P144
  if_1352_end:
    set $P131, $P135
.annotate 'line', 903
    goto if_1348_end
  if_1348:
    .const 'Sub' $P1350 = "51_1313007597.81655" 
    capture_lex $P1350
    $P134 = $P1350()
    set $P131, $P134
  if_1348_end:
.annotate 'line', 899
    set $P129, $P131
  if_1347_end:
.annotate 'line', 857
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1340"  :anon :subid("50_1313007597.81655") :outer("49_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 874
    new $P130, "Undef"
    set $P1342, $P130
    .lex "$reg", $P1342
.annotate 'line', 873
    get_hll_global $P131, ["POST"], "Label"
    find_lex $P132, "self"
    $P133 = $P132."unique"("control_")
    $P134 = $P131."new"($P133 :named("result"))
    store_lex "$ctrllabel", $P134
.annotate 'line', 874
    find_lex $P131, "self"
    $P132 = $P131."uniquereg"("P")
    store_lex "$reg", $P132
.annotate 'line', 875
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("new", $P132, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 877
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    find_lex $P133, "$ctrllabel"
    $P131."push_pirop"("set_label", $P132, $P133)
.annotate 'line', 878
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("push_eh", $P132)
.annotate 'line', 879
    find_lex $P131, "$bpost"
    $P132 = $P131."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 872
    .return ($P132)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1349"  :anon :subid("51_1313007597.81655") :outer("49_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 905
    new $P133, "Undef"
    set $P1351, $P133
    .lex "$reg", $P1351
    find_lex $P134, "self"
    $P135 = $P134."tempreg"("P")
    store_lex "$reg", $P135
.annotate 'line', 906
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P134."push_pirop"("getattribute", $P135, "exception", "\"payload\"")
.annotate 'line', 908
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P136 = $P134."push_pirop"("return", $P135)
.annotate 'line', 903
    .return ($P136)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1354"  :anon :subid("52_1313007597.81655") :outer("46_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 921
    new $P123, "Undef"
    set $P1356, $P123
    .lex "$lisub", $P1356
    get_hll_global $P124, ["POST"], "Sub"
    find_lex $P125, "$bpost"
    $P126 = $P124."new"($P125 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P126
.annotate 'line', 922
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockref"
    $P124."push_pirop"($P125)
.annotate 'line', 923
    find_lex $P124, "$lisub"
    $P124."push_pirop"(".local pmc", "block")
.annotate 'line', 924
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockreg"
    $P124."push_pirop"("set", "block", $P125)
.annotate 'line', 925
    find_lex $P124, "$lisub"
    find_lex $P125, "self"
    find_lex $P126, "$node"
    $P127 = $P126."loadinit"()
    $P128 = $P125."as_post"($P127, "v" :named("rtype"))
    $P124."push"($P128)
.annotate 'line', 926
    find_lex $P124, "$lisub"
    find_lex $P1357, "$bpost"
    unless_null $P1357, vivify_295
    $P1357 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1357
  vivify_295:
    set $P1357["loadinit"], $P124
.annotate 'line', 920
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1371"  :anon :subid("54_1313007597.81655") :outer("46_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 951
    new $P134, "Undef"
    set $P1373, $P134
    .lex "$result", $P1373
    find_lex $P135, "self"
    $P136 = $P135."uniquereg"("P")
    store_lex "$result", $P136
.annotate 'line', 952
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    find_lex $P137, "$blockreg"
    $P135."push_pirop"("newclosure", $P136, $P137)
.annotate 'line', 953
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    $P137 = $P135."result"($P136)
.annotate 'line', 948
    .return ($P137)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1360"  :anon :subid("53_1313007597.81655") :outer("46_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 936
    $P1363 = root_new ['parrot';'ResizablePMCArray']
    set $P1362, $P1363
    .lex "@arglist", $P1362
.annotate 'line', 938
    new $P124, "Undef"
    set $P1364, $P124
    .lex "$result", $P1364
.annotate 'line', 936
    find_lex $P1365, "%options"
    unless_null $P1365, vivify_298
    $P1365 = root_new ['parrot';'Hash']
  vivify_298:
    set $P125, $P1365["arglist"]
    unless_null $P125, vivify_299
    new $P125, "Undef"
  vivify_299:
    store_lex "@arglist", $P125
.annotate 'line', 937
    find_lex $P125, "@arglist"
    defined $I101, $P125
    if $I101, unless_1366_end
    new $P126, "ResizablePMCArray"
    store_lex "@arglist", $P126
  unless_1366_end:
.annotate 'line', 938
    find_lex $P125, "self"
    find_lex $P126, "$rtype"
    $P127 = $P125."tempreg"($P126)
    store_lex "$result", $P127
.annotate 'line', 939
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$bpost"
    find_lex $P127, "$node"
    find_lex $P128, "$result"
    $P129 = $P125."new"($P126, $P127 :named("node"), $P128 :named("result"))
    store_lex "$bpost", $P129
.annotate 'line', 940
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 941
    find_lex $P125, "$islexical"
    unless $P125, if_1367_end
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockreg"
    $P126."push_pirop"("capture_lex", $P127)
  if_1367_end:
.annotate 'line', 942
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockreg"
    find_lex $P127, "@arglist"
    find_lex $P128, "$result"
    $P129 = $P125."push_pirop"("call", $P126, $P127 :flat, $P128 :named("result"))
.annotate 'line', 935
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("55_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1377
    .param pmc param_1378 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 984
    new $P1376, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1376, control_1375
    push_eh $P1376
    .lex "self", self
    .lex "$node", param_1377
    .lex "%options", param_1378
.annotate 'line', 986
    new $P105, "Undef"
    set $P1379, $P105
    .lex "$lvalue", $P1379
.annotate 'line', 987
    new $P106, "Undef"
    set $P1380, $P106
    .lex "$child", $P1380
.annotate 'line', 992
    new $P107, "Undef"
    set $P1381, $P107
    .lex "$pasttype", $P1381
.annotate 'line', 997
    new $P108, "Undef"
    set $P1382, $P108
    .lex "$pirop", $P1382
.annotate 'line', 1002
    new $P109, "Undef"
    set $P1383, $P109
    .lex "$inline", $P1383
.annotate 'line', 986
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    store_lex "$lvalue", $P111
.annotate 'line', 987
    find_lex $P1384, "$node"
    unless_null $P1384, vivify_302
    $P1384 = root_new ['parrot';'ResizablePMCArray']
  vivify_302:
    set $P110, $P1384[0]
    unless_null $P110, vivify_303
    new $P110, "Undef"
  vivify_303:
    store_lex "$child", $P110
.annotate 'line', 988
    find_lex $P112, "$lvalue"
    if $P112, if_1387
    set $P111, $P112
    goto if_1387_end
  if_1387:
    find_lex $P113, "$child"
    defined $I100, $P113
    new $P111, 'Integer'
    set $P111, $I100
  if_1387_end:
    if $P111, if_1386
    set $P110, $P111
    goto if_1386_end
  if_1386:
    find_lex $P114, "$child"
    exists $I101, $P114["lvalue"]
    new $P115, 'Integer'
    set $P115, $I101
    isfalse $I102, $P115
    new $P110, 'Integer'
    set $P110, $I102
  if_1386_end:
    unless $P110, if_1385_end
.annotate 'line', 989
    find_lex $P116, "$child"
    find_lex $P117, "$lvalue"
    $P116."lvalue"($P117)
  if_1385_end:
.annotate 'line', 992
    find_lex $P110, "$node"
    $P111 = $P110."pasttype"()
    store_lex "$pasttype", $P111
.annotate 'line', 993
    find_lex $P110, "$pasttype"
    unless $P110, if_1388_end
.annotate 'line', 994
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
  if_1388_end:
.annotate 'line', 997
    find_lex $P110, "$node"
    $P111 = $P110."pirop"()
    store_lex "$pirop", $P111
.annotate 'line', 998
    find_lex $P110, "$pirop"
    unless $P110, if_1389_end
.annotate 'line', 999
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."pirop"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1389_end:
.annotate 'line', 1002
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1003
    find_lex $P110, "$inline"
    unless $P110, if_1390_end
.annotate 'line', 1004
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."inline"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1390_end:
.annotate 'line', 1007
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "%options"
    $P113 = $P110."call"($P111, $P112 :flat)
.annotate 'line', 984
    .return ($P113)
  control_1375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("56_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1394
    .param pmc param_1395 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1015
    new $P1393, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1393, control_1392
    push_eh $P1393
    .lex "self", self
    .lex "$node", param_1394
    .lex "%options", param_1395
.annotate 'line', 1016
    new $P105, "Undef"
    set $P1396, $P105
    .lex "$pirop", $P1396
.annotate 'line', 1017
    new $P106, "Undef"
    set $P1397, $P106
    .lex "$signature", $P1397
.annotate 'line', 1018
    new $P107, "Undef"
    set $P1398, $P107
    .lex "$I0", $P1398
.annotate 'line', 1034
    new $P108, "Undef"
    set $P1399, $P108
    .lex "$ops", $P1399
.annotate 'line', 1035
    $P1401 = root_new ['parrot';'ResizablePMCArray']
    set $P1400, $P1401
    .lex "@posargs", $P1400
.annotate 'line', 1045
    $P1403 = root_new ['parrot';'ResizablePMCArray']
    set $P1402, $P1403
    .lex "@arglist", $P1402
.annotate 'line', 1047
    new $P109, "Undef"
    set $P1404, $P109
    .lex "$S0", $P1404
.annotate 'line', 1058
    new $P110, "Undef"
    set $P1405, $P110
    .lex "$result", $P1405
.annotate 'line', 1016
    find_lex $P111, "$node"
    $P112 = $P111."pirop"()
    store_lex "$pirop", $P112
.annotate 'line', 1015
    find_lex $P111, "$signature"
    find_lex $P111, "$I0"
.annotate 'line', 1019
    find_lex $P111, "$pirop"
    set $S100, $P111
    index $I100, $S100, " "
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
    set $N100, $P112
    isge $I101, $N100, 0.0
    if $I101, if_1406
.annotate 'line', 1024
    find_lex $P113, "$pirop"
    set $S101, $P113
    index $I102, $S101, "__"
    new $P114, 'Integer'
    set $P114, $I102
    store_lex "$I0", $P114
    set $N101, $P114
    isge $I103, $N101, 0.0
    if $I103, if_1407
.annotate 'line', 1030
    find_lex $P115, "$pirop"
    get_global $P1408, "%piropsig"
    unless_null $P1408, vivify_304
    $P1408 = root_new ['parrot';'Hash']
  vivify_304:
    set $P116, $P1408[$P115]
    unless_null $P116, vivify_305
    new $P116, "Undef"
  vivify_305:
    store_lex "$signature", $P116
.annotate 'line', 1031
    find_lex $P115, "$signature"
    if $P115, unless_1409_end
    new $P116, "String"
    assign $P116, "vP"
    store_lex "$signature", $P116
  unless_1409_end:
.annotate 'line', 1029
    goto if_1407_end
  if_1407:
.annotate 'line', 1026
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    add $P117, $P116, 2
    set $I104, $P117
    substr $S103, $S102, $I104
    new $P118, 'String'
    set $P118, $S103
    store_lex "$signature", $P118
.annotate 'line', 1027
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    set $I104, $P116
    substr $S103, $S102, 0, $I104
    new $P117, 'String'
    set $P117, $S103
    store_lex "$pirop", $P117
  if_1407_end:
.annotate 'line', 1024
    goto if_1406_end
  if_1406:
.annotate 'line', 1021
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    add $P115, $P114, 1
    set $I102, $P115
    substr $S102, $S101, $I102
    new $P116, 'String'
    set $P116, $S102
    store_lex "$signature", $P116
.annotate 'line', 1022
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    set $I102, $P114
    substr $S102, $S101, 0, $I102
    new $P115, 'String'
    set $P115, $S102
    store_lex "$pirop", $P115
  if_1406_end:
.annotate 'line', 1015
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
.annotate 'line', 1037

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1045
    find_lex $P111, "$ops"
    $P112 = $P111."list"()
    store_lex "@arglist", $P112
.annotate 'line', 1047
    find_lex $P111, "$signature"
    set $S100, $P111
    substr $S101, $S100, 0, 1
    new $P112, 'String'
    set $P112, $S101
    store_lex "$S0", $P112
.annotate 'line', 1048
    find_lex $P111, "$S0"
    set $S100, $P111
    iseq $I100, $S100, "v"
    unless $I100, if_1410_end
.annotate 'line', 1049
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1050
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1410_end:
.annotate 'line', 1052
    find_lex $P111, "$S0"
    set $S100, $P111
    index $I100, "0123456789", $S100
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
.annotate 'line', 1053
    find_lex $P111, "$I0"
    set $N100, $P111
    isge $I100, $N100, 0.0
    unless $I100, if_1411_end
.annotate 'line', 1054
    find_lex $P112, "$ops"
    find_lex $P113, "$I0"
    set $I101, $P113
    find_lex $P1412, "@arglist"
    unless_null $P1412, vivify_306
    $P1412 = root_new ['parrot';'ResizablePMCArray']
  vivify_306:
    set $P114, $P1412[$I101]
    unless_null $P114, vivify_307
    new $P114, "Undef"
  vivify_307:
    $P112."result"($P114)
.annotate 'line', 1055
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1056
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1411_end:
.annotate 'line', 1058
    find_lex $P111, "self"
    find_lex $P112, "$S0"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1059
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1060
    find_lex $P111, "$ops"
    find_lex $P112, "$pirop"
    find_lex $P113, "$result"
    find_lex $P114, "@posargs"
    $P111."push_pirop"($P112, $P113, $P114 :flat)
.annotate 'line', 1061
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
.annotate 'line', 1015
    .return ()
  control_1392:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("57_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1416
    .param pmc param_1417 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1069
    .const 'Sub' $P1435 = "58_1313007597.81655" 
    capture_lex $P1435
    new $P1415, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1415, control_1414
    push_eh $P1415
    .lex "self", self
    .lex "$node", param_1416
    .lex "%options", param_1417
.annotate 'line', 1070
    new $P105, "Undef"
    set $P1418, $P105
    .lex "$pasttype", $P1418
.annotate 'line', 1073
    new $P106, "Undef"
    set $P1419, $P106
    .lex "$signature", $P1419
.annotate 'line', 1077
    new $P107, "Undef"
    set $P1420, $P107
    .lex "$name", $P1420
.annotate 'line', 1078
    new $P108, "Undef"
    set $P1421, $P108
    .lex "$ops", $P1421
.annotate 'line', 1079
    $P1423 = root_new ['parrot';'ResizablePMCArray']
    set $P1422, $P1423
    .lex "@posargs", $P1422
.annotate 'line', 1080
    $P1425 = root_new ['parrot';'Hash']
    set $P1424, $P1425
    .lex "%namedargs", $P1424
.annotate 'line', 1105
    new $P109, "Undef"
    set $P1426, $P109
    .lex "$rtype", $P1426
.annotate 'line', 1106
    new $P110, "Undef"
    set $P1427, $P110
    .lex "$result", $P1427
.annotate 'line', 1070
    find_lex $P111, "$node"
    $P112 = $P111."pasttype"()
    store_lex "$pasttype", $P112
.annotate 'line', 1071
    find_lex $P111, "$pasttype"
    if $P111, unless_1428_end
    new $P112, "String"
    assign $P112, "call"
    store_lex "$pasttype", $P112
  unless_1428_end:
.annotate 'line', 1073
    new $P111, "String"
    assign $P111, "v:"
    store_lex "$signature", $P111
.annotate 'line', 1075
    find_lex $P111, "$pasttype"
    set $S100, $P111
    iseq $I100, $S100, "callmethod"
    unless $I100, if_1429_end
    new $P112, "String"
    assign $P112, "vP:"
    store_lex "$signature", $P112
  if_1429_end:
.annotate 'line', 1077
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    store_lex "$name", $P112
.annotate 'line', 1069
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
    find_lex $P111, "%namedargs"
.annotate 'line', 1082
    find_lex $P111, "$name"
    if $P111, unless_1430_end
    find_lex $P112, "$signature"
    set $S100, $P112
    replace $S101, $S100, 1, 0, "P"
    new $P113, 'String'
    set $P113, $S101
    store_lex "$signature", $P113
  unless_1430_end:
.annotate 'line', 1084

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1092
    find_lex $P111, "$name"
    unless $P111, if_1431_end
.annotate 'line', 1093
    find_lex $P113, "$name"
    isa $I100, $P113, "P6object"
    if $I100, if_1433
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1433_end
  if_1433:
    find_lex $P114, "$name"
    get_hll_global $P115, ["PAST"], "Node"
    $P116 = $P114."isa"($P115)
    set $P112, $P116
  if_1433_end:
    if $P112, if_1432
.annotate 'line', 1100
    find_lex $P119, "@posargs"
    find_lex $P120, "self"
    find_lex $P121, "$name"
    $P122 = $P120."escape"($P121)
    unshift $P119, $P122
.annotate 'line', 1099
    goto if_1432_end
  if_1432:
.annotate 'line', 1093
    .const 'Sub' $P1435 = "58_1313007597.81655" 
    capture_lex $P1435
    $P1435()
  if_1432_end:
  if_1431_end:
.annotate 'line', 1105
    find_lex $P1437, "%options"
    unless_null $P1437, vivify_308
    $P1437 = root_new ['parrot';'Hash']
  vivify_308:
    set $P111, $P1437["rtype"]
    unless_null $P111, vivify_309
    new $P111, "Undef"
  vivify_309:
    store_lex "$rtype", $P111
.annotate 'line', 1106
    find_lex $P111, "self"
    find_lex $P112, "$rtype"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1107
    find_lex $P111, "$ops"
    find_lex $P112, "$pasttype"
    find_lex $P113, "@posargs"
    find_lex $P114, "%namedargs"
    find_lex $P115, "$result"
    $P111."push_pirop"($P112, $P113 :flat, $P114 :flat, $P115 :named("result"))
.annotate 'line', 1108
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1069
    find_lex $P111, "$ops"
    .return ($P111)
  control_1414:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1434"  :anon :subid("58_1313007597.81655") :outer("57_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1094
    new $P117, "Undef"
    set $P1436, $P117
    .lex "$name_post", $P1436
    find_lex $P118, "self"
    find_lex $P119, "$name"
    $P120 = $P118."as_post"($P119, "s" :named("rtype"))
    store_lex "$name_post", $P120
.annotate 'line', 1095
    find_lex $P118, "self"
    find_lex $P119, "$name_post"
    $P120 = $P118."coerce"($P119, "s")
    store_lex "$name_post", $P120
.annotate 'line', 1096
    find_lex $P118, "$ops"
    find_lex $P119, "$name_post"
    $P118."push"($P119)
.annotate 'line', 1097
    find_lex $P118, "@posargs"
    find_lex $P119, "$name_post"
    unshift $P118, $P119
.annotate 'line', 1093
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("59_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1441
    .param pmc param_1442 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1117
    new $P1440, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1440, control_1439
    push_eh $P1440
    .lex "self", self
    .lex "$node", param_1441
    .lex "%options", param_1442
.annotate 'line', 1118
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."call"($P106, $P107 :flat)
.annotate 'line', 1117
    .return ($P108)
  control_1439:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("60_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1446
    .param pmc param_1447 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1127
    .const 'Sub' $P1488 = "63_1313007597.81655" 
    capture_lex $P1488
    .const 'Sub' $P1464 = "61_1313007597.81655" 
    capture_lex $P1464
    new $P1445, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1445, control_1444
    push_eh $P1445
    .lex "self", self
    .lex "$node", param_1446
    .lex "%options", param_1447
.annotate 'line', 1128
    new $P105, "Undef"
    set $P1448, $P105
    .lex "$ops", $P1448
.annotate 'line', 1130
    new $P106, "Undef"
    set $P1449, $P106
    .lex "$rtype", $P1449
.annotate 'line', 1131
    new $P107, "Undef"
    set $P1450, $P107
    .lex "$result", $P1450
.annotate 'line', 1134
    new $P108, "Undef"
    set $P1451, $P108
    .lex "$pasttype", $P1451
.annotate 'line', 1136
    new $P109, "Undef"
    set $P1452, $P109
    .lex "$exprpast", $P1452
.annotate 'line', 1137
    new $P110, "Undef"
    set $P1453, $P110
    .lex "$thenpast", $P1453
.annotate 'line', 1138
    new $P111, "Undef"
    set $P1454, $P111
    .lex "$elsepast", $P1454
.annotate 'line', 1140
    new $P112, "Undef"
    set $P1455, $P112
    .lex "$S0", $P1455
.annotate 'line', 1141
    new $P113, "Undef"
    set $P1456, $P113
    .lex "$thenlabel", $P1456
.annotate 'line', 1142
    new $P114, "Undef"
    set $P1457, $P114
    .lex "$endlabel", $P1457
.annotate 'line', 1144
    new $P115, "Undef"
    set $P1458, $P115
    .lex "$exprrtype", $P1458
.annotate 'line', 1146
    new $P116, "Undef"
    set $P1459, $P116
    .lex "$childrtype", $P1459
.annotate 'line', 1149
    new $P117, "Undef"
    set $P1460, $P117
    .lex "$exprpost", $P1460
.annotate 'line', 1151
    new $P118, "Undef"
    set $P1461, $P118
    .lex "$thenpost", $P1461
.annotate 'line', 1152
    new $P119, "Undef"
    set $P1462, $P119
    .lex "$elsepost", $P1462
.annotate 'line', 1174
    .const 'Sub' $P1464 = "61_1313007597.81655" 
    newclosure $P1477, $P1464
    set $P1463, $P1477
    .lex "make_childpost", $P1463
.annotate 'line', 1128
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$node"
    $P126 = $P124."new"($P125 :named("node"))
    store_lex "$ops", $P126
.annotate 'line', 1130
    find_lex $P1478, "%options"
    unless_null $P1478, vivify_311
    $P1478 = root_new ['parrot';'Hash']
  vivify_311:
    set $P124, $P1478["rtype"]
    unless_null $P124, vivify_312
    new $P124, "Undef"
  vivify_312:
    store_lex "$rtype", $P124
.annotate 'line', 1131
    find_lex $P124, "self"
    find_lex $P125, "$rtype"
    $P126 = $P124."tempreg"($P125)
    store_lex "$result", $P126
.annotate 'line', 1132
    find_lex $P124, "$ops"
    find_lex $P125, "$result"
    $P124."result"($P125)
.annotate 'line', 1134
    find_lex $P124, "$node"
    $P125 = $P124."pasttype"()
    store_lex "$pasttype", $P125
.annotate 'line', 1136
    find_lex $P1479, "$node"
    unless_null $P1479, vivify_313
    $P1479 = root_new ['parrot';'ResizablePMCArray']
  vivify_313:
    set $P124, $P1479[0]
    unless_null $P124, vivify_314
    new $P124, "Undef"
  vivify_314:
    store_lex "$exprpast", $P124
.annotate 'line', 1137
    find_lex $P1480, "$node"
    unless_null $P1480, vivify_315
    $P1480 = root_new ['parrot';'ResizablePMCArray']
  vivify_315:
    set $P124, $P1480[1]
    unless_null $P124, vivify_316
    new $P124, "Undef"
  vivify_316:
    store_lex "$thenpast", $P124
.annotate 'line', 1138
    find_lex $P1481, "$node"
    unless_null $P1481, vivify_317
    $P1481 = root_new ['parrot';'ResizablePMCArray']
  vivify_317:
    set $P124, $P1481[2]
    unless_null $P124, vivify_318
    new $P124, "Undef"
  vivify_318:
    store_lex "$elsepast", $P124
.annotate 'line', 1140
    find_lex $P124, "self"
    find_lex $P125, "$pasttype"
    concat $P126, $P125, "_"
    $P127 = $P124."unique"($P126)
    store_lex "$S0", $P127
.annotate 'line', 1141
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$thenlabel", $P126
.annotate 'line', 1142
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    concat $P126, $P125, "_end"
    $P127 = $P124."new"($P126 :named("result"))
    store_lex "$endlabel", $P127
.annotate 'line', 1144
    new $P124, "String"
    assign $P124, "r"
    store_lex "$exprrtype", $P124
.annotate 'line', 1145
    find_lex $P124, "$rtype"
    set $S100, $P124
    iseq $I100, $S100, "v"
    unless $I100, if_1482_end
    new $P125, "String"
    assign $P125, "*"
    store_lex "$exprrtype", $P125
  if_1482_end:
.annotate 'line', 1146
    find_lex $P124, "$rtype"
    store_lex "$childrtype", $P124
.annotate 'line', 1147
    find_lex $P124, "$rtype"
    set $S100, $P124
    index $I100, "*:", $S100
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1483_end
    new $P125, "String"
    assign $P125, "P"
    store_lex "$childrtype", $P125
  if_1483_end:
.annotate 'line', 1149
    find_lex $P124, "self"
    find_lex $P125, "$exprpast"
    find_lex $P126, "$exprrtype"
    $P127 = $P124."as_post"($P125, $P126 :named("rtype"))
    store_lex "$exprpost", $P127
.annotate 'line', 1151
    find_lex $P124, "$thenpast"
    $P125 = "make_childpost"($P124)
    store_lex "$thenpost", $P125
.annotate 'line', 1152
    find_lex $P124, "$elsepast"
    $P125 = "make_childpost"($P124)
    store_lex "$elsepost", $P125
.annotate 'line', 1154
    find_lex $P124, "$elsepost"
    defined $I100, $P124
    if $I100, if_1484
.annotate 'line', 1164
    .const 'Sub' $P1488 = "63_1313007597.81655" 
    capture_lex $P1488
    $P1488()
    goto if_1484_end
  if_1484:
.annotate 'line', 1155
    find_lex $P125, "$ops"
    find_lex $P126, "$exprpost"
    $P125."push"($P126)
.annotate 'line', 1156
    find_lex $P125, "$ops"
    find_lex $P126, "$pasttype"
    find_lex $P127, "$exprpost"
    find_lex $P128, "$thenlabel"
    $P125."push_pirop"($P126, $P127, $P128)
.annotate 'line', 1157
    find_lex $P125, "$elsepost"
    defined $I101, $P125
    unless $I101, if_1485_end
    find_lex $P126, "$ops"
    find_lex $P127, "$elsepost"
    $P126."push"($P127)
  if_1485_end:
.annotate 'line', 1158
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push_pirop"("goto", $P126)
.annotate 'line', 1159
    find_lex $P125, "$ops"
    find_lex $P126, "$thenlabel"
    $P125."push"($P126)
.annotate 'line', 1160
    find_lex $P125, "$thenpost"
    defined $I101, $P125
    unless $I101, if_1486_end
    find_lex $P126, "$ops"
    find_lex $P127, "$thenpost"
    $P126."push"($P127)
  if_1486_end:
.annotate 'line', 1161
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push"($P126)
.annotate 'line', 1162
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$ops"
    setattribute $P125, 'payload', $P126
    throw $P125
  if_1484_end:
.annotate 'line', 1127
    find_lex $P124, "make_childpost"
    .return ($P124)
  control_1444:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("61_1313007597.81655") :outer("60_1313007597.81655")
    .param pmc param_1467 :optional
    .param int has_param_1467 :opt_flag
.annotate 'file', "Compiler.pm"
.annotate 'line', 1174
    .const 'Sub' $P1471 = "62_1313007597.81655" 
    capture_lex $P1471
    new $P1466, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1466, control_1465
    push_eh $P1466
    if has_param_1467, optparam_310
    new $P120, "Undef"
    set param_1467, $P120
  optparam_310:
    .lex "$childpast", param_1467
.annotate 'line', 1175
    new $P121, "Undef"
    set $P1468, $P121
    .lex "$childpost", $P1468
.annotate 'line', 1174
    find_lex $P122, "$childpost"
.annotate 'line', 1176
    find_lex $P122, "$childpast"
    defined $I100, $P122
    if $I100, if_1469
.annotate 'line', 1183
    find_lex $P123, "$rtype"
    set $S100, $P123
    iseq $I101, $S100, "v"
    unless $I101, if_1475_end
    new $P124, "Exception"
    set $P124['type'], .CONTROL_RETURN
    find_lex $P125, "$childpost"
    setattribute $P124, 'payload', $P125
    throw $P124
  if_1475_end:
.annotate 'line', 1184
    get_hll_global $P123, ["POST"], "Ops"
    find_lex $P124, "$exprpost"
    $P125 = $P123."new"($P124 :named("result"))
    store_lex "$childpost", $P125
.annotate 'line', 1182
    goto if_1469_end
  if_1469:
.annotate 'line', 1176
    .const 'Sub' $P1471 = "62_1313007597.81655" 
    capture_lex $P1471
    $P1471()
  if_1469_end:
.annotate 'line', 1186
    find_lex $P122, "$result"
    unless $P122, if_1476_end
    find_lex $P123, "self"
    find_lex $P124, "$childpost"
    find_lex $P125, "$result"
    $P126 = $P123."coerce"($P124, $P125)
    store_lex "$childpost", $P126
  if_1476_end:
.annotate 'line', 1174
    find_lex $P122, "$childpost"
    .return ($P122)
  control_1465:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1470"  :anon :subid("62_1313007597.81655") :outer("61_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1177
    $P1473 = root_new ['parrot';'ResizablePMCArray']
    set $P1472, $P1473
    .lex "@arglist", $P1472
    new $P123, "ResizablePMCArray"
    store_lex "@arglist", $P123
.annotate 'line', 1178
    find_lex $P123, "$childpast"
    $N100 = $P123."arity"()
    isgt $I101, $N100, 0.0
    unless $I101, if_1474_end
    find_lex $P124, "@arglist"
    find_lex $P125, "$exprpost"
    push $P124, $P125
  if_1474_end:
.annotate 'line', 1179
    find_lex $P123, "self"
    find_lex $P124, "$childpast"
    find_lex $P125, "$childrtype"
    find_lex $P126, "@arglist"
    $P127 = $P123."as_post"($P124, $P125 :named("rtype"), $P126 :named("arglist"))
    store_lex "$childpost", $P127
.annotate 'line', 1176
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1487"  :anon :subid("63_1313007597.81655") :outer("60_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1165
    new $P125, "Undef"
    set $P1489, $P125
    .lex "$S0", $P1489
    new $P126, "String"
    assign $P126, "if"
    store_lex "$S0", $P126
.annotate 'line', 1166
    find_lex $P126, "$pasttype"
    set $S100, $P126
    find_lex $P127, "$S0"
    set $S101, $P127
    iseq $I101, $S100, $S101
    unless $I101, if_1490_end
    new $P128, "String"
    assign $P128, "unless"
    store_lex "$S0", $P128
  if_1490_end:
.annotate 'line', 1167
    find_lex $P126, "$ops"
    find_lex $P127, "$exprpost"
    $P126."push"($P127)
.annotate 'line', 1168
    find_lex $P126, "$ops"
    find_lex $P127, "$S0"
    find_lex $P128, "$exprpost"
    find_lex $P129, "$endlabel"
    $P126."push_pirop"($P127, $P128, $P129)
.annotate 'line', 1169
    find_lex $P126, "$thenpost"
    defined $I101, $P126
    unless $I101, if_1491_end
    find_lex $P127, "$ops"
    find_lex $P128, "$thenpost"
    $P127."push"($P128)
  if_1491_end:
.annotate 'line', 1170
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push"($P127)
.annotate 'line', 1171
    new $P126, "Exception"
    set $P126['type'], .CONTROL_RETURN
    find_lex $P127, "$ops"
    setattribute $P126, 'payload', $P127
    throw $P126
.annotate 'line', 1164
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("64_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1495
    .param pmc param_1496 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1191
    new $P1494, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1494, control_1493
    push_eh $P1494
    .lex "self", self
    .lex "$node", param_1495
    .lex "%options", param_1496
.annotate 'line', 1192
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."if"($P106, $P107 :flat)
.annotate 'line', 1191
    .return ($P108)
  control_1493:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("65_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1500 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1199
    new $P1499, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1499, control_1498
    push_eh $P1499
    .lex "self", self
    .lex "%options", param_1500
.annotate 'line', 1200
    new $P105, "Undef"
    set $P1501, $P105
    .lex "$loopname", $P1501
.annotate 'line', 1201
    new $P106, "Undef"
    set $P1502, $P106
    .lex "$testlabel", $P1502
.annotate 'line', 1202
    new $P107, "Undef"
    set $P1503, $P107
    .lex "$redolabel", $P1503
.annotate 'line', 1203
    new $P108, "Undef"
    set $P1504, $P108
    .lex "$nextlabel", $P1504
.annotate 'line', 1204
    new $P109, "Undef"
    set $P1505, $P109
    .lex "$donelabel", $P1505
.annotate 'line', 1205
    new $P110, "Undef"
    set $P1506, $P110
    .lex "$handlabel", $P1506
.annotate 'line', 1207
    new $P111, "Undef"
    set $P1507, $P111
    .lex "$testop", $P1507
.annotate 'line', 1208
    new $P112, "Undef"
    set $P1508, $P112
    .lex "$testpost", $P1508
.annotate 'line', 1209
    new $P113, "Undef"
    set $P1509, $P113
    .lex "$prepost", $P1509
.annotate 'line', 1210
    new $P114, "Undef"
    set $P1510, $P114
    .lex "$bodypost", $P1510
.annotate 'line', 1211
    new $P115, "Undef"
    set $P1511, $P115
    .lex "$nextpost", $P1511
.annotate 'line', 1212
    new $P116, "Undef"
    set $P1512, $P116
    .lex "$bodyfirst", $P1512
.annotate 'line', 1216
    new $P117, "Undef"
    set $P1513, $P117
    .lex "$ops", $P1513
.annotate 'line', 1220
    new $P118, "Undef"
    set $P1514, $P118
    .lex "$handreg", $P1514
.annotate 'line', 1242
    new $P119, "Undef"
    set $P1515, $P119
    .lex "$S0", $P1515
.annotate 'line', 1200
    find_lex $P120, "self"
    $P121 = $P120."unique"("loop")
    store_lex "$loopname", $P121
.annotate 'line', 1201
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_test"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$testlabel", $P123
.annotate 'line', 1202
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_redo"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$redolabel", $P123
.annotate 'line', 1203
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_next"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$nextlabel", $P123
.annotate 'line', 1204
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_done"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$donelabel", $P123
.annotate 'line', 1205
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_handler"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$handlabel", $P123
.annotate 'line', 1207
    find_lex $P1516, "%options"
    unless_null $P1516, vivify_319
    $P1516 = root_new ['parrot';'Hash']
  vivify_319:
    set $P120, $P1516["testop"]
    unless_null $P120, vivify_320
    new $P120, "Undef"
  vivify_320:
    store_lex "$testop", $P120
.annotate 'line', 1208
    find_lex $P1517, "%options"
    unless_null $P1517, vivify_321
    $P1517 = root_new ['parrot';'Hash']
  vivify_321:
    set $P120, $P1517["test"]
    unless_null $P120, vivify_322
    new $P120, "Undef"
  vivify_322:
    store_lex "$testpost", $P120
.annotate 'line', 1209
    find_lex $P1518, "%options"
    unless_null $P1518, vivify_323
    $P1518 = root_new ['parrot';'Hash']
  vivify_323:
    set $P120, $P1518["pre"]
    unless_null $P120, vivify_324
    new $P120, "Undef"
  vivify_324:
    store_lex "$prepost", $P120
.annotate 'line', 1210
    find_lex $P1519, "%options"
    unless_null $P1519, vivify_325
    $P1519 = root_new ['parrot';'Hash']
  vivify_325:
    set $P120, $P1519["body"]
    unless_null $P120, vivify_326
    new $P120, "Undef"
  vivify_326:
    store_lex "$bodypost", $P120
.annotate 'line', 1211
    find_lex $P1520, "%options"
    unless_null $P1520, vivify_327
    $P1520 = root_new ['parrot';'Hash']
  vivify_327:
    set $P120, $P1520["next"]
    unless_null $P120, vivify_328
    new $P120, "Undef"
  vivify_328:
    store_lex "$nextpost", $P120
.annotate 'line', 1212
    find_lex $P1521, "%options"
    unless_null $P1521, vivify_329
    $P1521 = root_new ['parrot';'Hash']
  vivify_329:
    set $P120, $P1521["bodyfirst"]
    unless_null $P120, vivify_330
    new $P120, "Undef"
  vivify_330:
    store_lex "$bodyfirst", $P120
.annotate 'line', 1214
    find_lex $P120, "$testop"
    if $P120, unless_1522_end
    new $P121, "String"
    assign $P121, "unless"
    store_lex "$testop", $P121
  unless_1522_end:
.annotate 'line', 1216
    get_hll_global $P120, ["POST"], "Ops"
    $P121 = $P120."new"()
    store_lex "$ops", $P121
.annotate 'line', 1218
    find_dynamic_lex $P120, "$*SUB"
    unless_null $P120, vivify_331
    get_hll_global $P120, "$SUB"
    unless_null $P120, vivify_332
    die "Contextual $*SUB not found"
  vivify_332:
  vivify_331:
    $P120."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1220
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$handreg", $P121
.annotate 'line', 1221
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("new", $P121, "'ExceptionHandler'")
.annotate 'line', 1222
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    find_lex $P122, "$handlabel"
    $P120."push_pirop"("set_label", $P121, $P122)
.annotate 'line', 1223
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("callmethod", "\"handle_types\"", $P121, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1225
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("push_eh", $P121)
.annotate 'line', 1227
    find_lex $P120, "$bodyfirst"
    unless $P120, if_1523_end
    find_lex $P121, "$ops"
    find_lex $P122, "$redolabel"
    $P121."push_pirop"("goto", $P122)
  if_1523_end:
.annotate 'line', 1228
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push"($P121)
.annotate 'line', 1229
    find_lex $P120, "$testpost"
    unless $P120, if_1524_end
.annotate 'line', 1230
    find_lex $P121, "$ops"
    find_lex $P122, "$testpost"
    $P121."push"($P122)
.annotate 'line', 1231
    find_lex $P121, "$ops"
    find_lex $P122, "$testop"
    find_lex $P123, "$testpost"
    find_lex $P124, "$donelabel"
    $P121."push_pirop"($P122, $P123, $P124)
  if_1524_end:
.annotate 'line', 1233
    find_lex $P120, "$prepost"
    unless $P120, if_1525_end
    find_lex $P121, "$ops"
    find_lex $P122, "$prepost"
    $P121."push"($P122)
  if_1525_end:
.annotate 'line', 1234
    find_lex $P120, "$ops"
    find_lex $P121, "$redolabel"
    $P120."push"($P121)
.annotate 'line', 1235
    find_lex $P120, "$bodypost"
    unless $P120, if_1526_end
    find_lex $P121, "$ops"
    find_lex $P122, "$bodypost"
    $P121."push"($P122)
  if_1526_end:
.annotate 'line', 1236
    find_lex $P120, "$ops"
    find_lex $P121, "$nextlabel"
    $P120."push"($P121)
.annotate 'line', 1237
    find_lex $P120, "$nextpost"
    unless $P120, if_1527_end
    find_lex $P121, "$ops"
    find_lex $P122, "$nextpost"
    $P121."push"($P122)
  if_1527_end:
.annotate 'line', 1238
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push_pirop"("goto", $P121)
.annotate 'line', 1239
    find_lex $P120, "$ops"
    find_lex $P121, "$handlabel"
    $P120."push"($P121)
.annotate 'line', 1240
    find_lex $P120, "$ops"
    $P120."push_pirop"(".local pmc exception")
.annotate 'line', 1241
    find_lex $P120, "$ops"
    $P120."push_pirop"(".get_results (exception)")
.annotate 'line', 1242
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$S0", $P121
.annotate 'line', 1243
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    $P120."push_pirop"("getattribute", $P121, "exception", "'type'")
.annotate 'line', 1244
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$nextlabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_NEXT", $P122)
.annotate 'line', 1245
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$redolabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_REDO", $P122)
.annotate 'line', 1246
    find_lex $P120, "$ops"
    find_lex $P121, "$donelabel"
    $P120."push"($P121)
.annotate 'line', 1247
    find_lex $P120, "$ops"
    $P120."push_pirop"("pop_eh")
.annotate 'line', 1199
    find_lex $P120, "$ops"
    .return ($P120)
  control_1498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("66_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1531
    .param pmc param_1532 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1258
    new $P1530, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1530, control_1529
    push_eh $P1530
    .lex "self", self
    .lex "$node", param_1531
    .lex "%options", param_1532
.annotate 'line', 1259
    new $P105, "Undef"
    set $P1533, $P105
    .lex "$exprpast", $P1533
.annotate 'line', 1260
    new $P106, "Undef"
    set $P1534, $P106
    .lex "$bodypast", $P1534
.annotate 'line', 1261
    new $P107, "Undef"
    set $P1535, $P107
    .lex "$nextpast", $P1535
.annotate 'line', 1263
    new $P108, "Undef"
    set $P1536, $P108
    .lex "$exprpost", $P1536
.annotate 'line', 1265
    $P1538 = root_new ['parrot';'ResizablePMCArray']
    set $P1537, $P1538
    .lex "@arglist", $P1537
.annotate 'line', 1267
    new $P109, "Undef"
    set $P1539, $P109
    .lex "$bodypost", $P1539
.annotate 'line', 1269
    new $P110, "Undef"
    set $P1540, $P110
    .lex "$nextpost", $P1540
.annotate 'line', 1272
    new $P111, "Undef"
    set $P1541, $P111
    .lex "$testop", $P1541
.annotate 'line', 1273
    new $P112, "Undef"
    set $P1542, $P112
    .lex "$bodyfirst", $P1542
.annotate 'line', 1275
    new $P113, "Undef"
    set $P1543, $P113
    .lex "$ops", $P1543
.annotate 'line', 1259
    find_lex $P1544, "$node"
    unless_null $P1544, vivify_333
    $P1544 = root_new ['parrot';'ResizablePMCArray']
  vivify_333:
    set $P114, $P1544[0]
    unless_null $P114, vivify_334
    new $P114, "Undef"
  vivify_334:
    store_lex "$exprpast", $P114
.annotate 'line', 1260
    find_lex $P1545, "$node"
    unless_null $P1545, vivify_335
    $P1545 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P114, $P1545[1]
    unless_null $P114, vivify_336
    new $P114, "Undef"
  vivify_336:
    store_lex "$bodypast", $P114
.annotate 'line', 1261
    find_lex $P1546, "$node"
    unless_null $P1546, vivify_337
    $P1546 = root_new ['parrot';'ResizablePMCArray']
  vivify_337:
    set $P114, $P1546[2]
    unless_null $P114, vivify_338
    new $P114, "Undef"
  vivify_338:
    store_lex "$nextpast", $P114
.annotate 'line', 1263
    find_lex $P114, "self"
    find_lex $P115, "$exprpast"
    $P116 = $P114."as_post"($P115, "r" :named("rtype"))
    store_lex "$exprpost", $P116
.annotate 'line', 1265
    new $P114, "ResizablePMCArray"
    store_lex "@arglist", $P114
.annotate 'line', 1266
    find_lex $P114, "$bodypast"
    $N100 = $P114."arity"()
    islt $I100, $N100, 1.0
    if $I100, unless_1547_end
    find_lex $P115, "@arglist"
    find_lex $P116, "$exprpost"
    push $P115, $P116
  unless_1547_end:
.annotate 'line', 1267
    find_lex $P114, "self"
    find_lex $P115, "$bodypast"
    find_lex $P116, "@arglist"
    $P117 = $P114."as_post"($P115, "v" :named("rtype"), $P116 :named("arglist"))
    store_lex "$bodypost", $P117
.annotate 'line', 1269
    get_hll_global $P114, "null__P"
    store_lex "$nextpost", $P114
.annotate 'line', 1270
    find_lex $P114, "$nextpast"
    unless $P114, if_1548_end
    find_lex $P115, "self"
    find_lex $P116, "$nextpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    store_lex "$nextpost", $P117
  if_1548_end:
.annotate 'line', 1272
    find_lex $P1549, "%options"
    unless_null $P1549, vivify_339
    $P1549 = root_new ['parrot';'Hash']
  vivify_339:
    set $P114, $P1549["testop"]
    unless_null $P114, vivify_340
    new $P114, "Undef"
  vivify_340:
    store_lex "$testop", $P114
.annotate 'line', 1273
    find_lex $P1550, "%options"
    unless_null $P1550, vivify_341
    $P1550 = root_new ['parrot';'Hash']
  vivify_341:
    set $P114, $P1550["bodyfirst"]
    unless_null $P114, vivify_342
    new $P114, "Undef"
  vivify_342:
    store_lex "$bodyfirst", $P114
.annotate 'line', 1275
    find_lex $P114, "self"
    find_lex $P115, "$testop"
    find_lex $P116, "$exprpost"
    find_lex $P117, "$bodypost"
    find_lex $P118, "$bodyfirst"
    find_lex $P119, "$nextpost"
    $P120 = $P114."loop_gen"($P115 :named("testop"), $P116 :named("test"), $P117 :named("body"), $P118 :named("bodyfirst"), $P119 :named("next"))
    store_lex "$ops", $P120
.annotate 'line', 1277
    find_lex $P114, "$ops"
    find_lex $P115, "$exprpost"
    $P114."result"($P115)
.annotate 'line', 1278
    find_lex $P114, "$ops"
    find_lex $P115, "$node"
    $P114."node"($P115)
.annotate 'line', 1258
    find_lex $P114, "$ops"
    .return ($P114)
  control_1529:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("67_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1554
    .param pmc param_1555 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1282
    new $P1553, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1553, control_1552
    push_eh $P1553
    .lex "self", self
    .lex "$node", param_1554
    .lex "%options", param_1555
.annotate 'line', 1283
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"))
.annotate 'line', 1282
    .return ($P108)
  control_1552:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("68_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1559
    .param pmc param_1560 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1286
    new $P1558, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1558, control_1557
    push_eh $P1558
    .lex "self", self
    .lex "$node", param_1559
    .lex "%options", param_1560
.annotate 'line', 1287
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1286
    .return ($P108)
  control_1557:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("69_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1564
    .param pmc param_1565 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1290
    new $P1563, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1563, control_1562
    push_eh $P1563
    .lex "self", self
    .lex "$node", param_1564
    .lex "%options", param_1565
.annotate 'line', 1291
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1290
    .return ($P108)
  control_1562:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("70_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1569
    .param pmc param_1570 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1299
    .const 'Sub' $P1588 = "71_1313007597.81655" 
    capture_lex $P1588
    new $P1568, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1568, control_1567
    push_eh $P1568
    .lex "self", self
    .lex "$node", param_1569
    .lex "%options", param_1570
.annotate 'line', 1300
    new $P105, "Undef"
    set $P1571, $P105
    .lex "$ops", $P1571
.annotate 'line', 1301
    new $P106, "Undef"
    set $P1572, $P106
    .lex "$prepost", $P1572
.annotate 'line', 1302
    new $P107, "Undef"
    set $P1573, $P107
    .lex "$testpost", $P1573
.annotate 'line', 1304
    new $P108, "Undef"
    set $P1574, $P108
    .lex "$collpast", $P1574
.annotate 'line', 1305
    new $P109, "Undef"
    set $P1575, $P109
    .lex "$bodypast", $P1575
.annotate 'line', 1307
    new $P110, "Undef"
    set $P1576, $P110
    .lex "$collpost", $P1576
.annotate 'line', 1311
    new $P111, "Undef"
    set $P1577, $P111
    .lex "$undeflabel", $P1577
.annotate 'line', 1312
    new $P112, "Undef"
    set $P1578, $P112
    .lex "$S0", $P1578
.annotate 'line', 1320
    new $P113, "Undef"
    set $P1579, $P113
    .lex "$arity", $P1579
.annotate 'line', 1329
    $P1581 = root_new ['parrot';'ResizablePMCArray']
    set $P1580, $P1581
    .lex "@arglist", $P1580
.annotate 'line', 1339
    new $P114, "Undef"
    set $P1582, $P114
    .lex "$bodypost", $P1582
.annotate 'line', 1300
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1301
    get_hll_global $P115, ["POST"], "Ops"
    $P116 = $P115."new"()
    store_lex "$prepost", $P116
.annotate 'line', 1302
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("P")
    $P118 = $P115."new"($P117 :named("result"))
    store_lex "$testpost", $P118
.annotate 'line', 1304
    find_lex $P1583, "$node"
    unless_null $P1583, vivify_343
    $P1583 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P115, $P1583[0]
    unless_null $P115, vivify_344
    new $P115, "Undef"
  vivify_344:
    store_lex "$collpast", $P115
.annotate 'line', 1305
    find_lex $P1584, "$node"
    unless_null $P1584, vivify_345
    $P1584 = root_new ['parrot';'ResizablePMCArray']
  vivify_345:
    set $P115, $P1584[1]
    unless_null $P115, vivify_346
    new $P115, "Undef"
  vivify_346:
    store_lex "$bodypast", $P115
.annotate 'line', 1307
    find_lex $P115, "self"
    find_lex $P116, "$collpast"
    $P117 = $P115."as_post"($P116, "P" :named("rtype"))
    store_lex "$collpost", $P117
.annotate 'line', 1308
    find_lex $P115, "$ops"
    find_lex $P116, "$collpost"
    $P115."push"($P116)
.annotate 'line', 1311
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P116
.annotate 'line', 1312
    find_lex $P115, "self"
    $P116 = $P115."tempreg"("I")
    store_lex "$S0", $P116
.annotate 'line', 1313
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("defined", $P116, $P117)
.annotate 'line', 1314
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$undeflabel"
    $P115."push_pirop"("unless", $P116, $P117)
.annotate 'line', 1316
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("iter", $P116, $P117)
.annotate 'line', 1320
    new $P115, "Integer"
    assign $P115, 1
    store_lex "$arity", $P115
.annotate 'line', 1321
    find_lex $P115, "$node"
    $P116 = $P115."arity"()
    defined $I100, $P116
    if $I100, if_1585
.annotate 'line', 1324
    find_lex $P117, "$bodypast"
    $P118 = $P117."arity"()
    defined $I101, $P118
    unless $I101, if_1586_end
.annotate 'line', 1325
    find_lex $P119, "$bodypast"
    $P120 = $P119."arity"()
    store_lex "$arity", $P120
  if_1586_end:
.annotate 'line', 1324
    goto if_1585_end
  if_1585:
.annotate 'line', 1322
    find_lex $P117, "$node"
    $P118 = $P117."arity"()
    store_lex "$arity", $P118
  if_1585_end:
.annotate 'line', 1329
    new $P115, "ResizablePMCArray"
    store_lex "@arglist", $P115
.annotate 'line', 1330
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1592_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
    goto loop1592_redo
  loop1592_test:
    find_lex $P115, "$arity"
    set $N100, $P115
    isgt $I100, $N100, 0.0
    unless $I100, loop1592_done
  loop1592_redo:
    .const 'Sub' $P1588 = "71_1313007597.81655" 
    capture_lex $P1588
    $P1588()
  loop1592_next:
    goto loop1592_test
  loop1592_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1592_next
    eq $P118, .CONTROL_LOOP_REDO, loop1592_redo
  loop1592_done:
    pop_eh 
.annotate 'line', 1339
    find_lex $P115, "self"
    find_lex $P116, "$bodypast"
    find_lex $P117, "@arglist"
    $P118 = $P115."as_post"($P116, "v" :named("rtype"), $P117 :named("arglist"))
    store_lex "$bodypost", $P118
.annotate 'line', 1342
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$testpost"
    find_lex $P118, "$prepost"
    find_lex $P119, "$bodypost"
    $P120 = $P116."loop_gen"($P117 :named("test"), $P118 :named("pre"), $P119 :named("body"))
    $P115."push"($P120)
.annotate 'line', 1344
    find_lex $P115, "$ops"
    find_lex $P116, "$undeflabel"
    $P115."push"($P116)
.annotate 'line', 1345
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    $P115."result"($P116)
.annotate 'line', 1299
    find_lex $P115, "$ops"
    .return ($P115)
  control_1567:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1587"  :anon :subid("71_1313007597.81655") :outer("70_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1331
    new $P116, "Undef"
    set $P1589, $P116
    .lex "$nextarg", $P1589
    find_lex $P117, "self"
    $P118 = $P117."tempreg"("P")
    store_lex "$nextarg", $P118
.annotate 'line', 1332
    find_lex $P117, "$prepost"
    find_lex $P118, "$nextarg"
    find_lex $P119, "$testpost"
    $P117."push_pirop"("shift", $P118, $P119)
.annotate 'line', 1333
    find_lex $P117, "$arity"
    set $N101, $P117
    islt $I101, $N101, 1.0
    unless $I101, if_1590_end
    die 0, .CONTROL_LOOP_LAST
  if_1590_end:
.annotate 'line', 1334
    find_lex $P117, "@arglist"
    find_lex $P118, "$nextarg"
    push $P117, $P118
.annotate 'line', 1330
    find_lex $P117, "$arity"
    clone $P1591, $P117
    dec $P117
    .return ($P1591)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("72_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1596
    .param pmc param_1597 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1355
    .const 'Sub' $P1605 = "73_1313007597.81655" 
    capture_lex $P1605
    new $P1595, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1595, control_1594
    push_eh $P1595
    .lex "self", self
    .lex "$node", param_1596
    .lex "%options", param_1597
.annotate 'line', 1357
    new $P105, "Undef"
    set $P1598, $P105
    .lex "$ops", $P1598
.annotate 'line', 1358
    $P1600 = root_new ['parrot';'ResizablePMCArray']
    set $P1599, $P1600
    .lex "@posargs", $P1599
.annotate 'line', 1366
    new $P106, "Undef"
    set $P1601, $P106
    .lex "$returns", $P1601
.annotate 'line', 1369
    new $P107, "Undef"
    set $P1602, $P107
    .lex "$listpost", $P1602
.annotate 'line', 1355
    find_lex $P108, "$ops"
    find_lex $P108, "@posargs"
.annotate 'line', 1359

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1366
    find_lex $P108, "$node"
    $P109 = $P108."returns"()
    store_lex "$returns", $P109
.annotate 'line', 1367
    find_lex $P108, "$returns"
    if $P108, unless_1603_end
    new $P109, "String"
    assign $P109, "ResizablePMCArray"
    store_lex "$returns", $P109
  unless_1603_end:
.annotate 'line', 1369
    find_lex $P108, "self"
    find_lex $P109, "$returns"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$listpost", $P110
.annotate 'line', 1370
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."result"($P109)
.annotate 'line', 1371
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."push"($P109)
.annotate 'line', 1372
    find_lex $P109, "@posargs"
    defined $I100, $P109
    unless $I100, for_undef_347
    iter $P108, $P109
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1607_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1607_test:
    unless $P108, loop1607_done
    shift $P110, $P108
  loop1607_redo:
    .const 'Sub' $P1605 = "73_1313007597.81655" 
    capture_lex $P1605
    $P1605($P110)
  loop1607_next:
    goto loop1607_test
  loop1607_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1607_next
    eq $P116, .CONTROL_LOOP_REDO, loop1607_redo
  loop1607_done:
    pop_eh 
  for_undef_347:
.annotate 'line', 1355
    find_lex $P108, "$ops"
    .return ($P108)
  control_1594:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1604"  :anon :subid("73_1313007597.81655") :outer("72_1313007597.81655")
    .param pmc param_1606
.annotate 'file', "Compiler.pm"
.annotate 'line', 1372
    .lex "$_", param_1606
    find_lex $P111, "$ops"
    find_lex $P112, "$listpost"
    find_lex $P113, "$_"
    $P114 = $P111."push_pirop"("push", $P112, $P113)
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("74_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1611
    .param pmc param_1612 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1381
    new $P1610, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1610, control_1609
    push_eh $P1610
    .lex "self", self
    .lex "$node", param_1611
    .lex "%options", param_1612
.annotate 'line', 1382
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 1381
    .return ($P108)
  control_1609:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("75_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1616
    .param pmc param_1617 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1392
    new $P1615, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1615, control_1614
    push_eh $P1615
    .lex "self", self
    .lex "$node", param_1616
    .lex "%options", param_1617
.annotate 'line', 1393
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "$node"
    $P107 = $P105."new"($P106 :named("node"))
.annotate 'line', 1392
    .return ($P107)
  control_1614:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("76_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1621
    .param pmc param_1622 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1401
    .const 'Sub' $P1630 = "77_1313007597.81655" 
    capture_lex $P1630
    new $P1620, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1620, control_1619
    push_eh $P1620
    .lex "self", self
    .lex "$node", param_1621
    .lex "%options", param_1622
.annotate 'line', 1402
    new $P105, "Undef"
    set $P1623, $P105
    .lex "$ops", $P1623
.annotate 'line', 1404
    new $P106, "Undef"
    set $P1624, $P106
    .lex "$exreg", $P1624
.annotate 'line', 1405
    new $P107, "Undef"
    set $P1625, $P107
    .lex "$extype", $P1625
.annotate 'line', 1410
    new $P108, "Undef"
    set $P1626, $P108
    .lex "$cpast", $P1626
.annotate 'line', 1402
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1404
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$exreg", $P110
.annotate 'line', 1405
    find_lex $P109, "$exreg"
    concat $P110, $P109, "['type']"
    store_lex "$extype", $P110
.annotate 'line', 1406
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("new", $P110, "\"Exception\"")
.annotate 'line', 1407
    find_lex $P109, "$ops"
    find_lex $P110, "$extype"
    $P109."push_pirop"("set", $P110, ".CONTROL_RETURN")
.annotate 'line', 1408
    find_dynamic_lex $P109, "$*SUB"
    unless_null $P109, vivify_348
    get_hll_global $P109, "$SUB"
    unless_null $P109, vivify_349
    die "Contextual $*SUB not found"
  vivify_349:
  vivify_348:
    $P109."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1410
    find_lex $P1627, "$node"
    unless_null $P1627, vivify_350
    $P1627 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P109, $P1627[0]
    unless_null $P109, vivify_351
    new $P109, "Undef"
  vivify_351:
    store_lex "$cpast", $P109
.annotate 'line', 1411
    find_lex $P109, "$cpast"
    unless $P109, if_1628_end
    .const 'Sub' $P1630 = "77_1313007597.81655" 
    capture_lex $P1630
    $P1630()
  if_1628_end:
.annotate 'line', 1417
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("throw", $P110)
.annotate 'line', 1401
    find_lex $P109, "$ops"
    .return ($P109)
  control_1619:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1629"  :anon :subid("77_1313007597.81655") :outer("76_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1412
    new $P110, "Undef"
    set $P1631, $P110
    .lex "$cpost", $P1631
    find_lex $P111, "self"
    find_lex $P112, "$cpast"
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$cpost", $P113
.annotate 'line', 1413
    find_lex $P111, "self"
    find_lex $P112, "$cpost"
    $P113 = $P111."coerce"($P112, "P")
    store_lex "$cpost", $P113
.annotate 'line', 1414
    find_lex $P111, "$ops"
    find_lex $P112, "$cpost"
    $P111."push"($P112)
.annotate 'line', 1415
    find_lex $P111, "$ops"
    find_lex $P112, "$exreg"
    find_lex $P113, "$cpost"
    $P114 = $P111."push_pirop"("setattribute", $P112, "'payload'", $P113)
.annotate 'line', 1411
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("78_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1635
    .param pmc param_1636 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1429
    new $P1634, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1634, control_1633
    push_eh $P1634
    .lex "self", self
    .lex "$node", param_1635
    .lex "%options", param_1636
.annotate 'line', 1430
    new $P105, "Undef"
    set $P1637, $P105
    .lex "$ops", $P1637
.annotate 'line', 1432
    new $P106, "Undef"
    set $P1638, $P106
    .lex "$S0", $P1638
.annotate 'line', 1433
    new $P107, "Undef"
    set $P1639, $P107
    .lex "$catchlabel", $P1639
.annotate 'line', 1434
    new $P108, "Undef"
    set $P1640, $P108
    .lex "$endlabel", $P1640
.annotate 'line', 1436
    new $P109, "Undef"
    set $P1641, $P109
    .lex "$rtype", $P1641
.annotate 'line', 1438
    new $P110, "Undef"
    set $P1642, $P110
    .lex "$trypost", $P1642
.annotate 'line', 1442
    new $P111, "Undef"
    set $P1643, $P111
    .lex "$elsepast", $P1643
.annotate 'line', 1448
    new $P112, "Undef"
    set $P1644, $P112
    .lex "$catchpast", $P1644
.annotate 'line', 1430
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1432
    find_lex $P113, "self"
    $P114 = $P113."unique"("catch_")
    store_lex "$S0", $P114
.annotate 'line', 1433
    get_hll_global $P113, ["POST"], "Label"
    find_lex $P114, "$S0"
    $P115 = $P113."new"($P114 :named("result"))
    store_lex "$catchlabel", $P115
.annotate 'line', 1434
    get_hll_global $P113, ["POST"], "Lable"
    find_lex $P114, "$S0"
    concat $P115, $P114, "_end"
    $P116 = $P113."new"($P115 :named("result"))
    store_lex "$endlabel", $P116
.annotate 'line', 1436
    find_lex $P1645, "%options"
    unless_null $P1645, vivify_352
    $P1645 = root_new ['parrot';'Hash']
  vivify_352:
    set $P113, $P1645["rtype"]
    unless_null $P113, vivify_353
    new $P113, "Undef"
  vivify_353:
    store_lex "$rtype", $P113
.annotate 'line', 1438
    find_lex $P113, "self"
    find_lex $P1646, "$node"
    unless_null $P1646, vivify_354
    $P1646 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P114, $P1646[0]
    unless_null $P114, vivify_355
    new $P114, "Undef"
  vivify_355:
    find_lex $P115, "$rtype"
    $P116 = $P113."as_post"($P114, $P115 :named("rtype"))
    store_lex "$trypost", $P116
.annotate 'line', 1439
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push_pirop"("push_eh", $P114)
.annotate 'line', 1440
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."push"($P114)
.annotate 'line', 1441
    find_lex $P113, "$ops"
    $P113."push_pirop"("pop_eh")
.annotate 'line', 1442
    find_lex $P1647, "$node"
    unless_null $P1647, vivify_356
    $P1647 = root_new ['parrot';'ResizablePMCArray']
  vivify_356:
    set $P113, $P1647[2]
    unless_null $P113, vivify_357
    new $P113, "Undef"
  vivify_357:
    store_lex "$elsepast", $P113
.annotate 'line', 1443
    find_lex $P113, "$elsepast"
    unless $P113, if_1648_end
.annotate 'line', 1444
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$elsepast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
  if_1648_end:
.annotate 'line', 1446
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push_pirop"("goto", $P114)
.annotate 'line', 1447
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push"($P114)
.annotate 'line', 1448
    find_lex $P1649, "$node"
    unless_null $P1649, vivify_358
    $P1649 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P113, $P1649[1]
    unless_null $P113, vivify_359
    new $P113, "Undef"
  vivify_359:
    store_lex "$catchpast", $P113
.annotate 'line', 1449
    find_lex $P113, "$catchpast"
    unless $P113, if_1650_end
.annotate 'line', 1450
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$catchpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
.annotate 'line', 1451
    find_lex $P114, "$ops"
    $P114."push_pirop"("pop_eh")
  if_1650_end:
.annotate 'line', 1453
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push"($P114)
.annotate 'line', 1454
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."result"($P114)
.annotate 'line', 1429
    find_lex $P113, "$ops"
    .return ($P113)
  control_1633:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("79_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1654
    .param pmc param_1655 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1467
    .const 'Sub' $P1670 = "81_1313007597.81655" 
    capture_lex $P1670
    .const 'Sub' $P1663 = "80_1313007597.81655" 
    capture_lex $P1663
    new $P1653, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1653, control_1652
    push_eh $P1653
    .lex "self", self
    .lex "$node", param_1654
    .lex "%options", param_1655
.annotate 'line', 1469
    $P1657 = root_new ['parrot';'ResizablePMCArray']
    set $P1656, $P1657
    .lex "@clist", $P1656
.annotate 'line', 1470
    new $P105, "Undef"
    set $P1658, $P105
    .lex "$cpast", $P1658
.annotate 'line', 1478
    new $P106, "Undef"
    set $P1659, $P106
    .lex "$ops", $P1659
.annotate 'line', 1480
    new $P107, "Undef"
    set $P1660, $P107
    .lex "$endlabel", $P1660
.annotate 'line', 1483
    new $P108, "Undef"
    set $P1661, $P108
    .lex "$apost", $P1661
.annotate 'line', 1469
    new $P109, "ResizablePMCArray"
    store_lex "@clist", $P109
.annotate 'line', 1470
    find_lex $P109, "$node"
    store_lex "$cpast", $P109
.annotate 'line', 1471
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1667_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1667_test:
    find_lex $P109, "$cpast"
    get_hll_global $P110, ["PAST"], "Op"
    $P111 = $P109."isa"($P110)
    unless $P111, loop1667_done
  loop1667_redo:
    .const 'Sub' $P1663 = "80_1313007597.81655" 
    capture_lex $P1663
    $P1663()
  loop1667_next:
    goto loop1667_test
  loop1667_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1667_next
    eq $P115, .CONTROL_LOOP_REDO, loop1667_redo
  loop1667_done:
    pop_eh 
.annotate 'line', 1478
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1479
    find_lex $P109, "$ops"
    find_lex $P110, "self"
    $P111 = $P110."unique"("$P")
    $P109."result"($P111)
.annotate 'line', 1480
    get_hll_global $P109, ["POST"], "Label"
    $P110 = $P109("chain_end_" :named("name"))
    store_lex "$endlabel", $P110
.annotate 'line', 1482
    find_lex $P109, "@clist"
    pop $P110, $P109
    store_lex "$cpast", $P110
.annotate 'line', 1483
    find_lex $P109, "self"
    find_lex $P1668, "$cpast"
    unless_null $P1668, vivify_362
    $P1668 = root_new ['parrot';'ResizablePMCArray']
  vivify_362:
    set $P110, $P1668[0]
    unless_null $P110, vivify_363
    new $P110, "Undef"
  vivify_363:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$apost", $P111
.annotate 'line', 1484
    find_lex $P109, "$ops"
    find_lex $P110, "$apost"
    $P109."push"($P110)
.annotate 'line', 1486
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1675_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1675_test:
    new $P109, "Integer"
    assign $P109, 1
    unless $P109, loop1675_done
  loop1675_redo:
    .const 'Sub' $P1670 = "81_1313007597.81655" 
    capture_lex $P1670
    $P1670()
  loop1675_next:
    goto loop1675_test
  loop1675_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1675_next
    eq $P114, .CONTROL_LOOP_REDO, loop1675_redo
  loop1675_done:
    pop_eh 
.annotate 'line', 1496
    find_lex $P109, "$ops"
    find_lex $P110, "$endlabel"
    $P109."push"($P110)
.annotate 'line', 1467
    find_lex $P109, "$ops"
    .return ($P109)
  control_1652:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1662"  :anon :subid("80_1313007597.81655") :outer("79_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1472
    new $P112, "Undef"
    set $P1664, $P112
    .lex "$pasttype", $P1664
    find_lex $P113, "$cpast"
    $P114 = $P113."pasttype"()
    store_lex "$pasttype", $P114
.annotate 'line', 1473
    find_lex $P113, "$pasttype"
    set $S100, $P113
    isne $I100, $S100, "chain"
    unless $I100, if_1665_end
    die 0, .CONTROL_LOOP_LAST
  if_1665_end:
.annotate 'line', 1474
    find_lex $P113, "@clist"
    find_lex $P114, "$cpast"
    push $P113, $P114
.annotate 'line', 1475
    find_lex $P1666, "$cpast"
    unless_null $P1666, vivify_360
    $P1666 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P113, $P1666[0]
    unless_null $P113, vivify_361
    new $P113, "Undef"
  vivify_361:
    store_lex "$cpast", $P113
.annotate 'line', 1471
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1669"  :anon :subid("81_1313007597.81655") :outer("79_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1487
    new $P110, "Undef"
    set $P1671, $P110
    .lex "$bpost", $P1671
.annotate 'line', 1489
    new $P111, "Undef"
    set $P1672, $P111
    .lex "$name", $P1672
.annotate 'line', 1487
    find_lex $P112, "self"
    find_lex $P1673, "$cpast"
    unless_null $P1673, vivify_364
    $P1673 = root_new ['parrot';'ResizablePMCArray']
  vivify_364:
    set $P113, $P1673[1]
    unless_null $P113, vivify_365
    new $P113, "Undef"
  vivify_365:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$bpost", $P114
.annotate 'line', 1488
    find_lex $P112, "$ops"
    find_lex $P113, "$bpost"
    $P112."push"($P113)
.annotate 'line', 1489
    find_lex $P112, "self"
    find_lex $P113, "$cpast"
    $P114 = $P113."name"()
    $P115 = $P112."escape"($P114)
    store_lex "$name", $P115
.annotate 'line', 1490
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$apost"
    find_lex $P115, "$bpost"
    find_lex $P116, "$ops"
    $P112."push_pirop"("call", $P113, $P114, $P115, $P116 :named("result"))
.annotate 'line', 1491
    find_lex $P112, "@clist"
    if $P112, unless_1674_end
    die 0, .CONTROL_LOOP_LAST
  unless_1674_end:
.annotate 'line', 1492
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P112."push_pirop"("unless", $P113, $P114)
.annotate 'line', 1493
    find_lex $P112, "@clist"
    pop $P113, $P112
    store_lex "$cpast", $P113
.annotate 'line', 1494
    find_lex $P112, "$bpost"
    store_lex "$apost", $P112
.annotate 'line', 1486
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("82_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1679
    .param pmc param_1680 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1507
    new $P1678, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1678, control_1677
    push_eh $P1678
    .lex "self", self
    .lex "$node", param_1679
    .lex "%options", param_1680
.annotate 'line', 1508
    new $P105, "Undef"
    set $P1681, $P105
    .lex "$ops", $P1681
.annotate 'line', 1510
    new $P106, "Undef"
    set $P1682, $P106
    .lex "$lpost", $P1682
.annotate 'line', 1514
    new $P107, "Undef"
    set $P1683, $P107
    .lex "$endlabel", $P1683
.annotate 'line', 1516
    new $P108, "Undef"
    set $P1684, $P108
    .lex "$reg", $P1684
.annotate 'line', 1519
    new $P109, "Undef"
    set $P1685, $P109
    .lex "$rpost", $P1685
.annotate 'line', 1508
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    $P114 = $P110."new"($P111 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1510
    find_lex $P110, "self"
    find_lex $P1686, "$node"
    unless_null $P1686, vivify_366
    $P1686 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P111, $P1686[0]
    unless_null $P111, vivify_367
    new $P111, "Undef"
  vivify_367:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$lpost", $P112
.annotate 'line', 1511
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1512
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1514
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("default_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$endlabel", $P113
.annotate 'line', 1516
    find_lex $P110, "self"
    $P111 = $P110."unique"("$I")
    store_lex "$reg", $P111
.annotate 'line', 1517
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$ops"
    $P110."push_pirop"("defined", $P111, $P112)
.annotate 'line', 1518
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$endlabel"
    $P110."push_pirop"("if", $P111, $P112)
.annotate 'line', 1519
    find_lex $P110, "self"
    find_lex $P1687, "$node"
    unless_null $P1687, vivify_368
    $P1687 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P111, $P1687[1]
    unless_null $P111, vivify_369
    new $P111, "Undef"
  vivify_369:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1520
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1521
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1522
    find_lex $P110, "$ops"
    find_lex $P111, "$endlabel"
    $P110."push"($P111)
.annotate 'line', 1507
    find_lex $P110, "$ops"
    .return ($P110)
  control_1677:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("83_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1691
    .param pmc param_1692 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1533
    .const 'Sub' $P1703 = "84_1313007597.81655" 
    capture_lex $P1703
    new $P1690, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1690, control_1689
    push_eh $P1690
    .lex "self", self
    .lex "$node", param_1691
    .lex "%options", param_1692
.annotate 'line', 1534
    new $P105, "Undef"
    set $P1693, $P105
    .lex "$ops", $P1693
.annotate 'line', 1537
    new $P106, "Undef"
    set $P1694, $P106
    .lex "$falselabel", $P1694
.annotate 'line', 1538
    new $P107, "Undef"
    set $P1695, $P107
    .lex "$endlabel", $P1695
.annotate 'line', 1540
    new $P108, "Undef"
    set $P1696, $P108
    .lex "$i", $P1696
.annotate 'line', 1541
    new $P109, "Undef"
    set $P1697, $P109
    .lex "$t", $P1697
.annotate 'line', 1542
    new $P110, "Undef"
    set $P1698, $P110
    .lex "$u", $P1698
.annotate 'line', 1543
    new $P111, "Undef"
    set $P1699, $P111
    .lex "$iter", $P1699
.annotate 'line', 1544
    new $P112, "Undef"
    set $P1700, $P112
    .lex "$apost", $P1700
.annotate 'line', 1545
    new $P113, "Undef"
    set $P1701, $P113
    .lex "$bpost", $P1701
.annotate 'line', 1534
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1535
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    $P116 = $P115."unique"("$P")
    $P114."result"($P116)
.annotate 'line', 1537
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P115
.annotate 'line', 1538
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P115
.annotate 'line', 1540
    find_lex $P114, "self"
    $P115 = $P114."unique"("$I")
    store_lex "$i", $P115
.annotate 'line', 1541
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$t", $P115
.annotate 'line', 1542
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$u", $P115
.annotate 'line', 1543
    get_hll_global $P114, "node"
    $P115 = $P114."iterator"()
    store_lex "$iter", $P115
.annotate 'line', 1544
    find_lex $P114, "self"
    find_lex $P115, "$iter"
    shift $P116, $P115
    $P117 = $P114."as_post"($P116, "P" :named("rtype"))
    store_lex "$apost", $P117
.annotate 'line', 1533
    find_lex $P114, "$bpost"
.annotate 'line', 1546
    find_lex $P114, "$ops"
    find_lex $P115, "$apost"
    $P114."push"($P115)
.annotate 'line', 1547
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$apost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1548
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$apost"
    $P114."push_pirop"("istrue", $P115, $P116)
.annotate 'line', 1549
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1706_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1706_test:
    new $P114, "Integer"
    assign $P114, 1
    unless $P114, loop1706_done
  loop1706_redo:
    .const 'Sub' $P1703 = "84_1313007597.81655" 
    capture_lex $P1703
    $P1703()
  loop1706_next:
    goto loop1706_test
  loop1706_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1706_next
    eq $P117, .CONTROL_LOOP_REDO, loop1706_redo
  loop1706_done:
    pop_eh 
.annotate 'line', 1562
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$endlabel"
    $P114."push_pirop"("if", $P115, $P116)
.annotate 'line', 1563
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$bpost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1564
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push_pirop"("goto", $P115)
.annotate 'line', 1565
    find_lex $P114, "$ops"
    find_lex $P115, "$falselabel"
    $P114."push"($P115)
.annotate 'line', 1566
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    $P114."push_pirop"("new", $P115, "\"Undef\"")
.annotate 'line', 1567
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push"($P115)
.annotate 'line', 1533
    find_lex $P114, "$ops"
    .return ($P114)
  control_1689:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1702"  :anon :subid("84_1313007597.81655") :outer("83_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1556
    new $P115, "Undef"
    set $P1704, $P115
    .lex "$truelabel", $P1704
.annotate 'line', 1550
    find_lex $P116, "self"
    find_lex $P117, "$iter"
    shift $P118, $P117
    $P119 = $P116."as_post"($P118, "P" :named("rtype"))
    store_lex "$bpost", $P119
.annotate 'line', 1551
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P116."push"($P117)
.annotate 'line', 1552
    find_lex $P116, "$ops"
    find_lex $P117, "$u"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("istrue", $P117, $P118)
.annotate 'line', 1553
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$t"
    find_lex $P119, "$u"
    $P116."push_pirop"("and", $P117, $P118, $P119)
.annotate 'line', 1554
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$falselabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1555
    find_lex $P116, "$iter"
    if $P116, unless_1705_end
    die 0, .CONTROL_LOOP_LAST
  unless_1705_end:
.annotate 'line', 1556
    get_hll_global $P116, ["POST"], "Label"
    $P117 = $P116."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P117
.annotate 'line', 1557
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$truelabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1558
    find_lex $P116, "$ops"
    find_lex $P117, "$ops"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1559
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$u"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1560
    find_lex $P116, "$ops"
    find_lex $P117, "$truelabel"
    $P118 = $P116."push"($P117)
.annotate 'line', 1549
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("85_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1710
    .param pmc param_1711 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1576
    new $P1709, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1709, control_1708
    push_eh $P1709
    .lex "self", self
    .lex "$node", param_1710
    .lex "%options", param_1711
.annotate 'line', 1577
    new $P105, "Undef"
    set $P1712, $P105
    .lex "$lpast", $P1712
.annotate 'line', 1578
    new $P106, "Undef"
    set $P1713, $P106
    .lex "$rpast", $P1713
.annotate 'line', 1580
    new $P107, "Undef"
    set $P1714, $P107
    .lex "$ops", $P1714
.annotate 'line', 1581
    new $P108, "Undef"
    set $P1715, $P108
    .lex "$rpost", $P1715
.annotate 'line', 1586
    new $P109, "Undef"
    set $P1716, $P109
    .lex "$lpost", $P1716
.annotate 'line', 1577
    find_lex $P1717, "$node"
    unless_null $P1717, vivify_370
    $P1717 = root_new ['parrot';'ResizablePMCArray']
  vivify_370:
    set $P110, $P1717[0]
    unless_null $P110, vivify_371
    new $P110, "Undef"
  vivify_371:
    store_lex "$lpast", $P110
.annotate 'line', 1578
    find_lex $P1718, "$node"
    unless_null $P1718, vivify_372
    $P1718 = root_new ['parrot';'ResizablePMCArray']
  vivify_372:
    set $P110, $P1718[1]
    unless_null $P110, vivify_373
    new $P110, "Undef"
  vivify_373:
    store_lex "$rpast", $P110
.annotate 'line', 1580
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1581
    find_lex $P110, "self"
    find_lex $P111, "$rpast"
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1582
    find_lex $P110, "self"
    find_lex $P111, "$rpost"
    $P112 = $P110."coerce"($P111, "P")
    store_lex "$rpost", $P112
.annotate 'line', 1583
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1585
    find_lex $P110, "$lpast"
    $P110."lvalue"(1)
.annotate 'line', 1586
    find_lex $P110, "self"
    find_lex $P111, "$lpast"
    find_lex $P112, "$rpost"
    $P113 = $P110."as_post"($P111, $P112 :named("bindpost"))
    store_lex "$lpost", $P113
.annotate 'line', 1587
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1588
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."result"($P111)
.annotate 'line', 1576
    find_lex $P110, "$ops"
    .return ($P110)
  control_1708:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("86_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1722
    .param pmc param_1723 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1596
    new $P1721, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1721, control_1720
    push_eh $P1721
    .lex "self", self
    .lex "$node", param_1722
    .lex "%options", param_1723
.annotate 'line', 1597
    new $P105, "Undef"
    set $P1724, $P105
    .lex "$rpost", $P1724
.annotate 'line', 1598
    new $P106, "Undef"
    set $P1725, $P106
    .lex "$lpost", $P1725
.annotate 'line', 1599
    new $P107, "Undef"
    set $P1726, $P107
    .lex "$ops", $P1726
.annotate 'line', 1597
    find_lex $P108, "self"
    find_lex $P1727, "$node"
    unless_null $P1727, vivify_374
    $P1727 = root_new ['parrot';'ResizablePMCArray']
  vivify_374:
    set $P109, $P1727[1]
    unless_null $P109, vivify_375
    new $P109, "Undef"
  vivify_375:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$rpost", $P110
.annotate 'line', 1598
    find_lex $P108, "self"
    find_lex $P1728, "$node"
    unless_null $P1728, vivify_376
    $P1728 = root_new ['parrot';'ResizablePMCArray']
  vivify_376:
    set $P109, $P1728[0]
    unless_null $P109, vivify_377
    new $P109, "Undef"
  vivify_377:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$lpost", $P110
.annotate 'line', 1599
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$rpost"
    find_lex $P110, "$lpost"
    find_lex $P111, "$node"
    find_lex $P112, "$lpost"
    $P113 = $P108."new"($P109, $P110, $P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1601
    find_lex $P108, "$ops"
    find_lex $P109, "$lpost"
    find_lex $P110, "$rpost"
    $P108."push_pirop"("copy", $P109, $P110)
.annotate 'line', 1596
    find_lex $P108, "$ops"
    .return ($P108)
  control_1720:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("87_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Op"])
    .param pmc param_1732
    .param pmc param_1733 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1610
    new $P1731, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1731, control_1730
    push_eh $P1731
    .lex "self", self
    .lex "$node", param_1732
    .lex "%options", param_1733
.annotate 'line', 1615
    new $P105, "Undef"
    set $P1734, $P105
    .lex "$ops", $P1734
.annotate 'line', 1616
    new $P106, "Undef"
    set $P1735, $P106
    .lex "$inline", $P1735
.annotate 'line', 1619
    new $P107, "Undef"
    set $P1736, $P107
    .lex "$result", $P1736
.annotate 'line', 1620
    new $P108, "Undef"
    set $P1737, $P108
    .lex "$i", $P1737
.annotate 'line', 1633
    $P1739 = root_new ['parrot';'ResizablePMCArray']
    set $P1738, $P1739
    .lex "@arglist", $P1738
.annotate 'line', 1635
    new $P109, "Undef"
    set $P1740, $P109
    .lex "$s", $P1740
.annotate 'line', 1615
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P110."post_children"($P111, "vP" :named("signature"))
    store_lex "$ops", $P112
.annotate 'line', 1616
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1617
    find_lex $P110, "$inline"
    does $I100, $P110, "array"
    unless $I100, if_1741_end
    find_lex $P111, "$inline"
    join $S100, "\n", $P111
    new $P112, 'String'
    set $P112, $S100
    store_lex "$inline", $P112
  if_1741_end:
.annotate 'line', 1619
    new $P110, "String"
    assign $P110, ""
    store_lex "$result", $P110
.annotate 'line', 1620
    find_lex $P110, "$inline"
    set $S100, $P110
    index $I100, $S100, "%t"
    new $P111, 'Integer'
    set $P111, $I100
    store_lex "$i", $P111
.annotate 'line', 1621
    find_lex $P110, "$i"
    set $N100, $P110
    isge $I100, $N100, 0.0
    if $I100, if_1742
.annotate 'line', 1627
    find_lex $P111, "$inline"
    set $S100, $P111
    index $I101, $S100, "%r"
    new $P112, 'Integer'
    set $P112, $I101
    store_lex "$i", $P112
.annotate 'line', 1628
    find_lex $P111, "$i"
    set $N101, $P111
    isge $I101, $N101, 0.0
    unless $I101, if_1743_end
.annotate 'line', 1629
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    store_lex "$result", $P113
.annotate 'line', 1630
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
  if_1743_end:
.annotate 'line', 1626
    goto if_1742_end
  if_1742:
.annotate 'line', 1622
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    store_lex "$result", $P112
.annotate 'line', 1623
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."push_pirop"("new", $P112, "'Undef'")
.annotate 'line', 1624
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
  if_1742_end:
.annotate 'line', 1633
    find_lex $P110, "$ops"
    $P111 = $P110."list"()
    store_lex "@arglist", $P111
.annotate 'line', 1634
    find_lex $P110, "$ops"
    find_lex $P111, "@arglist"
    find_lex $P112, "$inline"
    find_lex $P113, "$result"
    $P110."push_pirop"("inline", $P111 :flat, $P112 :named("inline"), $P113 :named("result"))
.annotate 'line', 1635
    find_lex $P1744, "%options"
    unless_null $P1744, vivify_378
    $P1744 = root_new ['parrot';'Hash']
  vivify_378:
    set $P110, $P1744["rtype"]
    unless_null $P110, vivify_379
    new $P110, "Undef"
  vivify_379:
    store_lex "$s", $P110
.annotate 'line', 1610
    find_lex $P110, "$ops"
    .return ($P110)
  control_1730:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("88_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"])
    .param pmc param_1748
    .param pmc param_1749 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1647
    .const 'Sub' $P1789 = "92_1313007597.81655" 
    capture_lex $P1789
    .const 'Sub' $P1778 = "91_1313007597.81655" 
    capture_lex $P1778
    .const 'Sub' $P1754 = "89_1313007597.81655" 
    capture_lex $P1754
    new $P1747, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1747, control_1746
    push_eh $P1747
    .lex "self", self
    .lex "$node", param_1748
    .lex "%options", param_1749
.annotate 'line', 1649
    new $P105, "Undef"
    set $P1750, $P105
    .lex "$bindpost", $P1750
.annotate 'line', 1653
    new $P106, "Undef"
    set $P1751, $P106
    .lex "$scope", $P1751
.annotate 'line', 1654
    new $P107, "Undef"
    set $P1752, $P107
    .lex "$name", $P1752
.annotate 'line', 1673
    .const 'Sub' $P1754 = "89_1313007597.81655" 
    newclosure $P1773, $P1754
    set $P1753, $P1773
    .lex "scope_error", $P1753
.annotate 'line', 1649
    find_lex $P1774, "%options"
    unless_null $P1774, vivify_387
    $P1774 = root_new ['parrot';'Hash']
  vivify_387:
    set $P114, $P1774["bindpost"]
    unless_null $P114, vivify_388
    new $P114, "Undef"
  vivify_388:
    store_lex "$bindpost", $P114
.annotate 'line', 1650
    find_lex $P114, "$bindpost"
    if $P114, unless_1775_end
    new $P115, "Undef"
    store_lex "$bindpost", $P115
  unless_1775_end:
.annotate 'line', 1653
    find_lex $P114, "$node"
    $P115 = $P114."scope"()
    store_lex "$scope", $P115
.annotate 'line', 1654
    find_lex $P114, "$node"
    $P115 = $P114."name"()
    store_lex "$name", $P115
.annotate 'line', 1655
    find_lex $P114, "$scope"
    if $P114, unless_1776_end
    .const 'Sub' $P1778 = "91_1313007597.81655" 
    capture_lex $P1778
    $P1778()
  unless_1776_end:
.annotate 'line', 1668
    .const 'Sub' $P1789 = "92_1313007597.81655" 
    capture_lex $P1789
    $P1789()
.annotate 'line', 1647
    find_lex $P114, "scope_error"
    .return ($P114)
  control_1746:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("89_1313007597.81655") :outer("88_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1673
    .const 'Sub' $P1764 = "90_1313007597.81655" 
    capture_lex $P1764
    new $P1756, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1756, control_1755
    push_eh $P1756
.annotate 'line', 1675
    new $P108, "Undef"
    set $P1757, $P108
    .lex "$blockname", $P1757
.annotate 'line', 1682
    new $P109, "Undef"
    set $P1758, $P109
    .lex "$sourceline", $P1758
.annotate 'line', 1683
    new $P110, "Undef"
    set $P1759, $P110
    .lex "$source", $P1759
.annotate 'line', 1684
    new $P111, "Undef"
    set $P1760, $P111
    .lex "$pos", $P1760
.annotate 'line', 1685
    new $P112, "Undef"
    set $P1761, $P112
    .lex "$files", $P1761
.annotate 'line', 1674
    find_lex $P113, "$scope"
    unless $P113, if_1762_end
    new $P114, 'String'
    set $P114, " in '"
    find_lex $P115, "$scope"
    concat $P116, $P114, $P115
    concat $P117, $P116, "' scope"
    store_lex "$scope", $P117
  if_1762_end:
.annotate 'line', 1675
    new $P113, "String"
    assign $P113, ""
    store_lex "$blockname", $P113
.annotate 'line', 1676
    find_dynamic_lex $P114, "@*BLOCKPAST"
    unless_null $P114, vivify_380
    get_hll_global $P114, "@BLOCKPAST"
    unless_null $P114, vivify_381
    die "Contextual @*BLOCKPAST not found"
  vivify_381:
  vivify_380:
    defined $I100, $P114
    unless $I100, for_undef_382
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1767_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1767_test:
    unless $P113, loop1767_done
    shift $P115, $P113
  loop1767_redo:
    .const 'Sub' $P1764 = "90_1313007597.81655" 
    capture_lex $P1764
    $P1764($P115)
  loop1767_next:
    goto loop1767_test
  loop1767_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1767_next
    eq $P118, .CONTROL_LOOP_REDO, loop1767_redo
  loop1767_done:
    pop_eh 
  for_undef_382:
.annotate 'line', 1680
    find_lex $P113, "$blockname"
    if $P113, unless_1768_end
    new $P114, "String"
    assign $P114, "<anonymous>"
    store_lex "$blockname", $P114
  unless_1768_end:
.annotate 'line', 1682
    new $P113, "String"
    assign $P113, ""
    store_lex "$sourceline", $P113
.annotate 'line', 1683
    find_lex $P1769, "$node"
    unless_null $P1769, vivify_383
    $P1769 = root_new ['parrot';'Hash']
  vivify_383:
    set $P113, $P1769["source"]
    unless_null $P113, vivify_384
    new $P113, "Undef"
  vivify_384:
    store_lex "$source", $P113
.annotate 'line', 1684
    find_lex $P1770, "$node"
    unless_null $P1770, vivify_385
    $P1770 = root_new ['parrot';'Hash']
  vivify_385:
    set $P113, $P1770["pos"]
    unless_null $P113, vivify_386
    new $P113, "Undef"
  vivify_386:
    store_lex "$pos", $P113
.annotate 'line', 1685
    find_caller_lex $P113, "$?FILES"
    store_lex "$files", $P113
.annotate 'line', 1686
    find_lex $P114, "$source"
    if $P114, if_1772
    set $P113, $P114
    goto if_1772_end
  if_1772:
    find_lex $P115, "$files"
    set $P113, $P115
  if_1772_end:
    if $P113, unless_1771_end
.annotate 'line', 1687
    new $P116, "String"
    assign $P116, " ("
    find_lex $P117, "$files"
    concat $P118, $P116, $P117
    concat $P119, $P118, ":"
.annotate 'line', 1688
    find_lex $P120, "self"
    find_lex $P121, "$source"
    find_lex $P122, "$pos"
    $P123 = $P120."lineof"($P121, $P122)
    add $P124, $P123, 1
    concat $P125, $P119, $P124
.annotate 'line', 1687
    concat $P126, $P125, ")"
.annotate 'line', 1688
    store_lex "$sourceline", $P126
  unless_1771_end:
.annotate 'line', 1690
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
.annotate 'line', 1673
    .return ($P121)
  control_1755:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1763"  :anon :subid("90_1313007597.81655") :outer("89_1313007597.81655")
    .param pmc param_1765
.annotate 'file', "Compiler.pm"
.annotate 'line', 1676
    .lex "$_", param_1765
.annotate 'line', 1677
    find_lex $P116, "$_"
    $P117 = $P116."name"()
    store_lex "$blockname", $P117
.annotate 'line', 1678
    find_lex $P117, "$blockname"
    if $P117, if_1766
    set $P116, $P117
    goto if_1766_end
  if_1766:
    die 0, .CONTROL_LOOP_LAST
  if_1766_end:
.annotate 'line', 1676
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1777"  :anon :subid("91_1313007597.81655") :outer("88_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1657
    new $P115, "Undef"
    set $P1779, $P115
    .lex "$P0", $P1779
    find_lex $P116, "$name"
    find_lex $P117, "self"
    getattribute $P1780, $P117, "%!symtable"
    unless_null $P1780, vivify_389
    $P1780 = root_new ['parrot';'Hash']
  vivify_389:
    set $P118, $P1780[$P116]
    unless_null $P118, vivify_390
    new $P118, "Undef"
  vivify_390:
    store_lex "$P0", $P118
.annotate 'line', 1658
    find_lex $P116, "$P0"
    unless $P116, if_1781_end
    find_lex $P1782, "$P0"
    unless_null $P1782, vivify_391
    $P1782 = root_new ['parrot';'Hash']
  vivify_391:
    set $P117, $P1782["scope"]
    unless_null $P117, vivify_392
    new $P117, "Undef"
  vivify_392:
    store_lex "$scope", $P117
  if_1781_end:
.annotate 'line', 1659
    find_lex $P117, "$scope"
    unless $P117, unless_1783
    set $P116, $P117
    goto unless_1783_end
  unless_1783:
.annotate 'line', 1661
    find_lex $P118, "self"
    getattribute $P1784, $P118, "%!symtable"
    unless_null $P1784, vivify_393
    $P1784 = root_new ['parrot';'Hash']
  vivify_393:
    set $P119, $P1784[""]
    unless_null $P119, vivify_394
    new $P119, "Undef"
  vivify_394:
    store_lex "$P0", $P119
.annotate 'line', 1662
    find_lex $P118, "$P0"
    if $P118, unless_1785_end
    "scope_error"()
  unless_1785_end:
.annotate 'line', 1663
    find_lex $P1786, "$P0"
    unless_null $P1786, vivify_395
    $P1786 = root_new ['parrot';'Hash']
  vivify_395:
    set $P118, $P1786["scope"]
    unless_null $P118, vivify_396
    new $P118, "Undef"
  vivify_396:
    store_lex "$scope", $P118
.annotate 'line', 1664
    find_lex $P119, "$scope"
    unless $P119, unless_1787
    set $P118, $P119
    goto unless_1787_end
  unless_1787:
    $P120 = "scope_error"()
    set $P118, $P120
  unless_1787_end:
.annotate 'line', 1659
    set $P116, $P118
  unless_1783_end:
.annotate 'line', 1655
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1788"  :anon :subid("92_1313007597.81655") :outer("88_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1668
    .const 'Sub' $P1796 = "93_1313007597.81655" 
    capture_lex $P1796
    new $P1792, 'ExceptionHandler'
    set_label $P1792, control_1791
    $P1792."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1792
.annotate 'line', 1669
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
.annotate 'line', 1668
    pop_eh 
    goto skip_handler_1790
  control_1791:
.annotate 'line', 1670
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1796 = "93_1313007597.81655" 
    newclosure $P1801, $P1796
    $P1801(exception)
    new $P1802, 'Integer'
    set $P1802, 1
    set exception["handled"], $P1802
    set $I1803, exception["handled"]
    ne $I1803, 1, nothandled_1794
  handled_1793:
    .return (exception)
  nothandled_1794:
    rethrow exception
  skip_handler_1790:
.annotate 'line', 1668
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1795"  :anon :subid("93_1313007597.81655") :outer("92_1313007597.81655")
    .param pmc param_1797
.annotate 'file', "Compiler.pm"
.annotate 'line', 1670
    .lex "$_", param_1797
    find_lex $P1798, "$_"
    set $P1799, $P1798
    .lex "$!", $P1799
    $P1800 = "scope_error"()
    .return ($P1800)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("94_1313007597.81655") :method :outer("11_1313007597.81655")
    .param pmc param_1807
    .param pmc param_1808
    .param pmc param_1809
    .param pmc param_1810
.annotate 'file', "Compiler.pm"
.annotate 'line', 1696
    .const 'Sub' $P1817 = "95_1313007597.81655" 
    capture_lex $P1817
    new $P1806, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1806, control_1805
    push_eh $P1806
    .lex "self", self
    .lex "$node", param_1807
    .lex "$ops", param_1808
    .lex "$fetchop", param_1809
    .lex "$storeop", param_1810
.annotate 'line', 1697
    new $P105, "Undef"
    set $P1811, $P105
    .lex "$viviself", $P1811
.annotate 'line', 1698
    new $P106, "Undef"
    set $P1812, $P106
    .lex "$vivipost", $P1812
.annotate 'line', 1699
    new $P107, "Undef"
    set $P1813, $P107
    .lex "$result", $P1813
.annotate 'line', 1697
    find_lex $P108, "$node"
    $P109 = $P108."viviself"()
    store_lex "$viviself", $P109
.annotate 'line', 1698
    find_lex $P108, "self"
    find_lex $P109, "$viviself"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$vivipost", $P110
.annotate 'line', 1699
    find_lex $P108, "$vivipost"
    $P109 = $P108."result"()
    store_lex "$result", $P109
.annotate 'line', 1700
    find_lex $P108, "$result"
    set $S100, $P108
    iseq $I100, $S100, ""
    unless $I100, if_1814_end
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$result", $P110
  if_1814_end:
.annotate 'line', 1702
    find_lex $P108, "$ops"
    find_lex $P109, "$result"
    $P108."result"($P109)
.annotate 'line', 1703
    find_lex $P108, "$ops"
    find_lex $P109, "$fetchop"
    $P108."push"($P109)
.annotate 'line', 1704
    find_lex $P108, "$viviself"
    unless $P108, if_1815_end
    .const 'Sub' $P1817 = "95_1313007597.81655" 
    capture_lex $P1817
    $P1817()
  if_1815_end:
.annotate 'line', 1696
    find_lex $P108, "$ops"
    .return ($P108)
  control_1805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1816"  :anon :subid("95_1313007597.81655") :outer("94_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1705
    new $P109, "Undef"
    set $P1818, $P109
    .lex "$vivilabel", $P1818
    get_hll_global $P110, ["POST"], "Label"
    $P111 = $P110."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P111
.annotate 'line', 1706
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$vivilabel"
    $P110."push_pirop"("unless_null", $P111, $P112)
.annotate 'line', 1707
    find_lex $P110, "$ops"
    find_lex $P111, "$vivipost"
    $P110."push"($P111)
.annotate 'line', 1708
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    unless $P111, if_1819_end
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P112."push"($P113)
  if_1819_end:
.annotate 'line', 1709
    find_lex $P110, "$ops"
    find_lex $P111, "$vivilabel"
    $P112 = $P110."push"($P111)
.annotate 'line', 1704
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("96_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1823
    .param pmc param_1824
.annotate 'file', "Compiler.pm"
.annotate 'line', 1715
    .const 'Sub' $P1832 = "97_1313007597.81655" 
    capture_lex $P1832
    new $P1822, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1822, control_1821
    push_eh $P1822
    .lex "self", self
    .lex "$node", param_1823
    .lex "$bindpost", param_1824
.annotate 'line', 1717
    new $P105, "Undef"
    set $P1825, $P105
    .lex "$name", $P1825
.annotate 'line', 1718
    new $P106, "Undef"
    set $P1826, $P106
    .lex "$named", $P1826
.annotate 'line', 1719
    new $P107, "Undef"
    set $P1827, $P107
    .lex "$pname", $P1827
.annotate 'line', 1722
    new $P108, "Undef"
    set $P1828, $P108
    .lex "$ops", $P1828
.annotate 'line', 1724
    new $P109, "Undef"
    set $P1829, $P109
    .lex "$viviself", $P1829
.annotate 'line', 1717
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1718
    find_lex $P110, "$node"
    $P111 = $P110."named"()
    store_lex "$named", $P111
.annotate 'line', 1719
    find_lex $P110, "self"
    $P111 = $P110."unique"("param_")
    store_lex "$pname", $P111
.annotate 'line', 1722
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "$pname"
    $P113 = $P110."new"($P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1724
    find_lex $P110, "$node"
    $P111 = $P110."viviself"()
    store_lex "$viviself", $P111
.annotate 'line', 1725
    find_lex $P110, "$viviself"
    if $P110, if_1830
.annotate 'line', 1736
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_397
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_398
    die "Contextual $*SUB not found"
  vivify_398:
  vivify_397:
    find_lex $P114, "$pname"
    find_lex $P116, "$named"
.annotate 'line', 1737
    find_lex $P117, "$node"
    $P118 = $P117."slurpy"()
    find_lex $P119, "$node"
    $P120 = $P119."call_sig"()
.annotate 'line', 1736
    $P113."add_param"($P114, $P116 :named("named"), $P118 :named("slurpy"), $P120 :named("call_sig"))
.annotate 'line', 1735
    goto if_1830_end
  if_1830:
.annotate 'line', 1725
    .const 'Sub' $P1832 = "97_1313007597.81655" 
    capture_lex $P1832
    $P1832()
  if_1830_end:
.annotate 'line', 1740
    find_lex $P110, "$name"
    defined $I100, $P110
    unless $I100, if_1835_end
.annotate 'line', 1741
    find_lex $P111, "$ops"
    find_lex $P112, "self"
    find_lex $P113, "$name"
    $P114 = $P112."escape"($P113)
    find_lex $P115, "$ops"
    $P111."push_pirop"(".lex", $P114, $P115)
  if_1835_end:
.annotate 'line', 1715
    find_lex $P110, "$ops"
    .return ($P110)
  control_1821:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1831"  :anon :subid("97_1313007597.81655") :outer("96_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1727
    new $P111, "Undef"
    set $P1833, $P111
    .lex "$vivipost", $P1833
.annotate 'line', 1728
    new $P112, "Undef"
    set $P1834, $P112
    .lex "$vivilabel", $P1834
.annotate 'line', 1727
    find_lex $P113, "self"
    find_lex $P114, "$viviself"
    $P115 = $P113."as_vivipost"($P114, "P" :named("rtype"))
    store_lex "$vivipost", $P115
.annotate 'line', 1728
    get_hll_global $P113, ["POST"], "Label"
    $P114 = $P113."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P114
.annotate 'line', 1729
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_399
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_400
    die "Contextual $*SUB not found"
  vivify_400:
  vivify_399:
    find_lex $P114, "$pname"
    find_lex $P115, "$named"
    $P113."add_param"($P114, $P115 :named("named"), 1 :named("optional"))
.annotate 'line', 1730
    find_lex $P113, "$ops"
    new $P114, 'String'
    set $P114, "has_"
    find_lex $P115, "$pname"
    concat $P116, $P114, $P115
    find_lex $P117, "$vivilabel"
    $P113."push_pirop"("if", $P116, $P117)
.annotate 'line', 1731
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P113."push"($P114)
.annotate 'line', 1732
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1733
    find_lex $P113, "$ops"
    find_lex $P114, "$vivilabel"
    $P115 = $P113."push"($P114)
.annotate 'line', 1725
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("98_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1839
    .param pmc param_1840
.annotate 'file', "Compiler.pm"
.annotate 'line', 1748
    new $P1838, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1838, control_1837
    push_eh $P1838
    .lex "self", self
    .lex "$node", param_1839
    .lex "$bindpost", param_1840
.annotate 'line', 1749
    new $P105, "Undef"
    set $P1841, $P105
    .lex "$ops", $P1841
.annotate 'line', 1750
    new $P106, "Undef"
    set $P1842, $P106
    .lex "$name", $P1842
.annotate 'line', 1751
    new $P107, "Undef"
    set $P1843, $P107
    .lex "$ns", $P1843
.annotate 'line', 1753
    new $P108, "Undef"
    set $P1844, $P108
    .lex "$fetchop", $P1844
.annotate 'line', 1754
    new $P109, "Undef"
    set $P1845, $P109
    .lex "$storeop", $P1845
.annotate 'line', 1755
    $P1847 = root_new ['parrot';'ResizablePMCArray']
    set $P1846, $P1847
    .lex "@name", $P1846
.annotate 'line', 1749
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1750
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    $P113 = $P110."escape"($P112)
    store_lex "$name", $P113
.annotate 'line', 1751
    find_lex $P110, "$node"
    $P111 = $P110."namespace"()
    store_lex "$ns", $P111
.annotate 'line', 1753
    new $P110, "String"
    assign $P110, "get_global"
    store_lex "$fetchop", $P110
.annotate 'line', 1754
    new $P110, "String"
    assign $P110, "set_global"
    store_lex "$storeop", $P110
.annotate 'line', 1755
    find_lex $P110, "$name"
    new $P111, "ResizablePMCArray"
    push $P111, $P110
    store_lex "@name", $P111
.annotate 'line', 1757
    find_lex $P110, "$ns"
    defined $I100, $P110
    unless $I100, if_1848_end
.annotate 'line', 1758
    new $P111, "String"
    assign $P111, "get_hll_global"
    store_lex "$fetchop", $P111
.annotate 'line', 1759
    new $P111, "String"
    assign $P111, "set_hll_global"
    store_lex "$storeop", $P111
.annotate 'line', 1761
    find_lex $P111, "$ns"
    unless $P111, if_1849_end
.annotate 'line', 1762
    get_hll_global $P112, ["POST"], "Compiler"
    find_lex $P113, "$ns"
    $P114 = $P112."key_pir"($P113)
    store_lex "$ns", $P114
.annotate 'line', 1763
    find_lex $P112, "@name"
    find_lex $P113, "$ns"
    $P112."unshift"($P113)
  if_1849_end:
  if_1848_end:
.annotate 'line', 1767
    find_lex $P110, "$bindpost"
    unless $P110, if_1850_end
.annotate 'line', 1768
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
  if_1850_end:
.annotate 'line', 1772
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$ops"
    find_lex $P112, "@name"
    find_lex $P113, "$fetchop"
    $P114 = $P110."new"($P111, $P112 :flat, $P113 :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1773
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "@name"
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P114 = $P110."new"($P111 :flat, $P112, $P113 :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1774
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
.annotate 'line', 1748
    .return ()
  control_1837:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("99_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1854
    .param pmc param_1855
.annotate 'file', "Compiler.pm"
.annotate 'line', 1778
    .const 'Sub' $P1868 = "101_1313007597.81655" 
    capture_lex $P1868
    .const 'Sub' $P1860 = "100_1313007597.81655" 
    capture_lex $P1860
    new $P1853, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1853, control_1852
    push_eh $P1853
    .lex "self", self
    .lex "$node", param_1854
    .lex "$bindpost", param_1855
.annotate 'line', 1779
    new $P105, "Undef"
    set $P1856, $P105
    .lex "$name", $P1856
.annotate 'line', 1780
    new $P106, "Undef"
    set $P1857, $P106
    .lex "$isdecl", $P1857
.annotate 'line', 1779
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    $P110 = $P107."escape"($P109)
    store_lex "$name", $P110
.annotate 'line', 1780
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    store_lex "$isdecl", $P108
.annotate 'line', 1782
    find_lex $P108, "$isdecl"
    if $P108, if_1858
.annotate 'line', 1799
    .const 'Sub' $P1868 = "101_1313007597.81655" 
    capture_lex $P1868
    $P116 = $P1868()
    set $P107, $P116
.annotate 'line', 1782
    goto if_1858_end
  if_1858:
    .const 'Sub' $P1860 = "100_1313007597.81655" 
    capture_lex $P1860
    $P112 = $P1860()
    set $P107, $P112
  if_1858_end:
.annotate 'line', 1778
    .return ($P107)
  control_1852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1867"  :anon :subid("101_1313007597.81655") :outer("99_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1805
    new $P113, "Undef"
    set $P1869, $P113
    .lex "$ops", $P1869
.annotate 'line', 1806
    new $P114, "Undef"
    set $P1870, $P114
    .lex "$fetchop", $P1870
.annotate 'line', 1807
    new $P115, "Undef"
    set $P1871, $P115
    .lex "$storeop", $P1871
.annotate 'line', 1800
    find_lex $P116, "$bindpost"
    unless $P116, if_1872_end
.annotate 'line', 1801
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    get_hll_global $P118, ["POST"], "Op"
    find_lex $P119, "$name"
    find_lex $P120, "$bindpost"
    find_lex $P121, "$bindpost"
    $P122 = $P118."new"($P119, $P120, "store_lex" :named("pirop"), $P121 :named("result"))
    setattribute $P117, 'payload', $P122
    throw $P117
  if_1872_end:
.annotate 'line', 1805
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "$node"
    $P118 = $P116."new"($P117 :named("node"))
    store_lex "$ops", $P118
.annotate 'line', 1806
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$ops"
    find_lex $P118, "$name"
    $P119 = $P116."new"($P117, $P118, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P119
.annotate 'line', 1807
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$name"
    find_lex $P118, "$ops"
    $P119 = $P116."new"($P117, $P118, "store_lex" :named("pirop"))
    store_lex "$storeop", $P119
.annotate 'line', 1808
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
.annotate 'line', 1799
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1859"  :anon :subid("100_1313007597.81655") :outer("99_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1784
    new $P109, "Undef"
    set $P1861, $P109
    .lex "$lexreg", $P1861
.annotate 'line', 1785
    new $P110, "Undef"
    set $P1862, $P110
    .lex "$ops", $P1862
.annotate 'line', 1786
    new $P111, "Undef"
    set $P1863, $P111
    .lex "$viviself", $P1863
.annotate 'line', 1784
    find_lex $P112, "self"
    $P113 = $P112."uniquereg"("P")
    store_lex "$lexreg", $P113
.annotate 'line', 1785
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1786
    find_lex $P112, "$node"
    $P113 = $P112."viviself"()
    store_lex "$viviself", $P113
.annotate 'line', 1788
    find_lex $P113, "$bindpost"
    isfalse $I100, $P113
    if $I100, if_1865
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1865_end
  if_1865:
    find_lex $P114, "$viviself"
    set $P112, $P114
  if_1865_end:
    unless $P112, if_1864_end
.annotate 'line', 1789
    find_lex $P115, "self"
    find_lex $P116, "$viviself"
    $P117 = $P115."as_vivipost"($P116, "P" :named("rtype"))
    store_lex "$bindpost", $P117
.annotate 'line', 1790
    find_lex $P115, "$ops"
    find_lex $P116, "$bindpost"
    $P115."push"($P116)
  if_1864_end:
.annotate 'line', 1793
    find_lex $P112, "$bindpost"
    unless $P112, if_1866_end
    find_lex $P113, "$ops"
    find_lex $P114, "$lexreg"
    find_lex $P115, "$bindpost"
    $P113."push_pirop"("set", $P114, $P115)
  if_1866_end:
.annotate 'line', 1795
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$lexreg"
    $P112."push_pirop"(".lex", $P113, $P114)
.annotate 'line', 1796
    find_lex $P112, "$ops"
    find_lex $P113, "$lexreg"
    $P112."result"($P113)
.annotate 'line', 1797
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 1782
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("102_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1876
    .param pmc param_1877
.annotate 'file', "Compiler.pm"
.annotate 'line', 1813
    .const 'Sub' $P1888 = "103_1313007597.81655" 
    capture_lex $P1888
    new $P1875, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1875, control_1874
    push_eh $P1875
    .lex "self", self
    .lex "$node", param_1876
    .lex "$bindpost", param_1877
.annotate 'line', 1818
    new $P105, "Undef"
    set $P1878, $P105
    .lex "$name", $P1878
.annotate 'line', 1820
    $P1880 = root_new ['parrot';'Hash']
    set $P1879, $P1880
    .lex "%symtable", $P1879
.annotate 'line', 1842
    new $P106, "Undef"
    set $P1881, $P106
    .lex "$ops", $P1881
.annotate 'line', 1843
    new $P107, "Undef"
    set $P1882, $P107
    .lex "$fetchop", $P1882
.annotate 'line', 1844
    new $P108, "Undef"
    set $P1883, $P108
    .lex "$storeop", $P1883
.annotate 'line', 1818
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    store_lex "$name", $P110
.annotate 'line', 1820
    find_dynamic_lex $P109, "@*BLOCKPAST"
    unless_null $P109, vivify_401
    get_hll_global $P109, "@BLOCKPAST"
    unless_null $P109, vivify_402
    die "Contextual @*BLOCKPAST not found"
  vivify_402:
  vivify_401:
    set $P110, $P109[0]
    unless_null $P110, vivify_403
    new $P110, "Undef"
  vivify_403:
    $P111 = $P110."symtable"()
    store_lex "%symtable", $P111
.annotate 'line', 1821
    find_lex $P109, "%symtable"
    defined $I100, $P109
    unless $I100, if_1884_end
.annotate 'line', 1822
    find_lex $P110, "$name"
    find_lex $P1885, "%symtable"
    unless_null $P1885, vivify_404
    $P1885 = root_new ['parrot';'Hash']
  vivify_404:
    set $P111, $P1885[$P110]
    unless_null $P111, vivify_405
    new $P111, "Undef"
  vivify_405:
    store_lex "%symtable", $P111
.annotate 'line', 1823
    find_lex $P110, "%symtable"
    defined $I101, $P110
    unless $I101, if_1886_end
    .const 'Sub' $P1888 = "103_1313007597.81655" 
    capture_lex $P1888
    $P1888()
  if_1886_end:
  if_1884_end:
.annotate 'line', 1832
    find_lex $P109, "$node"
    $P110 = $P109."isdecl"()
    unless $P110, if_1893_end
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$bindpost"
    $P115 = $P112."lexical"($P113, $P114)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1893_end:
.annotate 'line', 1834
    find_lex $P109, "self"
    find_lex $P110, "$name"
    $P111 = $P109."escape"($P110)
    store_lex "$name", $P111
.annotate 'line', 1836
    find_lex $P109, "$bindpost"
    unless $P109, if_1894_end
.annotate 'line', 1837
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$name"
    find_lex $P113, "$bindpost"
    find_lex $P114, "$bindpost"
    $P115 = $P111."new"($P112, $P113, "store_dynamic_lex" :named("pirop"), $P114 :named("result"))
    setattribute $P110, 'payload', $P115
    throw $P110
  if_1894_end:
.annotate 'line', 1842
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1843
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$ops"
    find_lex $P111, "$name"
    $P112 = $P109."new"($P110, $P111, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P112
.annotate 'line', 1844
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$name"
    find_lex $P111, "$ops"
    $P112 = $P109."new"($P110, $P111, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P112
.annotate 'line', 1845
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "$ops"
    find_lex $P112, "$fetchop"
    find_lex $P113, "$storeop"
    $P114 = $P109."vivify"($P110, $P111, $P112, $P113)
.annotate 'line', 1813
    .return ($P114)
  control_1874:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1887"  :anon :subid("103_1313007597.81655") :outer("102_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1824
    new $P111, "Undef"
    set $P1889, $P111
    .lex "$scope", $P1889
    find_lex $P1890, "%symtable"
    unless_null $P1890, vivify_406
    $P1890 = root_new ['parrot';'Hash']
  vivify_406:
    set $P112, $P1890["scope"]
    unless_null $P112, vivify_407
    new $P112, "Undef"
  vivify_407:
    store_lex "$scope", $P112
.annotate 'line', 1825
    find_lex $P114, "$scope"
    if $P114, if_1892
    set $P113, $P114
    goto if_1892_end
  if_1892:
    find_lex $P115, "$scope"
    set $S100, $P115
    isne $I102, $S100, "contextual"
    new $P113, 'Integer'
    set $P113, $I102
  if_1892_end:
    if $P113, if_1891
    set $P112, $P113
    goto if_1891_end
  if_1891:
.annotate 'line', 1826
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
  if_1891_end:
.annotate 'line', 1823
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("104_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1898
    .param pmc param_1899
    .param pmc param_1900 :optional
    .param int has_param_1900 :opt_flag
.annotate 'file', "Compiler.pm"
.annotate 'line', 1849
    new $P1897, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1897, control_1896
    push_eh $P1897
    .lex "self", self
    .lex "$node", param_1898
    .lex "$bindpost", param_1899
    if has_param_1900, optparam_408
    new $P105, "Undef"
    set param_1900, $P105
  optparam_408:
    .lex "$keyrtype", param_1900
.annotate 'line', 1850

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
    
.annotate 'line', 1849
    .return ()
  control_1896:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("105_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1904
    .param pmc param_1905
.annotate 'file', "Compiler.pm"
.annotate 'line', 1918
    new $P1903, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1903, control_1902
    push_eh $P1903
    .lex "self", self
    .lex "$node", param_1904
    .lex "$bindpost", param_1905
.annotate 'line', 1919
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "$bindpost"
    $P108 = $P105."keyed"($P106, $P107, "i")
.annotate 'line', 1918
    .return ($P108)
  control_1902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("106_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1909
    .param pmc param_1910
.annotate 'file', "Compiler.pm"
.annotate 'line', 1923
    .const 'Sub' $P1923 = "107_1313007597.81655" 
    capture_lex $P1923
    new $P1908, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1908, control_1907
    push_eh $P1908
    .lex "self", self
    .lex "$node", param_1909
    .lex "$bindpost", param_1910
.annotate 'line', 1924
    new $P105, "Undef"
    set $P1911, $P105
    .lex "$ops", $P1911
.annotate 'line', 1925
    new $P106, "Undef"
    set $P1912, $P106
    .lex "$name", $P1912
.annotate 'line', 1933
    new $P107, "Undef"
    set $P1913, $P107
    .lex "$call_on", $P1913
.annotate 'line', 1934
    $P1915 = root_new ['parrot';'ResizablePMCArray']
    set $P1914, $P1915
    .lex "@attribute", $P1914
.annotate 'line', 1935
    new $P108, "Undef"
    set $P1916, $P108
    .lex "$elements", $P1916
.annotate 'line', 1956
    new $P109, "Undef"
    set $P1917, $P109
    .lex "$fetchop", $P1917
.annotate 'line', 1957
    new $P110, "Undef"
    set $P1918, $P110
    .lex "$storeop", $P1918
.annotate 'line', 1924
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1925
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1923
    find_lex $P111, "$call_on"
.annotate 'line', 1934
    find_lex $P111, "$name"
    new $P112, "ResizablePMCArray"
    push $P112, $P111
    store_lex "@attribute", $P112
.annotate 'line', 1935
    find_lex $P111, "$node"
    elements $I100, $P111
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$elements", $P112
.annotate 'line', 1936
    find_lex $P111, "$elements"
    set $N100, $P111
    iseq $I100, $N100, 0.0
    if $I100, if_1919
.annotate 'line', 1940
    find_lex $P112, "self"
    find_lex $P1920, "$node"
    unless_null $P1920, vivify_409
    $P1920 = root_new ['parrot';'ResizablePMCArray']
  vivify_409:
    set $P113, $P1920[0]
    unless_null $P113, vivify_410
    new $P113, "Undef"
  vivify_410:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$call_on", $P114
.annotate 'line', 1941
    find_lex $P112, "$ops"
    find_lex $P113, "$call_on"
    $P112."push"($P113)
.annotate 'line', 1942
    find_lex $P112, "$elements"
    set $N101, $P112
    iseq $I101, $N101, 2.0
    unless $I101, if_1921_end
    .const 'Sub' $P1923 = "107_1313007597.81655" 
    capture_lex $P1923
    $P1923()
  if_1921_end:
.annotate 'line', 1939
    goto if_1919_end
  if_1919:
.annotate 'line', 1937
    new $P112, "String"
    assign $P112, "self"
    store_lex "$call_on", $P112
  if_1919_end:
.annotate 'line', 1948
    find_lex $P111, "@attribute"
    find_lex $P112, "$call_on"
    $P111."unshift"($P112)
.annotate 'line', 1950
    find_lex $P111, "$bindpost"
    unless $P111, if_1926_end
.annotate 'line', 1951
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    find_lex $P114, "$bindpost"
    $P112."push_pirop"("setattribute", $P113 :flat, $P114)
.annotate 'line', 1952
    find_lex $P112, "$ops"
    find_lex $P113, "$bindpost"
    $P112."result"($P113)
.annotate 'line', 1953
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1926_end:
.annotate 'line', 1956
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    $P114 = $P111."new"($P112, $P113 :flat, "getattribute" :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1957
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@attribute"
    find_lex $P113, "$ops"
    $P114 = $P111."new"($P112 :flat, $P113, "setattribute" :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1958
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$ops"
    find_lex $P114, "$fetchop"
    find_lex $P115, "$storeop"
    $P116 = $P111."vivify"($P112, $P113, $P114, $P115)
.annotate 'line', 1923
    .return ($P116)
  control_1907:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1922"  :anon :subid("107_1313007597.81655") :outer("106_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1943
    new $P113, "Undef"
    set $P1924, $P113
    .lex "$handle", $P1924
    find_lex $P114, "self"
    find_lex $P1925, "$node"
    unless_null $P1925, vivify_411
    $P1925 = root_new ['parrot';'ResizablePMCArray']
  vivify_411:
    set $P115, $P1925[1]
    unless_null $P115, vivify_412
    new $P115, "Undef"
  vivify_412:
    $P116 = $P114."as_post"($P115, "P" :named("rtype"))
    store_lex "$handle", $P116
.annotate 'line', 1944
    find_lex $P114, "$ops"
    find_lex $P115, "$handle"
    $P114."push"($P115)
.annotate 'line', 1945
    find_lex $P114, "@attribute"
    find_lex $P115, "$handle"
    $P116 = $P114."unshift"($P115)
.annotate 'line', 1942
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("108_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Var"],_)
    .param pmc param_1930
    .param pmc param_1931
.annotate 'file', "Compiler.pm"
.annotate 'line', 1962
    .const 'Sub' $P1938 = "109_1313007597.81655" 
    capture_lex $P1938
    new $P1929, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1929, control_1928
    push_eh $P1929
    .lex "self", self
    .lex "$node", param_1930
    .lex "$bindpost", param_1931
.annotate 'line', 1963
    new $P105, "Undef"
    set $P1932, $P105
    .lex "$name", $P1932
.annotate 'line', 1970
    new $P106, "Undef"
    set $P1933, $P106
    .lex "$ops", $P1933
.annotate 'line', 1963
    find_lex $P107, "$node"
    $P108 = $P107."name"()
    store_lex "$name", $P108
.annotate 'line', 1965
    find_lex $P107, "$name"
    if $P107, unless_1934_end
.annotate 'line', 1966
    find_lex $P108, "self"
    $P109 = $P108."uniquereg"("P")
    store_lex "$name", $P109
.annotate 'line', 1967
    find_lex $P108, "$node"
    find_lex $P109, "$name"
    $P108."name"($P109)
  unless_1934_end:
.annotate 'line', 1970
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$name"
    find_lex $P109, "$node"
    $P110 = $P107."new"($P108 :named("result"), $P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1972
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    unless $P108, if_1935_end
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    $P109."push_pirop"(".local pmc", $P110)
  if_1935_end:
.annotate 'line', 1974
    find_lex $P107, "$bindpost"
    if $P107, if_1936
.annotate 'line', 1977
    .const 'Sub' $P1938 = "109_1313007597.81655" 
    capture_lex $P1938
    $P1938()
    goto if_1936_end
  if_1936:
.annotate 'line', 1975
    find_lex $P108, "$ops"
    find_lex $P109, "$ops"
    find_lex $P110, "$bindpost"
    $P108."push_pirop"("set", $P109, $P110)
  if_1936_end:
.annotate 'line', 1962
    find_lex $P107, "$ops"
    .return ($P107)
  control_1928:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1937"  :anon :subid("109_1313007597.81655") :outer("108_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1977
    .const 'Sub' $P1942 = "110_1313007597.81655" 
    capture_lex $P1942
.annotate 'line', 1978
    new $P108, "Undef"
    set $P1939, $P108
    .lex "$viviself", $P1939
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 1979
    find_lex $P110, "$viviself"
    if $P110, if_1940
    set $P109, $P110
    goto if_1940_end
  if_1940:
    .const 'Sub' $P1942 = "110_1313007597.81655" 
    capture_lex $P1942
    $P112 = $P1942()
    set $P109, $P112
  if_1940_end:
.annotate 'line', 1977
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1941"  :anon :subid("110_1313007597.81655") :outer("109_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1980
    new $P111, "Undef"
    set $P1943, $P111
    .lex "$vivipost", $P1943
    find_lex $P112, "self"
    find_lex $P113, "$viviself"
    $P114 = $P112."as_vivipost"($P113, "P" :named("rtype"))
    store_lex "$vivipost", $P114
.annotate 'line', 1981
    find_lex $P112, "$ops"
    find_lex $P113, "$vivipost"
    $P112."push"($P113)
.annotate 'line', 1982
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P115 = $P112."push_pirop"("set", $P113, $P114)
.annotate 'line', 1979
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("111_1313007597.81655") :method :outer("11_1313007597.81655") :multi(_,["PAST";"Val"])
    .param pmc param_1947
    .param pmc param_1948 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 1998
    .const 'Sub' $P1959 = "112_1313007597.81655" 
    capture_lex $P1959
    new $P1946, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1946, control_1945
    push_eh $P1946
    .lex "self", self
    .lex "$node", param_1947
    .lex "%options", param_1948
.annotate 'line', 1999
    new $P105, "Undef"
    set $P1949, $P105
    .lex "$ops", $P1949
.annotate 'line', 2001
    new $P106, "Undef"
    set $P1950, $P106
    .lex "$value", $P1950
.annotate 'line', 2014
    new $P107, "Undef"
    set $P1951, $P107
    .lex "$returns", $P1951
.annotate 'line', 2017
    new $P108, "Undef"
    set $P1952, $P108
    .lex "$valflags", $P1952
.annotate 'line', 2032
    new $P109, "Undef"
    set $P1953, $P109
    .lex "$rtype", $P1953
.annotate 'line', 2045
    new $P110, "Undef"
    set $P1954, $P110
    .lex "$result", $P1954
.annotate 'line', 1999
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 2001
    find_lex $P1955, "$node"
    unless_null $P1955, vivify_413
    $P1955 = root_new ['parrot';'Hash']
  vivify_413:
    set $P111, $P1955["value"]
    unless_null $P111, vivify_414
    new $P111, "Undef"
  vivify_414:
    store_lex "$value", $P111
.annotate 'line', 2002
    find_lex $P111, "$value"
    defined $I100, $P111
    if $I100, unless_1956_end
.annotate 'line', 2003
    find_lex $P112, "self"
    $P112."panic"("PAST::Val node missing :value attribute")
  unless_1956_end:
.annotate 'line', 2005
    get_hll_global $P111, ["PAST"], "Block"
    find_lex $P112, "$value"
    $P113 = $P111."ACCEPTS"($P112)
    unless $P113, if_1957_end
    .const 'Sub' $P1959 = "112_1313007597.81655" 
    capture_lex $P1959
    $P1959()
  if_1957_end:
.annotate 'line', 2014
    find_lex $P1962, "$node"
    unless_null $P1962, vivify_415
    $P1962 = root_new ['parrot';'Hash']
  vivify_415:
    set $P111, $P1962["returns"]
    unless_null $P111, vivify_416
    new $P111, "Undef"
  vivify_416:
    store_lex "$returns", $P111
.annotate 'line', 2015
    find_lex $P111, "$returns"
    if $P111, unless_1963_end
    find_lex $P112, "$value"
    typeof $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$returns", $P113
  unless_1963_end:
.annotate 'line', 2017
    find_lex $P111, "$returns"
    get_global $P1964, "%valflags"
    unless_null $P1964, vivify_417
    $P1964 = root_new ['parrot';'Hash']
  vivify_417:
    set $P112, $P1964[$P111]
    unless_null $P112, vivify_418
    new $P112, "Undef"
  vivify_418:
    store_lex "$valflags", $P112
.annotate 'line', 2018
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "e"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1965_end
    find_lex $P112, "self"
    find_lex $P113, "$value"
    $P114 = $P112."escape"($P113)
    store_lex "$value", $P114
  if_1965_end:
.annotate 'line', 2021
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "c"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1966_end
.annotate 'line', 2023
    find_lex $P112, "$returns"
    set $S101, $P112
    isne $I102, $S101, "!macro_const"
    unless $I102, if_1967_end
.annotate 'line', 2024
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_419
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_420
    die "Contextual $*SUB not found"
  vivify_420:
  vivify_419:
.annotate 'line', 2025
    find_lex $P114, "$returns"
    set $S102, $P114
    replace $S103, $S102, 0, 1, ".include \""
    new $P115, 'String'
    set $P115, $S103
    concat $P116, $P115, ".pasm\""
    $P113."add_directive"($P116)
  if_1967_end:
.annotate 'line', 2029
    find_lex $P112, "$value"
    set $S101, $P112
    substr $S102, $S101, 0, 1
    iseq $I102, $S102, "."
    if $I102, unless_1968_end
    new $P113, "String"
    assign $P113, "."
    find_lex $P114, "$value"
    concat $P115, $P113, $P114
    store_lex "$value", $P115
  unless_1968_end:
  if_1966_end:
.annotate 'line', 2032
    find_lex $P1969, "%options"
    unless_null $P1969, vivify_421
    $P1969 = root_new ['parrot';'Hash']
  vivify_421:
    set $P111, $P1969["rtype"]
    unless_null $P111, vivify_422
    new $P111, "Undef"
  vivify_422:
    store_lex "$rtype", $P111
.annotate 'line', 2033
    find_lex $P111, "$valflags"
    set $S100, $P111
    find_lex $P112, "$rtype"
    set $S101, $P112
    index $I100, $S100, $S101
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1970_end
.annotate 'line', 2034
    find_lex $P113, "$ops"
    find_lex $P114, "$value"
    $P113."result"($P114)
.annotate 'line', 2035
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1970_end:
.annotate 'line', 2039
    find_lex $P112, "$rtype"
    set $S100, $P112
    iseq $I100, $S100, "n"
    if $I100, if_1972
    new $P111, 'Integer'
    set $P111, $I100
    goto if_1972_end
  if_1972:
    find_lex $P113, "$valflags"
    set $S101, $P113
    index $I101, $S101, "i"
    set $N100, $I101
    isge $I102, $N100, 0.0
    new $P111, 'Integer'
    set $P111, $I102
  if_1972_end:
    unless $P111, if_1971_end
.annotate 'line', 2040
    find_lex $P114, "$value"
    concat $P115, $P114, ".0"
    store_lex "$value", $P115
.annotate 'line', 2041
    find_lex $P114, "$ops"
    find_lex $P115, "$value"
    $P114."result"($P115)
.annotate 'line', 2042
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "$ops"
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1971_end:
.annotate 'line', 2045
    find_lex $P111, "self"
    $P112 = $P111."tempreg"("P")
    store_lex "$result", $P112
.annotate 'line', 2046
    find_lex $P111, "self"
    find_lex $P112, "$returns"
    $P113 = $P111."escape"($P112)
    store_lex "$returns", $P113
.annotate 'line', 2047
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$returns"
    $P111."push_pirop"("new", $P112, $P113)
.annotate 'line', 2048
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$value"
    $P111."push_pirop"("assign", $P112, $P113)
.annotate 'line', 2049
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1998
    find_lex $P111, "$ops"
    .return ($P111)
  control_1945:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1958"  :anon :subid("112_1313007597.81655") :outer("111_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 2006
    new $P114, "Undef"
    set $P1960, $P114
    .lex "$blockreg", $P1960
.annotate 'line', 2007
    new $P115, "Undef"
    set $P1961, $P115
    .lex "$blockref", $P1961
.annotate 'line', 2006
    find_lex $P116, "self"
    $P117 = $P116."uniquereg"("P")
    store_lex "$blockreg", $P117
.annotate 'line', 2007
    new $P116, 'String'
    set $P116, ".const 'Sub' "
    find_lex $P117, "$blockreg"
    concat $P118, $P116, $P117
    concat $P119, $P118, " = "
    store_lex "$blockref", $P119
.annotate 'line', 2008
    find_lex $P116, "$blockref"
    find_lex $P117, "self"
    find_lex $P118, "$value"
    $P119 = $P118."subid"()
    set $S100, $P119
    $S101 = $P117."escape"($S100)
    concat $P120, $P116, $S101
    store_lex "$blockref", $P120
.annotate 'line', 2009
    find_lex $P116, "$ops"
    find_lex $P117, "$blockref"
    $P116."push_pirop"($P117)
.annotate 'line', 2010
    find_lex $P116, "$ops"
    find_lex $P117, "$blockreg"
    $P116."result"($P117)
.annotate 'line', 2011
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    find_lex $P117, "$ops"
    setattribute $P116, 'payload', $P117
    throw $P116
.annotate 'line', 2005
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1974" :load :anon :subid("113_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1976 = "11_1313007597.81655" 
    $P105 = $P1976()
    .return ($P105)
.end


.namespace []
.sub "_block2068" :load :anon :subid("114_1313007597.81655")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1
    .const 'Sub' $P2070 = "10_1313007597.81655" 
    $P100 = $P2070()
    .return ($P100)
.end

