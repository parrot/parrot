
.namespace []
.sub "_block1000"  :anon :subid("10_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308507553.18311" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1308507553.18311" 
    capture_lex $P1003
    $P105 = $P1003()
.annotate 'line', 1
    .return ($P105)
    .const 'Sub' $P1965 = "104_1308507553.18311" 
    .return ($P1965)
.end


.namespace []
.sub "" :load :init :subid("post105") :outer("10_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308507553.18311" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P1967 = get_root_global ["parrot"], "P6metaclass"
    new $P102, "ResizablePMCArray"
    push $P102, "%!symtable"
    $P1967."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P102 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1308507553.18311") :outer("10_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1864 = "102_1308507553.18311" 
    capture_lex $P1864
    .const 'Sub' $P1847 = "99_1308507553.18311" 
    capture_lex $P1847
    .const 'Sub' $P1842 = "98_1308507553.18311" 
    capture_lex $P1842
    .const 'Sub' $P1837 = "97_1308507553.18311" 
    capture_lex $P1837
    .const 'Sub' $P1831 = "96_1308507553.18311" 
    capture_lex $P1831
    .const 'Sub' $P1809 = "94_1308507553.18311" 
    capture_lex $P1809
    .const 'Sub' $P1787 = "91_1308507553.18311" 
    capture_lex $P1787
    .const 'Sub' $P1772 = "90_1308507553.18311" 
    capture_lex $P1772
    .const 'Sub' $P1756 = "88_1308507553.18311" 
    capture_lex $P1756
    .const 'Sub' $P1740 = "86_1308507553.18311" 
    capture_lex $P1740
    .const 'Sub' $P1681 = "80_1308507553.18311" 
    capture_lex $P1681
    .const 'Sub' $P1665 = "79_1308507553.18311" 
    capture_lex $P1665
    .const 'Sub' $P1655 = "78_1308507553.18311" 
    capture_lex $P1655
    .const 'Sub' $P1643 = "77_1308507553.18311" 
    capture_lex $P1643
    .const 'Sub' $P1624 = "75_1308507553.18311" 
    capture_lex $P1624
    .const 'Sub' $P1612 = "74_1308507553.18311" 
    capture_lex $P1612
    .const 'Sub' $P1587 = "71_1308507553.18311" 
    capture_lex $P1587
    .const 'Sub' $P1568 = "70_1308507553.18311" 
    capture_lex $P1568
    .const 'Sub' $P1554 = "68_1308507553.18311" 
    capture_lex $P1554
    .const 'Sub' $P1549 = "67_1308507553.18311" 
    capture_lex $P1549
    .const 'Sub' $P1544 = "66_1308507553.18311" 
    capture_lex $P1544
    .const 'Sub' $P1529 = "64_1308507553.18311" 
    capture_lex $P1529
    .const 'Sub' $P1502 = "62_1308507553.18311" 
    capture_lex $P1502
    .const 'Sub' $P1497 = "61_1308507553.18311" 
    capture_lex $P1497
    .const 'Sub' $P1492 = "60_1308507553.18311" 
    capture_lex $P1492
    .const 'Sub' $P1487 = "59_1308507553.18311" 
    capture_lex $P1487
    .const 'Sub' $P1464 = "58_1308507553.18311" 
    capture_lex $P1464
    .const 'Sub' $P1433 = "57_1308507553.18311" 
    capture_lex $P1433
    .const 'Sub' $P1428 = "56_1308507553.18311" 
    capture_lex $P1428
    .const 'Sub' $P1379 = "52_1308507553.18311" 
    capture_lex $P1379
    .const 'Sub' $P1374 = "51_1308507553.18311" 
    capture_lex $P1374
    .const 'Sub' $P1349 = "49_1308507553.18311" 
    capture_lex $P1349
    .const 'Sub' $P1327 = "48_1308507553.18311" 
    capture_lex $P1327
    .const 'Sub' $P1310 = "47_1308507553.18311" 
    capture_lex $P1310
    .const 'Sub' $P1208 = "37_1308507553.18311" 
    capture_lex $P1208
    .const 'Sub' $P1172 = "33_1308507553.18311" 
    capture_lex $P1172
    .const 'Sub' $P1158 = "32_1308507553.18311" 
    capture_lex $P1158
    .const 'Sub' $P1139 = "30_1308507553.18311" 
    capture_lex $P1139
    .const 'Sub' $P1127 = "29_1308507553.18311" 
    capture_lex $P1127
    .const 'Sub' $P1122 = "28_1308507553.18311" 
    capture_lex $P1122
    .const 'Sub' $P1117 = "27_1308507553.18311" 
    capture_lex $P1117
    .const 'Sub' $P1110 = "26_1308507553.18311" 
    capture_lex $P1110
    .const 'Sub' $P1103 = "25_1308507553.18311" 
    capture_lex $P1103
    .const 'Sub' $P1097 = "24_1308507553.18311" 
    capture_lex $P1097
    .const 'Sub' $P1091 = "23_1308507553.18311" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "22_1308507553.18311" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "21_1308507553.18311" 
    capture_lex $P1079
    .const 'Sub' $P1074 = "20_1308507553.18311" 
    capture_lex $P1074
    .const 'Sub' $P1069 = "19_1308507553.18311" 
    capture_lex $P1069
    .const 'Sub' $P1055 = "18_1308507553.18311" 
    capture_lex $P1055
    .const 'Sub' $P1046 = "17_1308507553.18311" 
    capture_lex $P1046
    .const 'Sub' $P1038 = "16_1308507553.18311" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "15_1308507553.18311" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "14_1308507553.18311" 
    capture_lex $P1025
    .const 'Sub' $P1008 = "12_1308507553.18311" 
    capture_lex $P1008
.annotate 'line', 43
    get_global $P1004, "%piropsig"
    unless_null $P1004, vivify_198
    $P1004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1004
  vivify_198:
.annotate 'line', 44
    get_global $P1005, "%valflags"
    unless_null $P1005, vivify_199
    $P1005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1005
  vivify_199:
.annotate 'line', 45
    get_global $P1006, "%controltypes"
    unless_null $P1006, vivify_200
    $P1006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1006
  vivify_200:
.annotate 'line', 46
    get_global $P101, "$serno"
    unless_null $P101, vivify_201
    new $P101, "Undef"
    set_global "$serno", $P101
  vivify_201:
.annotate 'line', 49
    get_global $P102, "$TEMPREG_BASE"
    unless_null $P102, vivify_202
    new $P102, "Undef"
    set_global "$TEMPREG_BASE", $P102
  vivify_202:
.annotate 'line', 50
    get_global $P103, "$UNIQUE_BASE"
    unless_null $P103, vivify_203
    new $P103, "Undef"
    set_global "$UNIQUE_BASE", $P103
  vivify_203:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_204
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_204:
.annotate 'line', 41
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P104, "%piropsig"
    get_global $P104, "%valflags"
    get_global $P104, "%controltypes"
    get_global $P104, "$serno"
    get_global $P104, "$TEMPREG_BASE"
    get_global $P104, "$UNIQUE_BASE"
    get_global $P104, "@?BLOCK"
.annotate 'line', 2042
    .const 'Sub' $P1864 = "102_1308507553.18311" 
    newclosure $P1869, $P1864
.annotate 'line', 41
    .return ($P1869)
    .const 'Sub' $P1871 = "103_1308507553.18311" 
    .return ($P1871)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post106") :outer("11_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1308507553.18311" 
    .local pmc block
    set block, $P1003
.annotate 'line', 54
    get_hll_global $P105, ["PAST"], "Compiler"
    $P105."language"("PAST")
.annotate 'line', 55
    get_hll_global $P105, ["PAST"], "Compiler"
    new $P106, "ResizablePMCArray"
    push $P106, "post"
    push $P106, "pir"
    push $P106, "evalpmc"
    $P105."stages"($P106)
.annotate 'line', 58
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1873, "%piropsig"
    unless_null $P1873, vivify_107
    $P1873 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1873
  vivify_107:
    set $P1873["add"], $P105
.annotate 'line', 59
    new $P105, "String"
    assign $P105, "PPP"
    get_global $P1874, "%piropsig"
    unless_null $P1874, vivify_108
    $P1874 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1874
  vivify_108:
    set $P1874["band"], $P105
.annotate 'line', 60
    new $P105, "String"
    assign $P105, "PPP"
    get_global $P1875, "%piropsig"
    unless_null $P1875, vivify_109
    $P1875 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1875
  vivify_109:
    set $P1875["bxor"], $P105
.annotate 'line', 61
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1876, "%piropsig"
    unless_null $P1876, vivify_110
    $P1876 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1876
  vivify_110:
    set $P1876["bnot"], $P105
.annotate 'line', 62
    new $P105, "String"
    assign $P105, "PPP"
    get_global $P1877, "%piropsig"
    unless_null $P1877, vivify_111
    $P1877 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1877
  vivify_111:
    set $P1877["bor"], $P105
.annotate 'line', 63
    new $P105, "String"
    assign $P105, "IPs"
    get_global $P1878, "%piropsig"
    unless_null $P1878, vivify_112
    $P1878 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1878
  vivify_112:
    set $P1878["can"], $P105
.annotate 'line', 64
    new $P105, "String"
    assign $P105, "Si"
    get_global $P1879, "%piropsig"
    unless_null $P1879, vivify_113
    $P1879 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1879
  vivify_113:
    set $P1879["chr"], $P105
.annotate 'line', 65
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1880, "%piropsig"
    unless_null $P1880, vivify_114
    $P1880 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1880
  vivify_114:
    set $P1880["clone"], $P105
.annotate 'line', 66
    new $P105, "String"
    assign $P105, "PP~"
    get_global $P1881, "%piropsig"
    unless_null $P1881, vivify_115
    $P1881 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1881
  vivify_115:
    set $P1881["concat"], $P105
.annotate 'line', 67
    new $P105, "String"
    assign $P105, "0PP"
    get_global $P1882, "%piropsig"
    unless_null $P1882, vivify_116
    $P1882 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1882
  vivify_116:
    set $P1882["copy"], $P105
.annotate 'line', 68
    new $P105, "String"
    assign $P105, "IP"
    get_global $P1883, "%piropsig"
    unless_null $P1883, vivify_117
    $P1883 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1883
  vivify_117:
    set $P1883["defined"], $P105
.annotate 'line', 69
    new $P105, "String"
    assign $P105, "vQ*"
    get_global $P1884, "%piropsig"
    unless_null $P1884, vivify_118
    $P1884 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1884
  vivify_118:
    set $P1884["delete"], $P105
.annotate 'line', 70
    new $P105, "String"
    assign $P105, "v~"
    get_global $P1885, "%piropsig"
    unless_null $P1885, vivify_119
    $P1885 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1885
  vivify_119:
    set $P1885["die"], $P105
.annotate 'line', 71
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1886, "%piropsig"
    unless_null $P1886, vivify_120
    $P1886 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1886
  vivify_120:
    set $P1886["div"], $P105
.annotate 'line', 72
    new $P105, "String"
    assign $P105, "IPs"
    get_global $P1887, "%piropsig"
    unless_null $P1887, vivify_121
    $P1887 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1887
  vivify_121:
    set $P1887["does"], $P105
.annotate 'line', 73
    new $P105, "String"
    assign $P105, "Ss"
    get_global $P1888, "%piropsig"
    unless_null $P1888, vivify_122
    $P1888 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1888
  vivify_122:
    set $P1888["downcase"], $P105
.annotate 'line', 74
    new $P105, "String"
    assign $P105, "IP"
    get_global $P1889, "%piropsig"
    unless_null $P1889, vivify_123
    $P1889 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1889
  vivify_123:
    set $P1889["elements"], $P105
.annotate 'line', 75
    new $P105, "String"
    assign $P105, "IQ*"
    get_global $P1890, "%piropsig"
    unless_null $P1890, vivify_124
    $P1890 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1890
  vivify_124:
    set $P1890["exists"], $P105
.annotate 'line', 76
    new $P105, "String"
    assign $P105, "vi"
    get_global $P1891, "%piropsig"
    unless_null $P1891, vivify_125
    $P1891 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1891
  vivify_125:
    set $P1891["exit"], $P105
.annotate 'line', 77
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1892, "%piropsig"
    unless_null $P1892, vivify_126
    $P1892 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1892
  vivify_126:
    set $P1892["fdiv"], $P105
.annotate 'line', 78
    new $P105, "String"
    assign $P105, "Is"
    get_global $P1893, "%piropsig"
    unless_null $P1893, vivify_127
    $P1893 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1893
  vivify_127:
    set $P1893["find_codepoint"], $P105
.annotate 'line', 79
    new $P105, "String"
    assign $P105, "Ps"
    get_global $P1894, "%piropsig"
    unless_null $P1894, vivify_128
    $P1894 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1894
  vivify_128:
    set $P1894["find_dynamic_lex"], $P105
.annotate 'line', 80
    new $P105, "String"
    assign $P105, "Ps"
    get_global $P1895, "%piropsig"
    unless_null $P1895, vivify_129
    $P1895 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1895
  vivify_129:
    set $P1895["find_name"], $P105
.annotate 'line', 81
    new $P105, "String"
    assign $P105, "P"
    get_global $P1896, "%piropsig"
    unless_null $P1896, vivify_130
    $P1896 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1896
  vivify_130:
    set $P1896["getinterp"], $P105
.annotate 'line', 82
    new $P105, "String"
    assign $P105, "P~P"
    get_global $P1897, "%piropsig"
    unless_null $P1897, vivify_131
    $P1897 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1897
  vivify_131:
    set $P1897["getprop"], $P105
.annotate 'line', 83
    new $P105, "String"
    assign $P105, "P"
    get_global $P1898, "%piropsig"
    unless_null $P1898, vivify_132
    $P1898 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1898
  vivify_132:
    set $P1898["getstderr"], $P105
.annotate 'line', 84
    new $P105, "String"
    assign $P105, "P"
    get_global $P1899, "%piropsig"
    unless_null $P1899, vivify_133
    $P1899 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1899
  vivify_133:
    set $P1899["getstdin"], $P105
.annotate 'line', 85
    new $P105, "String"
    assign $P105, "P"
    get_global $P1900, "%piropsig"
    unless_null $P1900, vivify_134
    $P1900 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1900
  vivify_134:
    set $P1900["getstdout"], $P105
.annotate 'line', 86
    new $P105, "String"
    assign $P105, "Issi"
    get_global $P1901, "%piropsig"
    unless_null $P1901, vivify_135
    $P1901 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1901
  vivify_135:
    set $P1901["index"], $P105
.annotate 'line', 87
    new $P105, "String"
    assign $P105, "IP~"
    get_global $P1902, "%piropsig"
    unless_null $P1902, vivify_136
    $P1902 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1902
  vivify_136:
    set $P1902["isa"], $P105
.annotate 'line', 88
    new $P105, "String"
    assign $P105, "IP"
    get_global $P1903, "%piropsig"
    unless_null $P1903, vivify_137
    $P1903 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1903
  vivify_137:
    set $P1903["isfalse"], $P105
.annotate 'line', 89
    new $P105, "String"
    assign $P105, "IP"
    get_global $P1904, "%piropsig"
    unless_null $P1904, vivify_138
    $P1904 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1904
  vivify_138:
    set $P1904["isnull"], $P105
.annotate 'line', 90
    new $P105, "String"
    assign $P105, "IPP"
    get_global $P1905, "%piropsig"
    unless_null $P1905, vivify_139
    $P1905 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1905
  vivify_139:
    set $P1905["issame"], $P105
.annotate 'line', 91
    new $P105, "String"
    assign $P105, "IP"
    get_global $P1906, "%piropsig"
    unless_null $P1906, vivify_140
    $P1906 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1906
  vivify_140:
    set $P1906["istrue"], $P105
.annotate 'line', 92
    new $P105, "String"
    assign $P105, "SsP"
    get_global $P1907, "%piropsig"
    unless_null $P1907, vivify_141
    $P1907 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1907
  vivify_141:
    set $P1907["join"], $P105
.annotate 'line', 93
    new $P105, "String"
    assign $P105, "Is"
    get_global $P1908, "%piropsig"
    unless_null $P1908, vivify_142
    $P1908 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1908
  vivify_142:
    set $P1908["length"], $P105
.annotate 'line', 94
    new $P105, "String"
    assign $P105, "vs"
    get_global $P1909, "%piropsig"
    unless_null $P1909, vivify_143
    $P1909 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1909
  vivify_143:
    set $P1909["load_bytecode"], $P105
.annotate 'line', 95
    new $P105, "String"
    assign $P105, "vs"
    get_global $P1910, "%piropsig"
    unless_null $P1910, vivify_144
    $P1910 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1910
  vivify_144:
    set $P1910["load_language"], $P105
.annotate 'line', 96
    new $P105, "String"
    assign $P105, "P~"
    get_global $P1911, "%piropsig"
    unless_null $P1911, vivify_145
    $P1911 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1911
  vivify_145:
    set $P1911["loadlib"], $P105
.annotate 'line', 97
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1912, "%piropsig"
    unless_null $P1912, vivify_146
    $P1912 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1912
  vivify_146:
    set $P1912["mod"], $P105
.annotate 'line', 98
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1913, "%piropsig"
    unless_null $P1913, vivify_147
    $P1913 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1913
  vivify_147:
    set $P1913["mul"], $P105
.annotate 'line', 99
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1914, "%piropsig"
    unless_null $P1914, vivify_148
    $P1914 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1914
  vivify_148:
    set $P1914["neg"], $P105
.annotate 'line', 100
    new $P105, "String"
    assign $P105, "P~"
    get_global $P1915, "%piropsig"
    unless_null $P1915, vivify_149
    $P1915 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1915
  vivify_149:
    set $P1915["new"], $P105
.annotate 'line', 101
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1916, "%piropsig"
    unless_null $P1916, vivify_150
    $P1916 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1916
  vivify_150:
    set $P1916["newclosure"], $P105
.annotate 'line', 102
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1917, "%piropsig"
    unless_null $P1917, vivify_151
    $P1917 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1917
  vivify_151:
    set $P1917["not"], $P105
.annotate 'line', 103
    new $P105, "String"
    assign $P105, "Isi"
    get_global $P1918, "%piropsig"
    unless_null $P1918, vivify_152
    $P1918 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1918
  vivify_152:
    set $P1918["ord"], $P105
.annotate 'line', 104
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1919, "%piropsig"
    unless_null $P1919, vivify_153
    $P1919 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1919
  vivify_153:
    set $P1919["pop"], $P105
.annotate 'line', 105
    new $P105, "String"
    assign $P105, "NN+"
    get_global $P1920, "%piropsig"
    unless_null $P1920, vivify_154
    $P1920 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1920
  vivify_154:
    set $P1920["pow"], $P105
.annotate 'line', 106
    new $P105, "String"
    assign $P105, "v*"
    get_global $P1921, "%piropsig"
    unless_null $P1921, vivify_155
    $P1921 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1921
  vivify_155:
    set $P1921["print"], $P105
.annotate 'line', 107
    new $P105, "String"
    assign $P105, "v*"
    get_global $P1922, "%piropsig"
    unless_null $P1922, vivify_156
    $P1922 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1922
  vivify_156:
    set $P1922["printerr"], $P105
.annotate 'line', 108
    new $P105, "String"
    assign $P105, "0P*"
    get_global $P1923, "%piropsig"
    unless_null $P1923, vivify_157
    $P1923 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1923
  vivify_157:
    set $P1923["push"], $P105
.annotate 'line', 109
    new $P105, "String"
    assign $P105, "Ssi"
    get_global $P1924, "%piropsig"
    unless_null $P1924, vivify_158
    $P1924 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1924
  vivify_158:
    set $P1924["repeat"], $P105
.annotate 'line', 110
    new $P105, "String"
    assign $P105, "Ssiis"
    get_global $P1925, "%piropsig"
    unless_null $P1925, vivify_159
    $P1925 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1925
  vivify_159:
    set $P1925["replace"], $P105
.annotate 'line', 111
    new $P105, "String"
    assign $P105, "v*"
    get_global $P1926, "%piropsig"
    unless_null $P1926, vivify_160
    $P1926 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1926
  vivify_160:
    set $P1926["say"], $P105
.annotate 'line', 112
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1927, "%piropsig"
    unless_null $P1927, vivify_161
    $P1927 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1927
  vivify_161:
    set $P1927["set"], $P105
.annotate 'line', 113
    new $P105, "String"
    assign $P105, "0P~P"
    get_global $P1928, "%piropsig"
    unless_null $P1928, vivify_162
    $P1928 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1928
  vivify_162:
    set $P1928["setprop"], $P105
.annotate 'line', 114
    new $P105, "String"
    assign $P105, "0P~P"
    get_global $P1929, "%piropsig"
    unless_null $P1929, vivify_163
    $P1929 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1929
  vivify_163:
    set $P1929["setattribute"], $P105
.annotate 'line', 115
    new $P105, "String"
    assign $P105, "PP"
    get_global $P1930, "%piropsig"
    unless_null $P1930, vivify_164
    $P1930 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1930
  vivify_164:
    set $P1930["shift"], $P105
.annotate 'line', 116
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1931, "%piropsig"
    unless_null $P1931, vivify_165
    $P1931 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1931
  vivify_165:
    set $P1931["shl"], $P105
.annotate 'line', 117
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1932, "%piropsig"
    unless_null $P1932, vivify_166
    $P1932 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1932
  vivify_166:
    set $P1932["shr"], $P105
.annotate 'line', 118
    new $P105, "String"
    assign $P105, "v+"
    get_global $P1933, "%piropsig"
    unless_null $P1933, vivify_167
    $P1933 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1933
  vivify_167:
    set $P1933["sleep"], $P105
.annotate 'line', 119
    new $P105, "String"
    assign $P105, "0PPii"
    get_global $P1934, "%piropsig"
    unless_null $P1934, vivify_168
    $P1934 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1934
  vivify_168:
    set $P1934["splice"], $P105
.annotate 'line', 120
    new $P105, "String"
    assign $P105, "Pss"
    get_global $P1935, "%piropsig"
    unless_null $P1935, vivify_169
    $P1935 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1935
  vivify_169:
    set $P1935["split"], $P105
.annotate 'line', 121
    new $P105, "String"
    assign $P105, "PP+"
    get_global $P1936, "%piropsig"
    unless_null $P1936, vivify_170
    $P1936 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1936
  vivify_170:
    set $P1936["sub"], $P105
.annotate 'line', 122
    new $P105, "String"
    assign $P105, "Ssii"
    get_global $P1937, "%piropsig"
    unless_null $P1937, vivify_171
    $P1937 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1937
  vivify_171:
    set $P1937["substr"], $P105
.annotate 'line', 123
    new $P105, "String"
    assign $P105, "Ss"
    get_global $P1938, "%piropsig"
    unless_null $P1938, vivify_172
    $P1938 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1938
  vivify_172:
    set $P1938["titlecase"], $P105
.annotate 'line', 124
    new $P105, "String"
    assign $P105, "vi"
    get_global $P1939, "%piropsig"
    unless_null $P1939, vivify_173
    $P1939 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1939
  vivify_173:
    set $P1939["trace"], $P105
.annotate 'line', 125
    new $P105, "String"
    assign $P105, "SP"
    get_global $P1940, "%piropsig"
    unless_null $P1940, vivify_174
    $P1940 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1940
  vivify_174:
    set $P1940["typeof"], $P105
.annotate 'line', 126
    new $P105, "String"
    assign $P105, "0P*"
    get_global $P1941, "%piropsig"
    unless_null $P1941, vivify_175
    $P1941 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1941
  vivify_175:
    set $P1941["unshift"], $P105
.annotate 'line', 127
    new $P105, "String"
    assign $P105, "Ss"
    get_global $P1942, "%piropsig"
    unless_null $P1942, vivify_176
    $P1942 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1942
  vivify_176:
    set $P1942["upcase"], $P105
.annotate 'line', 132
    new $P105, "String"
    assign $P105, "s~*:e"
    get_global $P1943, "%valflags"
    unless_null $P1943, vivify_177
    $P1943 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1943
  vivify_177:
    set $P1943["String"], $P105
.annotate 'line', 133
    new $P105, "String"
    assign $P105, "i+*:"
    get_global $P1944, "%valflags"
    unless_null $P1944, vivify_178
    $P1944 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1944
  vivify_178:
    set $P1944["Integer"], $P105
.annotate 'line', 134
    new $P105, "String"
    assign $P105, "n+*:"
    get_global $P1945, "%valflags"
    unless_null $P1945, vivify_179
    $P1945 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1945
  vivify_179:
    set $P1945["Float"], $P105
.annotate 'line', 135
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1946, "%valflags"
    unless_null $P1946, vivify_180
    $P1946 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1946
  vivify_180:
    set $P1946["!macro_const"], $P105
.annotate 'line', 136
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1947, "%valflags"
    unless_null $P1947, vivify_181
    $P1947 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1947
  vivify_181:
    set $P1947["!cclass"], $P105
.annotate 'line', 137
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1948, "%valflags"
    unless_null $P1948, vivify_182
    $P1948 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1948
  vivify_182:
    set $P1948["!except_severity"], $P105
.annotate 'line', 138
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1949, "%valflags"
    unless_null $P1949, vivify_183
    $P1949 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1949
  vivify_183:
    set $P1949["!except_types"], $P105
.annotate 'line', 139
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1950, "%valflags"
    unless_null $P1950, vivify_184
    $P1950 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1950
  vivify_184:
    set $P1950["!iterator"], $P105
.annotate 'line', 140
    new $P105, "String"
    assign $P105, "i+*:c"
    get_global $P1951, "%valflags"
    unless_null $P1951, vivify_185
    $P1951 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1951
  vivify_185:
    set $P1951["!socket"], $P105
.annotate 'line', 144
    new $P105, "String"
    assign $P105, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P1952, "%controltypes"
    unless_null $P1952, vivify_186
    $P1952 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1952
  vivify_186:
    set $P1952["CONTROL"], $P105
.annotate 'line', 145
    new $P105, "String"
    assign $P105, ".CONTROL_RETURN"
    get_global $P1953, "%controltypes"
    unless_null $P1953, vivify_187
    $P1953 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1953
  vivify_187:
    set $P1953["RETURN"], $P105
.annotate 'line', 146
    new $P105, "String"
    assign $P105, ".CONTROL_OK"
    get_global $P1954, "%controltypes"
    unless_null $P1954, vivify_188
    $P1954 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1954
  vivify_188:
    set $P1954["OK"], $P105
.annotate 'line', 147
    new $P105, "String"
    assign $P105, ".CONTROL_BREAK"
    get_global $P1955, "%controltypes"
    unless_null $P1955, vivify_189
    $P1955 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1955
  vivify_189:
    set $P1955["BREAK"], $P105
.annotate 'line', 148
    new $P105, "String"
    assign $P105, ".CONTROL_CONTINUE"
    get_global $P1956, "%controltypes"
    unless_null $P1956, vivify_190
    $P1956 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1956
  vivify_190:
    set $P1956["CONTINUE"], $P105
.annotate 'line', 149
    new $P105, "String"
    assign $P105, ".CONTROL_ERROR"
    get_global $P1957, "%controltypes"
    unless_null $P1957, vivify_191
    $P1957 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1957
  vivify_191:
    set $P1957["ERROR"], $P105
.annotate 'line', 150
    new $P105, "String"
    assign $P105, ".CONTROL_TAKE"
    get_global $P1958, "%controltypes"
    unless_null $P1958, vivify_192
    $P1958 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1958
  vivify_192:
    set $P1958["GATHER"], $P105
.annotate 'line', 151
    new $P105, "String"
    assign $P105, ".CONTROL_LEAVE"
    get_global $P1959, "%controltypes"
    unless_null $P1959, vivify_193
    $P1959 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1959
  vivify_193:
    set $P1959["LEAVE"], $P105
.annotate 'line', 152
    new $P105, "String"
    assign $P105, ".CONTROL_EXIT"
    get_global $P1960, "%controltypes"
    unless_null $P1960, vivify_194
    $P1960 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1960
  vivify_194:
    set $P1960["EXIT"], $P105
.annotate 'line', 153
    new $P105, "String"
    assign $P105, ".CONTROL_NEXT"
    get_global $P1961, "%controltypes"
    unless_null $P1961, vivify_195
    $P1961 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1961
  vivify_195:
    set $P1961["NEXT"], $P105
.annotate 'line', 154
    new $P105, "String"
    assign $P105, ".CONTROL_LAST"
    get_global $P1962, "%controltypes"
    unless_null $P1962, vivify_196
    $P1962 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1962
  vivify_196:
    set $P1962["LAST"], $P105
.annotate 'line', 155
    new $P105, "String"
    assign $P105, ".CONTROL_REDO"
    get_global $P1963, "%controltypes"
    unless_null $P1963, vivify_197
    $P1963 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1963
  vivify_197:
    set $P1963["REDO"], $P105
.annotate 'line', 160
    new $P105, "Integer"
    assign $P105, 100
    set_global "$TEMPREG_BASE", $P105
.annotate 'line', 161
    new $P105, "Integer"
    assign $P105, 1000
    set_global "$UNIQUE_BASE", $P105
.annotate 'line', 164
    get_global $P105, "$UNIQUE_BASE"
    clone $P106, $P105
    set_global "$serno", $P106
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1011
    .param pmc param_1012 :slurpy :named
.annotate 'file', ''
.annotate 'line', 174
    .const 'Sub' $P1021 = "13_1308507553.18311" 
    capture_lex $P1021
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    .lex "$past", param_1011
    .lex "%options", param_1012
.annotate 'line', 181
    $P1014 = root_new ['parrot';'ResizablePMCArray']
    set $P1013, $P1014
    .lex "@*BLOCKPAST", $P1013
.annotate 'line', 182
    new $P104, "Undef"
    set $P1015, $P104
    .lex "$*SUB", $P1015
.annotate 'line', 183
    $P1017 = root_new ['parrot';'Hash']
    set $P1016, $P1017
    .lex "%tempregs", $P1016
.annotate 'line', 175
    $P1018 = root_new ['parrot';'Hash']
    find_lex $P105, "self"
    setattribute $P105, "%!symtable", $P1018
.annotate 'line', 177
    get_global $P105, "@?BLOCK"
    defined $I101, $P105
    if $I101, unless_1019_end
.annotate 'line', 178
    new $P106, "ResizablePMCArray"
    set_global "@?BLOCK", $P106
  unless_1019_end:
.annotate 'line', 181
    get_global $P105, "@?BLOCK"
    store_lex "@*BLOCKPAST", $P105
.annotate 'line', 174
    find_lex $P105, "$*SUB"
    unless_null $P105, vivify_205
    get_hll_global $P105, "$SUB"
    unless_null $P105, vivify_206
    die "Contextual $*SUB not found"
  vivify_206:
  vivify_205:
.annotate 'line', 183
    find_dynamic_lex $P105, "%*TEMPREGS"
    store_lex "%tempregs", $P105
.annotate 'line', 185
    .const 'Sub' $P1021 = "13_1308507553.18311" 
    capture_lex $P1021
    $P105 = $P1021()
.annotate 'line', 174
    .return ($P105)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1020"  :anon :subid("13_1308507553.18311") :outer("12_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 186
    $P1023 = root_new ['parrot';'Hash']
    set $P1022, $P1023
    .lex "%*TEMPREGS", $P1022
.annotate 'line', 185
    find_lex $P105, "%*TEMPREGS"
    unless_null $P105, vivify_207
    get_hll_global $P105, "%TEMPREGS"
    unless_null $P105, vivify_208
    die "Contextual %*TEMPREGS not found"
  vivify_208:
  vivify_207:
.annotate 'line', 187
    find_lex $P105, "%tempregs"
    defined $I101, $P105
    if $I101, if_1024
.annotate 'line', 191
    find_lex $P106, "self"
    $P107 = $P106."tempreg_frame"()
    store_lex "%*TEMPREGS", $P107
.annotate 'line', 190
    goto if_1024_end
  if_1024:
.annotate 'line', 188
    find_lex $P106, "%tempregs"
    store_lex "%*TEMPREGS", $P106
  if_1024_end:
.annotate 'line', 194
    find_lex $P105, "self"
    find_lex $P106, "$past"
    $P107 = $P105."as_post"($P106, "v" :named("rtype"))
.annotate 'line', 185
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("14_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1028
.annotate 'file', ''
.annotate 'line', 201
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$str", param_1028
.annotate 'line', 202
    new $P104, "Undef"
    set $P1029, $P104
    .lex "$estr", $P1029
    find_lex $P105, "$str"
    set $S101, $P105
    escape $S102, $S101
    new $P106, 'String'
    set $P106, $S102
    store_lex "$estr", $P106
.annotate 'line', 203
    find_lex $P106, "$estr"
    set $S101, $P106
    index $I101, $S101, unicode:"\\x"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, unless_1031
    new $P105, 'Integer'
    set $P105, $I102
    goto unless_1031_end
  unless_1031:
    find_lex $P107, "$estr"
    set $S102, $P107
    index $I103, $S102, unicode:"\\u"
    set $N102, $I103
    isgt $I104, $N102, 0.0
    new $P105, 'Integer'
    set $P105, $I104
  unless_1031_end:
    if $P105, if_1030
.annotate 'line', 207
    new $P108, "String"
    assign $P108, "\""
    find_lex $P109, "$estr"
    concat $P110, $P108, $P109
    store_lex "$estr", $P110
.annotate 'line', 206
    goto if_1030_end
  if_1030:
.annotate 'line', 204
    new $P108, "String"
    assign $P108, "unicode:\""
    find_lex $P109, "$estr"
    concat $P110, $P108, $P109
    store_lex "$estr", $P110
  if_1030_end:
.annotate 'line', 209
    find_lex $P105, "$estr"
    concat $P106, $P105, "\""
    store_lex "$estr", $P106
.annotate 'line', 201
    .return ($P106)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("15_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1035 :optional
    .param int has_param_1035 :opt_flag
.annotate 'file', ''
.annotate 'line', 217
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    if has_param_1035, optparam_209
    new $P104, "Undef"
    set param_1035, $P104
  optparam_209:
    .lex "$fmt", param_1035
.annotate 'line', 218
    find_lex $P105, "$fmt"
    defined $I101, $P105
    if $I101, unless_1036_end
    new $P106, "String"
    assign $P106, ""
    store_lex "$fmt", $P106
  unless_1036_end:
.annotate 'line', 219
    find_lex $P105, "$fmt"
    get_global $P106, "$serno"
    clone $P1037, $P106
    inc $P106
    concat $P107, $P105, $P1037
    store_lex "$fmt", $P107
.annotate 'line', 217
    .return ($P107)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("16_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1041
.annotate 'file', ''
.annotate 'line', 226
    new $P1040, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1040, control_1039
    push_eh $P1040
    .lex "self", self
    .lex "$rtype", param_1041
.annotate 'line', 231
    new $P104, "Undef"
    set $P1042, $P104
    .lex "$i", $P1042
.annotate 'line', 227
    find_lex $P105, "$rtype"
    if $P105, unless_1043_end
    find_lex $P106, "self"
    $P106."panic"("rtype not set")
  unless_1043_end:
.annotate 'line', 229
    find_lex $P105, "$rtype"
    set $S101, $P105
    iseq $I101, $S101, "v"
    unless $I101, if_1044_end
    new $P106, "Exception"
    set $P106['type'], .CONTROL_RETURN
    new $P107, "String"
    assign $P107, ""
    setattribute $P106, 'payload', $P107
    throw $P106
  if_1044_end:
.annotate 'line', 231
    find_lex $P105, "$rtype"
    set $S101, $P105
    index $I101, "Ss~Nn+Ii", $S101
    new $P106, 'Integer'
    set $P106, $I101
    store_lex "$i", $P106
.annotate 'line', 232
    new $P105, "String"
    assign $P105, "P"
    store_lex "$rtype", $P105
.annotate 'line', 233
    find_lex $P105, "$i"
    set $N101, $P105
    islt $I101, $N101, 0.0
    if $I101, unless_1045_end
    find_lex $P106, "$i"
    set $I102, $P106
    substr $S101, "SSSNNNII", $I102, 1
    new $P107, 'String'
    set $P107, $S101
    store_lex "$rtype", $P107
  unless_1045_end:
.annotate 'line', 234
    new $P105, "String"
    assign $P105, "$"
    find_lex $P106, "$rtype"
    concat $P107, $P105, $P106
    store_lex "$rtype", $P107
.annotate 'line', 236
    find_lex $P105, "self"
    find_lex $P106, "$rtype"
    $P107 = $P105."unique"($P106)
.annotate 'line', 226
    .return ($P107)
  control_1039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg_frame"  :subid("17_1308507553.18311") :method :outer("11_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 243
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
.annotate 'line', 244
    $P1050 = root_new ['parrot';'Hash']
    set $P1049, $P1050
    .lex "%tempregs", $P1049
.annotate 'line', 243
    find_lex $P104, "%tempregs"
.annotate 'line', 245
    get_global $P104, "$TEMPREG_BASE"
    find_lex $P1051, "%tempregs"
    unless_null $P1051, vivify_210
    $P1051 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1051
  vivify_210:
    set $P1051["I"], $P104
.annotate 'line', 246
    get_global $P104, "$TEMPREG_BASE"
    find_lex $P1052, "%tempregs"
    unless_null $P1052, vivify_211
    $P1052 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1052
  vivify_211:
    set $P1052["N"], $P104
.annotate 'line', 247
    get_global $P104, "$TEMPREG_BASE"
    find_lex $P1053, "%tempregs"
    unless_null $P1053, vivify_212
    $P1053 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1053
  vivify_212:
    set $P1053["S"], $P104
.annotate 'line', 248
    get_global $P104, "$TEMPREG_BASE"
    find_lex $P1054, "%tempregs"
    unless_null $P1054, vivify_213
    $P1054 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1054
  vivify_213:
    set $P1054["P"], $P104
.annotate 'line', 243
    find_lex $P104, "%tempregs"
    .return ($P104)
  control_1047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg"  :subid("18_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1058
.annotate 'file', ''
.annotate 'line', 267
    new $P1057, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1057, control_1056
    push_eh $P1057
    .lex "self", self
    .lex "$rtype", param_1058
.annotate 'line', 272
    new $P104, "Undef"
    set $P1059, $P104
    .lex "$I0", $P1059
.annotate 'line', 279
    new $P105, "Undef"
    set $P1060, $P105
    .lex "$reg", $P1060
.annotate 'line', 280
    new $P106, "Undef"
    set $P1061, $P106
    .lex "$rnum", $P1061
.annotate 'line', 268
    find_lex $P107, "$rtype"
    if $P107, unless_1062_end
    find_lex $P108, "self"
    $P108."panic"("rtype not set")
  unless_1062_end:
.annotate 'line', 270
    find_lex $P107, "$rtype"
    set $S101, $P107
    iseq $I101, $S101, "v"
    unless $I101, if_1063_end
    new $P108, "Exception"
    set $P108['type'], .CONTROL_RETURN
    new $P109, "String"
    assign $P109, ""
    setattribute $P108, 'payload', $P109
    throw $P108
  if_1063_end:
.annotate 'line', 272
    find_lex $P107, "$rtype"
    set $S101, $P107
    index $I101, "Ss~Nn+Ii", $S101
    new $P108, 'Integer'
    set $P108, $I101
    store_lex "$I0", $P108
.annotate 'line', 273
    new $P107, "String"
    assign $P107, "P"
    store_lex "$rtype", $P107
.annotate 'line', 274
    find_lex $P107, "$I0"
    set $N101, $P107
    islt $I101, $N101, 0.0
    if $I101, unless_1064_end
    find_lex $P108, "$I0"
    set $I102, $P108
    substr $S101, "SSSNNNII", $I102, 1
    new $P109, 'String'
    set $P109, $S101
    store_lex "$rtype", $P109
  unless_1064_end:
.annotate 'line', 277
    find_dynamic_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_214
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_215
    die "Contextual %*TEMPREGS not found"
  vivify_215:
  vivify_214:
    if $P107, unless_1065_end
    new $P108, "Exception"
    set $P108['type'], .CONTROL_RETURN
    find_lex $P109, "self"
    new $P110, "String"
    assign $P110, "$"
    find_lex $P111, "$rtype"
    concat $P112, $P110, $P111
    $P113 = $P109."unique"($P112)
    setattribute $P108, 'payload', $P113
    throw $P108
  unless_1065_end:
.annotate 'line', 267
    find_lex $P107, "$reg"
.annotate 'line', 280
    find_lex $P107, "$rtype"
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_216
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_217
    die "Contextual %*TEMPREGS not found"
  vivify_217:
  vivify_216:
    set $P109, $P108[$P107]
    unless_null $P109, vivify_218
    new $P109, "Undef"
  vivify_218:
    store_lex "$rnum", $P109
.annotate 'line', 281
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1068_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
    goto loop1068_redo
  loop1068_test:
    find_lex $P107, "$reg"
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_219
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_220
    die "Contextual %*TEMPREGS not found"
  vivify_220:
  vivify_219:
    set $P109, $P108[$P107]
    unless_null $P109, vivify_221
    new $P109, "Undef"
  vivify_221:
    unless $P109, loop1068_done
  loop1068_redo:
.annotate 'line', 283
    find_lex $P110, "$rnum"
    set $N101, $P110
    get_global $P111, "$UNIQUE_BASE"
    set $N102, $P111
    isge $I101, $N101, $N102
    unless $I101, if_1066_end
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    new $P114, "String"
    assign $P114, "$"
    find_lex $P115, "$rtype"
    concat $P116, $P114, $P115
    $P117 = $P113."unique"($P116)
    setattribute $P112, 'payload', $P117
    throw $P112
  if_1066_end:
.annotate 'line', 281
    find_lex $P110, "$rnum"
    clone $P1067, $P110
    inc $P110
.annotate 'line', 286
    find_lex $P110, "$rnum"
    find_lex $P111, "$rtype"
    find_dynamic_lex $P112, "%*TEMPREGS"
    unless_null $P112, vivify_222
    get_hll_global $P112, "%TEMPREGS"
    unless_null $P112, vivify_223
    die "Contextual %*TEMPREGS not found"
  vivify_223:
    store_dynamic_lex "%*TEMPREGS", $P112
  vivify_222:
    set $P112[$P111], $P110
.annotate 'line', 287
    new $P110, "String"
    assign $P110, "$"
    find_lex $P111, "$rtype"
    concat $P112, $P110, $P111
    find_lex $P113, "$rnum"
    concat $P114, $P112, $P113
    store_lex "$reg", $P114
  loop1068_next:
.annotate 'line', 281
    goto loop1068_test
  loop1068_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1068_next
    eq $P111, .CONTROL_LOOP_REDO, loop1068_redo
  loop1068_done:
    pop_eh 
.annotate 'line', 267
    find_lex $P107, "$reg"
    .return ($P107)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("19_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1072
    .param pmc param_1073
.annotate 'file', ''
.annotate 'line', 299
    new $P1071, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1071, control_1070
    push_eh $P1071
    .lex "self", self
    .lex "$post", param_1072
    .lex "$rtype", param_1073
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
  control_1070:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("20_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1077
    .param pmc param_1078 :slurpy :named
.annotate 'file', ''
.annotate 'line', 439
    new $P1076, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1076, control_1075
    push_eh $P1076
    .lex "self", self
    .lex "$node", param_1077
    .lex "%options", param_1078
.annotate 'line', 440

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
    
.annotate 'line', 439
    .return ()
  control_1075:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("21_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,_)
    .param pmc param_1082
    .param pmc param_1083 :slurpy :named
.annotate 'file', ''
.annotate 'line', 576
    new $P1081, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1081, control_1080
    push_eh $P1081
    .lex "self", self
    .lex "$node", param_1082
    .lex "%options", param_1083
.annotate 'line', 577
    new $P104, "Undef"
    set $P1084, $P104
    .lex "$what", $P1084
.annotate 'line', 576
    find_lex $P105, "$what"
.annotate 'line', 579
    find_lex $P105, "$node"
    isnull $I101, $P105
    if $I101, if_1085
.annotate 'line', 583
    new $P106, "String"
    assign $P106, "node of type "
    find_lex $P107, "$node"
    typeof $S101, $P107
    concat $P108, $P106, $S101
    store_lex "$what", $P108
.annotate 'line', 582
    goto if_1085_end
  if_1085:
.annotate 'line', 580
    new $P106, "String"
    assign $P106, "a null node"
    store_lex "$what", $P106
  if_1085_end:
.annotate 'line', 586
    find_lex $P105, "self"
    new $P106, "String"
    assign $P106, "PAST::Compiler can't compile "
    find_lex $P107, "$what"
    concat $P108, $P106, $P107
    $P109 = $P105."panic"($P108)
.annotate 'line', 576
    .return ($P109)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("22_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["Undef"])
    .param pmc param_1089
    .param pmc param_1090 :slurpy :named
.annotate 'file', ''
.annotate 'line', 592
    new $P1088, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1088, control_1087
    push_eh $P1088
    .lex "self", self
    .lex "$node", param_1089
    .lex "%options", param_1090
.annotate 'line', 593
    get_hll_global $P104, ["POST"], "Ops"
    find_lex $P105, "self"
    $P106 = $P105."tempreg"("P")
    $P107 = $P104."new"($P106 :named("result"))
.annotate 'line', 592
    .return ($P107)
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("23_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["Integer"])
    .param pmc param_1094
    .param pmc param_1095 :slurpy :named
.annotate 'file', ''
.annotate 'line', 603
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$node", param_1094
    .lex "%options", param_1095
.annotate 'line', 604
    find_lex $P104, "self"
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "$node"
    $P107 = $P105."new"($P106 :named("result"))
    find_lex $P1096, "%options"
    unless_null $P1096, vivify_224
    $P1096 = root_new ['parrot';'Hash']
  vivify_224:
    set $P108, $P1096["rtype"]
    unless_null $P108, vivify_225
    new $P108, "Undef"
  vivify_225:
    $P109 = $P104."coerce"($P107, $P108)
.annotate 'line', 603
    .return ($P109)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("24_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["Float"])
    .param pmc param_1100
    .param pmc param_1101 :slurpy :named
.annotate 'file', ''
.annotate 'line', 607
    new $P1099, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1099, control_1098
    push_eh $P1099
    .lex "self", self
    .lex "$node", param_1100
    .lex "%options", param_1101
.annotate 'line', 608
    find_lex $P104, "self"
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "$node"
    $P107 = $P105."new"($P106 :named("result"))
    find_lex $P1102, "%options"
    unless_null $P1102, vivify_226
    $P1102 = root_new ['parrot';'Hash']
  vivify_226:
    set $P108, $P1102["rtype"]
    unless_null $P108, vivify_227
    new $P108, "Undef"
  vivify_227:
    $P109 = $P104."coerce"($P107, $P108)
.annotate 'line', 607
    .return ($P109)
  control_1098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["String"])
    .param pmc param_1106
    .param pmc param_1107 :slurpy :named
.annotate 'file', ''
.annotate 'line', 611
    new $P1105, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1105, control_1104
    push_eh $P1105
    .lex "self", self
    .lex "$node", param_1106
    .lex "%options", param_1107
.annotate 'line', 612
    new $P104, "Undef"
    set $P1108, $P104
    .lex "$value", $P1108
    find_lex $P105, "self"
    find_lex $P106, "$node"
    $P107 = $P105."escape"($P106)
    store_lex "$value", $P107
.annotate 'line', 613
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$value"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1109, "%options"
    unless_null $P1109, vivify_228
    $P1109 = root_new ['parrot';'Hash']
  vivify_228:
    set $P109, $P1109["rtype"]
    unless_null $P109, vivify_229
    new $P109, "Undef"
  vivify_229:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 611
    .return ($P110)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("26_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["String"])
    .param pmc param_1113
    .param pmc param_1114 :slurpy :named
.annotate 'file', ''
.annotate 'line', 622
    new $P1112, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1112, control_1111
    push_eh $P1112
    .lex "self", self
    .lex "$node", param_1113
    .lex "%options", param_1114
.annotate 'line', 623
    new $P104, "Undef"
    set $P1115, $P104
    .lex "$result", $P1115
.annotate 'line', 624
    new $P105, "Undef"
    set $P1116, $P105
    .lex "$s", $P1116
.annotate 'line', 623
    find_lex $P106, "self"
    $P107 = $P106."tempreg"("P")
    store_lex "$result", $P107
.annotate 'line', 624
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P106."escape"($P107)
    store_lex "$s", $P108
.annotate 'line', 625
    get_hll_global $P106, ["POST"], "Op"
    find_lex $P107, "$result"
    find_lex $P108, "$s"
    find_lex $P109, "$result"
    $P110 = $P106."new"($P107, $P108, "new" :named("pirop"), $P109 :named("result"))
.annotate 'line', 622
    .return ($P110)
  control_1111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("27_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,_)
    .param pmc param_1120
    .param pmc param_1121 :slurpy :named
.annotate 'file', ''
.annotate 'line', 630
    new $P1119, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1119, control_1118
    push_eh $P1119
    .lex "self", self
    .lex "$node", param_1120
    .lex "%options", param_1121
.annotate 'line', 631
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."as_post"($P105, $P106 :flat)
.annotate 'line', 630
    .return ($P107)
  control_1118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("28_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Node"])
    .param pmc param_1125
    .param pmc param_1126 :slurpy :named
.annotate 'file', ''
.annotate 'line', 646
    new $P1124, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1124, control_1123
    push_eh $P1124
    .lex "self", self
    .lex "$node", param_1125
    .lex "%options", param_1126
.annotate 'line', 647
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."node_as_post"($P105, $P106)
.annotate 'line', 646
    .return ($P107)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("29_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1130
    .param pmc param_1131
.annotate 'file', ''
.annotate 'line', 651
    new $P1129, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1129, control_1128
    push_eh $P1129
    .lex "self", self
    .lex "$node", param_1130
    .lex "%options", param_1131
.annotate 'line', 652
    new $P104, "Undef"
    set $P1132, $P104
    .lex "$rtype", $P1132
.annotate 'line', 654
    new $P105, "Undef"
    set $P1133, $P105
    .lex "$signature", $P1133
.annotate 'line', 657
    new $P106, "Undef"
    set $P1134, $P106
    .lex "$ops", $P1134
.annotate 'line', 660
    new $P107, "Undef"
    set $P1135, $P107
    .lex "$eh", $P1135
.annotate 'line', 652
    find_lex $P1136, "%options"
    unless_null $P1136, vivify_230
    $P1136 = root_new ['parrot';'Hash']
  vivify_230:
    set $P108, $P1136["rtype"]
    unless_null $P108, vivify_231
    new $P108, "Undef"
  vivify_231:
    store_lex "$rtype", $P108
.annotate 'line', 654
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    set $N101, $P109
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P110, 'String'
    set $P110, $S101
    store_lex "$signature", $P110
.annotate 'line', 655
    find_lex $P108, "$signature"
    find_lex $P109, "$rtype"
    concat $P110, $P108, $P109
    store_lex "$signature", $P110
.annotate 'line', 657
    find_lex $P108, "self"
    find_lex $P109, "$node"
    find_lex $P110, "$signature"
    $P111 = $P108."post_children"($P109, $P110 :named("signature"))
    store_lex "$ops", $P111
.annotate 'line', 658
    find_lex $P108, "$ops"
    find_lex $P1137, "$ops"
    unless_null $P1137, vivify_232
    $P1137 = root_new ['parrot';'ResizablePMCArray']
  vivify_232:
    set $P109, $P1137[-1]
    unless_null $P109, vivify_233
    new $P109, "Undef"
  vivify_233:
    $P108."result"($P109)
.annotate 'line', 660
    find_lex $P108, "$node"
    $P109 = $P108."handlers"()
    store_lex "$eh", $P109
.annotate 'line', 661
    find_lex $P108, "$eh"
    unless $P108, if_1138_end
    find_lex $P109, "self"
    find_lex $P110, "$ops"
    find_lex $P111, "$eh"
    find_lex $P112, "$rtype"
    $P113 = $P109."wrap_handlers"($P110, $P111, $P112 :named("rtype"))
    store_lex "$ops", $P113
  if_1138_end:
.annotate 'line', 651
    find_lex $P108, "$ops"
    .return ($P108)
  control_1128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Stmt"])
    .param pmc param_1142
    .param pmc param_1143 :slurpy :named
.annotate 'file', ''
.annotate 'line', 673
    .const 'Sub' $P1149 = "31_1308507553.18311" 
    capture_lex $P1149
    new $P1141, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1141, control_1140
    push_eh $P1141
    .lex "self", self
    .lex "$node", param_1142
    .lex "%options", param_1143
.annotate 'line', 674
    $P1145 = root_new ['parrot';'Hash']
    set $P1144, $P1145
    .lex "%outerregs", $P1144
.annotate 'line', 675
    new $P104, "Undef"
    set $P1146, $P104
    .lex "$post", $P1146
.annotate 'line', 683
    new $P105, "Undef"
    set $P1147, $P105
    .lex "$result", $P1147
.annotate 'line', 674
    find_dynamic_lex $P106, "%*TEMPREGS"
    unless_null $P106, vivify_234
    get_hll_global $P106, "%TEMPREGS"
    unless_null $P106, vivify_235
    die "Contextual %*TEMPREGS not found"
  vivify_235:
  vivify_234:
    store_lex "%outerregs", $P106
.annotate 'line', 673
    find_lex $P106, "$post"
.annotate 'line', 677
    .const 'Sub' $P1149 = "31_1308507553.18311" 
    capture_lex $P1149
    $P1149()
.annotate 'line', 683
    find_lex $P106, "$post"
    $P107 = $P106."result"()
    store_lex "$result", $P107
.annotate 'line', 685
    find_lex $P108, "%outerregs"
    if $P108, if_1155
    set $P107, $P108
    goto if_1155_end
  if_1155:
    find_lex $P1156, "%options"
    unless_null $P1156, vivify_238
    $P1156 = root_new ['parrot';'Hash']
  vivify_238:
    set $P109, $P1156["rtype"]
    unless_null $P109, vivify_239
    new $P109, "Undef"
  vivify_239:
    set $S101, $P109
    isne $I101, $S101, "v"
    new $P107, 'Integer'
    set $P107, $I101
  if_1155_end:
    if $P107, if_1154
    set $P106, $P107
    goto if_1154_end
  if_1154:
.annotate 'line', 686
    find_lex $P110, "$result"
    set $S102, $P110
    substr $S103, $S102, 0, 1
    iseq $I102, $S103, "$"
    new $P106, 'Integer'
    set $P106, $I102
  if_1154_end:
    unless $P106, if_1153_end
.annotate 'line', 688
    new $P111, "Integer"
    assign $P111, 1
    find_lex $P112, "$result"
    find_lex $P1157, "%outerregs"
    unless_null $P1157, vivify_240
    $P1157 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1157
  vivify_240:
    set $P1157[$P112], $P111
  if_1153_end:
.annotate 'line', 673
    find_lex $P106, "$post"
    .return ($P106)
  control_1140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1148"  :anon :subid("31_1308507553.18311") :outer("30_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 678
    $P1151 = root_new ['parrot';'Hash']
    set $P1150, $P1151
    .lex "%*TEMPREGS", $P1150
.annotate 'line', 677
    find_lex $P106, "%*TEMPREGS"
    unless_null $P106, vivify_236
    get_hll_global $P106, "%TEMPREGS"
    unless_null $P106, vivify_237
    die "Contextual %*TEMPREGS not found"
  vivify_237:
  vivify_236:
.annotate 'line', 679
    find_lex $P106, "%outerregs"
    unless $P106, if_1152_end
    find_lex $P107, "%outerregs"
    clone $P108, $P107
    store_lex "%*TEMPREGS", $P108
  if_1152_end:
.annotate 'line', 680
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."node_as_post"($P107, $P108)
    store_lex "$post", $P109
.annotate 'line', 677
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Control"])
    .param pmc param_1161
    .param pmc param_1162 :slurpy :named
.annotate 'file', ''
.annotate 'line', 700
    new $P1160, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1160, control_1159
    push_eh $P1160
    .lex "self", self
    .lex "$node", param_1161
    .lex "%options", param_1162
.annotate 'line', 702
    $P1164 = root_new ['parrot';'Hash']
    set $P1163, $P1164
    .lex "%*TEMPREGS", $P1163
.annotate 'line', 704
    new $P104, "Undef"
    set $P1165, $P104
    .lex "$ishandled", $P1165
.annotate 'line', 705
    new $P105, "Undef"
    set $P1166, $P105
    .lex "$nothandled", $P1166
.annotate 'line', 707
    new $P106, "Undef"
    set $P1167, $P106
    .lex "$ops", $P1167
.annotate 'line', 709
    new $P107, "Undef"
    set $P1168, $P107
    .lex "$signature", $P1168
.annotate 'line', 714
    new $P108, "Undef"
    set $P1169, $P108
    .lex "$children", $P1169
.annotate 'line', 716
    new $P109, "Undef"
    set $P1170, $P109
    .lex "$handled", $P1170
.annotate 'line', 700
    find_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_241
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_242
    die "Contextual %*TEMPREGS not found"
  vivify_242:
  vivify_241:
.annotate 'line', 704
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("handled_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$ishandled", $P113
.annotate 'line', 705
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("nothandled_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$nothandled", $P113
.annotate 'line', 707
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 709
    find_lex $P110, "$node"
    $P111 = $P110."list"()
    set $N101, $P111
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P112, 'String'
    set $P112, $S101
    store_lex "$signature", $P112
.annotate 'line', 710
    find_lex $P110, "$signature"
    find_lex $P1171, "%options"
    unless_null $P1171, vivify_243
    $P1171 = root_new ['parrot';'Hash']
  vivify_243:
    set $P111, $P1171["rtype"]
    unless_null $P111, vivify_244
    new $P111, "Undef"
  vivify_244:
    concat $P112, $P110, $P111
    store_lex "$signature", $P112
.annotate 'line', 712
    find_lex $P110, "$ops"
    $P110."push_pirop"(".local pmc exception")
.annotate 'line', 713
    find_lex $P110, "$ops"
    $P110."push_pirop"(".get_results (exception)")
.annotate 'line', 714
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$signature"
    $P113 = $P110."post_children"($P111, $P112 :named("signature"))
    store_lex "$children", $P113
.annotate 'line', 715
    find_lex $P110, "$ops"
    find_lex $P111, "$children"
    $P110."push"($P111)
.annotate 'line', 716
    find_lex $P110, "self"
    $P111 = $P110."uniquereg"("I")
    store_lex "$handled", $P111
.annotate 'line', 718
    find_lex $P110, "$ops"
    find_lex $P111, "$handled"
    $P110."push_pirop"("set", $P111, "exception[\"handled\"]")
.annotate 'line', 719
    find_lex $P110, "$ops"
    find_lex $P111, "$handled"
    find_lex $P112, "$nothandled"
    $P110."push_pirop"("ne", $P111, 1, $P112)
.annotate 'line', 720
    find_lex $P110, "$ops"
    find_lex $P111, "$ishandled"
    $P110."push"($P111)
.annotate 'line', 721
    find_lex $P110, "$ops"
    $P110."push_pirop"("return", "exception")
.annotate 'line', 722
    find_lex $P110, "$ops"
    find_lex $P111, "$nothandled"
    $P110."push"($P111)
.annotate 'line', 723
    find_lex $P110, "$ops"
    $P110."push_pirop"("rethrow", "exception")
.annotate 'line', 700
    find_lex $P110, "$ops"
    .return ($P110)
  control_1159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("33_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1175
    .param pmc param_1176
    .param pmc param_1177 :slurpy :named
.annotate 'file', ''
.annotate 'line', 727
    .const 'Sub' $P1187 = "34_1308507553.18311" 
    capture_lex $P1187
    new $P1174, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1174, control_1173
    push_eh $P1174
    .lex "self", self
    .lex "$child", param_1175
    .lex "$ehs", param_1176
    .lex "%options", param_1177
.annotate 'line', 728
    new $P104, "Undef"
    set $P1178, $P104
    .lex "$rtype", $P1178
.annotate 'line', 731
    $P1180 = root_new ['parrot';'Hash']
    set $P1179, $P1180
    .lex "%*TEMPREGS", $P1179
.annotate 'line', 733
    new $P105, "Undef"
    set $P1181, $P105
    .lex "$ops", $P1181
.annotate 'line', 734
    new $P106, "Undef"
    set $P1182, $P106
    .lex "$pops", $P1182
.annotate 'line', 735
    new $P107, "Undef"
    set $P1183, $P107
    .lex "$tail", $P1183
.annotate 'line', 736
    new $P108, "Undef"
    set $P1184, $P108
    .lex "$skip", $P1184
.annotate 'line', 728
    find_lex $P1185, "%options"
    unless_null $P1185, vivify_245
    $P1185 = root_new ['parrot';'Hash']
  vivify_245:
    set $P109, $P1185["rtype"]
    unless_null $P109, vivify_246
    new $P109, "Undef"
  vivify_246:
    store_lex "$rtype", $P109
.annotate 'line', 727
    find_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_247
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_248
    die "Contextual %*TEMPREGS not found"
  vivify_248:
  vivify_247:
.annotate 'line', 733
    get_hll_global $P109, ["POST"], "Ops"
    $P110 = $P109."new"()
    store_lex "$ops", $P110
.annotate 'line', 734
    get_hll_global $P109, ["POST"], "Ops"
    $P110 = $P109."new"()
    store_lex "$pops", $P110
.annotate 'line', 735
    get_hll_global $P109, ["POST"], "Ops"
    $P110 = $P109."new"()
    store_lex "$tail", $P110
.annotate 'line', 736
    get_hll_global $P109, ["POST"], "Label"
    find_lex $P110, "self"
    $P111 = $P110."unique"("skip_handler_")
    $P112 = $P109."new"($P111 :named("result"))
    store_lex "$skip", $P112
.annotate 'line', 738
    find_lex $P110, "$ehs"
    defined $I101, $P110
    unless $I101, for_undef_249
    iter $P109, $P110
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1207_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1207_test:
    unless $P109, loop1207_done
    shift $P111, $P109
  loop1207_redo:
    .const 'Sub' $P1187 = "34_1308507553.18311" 
    capture_lex $P1187
    $P1187($P111)
  loop1207_next:
    goto loop1207_test
  loop1207_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1207_next
    eq $P117, .CONTROL_LOOP_REDO, loop1207_redo
  loop1207_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 771
    find_lex $P109, "$ops"
    find_lex $P110, "$child"
    $P109."push"($P110)
.annotate 'line', 773
    find_lex $P109, "$ops"
    find_lex $P110, "$pops"
    $P109."push"($P110)
.annotate 'line', 774
    find_lex $P109, "$ops"
    find_lex $P110, "$skip"
    $P109."push_pirop"("goto", $P110)
.annotate 'line', 775
    find_lex $P109, "$ops"
    find_lex $P110, "$tail"
    $P109."push"($P110)
.annotate 'line', 776
    find_lex $P109, "$ops"
    find_lex $P110, "$skip"
    $P109."push"($P110)
.annotate 'line', 727
    find_lex $P109, "$ops"
    .return ($P109)
  control_1173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1186"  :anon :subid("34_1308507553.18311") :outer("33_1308507553.18311")
    .param pmc param_1192
.annotate 'file', ''
.annotate 'line', 738
    .const 'Sub' $P1204 = "36_1308507553.18311" 
    capture_lex $P1204
    .const 'Sub' $P1197 = "35_1308507553.18311" 
    capture_lex $P1197
.annotate 'line', 739
    new $P112, "Undef"
    set $P1188, $P112
    .lex "$node", $P1188
.annotate 'line', 740
    new $P113, "Undef"
    set $P1189, $P113
    .lex "$label", $P1189
.annotate 'line', 741
    new $P114, "Undef"
    set $P1190, $P114
    .lex "$ehreg", $P1190
.annotate 'line', 746
    new $P115, "Undef"
    set $P1191, $P115
    .lex "$type", $P1191
    .lex "$_", param_1192
.annotate 'line', 739
    find_lex $P116, "$_"
    store_lex "$node", $P116
.annotate 'line', 740
    get_hll_global $P116, ["POST"], "Label"
    find_lex $P117, "self"
    $P118 = $P117."unique"("control_")
    $P119 = $P116."new"($P118 :named("result"))
    store_lex "$label", $P119
.annotate 'line', 741
    find_lex $P116, "self"
    $P117 = $P116."uniquereg"("P")
    store_lex "$ehreg", $P117
.annotate 'line', 743
    find_lex $P116, "$ops"
    find_lex $P117, "$ehreg"
    $P116."push_pirop"("new", $P117, "'ExceptionHandler'")
.annotate 'line', 744
    find_lex $P116, "$ops"
    find_lex $P117, "$ehreg"
    find_lex $P118, "$label"
    $P116."push_pirop"("set_label", $P117, $P118)
.annotate 'line', 746
    find_lex $P116, "$node"
    $P117 = $P116."handle_types"()
    store_lex "$type", $P117
.annotate 'line', 747
    find_lex $P117, "$type"
    if $P117, if_1194
    set $P116, $P117
    goto if_1194_end
  if_1194:
    find_lex $P118, "$type"
    get_global $P1195, "%controltypes"
    unless_null $P1195, vivify_250
    $P1195 = root_new ['parrot';'Hash']
  vivify_250:
    set $P119, $P1195[$P118]
    unless_null $P119, vivify_251
    new $P119, "Undef"
  vivify_251:
    store_lex "$type", $P119
    set $P116, $P119
  if_1194_end:
    unless $P116, if_1193_end
    .const 'Sub' $P1197 = "35_1308507553.18311" 
    capture_lex $P1197
    $P1197()
  if_1193_end:
.annotate 'line', 753
    find_lex $P116, "$node"
    $P117 = $P116."handle_types_except"()
    store_lex "$type", $P117
.annotate 'line', 754
    find_lex $P117, "$type"
    if $P117, if_1201
    set $P116, $P117
    goto if_1201_end
  if_1201:
    find_lex $P118, "$type"
    get_global $P1202, "%controltypes"
    unless_null $P1202, vivify_254
    $P1202 = root_new ['parrot';'Hash']
  vivify_254:
    set $P119, $P1202[$P118]
    unless_null $P119, vivify_255
    new $P119, "Undef"
  vivify_255:
    store_lex "$type", $P119
    set $P116, $P119
  if_1201_end:
    unless $P116, if_1200_end
    .const 'Sub' $P1204 = "36_1308507553.18311" 
    capture_lex $P1204
    $P1204()
  if_1200_end:
.annotate 'line', 761
    find_lex $P116, "$ops"
    find_lex $P117, "$ehreg"
    $P116."push_pirop"("push_eh", $P117)
.annotate 'line', 764
    find_lex $P116, "$pops"
    $P116."push_pirop"("pop_eh")
.annotate 'line', 767
    find_lex $P116, "$tail"
    find_lex $P117, "$label"
    $P116."push"($P117)
.annotate 'line', 768
    find_lex $P116, "$tail"
    find_lex $P117, "self"
    find_lex $P118, "$node"
    find_lex $P119, "$rtype"
    $P120 = $P117."as_post"($P118, $P119 :named("rtype"))
    $P121 = $P116."push"($P120)
.annotate 'line', 738
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1196"  :anon :subid("35_1308507553.18311") :outer("34_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 748
    $P1199 = root_new ['parrot';'ResizablePMCArray']
    set $P1198, $P1199
    .lex "@types", $P1198
    find_lex $P120, "$type"
    set $S101, $P120
    split $P121, ",", $S101
    store_lex "@types", $P121
.annotate 'line', 749
    find_lex $P120, "$ops"
    find_lex $P121, "$ehreg"
    find_lex $P122, "@types"
    $P120."push_pirop"("callmethod", "\"handle_types\"", $P121, $P122 :flat)
.annotate 'line', 750
    find_dynamic_lex $P120, "$*SUB"
    unless_null $P120, vivify_252
    get_hll_global $P120, "$SUB"
    unless_null $P120, vivify_253
    die "Contextual $*SUB not found"
  vivify_253:
  vivify_252:
    $P121 = $P120."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 747
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1203"  :anon :subid("36_1308507553.18311") :outer("34_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 755
    $P1206 = root_new ['parrot';'ResizablePMCArray']
    set $P1205, $P1206
    .lex "@types", $P1205
    find_lex $P120, "$type"
    set $S101, $P120
    split $P121, ",", $S101
    store_lex "@types", $P121
.annotate 'line', 756
    find_lex $P120, "$ops"
    find_lex $P121, "$ehreg"
    find_lex $P122, "@types"
    $P120."push_pirop"("callmethod", "\"handle_types_except\"", $P121, $P122 :flat)
.annotate 'line', 758
    find_dynamic_lex $P120, "$*SUB"
    unless_null $P120, vivify_256
    get_hll_global $P120, "$SUB"
    unless_null $P120, vivify_257
    die "Contextual $*SUB not found"
  vivify_257:
  vivify_256:
    $P121 = $P120."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 754
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("37_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Block"])
    .param pmc param_1211
    .param pmc param_1212 :slurpy :named
.annotate 'file', ''
.annotate 'line', 786
    .const 'Sub' $P1236 = "38_1308507553.18311" 
    capture_lex $P1236
    new $P1210, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1210, control_1209
    push_eh $P1210
    .lex "self", self
    .lex "$node", param_1211
    .lex "%options", param_1212
.annotate 'line', 790
    new $P104, "Undef"
    set $P1213, $P104
    .lex "$name", $P1213
.annotate 'line', 791
    new $P105, "Undef"
    set $P1214, $P105
    .lex "$pirflags", $P1214
.annotate 'line', 792
    new $P106, "Undef"
    set $P1215, $P106
    .lex "$blocktype", $P1215
.annotate 'line', 793
    new $P107, "Undef"
    set $P1216, $P107
    .lex "$nsentry", $P1216
.annotate 'line', 794
    new $P108, "Undef"
    set $P1217, $P108
    .lex "$subid", $P1217
.annotate 'line', 795
    new $P109, "Undef"
    set $P1218, $P109
    .lex "$ns", $P1218
.annotate 'line', 796
    new $P110, "Undef"
    set $P1219, $P110
    .lex "$hll", $P1219
.annotate 'line', 797
    new $P111, "Undef"
    set $P1220, $P111
    .lex "$multi", $P1220
.annotate 'line', 798
    new $P112, "Undef"
    set $P1221, $P112
    .lex "$loadlibs", $P1221
.annotate 'line', 823
    new $P113, "Undef"
    set $P1222, $P113
    .lex "$bpost", $P1222
.annotate 'line', 831
    new $P114, "Undef"
    set $P1223, $P114
    .lex "$blockreg", $P1223
.annotate 'line', 832
    new $P115, "Undef"
    set $P1224, $P115
    .lex "$blockref", $P1224
.annotate 'line', 837
    new $P116, "Undef"
    set $P1225, $P116
    .lex "$outerpost", $P1225
.annotate 'line', 788
    find_dynamic_lex $P117, "@*BLOCKPAST"
    unless_null $P117, vivify_258
    get_hll_global $P117, "@BLOCKPAST"
    unless_null $P117, vivify_259
    die "Contextual @*BLOCKPAST not found"
  vivify_259:
  vivify_258:
    find_lex $P118, "$node"
    unshift $P117, $P118
.annotate 'line', 790
    find_lex $P117, "$node"
    $P118 = $P117."name"()
    store_lex "$name", $P118
.annotate 'line', 791
    find_lex $P117, "$node"
    $P118 = $P117."pirflags"()
    store_lex "$pirflags", $P118
.annotate 'line', 792
    find_lex $P117, "$node"
    $P118 = $P117."blocktype"()
    store_lex "$blocktype", $P118
.annotate 'line', 793
    find_lex $P117, "$node"
    $P118 = $P117."nsentry"()
    store_lex "$nsentry", $P118
.annotate 'line', 794
    find_lex $P117, "$node"
    $P118 = $P117."subid"()
    store_lex "$subid", $P118
.annotate 'line', 795
    find_lex $P117, "$node"
    $P118 = $P117."namespace"()
    store_lex "$ns", $P118
.annotate 'line', 796
    find_lex $P117, "$node"
    $P118 = $P117."hll"()
    store_lex "$hll", $P118
.annotate 'line', 797
    find_lex $P117, "$node"
    $P118 = $P117."multi"()
    store_lex "$multi", $P118
.annotate 'line', 798
    find_lex $P117, "$node"
    $P118 = $P117."loadlibs"()
    store_lex "$loadlibs", $P118
.annotate 'line', 801
    find_lex $P117, "$name"
    defined $I101, $P117
    if $I101, unless_1226_end
    new $P118, "String"
    assign $P118, ""
    store_lex "$name", $P118
  unless_1226_end:
.annotate 'line', 802
    find_lex $P117, "$pirflags"
    defined $I101, $P117
    if $I101, unless_1227_end
    new $P118, "String"
    assign $P118, ""
    store_lex "$pirflags", $P118
  unless_1227_end:
.annotate 'line', 803
    find_lex $P117, "$blocktype"
    defined $I101, $P117
    if $I101, unless_1228_end
    new $P118, "String"
    assign $P118, ""
    store_lex "$blocktype", $P118
  unless_1228_end:
.annotate 'line', 806
    find_lex $P117, "$nsentry"
    defined $I101, $P117
    unless $I101, if_1229_end
.annotate 'line', 807
    find_lex $P118, "$nsentry"
    if $P118, if_1230
.annotate 'line', 812
    find_lex $P119, "$pirflags"
    concat $P120, $P119, " :anon"
    store_lex "$pirflags", $P120
.annotate 'line', 811
    goto if_1230_end
  if_1230:
.annotate 'line', 809
    find_lex $P119, "$pirflags"
    concat $P120, $P119, " :nsentry("
    find_lex $P121, "self"
    find_lex $P122, "$nsentry"
    $S101 = $P121."escape"($P122)
    concat $P123, $P120, $S101
    concat $P124, $P123, ")"
    store_lex "$pirflags", $P124
  if_1230_end:
  if_1229_end:
.annotate 'line', 817
    find_lex $P117, "$name"
    if $P117, unless_1231_end
.annotate 'line', 818
    find_lex $P118, "self"
    $P119 = $P118."unique"("_block")
    store_lex "$name", $P119
.annotate 'line', 819
    find_lex $P119, "$ns"
    unless $P119, unless_1233
    set $P118, $P119
    goto unless_1233_end
  unless_1233:
    find_lex $P120, "$nsentry"
    set $P118, $P120
  unless_1233_end:
    if $P118, unless_1232_end
    find_lex $P121, "$pirflags"
    concat $P122, $P121, " :anon"
    store_lex "$pirflags", $P122
  unless_1232_end:
  unless_1231_end:
.annotate 'line', 823
    get_hll_global $P117, ["POST"], "Sub"
    find_lex $P118, "$node"
    find_lex $P119, "$name"
    find_lex $P120, "$blocktype"
    find_lex $P121, "$ns"
    find_lex $P122, "$hll"
    find_lex $P123, "$subid"
    find_lex $P124, "$multi"
    find_lex $P125, "$loadlibs"
    $P126 = $P117."new"($P118 :named("node"), $P119 :named("name"), $P120 :named("blocktype"), $P121 :named("namespace"), $P122 :named("hll"), $P123 :named("subid"), $P124 :named("multi"), $P125 :named("loadlibs"))
    store_lex "$bpost", $P126
.annotate 'line', 828
    find_lex $P117, "$pirflags"
    unless $P117, if_1234_end
    find_lex $P118, "$bpost"
    find_lex $P119, "$pirflags"
    $P118."pirflags"($P119)
  if_1234_end:
.annotate 'line', 831
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$blockreg", $P118
.annotate 'line', 832
    new $P117, 'String'
    set $P117, ".const 'Sub' "
    find_lex $P118, "$blockreg"
    concat $P119, $P117, $P118
    concat $P120, $P119, " = "
    find_lex $P121, "self"
    find_lex $P122, "$bpost"
    $P123 = $P122."subid"()
    $S101 = $P121."escape"($P123)
    concat $P124, $P120, $S101
    store_lex "$blockref", $P124
.annotate 'line', 837
    find_dynamic_lex $P117, "$*SUB"
    unless_null $P117, vivify_260
    get_hll_global $P117, "$SUB"
    unless_null $P117, vivify_261
    die "Contextual $*SUB not found"
  vivify_261:
  vivify_260:
    store_lex "$outerpost", $P117
.annotate 'line', 838
    .const 'Sub' $P1236 = "38_1308507553.18311" 
    capture_lex $P1236
    $P1236()
.annotate 'line', 987
    find_dynamic_lex $P117, "@*BLOCKPAST"
    unless_null $P117, vivify_284
    get_hll_global $P117, "@BLOCKPAST"
    unless_null $P117, vivify_285
    die "Contextual @*BLOCKPAST not found"
  vivify_285:
  vivify_284:
    shift $P118, $P117
.annotate 'line', 786
    find_lex $P117, "$bpost"
    .return ($P117)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1235"  :anon :subid("38_1308507553.18311") :outer("37_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 838
    .const 'Sub' $P1308 = "46_1308507553.18311" 
    capture_lex $P1308
    .const 'Sub' $P1297 = "45_1308507553.18311" 
    capture_lex $P1297
    .const 'Sub' $P1291 = "44_1308507553.18311" 
    capture_lex $P1291
    .const 'Sub' $P1266 = "41_1308507553.18311" 
    capture_lex $P1266
    .const 'Sub' $P1257 = "40_1308507553.18311" 
    capture_lex $P1257
    .const 'Sub' $P1250 = "39_1308507553.18311" 
    capture_lex $P1250
.annotate 'line', 839
    new $P117, "Undef"
    set $P1237, $P117
    .lex "$*SUB", $P1237
.annotate 'line', 841
    new $P118, "Undef"
    set $P1238, $P118
    .lex "$islexical", $P1238
.annotate 'line', 855
    $P1240 = root_new ['parrot';'Hash']
    set $P1239, $P1240
    .lex "%outersym", $P1239
.annotate 'line', 856
    $P1242 = root_new ['parrot';'Hash']
    set $P1241, $P1242
    .lex "%symtable", $P1241
.annotate 'line', 874
    $P1244 = root_new ['parrot';'Hash']
    set $P1243, $P1244
    .lex "%outerregs", $P1243
.annotate 'line', 876
    new $P119, "Undef"
    set $P1245, $P119
    .lex "$compiler", $P1245
.annotate 'line', 957
    new $P120, "Undef"
    set $P1246, $P120
    .lex "$rtype", $P1246
.annotate 'line', 839
    find_lex $P121, "$bpost"
    store_lex "$*SUB", $P121
.annotate 'line', 841
    find_lex $P121, "$node"
    $P122 = $P121."lexical"()
    store_lex "$islexical", $P122
.annotate 'line', 842
    find_lex $P121, "$islexical"
    unless $P121, if_1247_end
.annotate 'line', 843
    find_lex $P122, "$bpost"
    find_lex $P123, "$outerpost"
    $P122."outer"($P123)
.annotate 'line', 846
    find_lex $P122, "$outerpost"
    defined $I101, $P122
    unless $I101, if_1248_end
    .const 'Sub' $P1250 = "39_1308507553.18311" 
    capture_lex $P1250
    $P1250()
  if_1248_end:
  if_1247_end:
.annotate 'line', 855
    find_lex $P121, "self"
    getattribute $P1252, $P121, "%!symtable"
    unless_null $P1252, vivify_262
    $P1252 = root_new ['parrot';'Hash']
  vivify_262:
    store_lex "%outersym", $P1252
.annotate 'line', 856
    find_lex $P121, "%outersym"
    store_lex "%symtable", $P121
.annotate 'line', 858
    find_lex $P121, "$node"
    $P122 = $P121."symtable"()
    unless $P122, if_1253_end
.annotate 'line', 861
    find_lex $P123, "$node"
    $P124 = $P123."symtable"()
    store_lex "%symtable", $P124
.annotate 'line', 862
    find_lex $P1255, "%symtable"
    unless_null $P1255, vivify_263
    $P1255 = root_new ['parrot';'Hash']
  vivify_263:
    set $P123, $P1255[""]
    unless_null $P123, vivify_264
    new $P123, "Undef"
  vivify_264:
    defined $I101, $P123
    if $I101, unless_1254_end
.annotate 'line', 864
    find_lex $P124, "%symtable"
    clone $P125, $P124
    store_lex "%symtable", $P125
.annotate 'line', 865
    find_lex $P125, "%outersym"
    defined $I102, $P125
    unless $I102, for_undef_265
    iter $P124, $P125
    new $P127, 'ExceptionHandler'
    set_label $P127, loop1262_handler
    $P127."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P127
  loop1262_test:
    unless $P124, loop1262_done
    shift $P126, $P124
  loop1262_redo:
    .const 'Sub' $P1257 = "40_1308507553.18311" 
    capture_lex $P1257
    $P1257($P126)
  loop1262_next:
    goto loop1262_test
  loop1262_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, 'type'
    eq $P129, .CONTROL_LOOP_NEXT, loop1262_next
    eq $P129, .CONTROL_LOOP_REDO, loop1262_redo
  loop1262_done:
    pop_eh 
  for_undef_265:
  unless_1254_end:
  if_1253_end:
.annotate 'line', 871
    find_lex $P121, "%symtable"
    find_lex $P122, "self"
    setattribute $P122, "%!symtable", $P121
.annotate 'line', 874
    find_dynamic_lex $P121, "%*TEMPREGS"
    unless_null $P121, vivify_269
    get_hll_global $P121, "%TEMPREGS"
    unless_null $P121, vivify_270
    die "Contextual %*TEMPREGS not found"
  vivify_270:
  vivify_269:
    store_lex "%outerregs", $P121
.annotate 'line', 876
    find_lex $P121, "$node"
    $P122 = $P121."compiler"()
    store_lex "$compiler", $P122
.annotate 'line', 877
    find_lex $P121, "$compiler"
    if $P121, if_1263
.annotate 'line', 884
    .const 'Sub' $P1266 = "41_1308507553.18311" 
    capture_lex $P1266
    $P1266()
    goto if_1263_end
  if_1263:
.annotate 'line', 880
    find_lex $P122, "$bpost"
    find_lex $P123, "$compiler"
    $P122."compiler"($P123)
.annotate 'line', 881
    find_lex $P122, "$bpost"
    find_lex $P123, "$node"
    $P124 = $P123."compiler_args"()
    $P122."compiler_args"($P124)
.annotate 'line', 882
    find_lex $P122, "$bpost"
    find_lex $P1264, "$node"
    unless_null $P1264, vivify_277
    $P1264 = root_new ['parrot';'ResizablePMCArray']
  vivify_277:
    set $P123, $P1264[0]
    unless_null $P123, vivify_278
    new $P123, "Undef"
  vivify_278:
    $P122."push"($P123)
  if_1263_end:
.annotate 'line', 944
    find_lex $P121, "$node"
    exists $I101, $P121["loadinit"]
    unless $I101, if_1289_end
    .const 'Sub' $P1291 = "44_1308507553.18311" 
    capture_lex $P1291
    $P1291()
  if_1289_end:
.annotate 'line', 954
    find_lex $P121, "%outersym"
    find_lex $P122, "self"
    setattribute $P122, "%!symtable", $P121
.annotate 'line', 957
    find_lex $P1294, "%options"
    unless_null $P1294, vivify_280
    $P1294 = root_new ['parrot';'Hash']
  vivify_280:
    set $P121, $P1294["rtype"]
    unless_null $P121, vivify_281
    new $P121, "Undef"
  vivify_281:
    store_lex "$rtype", $P121
.annotate 'line', 959
    find_lex $P122, "$blocktype"
    set $S101, $P122
    iseq $I101, $S101, "immediate"
    if $I101, if_1295
.annotate 'line', 968
    find_lex $P126, "$rtype"
    set $S102, $P126
    isne $I102, $S102, "v"
    if $I102, if_1304
    new $P125, 'Integer'
    set $P125, $I102
    goto if_1304_end
  if_1304:
.annotate 'line', 969
    get_hll_global $P127, ["POST"], "Ops"
    find_lex $P129, "$bpost"
    find_lex $P130, "$node"
    find_lex $P131, "$blockreg"
    $P132 = $P127."new"($P129, $P130 :named("node"), $P131 :named("result"))
    store_lex "$bpost", $P132
.annotate 'line', 970
    find_lex $P127, "$bpost"
    find_lex $P129, "$blockref"
    find_lex $P130, "$blockreg"
    $P127."push_pirop"($P129, $P130 :named("result"))
.annotate 'line', 971
    find_lex $P129, "$islexical"
    if $P129, if_1305
    set $P127, $P129
    goto if_1305_end
  if_1305:
.annotate 'line', 972
    find_lex $P131, "$node"
    $P132 = $P131."closure"()
    if $P132, if_1306
.annotate 'line', 980
    find_lex $P135, "$bpost"
    find_lex $P137, "$blockreg"
    $P138 = $P135."push_pirop"("capture_lex", $P137)
.annotate 'line', 979
    set $P130, $P138
.annotate 'line', 972
    goto if_1306_end
  if_1306:
    .const 'Sub' $P1308 = "46_1308507553.18311" 
    capture_lex $P1308
    $P134 = $P1308()
    set $P130, $P134
  if_1306_end:
.annotate 'line', 971
    set $P127, $P130
  if_1305_end:
.annotate 'line', 968
    set $P125, $P127
  if_1304_end:
    set $P121, $P125
.annotate 'line', 959
    goto if_1295_end
  if_1295:
    .const 'Sub' $P1297 = "45_1308507553.18311" 
    capture_lex $P1297
    $P124 = $P1297()
    set $P121, $P124
  if_1295_end:
.annotate 'line', 838
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1249"  :anon :subid("39_1308507553.18311") :outer("38_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 847
    new $P123, "Undef"
    set $P1251, $P123
    .lex "$cpost", $P1251
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$blockreg"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$cpost", $P126
.annotate 'line', 848
    find_lex $P124, "$cpost"
    find_lex $P125, "$blockref"
    $P124."push_pirop"($P125)
.annotate 'line', 849
    find_lex $P124, "$cpost"
    find_lex $P125, "$blockreg"
    $P124."push_pirop"("capture_lex", $P125)
.annotate 'line', 850
    find_lex $P124, "$outerpost"
    find_lex $P125, "$cpost"
    $P126 = $P124."unshift"($P125)
.annotate 'line', 846
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1256"  :anon :subid("40_1308507553.18311") :outer("38_1308507553.18311")
    .param pmc param_1258
.annotate 'file', ''
.annotate 'line', 865
    .lex "$_", param_1258
.annotate 'line', 866
    find_lex $P128, "$_"
    find_lex $P127, "%symtable"
    exists $I103, $P127[$P128]
    unless $I103, if_1259_end
    die 0, .CONTROL_LOOP_NEXT
  if_1259_end:
.annotate 'line', 867
    find_lex $P127, "$_"
    find_lex $P1260, "%outersym"
    unless_null $P1260, vivify_266
    $P1260 = root_new ['parrot';'Hash']
  vivify_266:
    set $P128, $P1260[$P127]
    unless_null $P128, vivify_267
    new $P128, "Undef"
  vivify_267:
    find_lex $P129, "$_"
    find_lex $P1261, "%symtable"
    unless_null $P1261, vivify_268
    $P1261 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1261
  vivify_268:
    set $P1261[$P129], $P128
.annotate 'line', 865
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1265"  :anon :subid("41_1308507553.18311") :outer("38_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 884
    .const 'Sub' $P1286 = "43_1308507553.18311" 
    capture_lex $P1286
    .const 'Sub' $P1278 = "42_1308507553.18311" 
    capture_lex $P1278
.annotate 'line', 887
    $P1268 = root_new ['parrot';'Hash']
    set $P1267, $P1268
    .lex "%*TEMPREGS", $P1267
.annotate 'line', 896
    new $P122, "Undef"
    set $P1269, $P122
    .lex "$ctrlpast", $P1269
.annotate 'line', 897
    new $P123, "Undef"
    set $P1270, $P123
    .lex "$ctrllabel", $P1270
.annotate 'line', 910
    new $P124, "Undef"
    set $P1271, $P124
    .lex "$sig", $P1271
.annotate 'line', 912
    new $P125, "Undef"
    set $P1272, $P125
    .lex "$ops", $P1272
.annotate 'line', 914
    new $P126, "Undef"
    set $P1273, $P126
    .lex "$retval", $P1273
.annotate 'line', 916
    new $P127, "Undef"
    set $P1274, $P127
    .lex "$eh", $P1274
.annotate 'line', 884
    find_lex $P128, "%*TEMPREGS"
    unless_null $P128, vivify_271
    get_hll_global $P128, "%TEMPREGS"
    unless_null $P128, vivify_272
    die "Contextual %*TEMPREGS not found"
  vivify_272:
  vivify_271:
.annotate 'line', 888
    find_lex $P128, "$node"
    $P129 = $P128."tempregs"()
    if $P129, if_1275
.annotate 'line', 892
    find_lex $P130, "%outerregs"
    store_lex "%*TEMPREGS", $P130
.annotate 'line', 891
    goto if_1275_end
  if_1275:
.annotate 'line', 889
    find_lex $P130, "self"
    $P131 = $P130."tempreg_frame"()
    store_lex "%*TEMPREGS", $P131
  if_1275_end:
.annotate 'line', 896
    find_lex $P128, "$node"
    $P129 = $P128."control"()
    store_lex "$ctrlpast", $P129
.annotate 'line', 884
    find_lex $P128, "$ctrllabel"
.annotate 'line', 899
    find_lex $P128, "$ctrlpast"
    unless $P128, if_1276_end
    .const 'Sub' $P1278 = "42_1308507553.18311" 
    capture_lex $P1278
    $P1278()
  if_1276_end:
.annotate 'line', 910
    find_lex $P128, "$node"
    $P129 = $P128."list"()
    elements $I101, $P129
    repeat $S101, "v", $I101
    new $P130, 'String'
    set $P130, $S101
    concat $P131, $P130, "*"
    store_lex "$sig", $P131
.annotate 'line', 912
    find_lex $P128, "self"
    find_lex $P129, "$node"
    find_lex $P130, "$sig"
    $P131 = $P128."post_children"($P129, $P130 :named("signature"))
    store_lex "$ops", $P131
.annotate 'line', 914
    find_lex $P1280, "$ops"
    unless_null $P1280, vivify_273
    $P1280 = root_new ['parrot';'ResizablePMCArray']
  vivify_273:
    set $P128, $P1280[-1]
    unless_null $P128, vivify_274
    new $P128, "Undef"
  vivify_274:
    store_lex "$retval", $P128
.annotate 'line', 916
    find_lex $P128, "$node"
    $P129 = $P128."handlers"()
    store_lex "$eh", $P129
.annotate 'line', 917
    find_lex $P128, "$eh"
    unless $P128, if_1281_end
.annotate 'line', 918
    find_lex $P129, "self"
    find_lex $P130, "$ops"
    find_lex $P131, "$eh"
    find_lex $P1282, "%options"
    unless_null $P1282, vivify_275
    $P1282 = root_new ['parrot';'Hash']
  vivify_275:
    set $P132, $P1282["rtype"]
    unless_null $P132, vivify_276
    new $P132, "Undef"
  vivify_276:
    $P133 = $P129."wrap_handlers"($P130, $P131, $P132 :named("rtype"))
    store_lex "$ops", $P133
  if_1281_end:
.annotate 'line', 920
    find_lex $P128, "$bpost"
    find_lex $P129, "$ops"
    $P128."push"($P129)
.annotate 'line', 921
    find_lex $P128, "$bpost"
    find_lex $P129, "$retval"
    $P128."push_pirop"("return", $P129)
.annotate 'line', 923
    find_lex $P129, "$ctrlpast"
    if $P129, if_1283
    set $P128, $P129
    goto if_1283_end
  if_1283:
.annotate 'line', 924
    find_lex $P130, "$bpost"
    find_lex $P131, "$ctrllabel"
    $P130."push"($P131)
.annotate 'line', 925
    find_lex $P130, "$bpost"
    $P130."push_pirop"(".local pmc exception")
.annotate 'line', 926
    find_lex $P130, "$bpost"
    $P130."push_pirop"(".get_results (exception)")
.annotate 'line', 927
    find_lex $P131, "$ctrlpast"
    set $S101, $P131
    iseq $I101, $S101, "return_pir"
    if $I101, if_1284
.annotate 'line', 934
    find_lex $P136, "$ctrlpast"
    get_hll_global $P137, ["PAST"], "Node"
    $P138 = $P136."isa"($P137)
    if $P138, if_1288
.annotate 'line', 938
    find_lex $P139, "self"
    new $P140, 'String'
    set $P140, "Unrecognized control handler '"
    find_lex $P141, "$ctrlpast"
    concat $P142, $P140, $P141
    concat $P144, $P142, "'"
    $P145 = $P139."panic"($P144)
.annotate 'line', 937
    set $P134, $P145
.annotate 'line', 934
    goto if_1288_end
  if_1288:
.annotate 'line', 935
    find_lex $P139, "$bpost"
    find_lex $P140, "self"
    find_lex $P141, "$ctrlpast"
    $P142 = $P140."as_post"($P141, "*" :named("rtype"))
    $P143 = $P139."push"($P142)
.annotate 'line', 934
    set $P134, $P143
  if_1288_end:
    set $P130, $P134
.annotate 'line', 927
    goto if_1284_end
  if_1284:
    .const 'Sub' $P1286 = "43_1308507553.18311" 
    capture_lex $P1286
    $P133 = $P1286()
    set $P130, $P133
  if_1284_end:
.annotate 'line', 923
    set $P128, $P130
  if_1283_end:
.annotate 'line', 884
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1277"  :anon :subid("42_1308507553.18311") :outer("41_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 901
    new $P129, "Undef"
    set $P1279, $P129
    .lex "$reg", $P1279
.annotate 'line', 900
    get_hll_global $P130, ["POST"], "Label"
    find_lex $P131, "self"
    $P132 = $P131."unique"("control_")
    $P133 = $P130."new"($P132 :named("result"))
    store_lex "$ctrllabel", $P133
.annotate 'line', 901
    find_lex $P130, "self"
    $P131 = $P130."uniquereg"("P")
    store_lex "$reg", $P131
.annotate 'line', 902
    find_lex $P130, "$bpost"
    find_lex $P131, "$reg"
    $P130."push_pirop"("new", $P131, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 904
    find_lex $P130, "$bpost"
    find_lex $P131, "$reg"
    find_lex $P132, "$ctrllabel"
    $P130."push_pirop"("set_label", $P131, $P132)
.annotate 'line', 905
    find_lex $P130, "$bpost"
    find_lex $P131, "$reg"
    $P130."push_pirop"("push_eh", $P131)
.annotate 'line', 906
    find_lex $P130, "$bpost"
    $P131 = $P130."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 899
    .return ($P131)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1285"  :anon :subid("43_1308507553.18311") :outer("41_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 929
    new $P132, "Undef"
    set $P1287, $P132
    .lex "$reg", $P1287
    find_lex $P133, "self"
    $P134 = $P133."tempreg"("P")
    store_lex "$reg", $P134
.annotate 'line', 930
    find_lex $P133, "$bpost"
    find_lex $P134, "$reg"
    $P133."push_pirop"("getattribute", $P134, "exception", "\"payload\"")
.annotate 'line', 932
    find_lex $P133, "$bpost"
    find_lex $P134, "$reg"
    $P135 = $P133."push_pirop"("return", $P134)
.annotate 'line', 927
    .return ($P135)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1290"  :anon :subid("44_1308507553.18311") :outer("38_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 945
    new $P122, "Undef"
    set $P1292, $P122
    .lex "$lisub", $P1292
    get_hll_global $P123, ["POST"], "Sub"
    find_lex $P124, "$bpost"
    $P125 = $P123."new"($P124 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P125
.annotate 'line', 946
    find_lex $P123, "$lisub"
    find_lex $P124, "$blockref"
    $P123."push_pirop"($P124)
.annotate 'line', 947
    find_lex $P123, "$lisub"
    $P123."push_pirop"(".local pmc", "block")
.annotate 'line', 948
    find_lex $P123, "$lisub"
    find_lex $P124, "$blockreg"
    $P123."push_pirop"("set", "block", $P124)
.annotate 'line', 949
    find_lex $P123, "$lisub"
    find_lex $P124, "self"
    find_lex $P125, "$node"
    $P126 = $P125."loadinit"()
    $P127 = $P124."as_post"($P126, "v" :named("rtype"))
    $P123."push"($P127)
.annotate 'line', 950
    find_lex $P123, "$lisub"
    find_lex $P1293, "$bpost"
    unless_null $P1293, vivify_279
    $P1293 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1293
  vivify_279:
    set $P1293["loadinit"], $P123
.annotate 'line', 944
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1307"  :anon :subid("46_1308507553.18311") :outer("38_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 975
    new $P133, "Undef"
    set $P1309, $P133
    .lex "$result", $P1309
    find_lex $P134, "self"
    $P135 = $P134."uniquereg"("P")
    store_lex "$result", $P135
.annotate 'line', 976
    find_lex $P134, "$bpost"
    find_lex $P135, "$result"
    find_lex $P136, "$blockreg"
    $P134."push_pirop"("newclosure", $P135, $P136)
.annotate 'line', 977
    find_lex $P134, "$bpost"
    find_lex $P135, "$result"
    $P136 = $P134."result"($P135)
.annotate 'line', 972
    .return ($P136)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1296"  :anon :subid("45_1308507553.18311") :outer("38_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 960
    $P1299 = root_new ['parrot';'ResizablePMCArray']
    set $P1298, $P1299
    .lex "@arglist", $P1298
.annotate 'line', 962
    new $P123, "Undef"
    set $P1300, $P123
    .lex "$result", $P1300
.annotate 'line', 960
    find_lex $P1301, "%options"
    unless_null $P1301, vivify_282
    $P1301 = root_new ['parrot';'Hash']
  vivify_282:
    set $P124, $P1301["arglist"]
    unless_null $P124, vivify_283
    new $P124, "Undef"
  vivify_283:
    store_lex "@arglist", $P124
.annotate 'line', 961
    find_lex $P124, "@arglist"
    defined $I102, $P124
    if $I102, unless_1302_end
    new $P125, "ResizablePMCArray"
    store_lex "@arglist", $P125
  unless_1302_end:
.annotate 'line', 962
    find_lex $P124, "self"
    find_lex $P125, "$rtype"
    $P126 = $P124."tempreg"($P125)
    store_lex "$result", $P126
.annotate 'line', 963
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$bpost"
    find_lex $P126, "$node"
    find_lex $P127, "$result"
    $P128 = $P124."new"($P125, $P126 :named("node"), $P127 :named("result"))
    store_lex "$bpost", $P128
.annotate 'line', 964
    find_lex $P124, "$bpost"
    find_lex $P125, "$blockref"
    $P124."push_pirop"($P125)
.annotate 'line', 965
    find_lex $P124, "$islexical"
    unless $P124, if_1303_end
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("capture_lex", $P126)
  if_1303_end:
.annotate 'line', 966
    find_lex $P124, "$bpost"
    find_lex $P125, "$blockreg"
    find_lex $P126, "@arglist"
    find_lex $P127, "$result"
    $P128 = $P124."push_pirop"("call", $P125, $P126 :flat, $P127 :named("result"))
.annotate 'line', 959
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("47_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1313
    .param pmc param_1314 :slurpy :named
.annotate 'file', ''
.annotate 'line', 999
    new $P1312, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1312, control_1311
    push_eh $P1312
    .lex "self", self
    .lex "$node", param_1313
    .lex "%options", param_1314
.annotate 'line', 1001
    new $P104, "Undef"
    set $P1315, $P104
    .lex "$lvalue", $P1315
.annotate 'line', 1002
    new $P105, "Undef"
    set $P1316, $P105
    .lex "$child", $P1316
.annotate 'line', 1007
    new $P106, "Undef"
    set $P1317, $P106
    .lex "$pasttype", $P1317
.annotate 'line', 1012
    new $P107, "Undef"
    set $P1318, $P107
    .lex "$pirop", $P1318
.annotate 'line', 1017
    new $P108, "Undef"
    set $P1319, $P108
    .lex "$inline", $P1319
.annotate 'line', 1001
    find_lex $P109, "$node"
    $P110 = $P109."lvalue"()
    store_lex "$lvalue", $P110
.annotate 'line', 1002
    find_lex $P1320, "$node"
    unless_null $P1320, vivify_286
    $P1320 = root_new ['parrot';'ResizablePMCArray']
  vivify_286:
    set $P109, $P1320[0]
    unless_null $P109, vivify_287
    new $P109, "Undef"
  vivify_287:
    store_lex "$child", $P109
.annotate 'line', 1003
    find_lex $P111, "$lvalue"
    if $P111, if_1323
    set $P110, $P111
    goto if_1323_end
  if_1323:
    find_lex $P112, "$child"
    defined $I101, $P112
    new $P110, 'Integer'
    set $P110, $I101
  if_1323_end:
    if $P110, if_1322
    set $P109, $P110
    goto if_1322_end
  if_1322:
    find_lex $P113, "$child"
    exists $I102, $P113["lvalue"]
    new $P114, 'Integer'
    set $P114, $I102
    isfalse $I103, $P114
    new $P109, 'Integer'
    set $P109, $I103
  if_1322_end:
    unless $P109, if_1321_end
.annotate 'line', 1004
    find_lex $P115, "$child"
    find_lex $P116, "$lvalue"
    $P115."lvalue"($P116)
  if_1321_end:
.annotate 'line', 1007
    find_lex $P109, "$node"
    $P110 = $P109."pasttype"()
    store_lex "$pasttype", $P110
.annotate 'line', 1008
    find_lex $P109, "$pasttype"
    unless $P109, if_1324_end
.annotate 'line', 1009
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "%options"
    find_lex $P114, "$pasttype"
    set $S101, $P114
    $P115 = $P111.$S101($P112, $P113 :flat)
    setattribute $P110, 'payload', $P115
    throw $P110
  if_1324_end:
.annotate 'line', 1012
    find_lex $P109, "$node"
    $P110 = $P109."pirop"()
    store_lex "$pirop", $P110
.annotate 'line', 1013
    find_lex $P109, "$pirop"
    unless $P109, if_1325_end
.annotate 'line', 1014
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "%options"
    $P114 = $P111."pirop"($P112, $P113 :flat)
    setattribute $P110, 'payload', $P114
    throw $P110
  if_1325_end:
.annotate 'line', 1017
    find_lex $P109, "$node"
    $P110 = $P109."inline"()
    store_lex "$inline", $P110
.annotate 'line', 1018
    find_lex $P109, "$inline"
    unless $P109, if_1326_end
.annotate 'line', 1019
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "%options"
    $P114 = $P111."inline"($P112, $P113 :flat)
    setattribute $P110, 'payload', $P114
    throw $P110
  if_1326_end:
.annotate 'line', 1022
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "%options"
    $P112 = $P109."call"($P110, $P111 :flat)
.annotate 'line', 999
    .return ($P112)
  control_1311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("48_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1330
    .param pmc param_1331 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1030
    new $P1329, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1329, control_1328
    push_eh $P1329
    .lex "self", self
    .lex "$node", param_1330
    .lex "%options", param_1331
.annotate 'line', 1031
    new $P104, "Undef"
    set $P1332, $P104
    .lex "$pirop", $P1332
.annotate 'line', 1032
    new $P105, "Undef"
    set $P1333, $P105
    .lex "$signature", $P1333
.annotate 'line', 1033
    new $P106, "Undef"
    set $P1334, $P106
    .lex "$I0", $P1334
.annotate 'line', 1049
    new $P107, "Undef"
    set $P1335, $P107
    .lex "$ops", $P1335
.annotate 'line', 1050
    $P1337 = root_new ['parrot';'ResizablePMCArray']
    set $P1336, $P1337
    .lex "@posargs", $P1336
.annotate 'line', 1060
    $P1339 = root_new ['parrot';'ResizablePMCArray']
    set $P1338, $P1339
    .lex "@arglist", $P1338
.annotate 'line', 1062
    new $P108, "Undef"
    set $P1340, $P108
    .lex "$S0", $P1340
.annotate 'line', 1073
    new $P109, "Undef"
    set $P1341, $P109
    .lex "$result", $P1341
.annotate 'line', 1031
    find_lex $P110, "$node"
    $P111 = $P110."pirop"()
    store_lex "$pirop", $P111
.annotate 'line', 1030
    find_lex $P110, "$signature"
    find_lex $P110, "$I0"
.annotate 'line', 1034
    find_lex $P110, "$pirop"
    set $S101, $P110
    index $I101, $S101, " "
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$I0", $P111
    set $N101, $P111
    isge $I102, $N101, 0.0
    if $I102, if_1342
.annotate 'line', 1039
    find_lex $P112, "$pirop"
    set $S102, $P112
    index $I103, $S102, "__"
    new $P113, 'Integer'
    set $P113, $I103
    store_lex "$I0", $P113
    set $N102, $P113
    isge $I104, $N102, 0.0
    if $I104, if_1343
.annotate 'line', 1045
    find_lex $P114, "$pirop"
    get_global $P1344, "%piropsig"
    unless_null $P1344, vivify_288
    $P1344 = root_new ['parrot';'Hash']
  vivify_288:
    set $P115, $P1344[$P114]
    unless_null $P115, vivify_289
    new $P115, "Undef"
  vivify_289:
    store_lex "$signature", $P115
.annotate 'line', 1046
    find_lex $P114, "$signature"
    if $P114, unless_1345_end
    new $P115, "String"
    assign $P115, "vP"
    store_lex "$signature", $P115
  unless_1345_end:
.annotate 'line', 1044
    goto if_1343_end
  if_1343:
.annotate 'line', 1041
    find_lex $P114, "$pirop"
    set $S103, $P114
    find_lex $P115, "$I0"
    add $P116, $P115, 2
    set $I105, $P116
    substr $S104, $S103, $I105
    new $P117, 'String'
    set $P117, $S104
    store_lex "$signature", $P117
.annotate 'line', 1042
    find_lex $P114, "$pirop"
    set $S103, $P114
    find_lex $P115, "$I0"
    set $I105, $P115
    substr $S104, $S103, 0, $I105
    new $P116, 'String'
    set $P116, $S104
    store_lex "$pirop", $P116
  if_1343_end:
.annotate 'line', 1039
    goto if_1342_end
  if_1342:
.annotate 'line', 1036
    find_lex $P112, "$pirop"
    set $S102, $P112
    find_lex $P113, "$I0"
    add $P114, $P113, 1
    set $I103, $P114
    substr $S103, $S102, $I103
    new $P115, 'String'
    set $P115, $S103
    store_lex "$signature", $P115
.annotate 'line', 1037
    find_lex $P112, "$pirop"
    set $S102, $P112
    find_lex $P113, "$I0"
    set $I103, $P113
    substr $S103, $S102, 0, $I103
    new $P114, 'String'
    set $P114, $S103
    store_lex "$pirop", $P114
  if_1342_end:
.annotate 'line', 1030
    find_lex $P110, "$ops"
    find_lex $P110, "@posargs"
.annotate 'line', 1052

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1060
    find_lex $P110, "$ops"
    $P111 = $P110."list"()
    store_lex "@arglist", $P111
.annotate 'line', 1062
    find_lex $P110, "$signature"
    set $S101, $P110
    substr $S102, $S101, 0, 1
    new $P111, 'String'
    set $P111, $S102
    store_lex "$S0", $P111
.annotate 'line', 1063
    find_lex $P110, "$S0"
    set $S101, $P110
    iseq $I101, $S101, "v"
    unless $I101, if_1346_end
.annotate 'line', 1064
    find_lex $P111, "$ops"
    find_lex $P112, "$pirop"
    find_lex $P113, "@posargs"
    $P111."push_pirop"($P112, $P113 :flat)
.annotate 'line', 1065
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
  if_1346_end:
.annotate 'line', 1067
    find_lex $P110, "$S0"
    set $S101, $P110
    index $I101, "0123456789", $S101
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$I0", $P111
.annotate 'line', 1068
    find_lex $P110, "$I0"
    set $N101, $P110
    isge $I101, $N101, 0.0
    unless $I101, if_1347_end
.annotate 'line', 1069
    find_lex $P111, "$ops"
    find_lex $P112, "$I0"
    set $I102, $P112
    find_lex $P1348, "@arglist"
    unless_null $P1348, vivify_290
    $P1348 = root_new ['parrot';'ResizablePMCArray']
  vivify_290:
    set $P113, $P1348[$I102]
    unless_null $P113, vivify_291
    new $P113, "Undef"
  vivify_291:
    $P111."result"($P113)
.annotate 'line', 1070
    find_lex $P111, "$ops"
    find_lex $P112, "$pirop"
    find_lex $P113, "@posargs"
    $P111."push_pirop"($P112, $P113 :flat)
.annotate 'line', 1071
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
  if_1347_end:
.annotate 'line', 1073
    find_lex $P110, "self"
    find_lex $P111, "$S0"
    $P112 = $P110."tempreg"($P111)
    store_lex "$result", $P112
.annotate 'line', 1074
    find_lex $P110, "$ops"
    find_lex $P111, "$result"
    $P110."result"($P111)
.annotate 'line', 1075
    find_lex $P110, "$ops"
    find_lex $P111, "$pirop"
    find_lex $P112, "$result"
    find_lex $P113, "@posargs"
    $P110."push_pirop"($P111, $P112, $P113 :flat)
.annotate 'line', 1076
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "$ops"
    setattribute $P110, 'payload', $P111
    throw $P110
.annotate 'line', 1030
    .return ()
  control_1328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("49_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1352
    .param pmc param_1353 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1084
    .const 'Sub' $P1371 = "50_1308507553.18311" 
    capture_lex $P1371
    new $P1351, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1351, control_1350
    push_eh $P1351
    .lex "self", self
    .lex "$node", param_1352
    .lex "%options", param_1353
.annotate 'line', 1085
    new $P104, "Undef"
    set $P1354, $P104
    .lex "$pasttype", $P1354
.annotate 'line', 1088
    new $P105, "Undef"
    set $P1355, $P105
    .lex "$signature", $P1355
.annotate 'line', 1092
    new $P106, "Undef"
    set $P1356, $P106
    .lex "$name", $P1356
.annotate 'line', 1093
    new $P107, "Undef"
    set $P1357, $P107
    .lex "$ops", $P1357
.annotate 'line', 1094
    $P1359 = root_new ['parrot';'ResizablePMCArray']
    set $P1358, $P1359
    .lex "@posargs", $P1358
.annotate 'line', 1095
    $P1361 = root_new ['parrot';'Hash']
    set $P1360, $P1361
    .lex "%namedargs", $P1360
.annotate 'line', 1120
    new $P108, "Undef"
    set $P1362, $P108
    .lex "$rtype", $P1362
.annotate 'line', 1121
    new $P109, "Undef"
    set $P1363, $P109
    .lex "$result", $P1363
.annotate 'line', 1085
    find_lex $P110, "$node"
    $P111 = $P110."pasttype"()
    store_lex "$pasttype", $P111
.annotate 'line', 1086
    find_lex $P110, "$pasttype"
    if $P110, unless_1364_end
    new $P111, "String"
    assign $P111, "call"
    store_lex "$pasttype", $P111
  unless_1364_end:
.annotate 'line', 1088
    new $P110, "String"
    assign $P110, "v:"
    store_lex "$signature", $P110
.annotate 'line', 1090
    find_lex $P110, "$pasttype"
    set $S101, $P110
    iseq $I101, $S101, "callmethod"
    unless $I101, if_1365_end
    new $P111, "String"
    assign $P111, "vP:"
    store_lex "$signature", $P111
  if_1365_end:
.annotate 'line', 1092
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1084
    find_lex $P110, "$ops"
    find_lex $P110, "@posargs"
    find_lex $P110, "%namedargs"
.annotate 'line', 1097
    find_lex $P110, "$name"
    if $P110, unless_1366_end
    find_lex $P111, "$signature"
    set $S101, $P111
    replace $S102, $S101, 1, 0, "P"
    new $P112, 'String'
    set $P112, $S102
    store_lex "$signature", $P112
  unless_1366_end:
.annotate 'line', 1099

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1107
    find_lex $P110, "$name"
    unless $P110, if_1367_end
.annotate 'line', 1108
    find_lex $P112, "$name"
    isa $I101, $P112, "P6object"
    if $I101, if_1369
    new $P111, 'Integer'
    set $P111, $I101
    goto if_1369_end
  if_1369:
    find_lex $P113, "$name"
    get_hll_global $P114, ["PAST"], "Node"
    $P115 = $P113."isa"($P114)
    set $P111, $P115
  if_1369_end:
    if $P111, if_1368
.annotate 'line', 1115
    find_lex $P118, "@posargs"
    find_lex $P119, "self"
    find_lex $P120, "$name"
    $P121 = $P119."escape"($P120)
    unshift $P118, $P121
.annotate 'line', 1114
    goto if_1368_end
  if_1368:
.annotate 'line', 1108
    .const 'Sub' $P1371 = "50_1308507553.18311" 
    capture_lex $P1371
    $P1371()
  if_1368_end:
  if_1367_end:
.annotate 'line', 1120
    find_lex $P1373, "%options"
    unless_null $P1373, vivify_292
    $P1373 = root_new ['parrot';'Hash']
  vivify_292:
    set $P110, $P1373["rtype"]
    unless_null $P110, vivify_293
    new $P110, "Undef"
  vivify_293:
    store_lex "$rtype", $P110
.annotate 'line', 1121
    find_lex $P110, "self"
    find_lex $P111, "$rtype"
    $P112 = $P110."tempreg"($P111)
    store_lex "$result", $P112
.annotate 'line', 1122
    find_lex $P110, "$ops"
    find_lex $P111, "$pasttype"
    find_lex $P112, "@posargs"
    find_lex $P113, "%namedargs"
    find_lex $P114, "$result"
    $P110."push_pirop"($P111, $P112 :flat, $P113 :flat, $P114 :named("result"))
.annotate 'line', 1123
    find_lex $P110, "$ops"
    find_lex $P111, "$result"
    $P110."result"($P111)
.annotate 'line', 1084
    find_lex $P110, "$ops"
    .return ($P110)
  control_1350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1370"  :anon :subid("50_1308507553.18311") :outer("49_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1109
    new $P116, "Undef"
    set $P1372, $P116
    .lex "$name_post", $P1372
    find_lex $P117, "self"
    find_lex $P118, "$name"
    $P119 = $P117."as_post"($P118, "s" :named("rtype"))
    store_lex "$name_post", $P119
.annotate 'line', 1110
    find_lex $P117, "self"
    find_lex $P118, "$name_post"
    $P119 = $P117."coerce"($P118, "s")
    store_lex "$name_post", $P119
.annotate 'line', 1111
    find_lex $P117, "$ops"
    find_lex $P118, "$name_post"
    $P117."push"($P118)
.annotate 'line', 1112
    find_lex $P117, "@posargs"
    find_lex $P118, "$name_post"
    unshift $P117, $P118
.annotate 'line', 1108
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("51_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1377
    .param pmc param_1378 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1132
    new $P1376, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1376, control_1375
    push_eh $P1376
    .lex "self", self
    .lex "$node", param_1377
    .lex "%options", param_1378
.annotate 'line', 1133
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."call"($P105, $P106 :flat)
.annotate 'line', 1132
    .return ($P107)
  control_1375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("52_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1382
    .param pmc param_1383 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1142
    .const 'Sub' $P1424 = "55_1308507553.18311" 
    capture_lex $P1424
    .const 'Sub' $P1400 = "53_1308507553.18311" 
    capture_lex $P1400
    new $P1381, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1381, control_1380
    push_eh $P1381
    .lex "self", self
    .lex "$node", param_1382
    .lex "%options", param_1383
.annotate 'line', 1143
    new $P104, "Undef"
    set $P1384, $P104
    .lex "$ops", $P1384
.annotate 'line', 1145
    new $P105, "Undef"
    set $P1385, $P105
    .lex "$rtype", $P1385
.annotate 'line', 1146
    new $P106, "Undef"
    set $P1386, $P106
    .lex "$result", $P1386
.annotate 'line', 1149
    new $P107, "Undef"
    set $P1387, $P107
    .lex "$pasttype", $P1387
.annotate 'line', 1151
    new $P108, "Undef"
    set $P1388, $P108
    .lex "$exprpast", $P1388
.annotate 'line', 1152
    new $P109, "Undef"
    set $P1389, $P109
    .lex "$thenpast", $P1389
.annotate 'line', 1153
    new $P110, "Undef"
    set $P1390, $P110
    .lex "$elsepast", $P1390
.annotate 'line', 1155
    new $P111, "Undef"
    set $P1391, $P111
    .lex "$S0", $P1391
.annotate 'line', 1156
    new $P112, "Undef"
    set $P1392, $P112
    .lex "$thenlabel", $P1392
.annotate 'line', 1157
    new $P113, "Undef"
    set $P1393, $P113
    .lex "$endlabel", $P1393
.annotate 'line', 1159
    new $P114, "Undef"
    set $P1394, $P114
    .lex "$exprrtype", $P1394
.annotate 'line', 1161
    new $P115, "Undef"
    set $P1395, $P115
    .lex "$childrtype", $P1395
.annotate 'line', 1164
    new $P116, "Undef"
    set $P1396, $P116
    .lex "$exprpost", $P1396
.annotate 'line', 1166
    new $P117, "Undef"
    set $P1397, $P117
    .lex "$thenpost", $P1397
.annotate 'line', 1167
    new $P118, "Undef"
    set $P1398, $P118
    .lex "$elsepost", $P1398
.annotate 'line', 1189
    .const 'Sub' $P1400 = "53_1308507553.18311" 
    newclosure $P1413, $P1400
    set $P1399, $P1413
    .lex "make_childpost", $P1399
.annotate 'line', 1143
    get_hll_global $P123, ["POST"], "Ops"
    find_lex $P124, "$node"
    $P125 = $P123."new"($P124 :named("node"))
    store_lex "$ops", $P125
.annotate 'line', 1145
    find_lex $P1414, "%options"
    unless_null $P1414, vivify_295
    $P1414 = root_new ['parrot';'Hash']
  vivify_295:
    set $P123, $P1414["rtype"]
    unless_null $P123, vivify_296
    new $P123, "Undef"
  vivify_296:
    store_lex "$rtype", $P123
.annotate 'line', 1146
    find_lex $P123, "self"
    find_lex $P124, "$rtype"
    $P125 = $P123."tempreg"($P124)
    store_lex "$result", $P125
.annotate 'line', 1147
    find_lex $P123, "$ops"
    find_lex $P124, "$result"
    $P123."result"($P124)
.annotate 'line', 1149
    find_lex $P123, "$node"
    $P124 = $P123."pasttype"()
    store_lex "$pasttype", $P124
.annotate 'line', 1151
    find_lex $P1415, "$node"
    unless_null $P1415, vivify_297
    $P1415 = root_new ['parrot';'ResizablePMCArray']
  vivify_297:
    set $P123, $P1415[0]
    unless_null $P123, vivify_298
    new $P123, "Undef"
  vivify_298:
    store_lex "$exprpast", $P123
.annotate 'line', 1152
    find_lex $P1416, "$node"
    unless_null $P1416, vivify_299
    $P1416 = root_new ['parrot';'ResizablePMCArray']
  vivify_299:
    set $P123, $P1416[1]
    unless_null $P123, vivify_300
    new $P123, "Undef"
  vivify_300:
    store_lex "$thenpast", $P123
.annotate 'line', 1153
    find_lex $P1417, "$node"
    unless_null $P1417, vivify_301
    $P1417 = root_new ['parrot';'ResizablePMCArray']
  vivify_301:
    set $P123, $P1417[2]
    unless_null $P123, vivify_302
    new $P123, "Undef"
  vivify_302:
    store_lex "$elsepast", $P123
.annotate 'line', 1155
    find_lex $P123, "self"
    find_lex $P124, "$pasttype"
    concat $P125, $P124, "_"
    $P126 = $P123."unique"($P125)
    store_lex "$S0", $P126
.annotate 'line', 1156
    get_hll_global $P123, ["POST"], "Label"
    find_lex $P124, "$S0"
    $P125 = $P123."new"($P124 :named("result"))
    store_lex "$thenlabel", $P125
.annotate 'line', 1157
    get_hll_global $P123, ["POST"], "Label"
    find_lex $P124, "$S0"
    concat $P125, $P124, "_end"
    $P126 = $P123."new"($P125 :named("result"))
    store_lex "$endlabel", $P126
.annotate 'line', 1159
    new $P123, "String"
    assign $P123, "r"
    store_lex "$exprrtype", $P123
.annotate 'line', 1160
    find_lex $P123, "$rtype"
    set $S101, $P123
    iseq $I101, $S101, "v"
    unless $I101, if_1418_end
    new $P124, "String"
    assign $P124, "*"
    store_lex "$exprrtype", $P124
  if_1418_end:
.annotate 'line', 1161
    find_lex $P123, "$rtype"
    store_lex "$childrtype", $P123
.annotate 'line', 1162
    find_lex $P123, "$rtype"
    set $S101, $P123
    index $I101, "*:", $S101
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1419_end
    new $P124, "String"
    assign $P124, "P"
    store_lex "$childrtype", $P124
  if_1419_end:
.annotate 'line', 1164
    find_lex $P123, "self"
    find_lex $P124, "$exprpast"
    find_lex $P125, "$exprrtype"
    $P126 = $P123."as_post"($P124, $P125 :named("rtype"))
    store_lex "$exprpost", $P126
.annotate 'line', 1166
    find_lex $P123, "$thenpast"
    $P124 = "make_childpost"($P123)
    store_lex "$thenpost", $P124
.annotate 'line', 1167
    find_lex $P123, "$elsepast"
    $P124 = "make_childpost"($P123)
    store_lex "$elsepost", $P124
.annotate 'line', 1169
    find_lex $P123, "$elsepost"
    defined $I101, $P123
    if $I101, if_1420
.annotate 'line', 1179
    .const 'Sub' $P1424 = "55_1308507553.18311" 
    capture_lex $P1424
    $P1424()
    goto if_1420_end
  if_1420:
.annotate 'line', 1170
    find_lex $P124, "$ops"
    find_lex $P125, "$exprpost"
    $P124."push"($P125)
.annotate 'line', 1171
    find_lex $P124, "$ops"
    find_lex $P125, "$pasttype"
    find_lex $P126, "$exprpost"
    find_lex $P127, "$thenlabel"
    $P124."push_pirop"($P125, $P126, $P127)
.annotate 'line', 1172
    find_lex $P124, "$elsepost"
    defined $I102, $P124
    unless $I102, if_1421_end
    find_lex $P125, "$ops"
    find_lex $P126, "$elsepost"
    $P125."push"($P126)
  if_1421_end:
.annotate 'line', 1173
    find_lex $P124, "$ops"
    find_lex $P125, "$endlabel"
    $P124."push_pirop"("goto", $P125)
.annotate 'line', 1174
    find_lex $P124, "$ops"
    find_lex $P125, "$thenlabel"
    $P124."push"($P125)
.annotate 'line', 1175
    find_lex $P124, "$thenpost"
    defined $I102, $P124
    unless $I102, if_1422_end
    find_lex $P125, "$ops"
    find_lex $P126, "$thenpost"
    $P125."push"($P126)
  if_1422_end:
.annotate 'line', 1176
    find_lex $P124, "$ops"
    find_lex $P125, "$endlabel"
    $P124."push"($P125)
.annotate 'line', 1177
    new $P124, "Exception"
    set $P124['type'], .CONTROL_RETURN
    find_lex $P125, "$ops"
    setattribute $P124, 'payload', $P125
    throw $P124
  if_1420_end:
.annotate 'line', 1142
    find_lex $P123, "make_childpost"
    .return ($P123)
  control_1380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("53_1308507553.18311") :outer("52_1308507553.18311")
    .param pmc param_1403 :optional
    .param int has_param_1403 :opt_flag
.annotate 'file', ''
.annotate 'line', 1189
    .const 'Sub' $P1407 = "54_1308507553.18311" 
    capture_lex $P1407
    new $P1402, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1402, control_1401
    push_eh $P1402
    if has_param_1403, optparam_294
    new $P119, "Undef"
    set param_1403, $P119
  optparam_294:
    .lex "$childpast", param_1403
.annotate 'line', 1190
    new $P120, "Undef"
    set $P1404, $P120
    .lex "$childpost", $P1404
.annotate 'line', 1189
    find_lex $P121, "$childpost"
.annotate 'line', 1191
    find_lex $P121, "$childpast"
    defined $I101, $P121
    if $I101, if_1405
.annotate 'line', 1198
    find_lex $P122, "$rtype"
    set $S101, $P122
    iseq $I102, $S101, "v"
    unless $I102, if_1411_end
    new $P123, "Exception"
    set $P123['type'], .CONTROL_RETURN
    find_lex $P124, "$childpost"
    setattribute $P123, 'payload', $P124
    throw $P123
  if_1411_end:
.annotate 'line', 1199
    get_hll_global $P122, ["POST"], "Ops"
    find_lex $P123, "$exprpost"
    $P124 = $P122."new"($P123 :named("result"))
    store_lex "$childpost", $P124
.annotate 'line', 1197
    goto if_1405_end
  if_1405:
.annotate 'line', 1191
    .const 'Sub' $P1407 = "54_1308507553.18311" 
    capture_lex $P1407
    $P1407()
  if_1405_end:
.annotate 'line', 1201
    find_lex $P121, "$result"
    unless $P121, if_1412_end
    find_lex $P122, "self"
    find_lex $P123, "$childpost"
    find_lex $P124, "$result"
    $P125 = $P122."coerce"($P123, $P124)
    store_lex "$childpost", $P125
  if_1412_end:
.annotate 'line', 1189
    find_lex $P121, "$childpost"
    .return ($P121)
  control_1401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1406"  :anon :subid("54_1308507553.18311") :outer("53_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1192
    $P1409 = root_new ['parrot';'ResizablePMCArray']
    set $P1408, $P1409
    .lex "@arglist", $P1408
    new $P122, "ResizablePMCArray"
    store_lex "@arglist", $P122
.annotate 'line', 1193
    find_lex $P122, "$childpast"
    $N101 = $P122."arity"()
    isgt $I102, $N101, 0.0
    unless $I102, if_1410_end
    find_lex $P123, "@arglist"
    find_lex $P124, "$exprpost"
    push $P123, $P124
  if_1410_end:
.annotate 'line', 1194
    find_lex $P122, "self"
    find_lex $P123, "$childpast"
    find_lex $P124, "$childrtype"
    find_lex $P125, "@arglist"
    $P126 = $P122."as_post"($P123, $P124 :named("rtype"), $P125 :named("arglist"))
    store_lex "$childpost", $P126
.annotate 'line', 1191
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1423"  :anon :subid("55_1308507553.18311") :outer("52_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1180
    new $P124, "Undef"
    set $P1425, $P124
    .lex "$S0", $P1425
    new $P125, "String"
    assign $P125, "if"
    store_lex "$S0", $P125
.annotate 'line', 1181
    find_lex $P125, "$pasttype"
    set $S101, $P125
    find_lex $P126, "$S0"
    set $S102, $P126
    iseq $I102, $S101, $S102
    unless $I102, if_1426_end
    new $P127, "String"
    assign $P127, "unless"
    store_lex "$S0", $P127
  if_1426_end:
.annotate 'line', 1182
    find_lex $P125, "$ops"
    find_lex $P126, "$exprpost"
    $P125."push"($P126)
.annotate 'line', 1183
    find_lex $P125, "$ops"
    find_lex $P126, "$S0"
    find_lex $P127, "$exprpost"
    find_lex $P128, "$endlabel"
    $P125."push_pirop"($P126, $P127, $P128)
.annotate 'line', 1184
    find_lex $P125, "$thenpost"
    defined $I102, $P125
    unless $I102, if_1427_end
    find_lex $P126, "$ops"
    find_lex $P127, "$thenpost"
    $P126."push"($P127)
  if_1427_end:
.annotate 'line', 1185
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push"($P126)
.annotate 'line', 1186
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$ops"
    setattribute $P125, 'payload', $P126
    throw $P125
.annotate 'line', 1179
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("56_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1431
    .param pmc param_1432 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1206
    new $P1430, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1430, control_1429
    push_eh $P1430
    .lex "self", self
    .lex "$node", param_1431
    .lex "%options", param_1432
.annotate 'line', 1207
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."if"($P105, $P106 :flat)
.annotate 'line', 1206
    .return ($P107)
  control_1429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("57_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1436 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1214
    new $P1435, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1435, control_1434
    push_eh $P1435
    .lex "self", self
    .lex "%options", param_1436
.annotate 'line', 1215
    new $P104, "Undef"
    set $P1437, $P104
    .lex "$loopname", $P1437
.annotate 'line', 1216
    new $P105, "Undef"
    set $P1438, $P105
    .lex "$testlabel", $P1438
.annotate 'line', 1217
    new $P106, "Undef"
    set $P1439, $P106
    .lex "$redolabel", $P1439
.annotate 'line', 1218
    new $P107, "Undef"
    set $P1440, $P107
    .lex "$nextlabel", $P1440
.annotate 'line', 1219
    new $P108, "Undef"
    set $P1441, $P108
    .lex "$donelabel", $P1441
.annotate 'line', 1220
    new $P109, "Undef"
    set $P1442, $P109
    .lex "$handlabel", $P1442
.annotate 'line', 1222
    new $P110, "Undef"
    set $P1443, $P110
    .lex "$testop", $P1443
.annotate 'line', 1223
    new $P111, "Undef"
    set $P1444, $P111
    .lex "$testpost", $P1444
.annotate 'line', 1224
    new $P112, "Undef"
    set $P1445, $P112
    .lex "$prepost", $P1445
.annotate 'line', 1225
    new $P113, "Undef"
    set $P1446, $P113
    .lex "$bodypost", $P1446
.annotate 'line', 1226
    new $P114, "Undef"
    set $P1447, $P114
    .lex "$nextpost", $P1447
.annotate 'line', 1227
    new $P115, "Undef"
    set $P1448, $P115
    .lex "$bodyfirst", $P1448
.annotate 'line', 1231
    new $P116, "Undef"
    set $P1449, $P116
    .lex "$ops", $P1449
.annotate 'line', 1235
    new $P117, "Undef"
    set $P1450, $P117
    .lex "$handreg", $P1450
.annotate 'line', 1257
    new $P118, "Undef"
    set $P1451, $P118
    .lex "$S0", $P1451
.annotate 'line', 1215
    find_lex $P119, "self"
    $P120 = $P119."unique"("loop")
    store_lex "$loopname", $P120
.annotate 'line', 1216
    get_hll_global $P119, ["POST"], "Label"
    find_lex $P120, "$loopname"
    concat $P121, $P120, "_test"
    $P122 = $P119."new"($P121 :named("result"))
    store_lex "$testlabel", $P122
.annotate 'line', 1217
    get_hll_global $P119, ["POST"], "Label"
    find_lex $P120, "$loopname"
    concat $P121, $P120, "_redo"
    $P122 = $P119."new"($P121 :named("result"))
    store_lex "$redolabel", $P122
.annotate 'line', 1218
    get_hll_global $P119, ["POST"], "Label"
    find_lex $P120, "$loopname"
    concat $P121, $P120, "_next"
    $P122 = $P119."new"($P121 :named("result"))
    store_lex "$nextlabel", $P122
.annotate 'line', 1219
    get_hll_global $P119, ["POST"], "Label"
    find_lex $P120, "$loopname"
    concat $P121, $P120, "_done"
    $P122 = $P119."new"($P121 :named("result"))
    store_lex "$donelabel", $P122
.annotate 'line', 1220
    get_hll_global $P119, ["POST"], "Label"
    find_lex $P120, "$loopname"
    concat $P121, $P120, "_handler"
    $P122 = $P119."new"($P121 :named("result"))
    store_lex "$handlabel", $P122
.annotate 'line', 1222
    find_lex $P1452, "%options"
    unless_null $P1452, vivify_303
    $P1452 = root_new ['parrot';'Hash']
  vivify_303:
    set $P119, $P1452["testop"]
    unless_null $P119, vivify_304
    new $P119, "Undef"
  vivify_304:
    store_lex "$testop", $P119
.annotate 'line', 1223
    find_lex $P1453, "%options"
    unless_null $P1453, vivify_305
    $P1453 = root_new ['parrot';'Hash']
  vivify_305:
    set $P119, $P1453["test"]
    unless_null $P119, vivify_306
    new $P119, "Undef"
  vivify_306:
    store_lex "$testpost", $P119
.annotate 'line', 1224
    find_lex $P1454, "%options"
    unless_null $P1454, vivify_307
    $P1454 = root_new ['parrot';'Hash']
  vivify_307:
    set $P119, $P1454["pre"]
    unless_null $P119, vivify_308
    new $P119, "Undef"
  vivify_308:
    store_lex "$prepost", $P119
.annotate 'line', 1225
    find_lex $P1455, "%options"
    unless_null $P1455, vivify_309
    $P1455 = root_new ['parrot';'Hash']
  vivify_309:
    set $P119, $P1455["body"]
    unless_null $P119, vivify_310
    new $P119, "Undef"
  vivify_310:
    store_lex "$bodypost", $P119
.annotate 'line', 1226
    find_lex $P1456, "%options"
    unless_null $P1456, vivify_311
    $P1456 = root_new ['parrot';'Hash']
  vivify_311:
    set $P119, $P1456["next"]
    unless_null $P119, vivify_312
    new $P119, "Undef"
  vivify_312:
    store_lex "$nextpost", $P119
.annotate 'line', 1227
    find_lex $P1457, "%options"
    unless_null $P1457, vivify_313
    $P1457 = root_new ['parrot';'Hash']
  vivify_313:
    set $P119, $P1457["bodyfirst"]
    unless_null $P119, vivify_314
    new $P119, "Undef"
  vivify_314:
    store_lex "$bodyfirst", $P119
.annotate 'line', 1229
    find_lex $P119, "$testop"
    if $P119, unless_1458_end
    new $P120, "String"
    assign $P120, "unless"
    store_lex "$testop", $P120
  unless_1458_end:
.annotate 'line', 1231
    get_hll_global $P119, ["POST"], "Ops"
    $P120 = $P119."new"()
    store_lex "$ops", $P120
.annotate 'line', 1233
    find_dynamic_lex $P119, "$*SUB"
    unless_null $P119, vivify_315
    get_hll_global $P119, "$SUB"
    unless_null $P119, vivify_316
    die "Contextual $*SUB not found"
  vivify_316:
  vivify_315:
    $P119."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1235
    find_lex $P119, "self"
    $P120 = $P119."tempreg"("P")
    store_lex "$handreg", $P120
.annotate 'line', 1236
    find_lex $P119, "$ops"
    find_lex $P120, "$handreg"
    $P119."push_pirop"("new", $P120, "'ExceptionHandler'")
.annotate 'line', 1237
    find_lex $P119, "$ops"
    find_lex $P120, "$handreg"
    find_lex $P121, "$handlabel"
    $P119."push_pirop"("set_label", $P120, $P121)
.annotate 'line', 1238
    find_lex $P119, "$ops"
    find_lex $P120, "$handreg"
    $P119."push_pirop"("callmethod", "\"handle_types\"", $P120, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1240
    find_lex $P119, "$ops"
    find_lex $P120, "$handreg"
    $P119."push_pirop"("push_eh", $P120)
.annotate 'line', 1242
    find_lex $P119, "$bodyfirst"
    unless $P119, if_1459_end
    find_lex $P120, "$ops"
    find_lex $P121, "$redolabel"
    $P120."push_pirop"("goto", $P121)
  if_1459_end:
.annotate 'line', 1243
    find_lex $P119, "$ops"
    find_lex $P120, "$testlabel"
    $P119."push"($P120)
.annotate 'line', 1244
    find_lex $P119, "$testpost"
    unless $P119, if_1460_end
.annotate 'line', 1245
    find_lex $P120, "$ops"
    find_lex $P121, "$testpost"
    $P120."push"($P121)
.annotate 'line', 1246
    find_lex $P120, "$ops"
    find_lex $P121, "$testop"
    find_lex $P122, "$testpost"
    find_lex $P123, "$donelabel"
    $P120."push_pirop"($P121, $P122, $P123)
  if_1460_end:
.annotate 'line', 1248
    find_lex $P119, "$prepost"
    unless $P119, if_1461_end
    find_lex $P120, "$ops"
    find_lex $P121, "$prepost"
    $P120."push"($P121)
  if_1461_end:
.annotate 'line', 1249
    find_lex $P119, "$ops"
    find_lex $P120, "$redolabel"
    $P119."push"($P120)
.annotate 'line', 1250
    find_lex $P119, "$bodypost"
    unless $P119, if_1462_end
    find_lex $P120, "$ops"
    find_lex $P121, "$bodypost"
    $P120."push"($P121)
  if_1462_end:
.annotate 'line', 1251
    find_lex $P119, "$ops"
    find_lex $P120, "$nextlabel"
    $P119."push"($P120)
.annotate 'line', 1252
    find_lex $P119, "$nextpost"
    unless $P119, if_1463_end
    find_lex $P120, "$ops"
    find_lex $P121, "$nextpost"
    $P120."push"($P121)
  if_1463_end:
.annotate 'line', 1253
    find_lex $P119, "$ops"
    find_lex $P120, "$testlabel"
    $P119."push_pirop"("goto", $P120)
.annotate 'line', 1254
    find_lex $P119, "$ops"
    find_lex $P120, "$handlabel"
    $P119."push"($P120)
.annotate 'line', 1255
    find_lex $P119, "$ops"
    $P119."push_pirop"(".local pmc exception")
.annotate 'line', 1256
    find_lex $P119, "$ops"
    $P119."push_pirop"(".get_results (exception)")
.annotate 'line', 1257
    find_lex $P119, "self"
    $P120 = $P119."tempreg"("P")
    store_lex "$S0", $P120
.annotate 'line', 1258
    find_lex $P119, "$ops"
    find_lex $P120, "$S0"
    $P119."push_pirop"("getattribute", $P120, "exception", "'type'")
.annotate 'line', 1259
    find_lex $P119, "$ops"
    find_lex $P120, "$S0"
    find_lex $P121, "$nextlabel"
    $P119."push_pirop"("eq", $P120, ".CONTROL_LOOP_NEXT", $P121)
.annotate 'line', 1260
    find_lex $P119, "$ops"
    find_lex $P120, "$S0"
    find_lex $P121, "$redolabel"
    $P119."push_pirop"("eq", $P120, ".CONTROL_LOOP_REDO", $P121)
.annotate 'line', 1261
    find_lex $P119, "$ops"
    find_lex $P120, "$donelabel"
    $P119."push"($P120)
.annotate 'line', 1262
    find_lex $P119, "$ops"
    $P119."push_pirop"("pop_eh")
.annotate 'line', 1214
    find_lex $P119, "$ops"
    .return ($P119)
  control_1434:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("58_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1467
    .param pmc param_1468 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1273
    new $P1466, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1466, control_1465
    push_eh $P1466
    .lex "self", self
    .lex "$node", param_1467
    .lex "%options", param_1468
.annotate 'line', 1274
    new $P104, "Undef"
    set $P1469, $P104
    .lex "$exprpast", $P1469
.annotate 'line', 1275
    new $P105, "Undef"
    set $P1470, $P105
    .lex "$bodypast", $P1470
.annotate 'line', 1276
    new $P106, "Undef"
    set $P1471, $P106
    .lex "$nextpast", $P1471
.annotate 'line', 1278
    new $P107, "Undef"
    set $P1472, $P107
    .lex "$exprpost", $P1472
.annotate 'line', 1280
    $P1474 = root_new ['parrot';'ResizablePMCArray']
    set $P1473, $P1474
    .lex "@arglist", $P1473
.annotate 'line', 1282
    new $P108, "Undef"
    set $P1475, $P108
    .lex "$bodypost", $P1475
.annotate 'line', 1284
    new $P109, "Undef"
    set $P1476, $P109
    .lex "$nextpost", $P1476
.annotate 'line', 1287
    new $P110, "Undef"
    set $P1477, $P110
    .lex "$testop", $P1477
.annotate 'line', 1288
    new $P111, "Undef"
    set $P1478, $P111
    .lex "$bodyfirst", $P1478
.annotate 'line', 1290
    new $P112, "Undef"
    set $P1479, $P112
    .lex "$ops", $P1479
.annotate 'line', 1274
    find_lex $P1480, "$node"
    unless_null $P1480, vivify_317
    $P1480 = root_new ['parrot';'ResizablePMCArray']
  vivify_317:
    set $P113, $P1480[0]
    unless_null $P113, vivify_318
    new $P113, "Undef"
  vivify_318:
    store_lex "$exprpast", $P113
.annotate 'line', 1275
    find_lex $P1481, "$node"
    unless_null $P1481, vivify_319
    $P1481 = root_new ['parrot';'ResizablePMCArray']
  vivify_319:
    set $P113, $P1481[1]
    unless_null $P113, vivify_320
    new $P113, "Undef"
  vivify_320:
    store_lex "$bodypast", $P113
.annotate 'line', 1276
    find_lex $P1482, "$node"
    unless_null $P1482, vivify_321
    $P1482 = root_new ['parrot';'ResizablePMCArray']
  vivify_321:
    set $P113, $P1482[2]
    unless_null $P113, vivify_322
    new $P113, "Undef"
  vivify_322:
    store_lex "$nextpast", $P113
.annotate 'line', 1278
    find_lex $P113, "self"
    find_lex $P114, "$exprpast"
    $P115 = $P113."as_post"($P114, "r" :named("rtype"))
    store_lex "$exprpost", $P115
.annotate 'line', 1280
    new $P113, "ResizablePMCArray"
    store_lex "@arglist", $P113
.annotate 'line', 1281
    find_lex $P113, "$bodypast"
    $N101 = $P113."arity"()
    islt $I101, $N101, 1.0
    if $I101, unless_1483_end
    find_lex $P114, "@arglist"
    find_lex $P115, "$exprpost"
    push $P114, $P115
  unless_1483_end:
.annotate 'line', 1282
    find_lex $P113, "self"
    find_lex $P114, "$bodypast"
    find_lex $P115, "@arglist"
    $P116 = $P113."as_post"($P114, "v" :named("rtype"), $P115 :named("arglist"))
    store_lex "$bodypost", $P116
.annotate 'line', 1284
    get_hll_global $P113, "null__P"
    store_lex "$nextpost", $P113
.annotate 'line', 1285
    find_lex $P113, "$nextpast"
    unless $P113, if_1484_end
    find_lex $P114, "self"
    find_lex $P115, "$nextpast"
    $P116 = $P114."as_post"($P115, "v" :named("rtype"))
    store_lex "$nextpost", $P116
  if_1484_end:
.annotate 'line', 1287
    find_lex $P1485, "%options"
    unless_null $P1485, vivify_323
    $P1485 = root_new ['parrot';'Hash']
  vivify_323:
    set $P113, $P1485["testop"]
    unless_null $P113, vivify_324
    new $P113, "Undef"
  vivify_324:
    store_lex "$testop", $P113
.annotate 'line', 1288
    find_lex $P1486, "%options"
    unless_null $P1486, vivify_325
    $P1486 = root_new ['parrot';'Hash']
  vivify_325:
    set $P113, $P1486["bodyfirst"]
    unless_null $P113, vivify_326
    new $P113, "Undef"
  vivify_326:
    store_lex "$bodyfirst", $P113
.annotate 'line', 1290
    find_lex $P113, "self"
    find_lex $P114, "$testop"
    find_lex $P115, "$exprpost"
    find_lex $P116, "$bodypost"
    find_lex $P117, "$bodyfirst"
    find_lex $P118, "$nextpost"
    $P119 = $P113."loop_gen"($P114 :named("testop"), $P115 :named("test"), $P116 :named("body"), $P117 :named("bodyfirst"), $P118 :named("next"))
    store_lex "$ops", $P119
.annotate 'line', 1292
    find_lex $P113, "$ops"
    find_lex $P114, "$exprpost"
    $P113."result"($P114)
.annotate 'line', 1293
    find_lex $P113, "$ops"
    find_lex $P114, "$node"
    $P113."node"($P114)
.annotate 'line', 1273
    find_lex $P113, "$ops"
    .return ($P113)
  control_1465:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("59_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1490
    .param pmc param_1491 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1297
    new $P1489, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1489, control_1488
    push_eh $P1489
    .lex "self", self
    .lex "$node", param_1490
    .lex "%options", param_1491
.annotate 'line', 1298
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."while"($P105, $P106 :flat, "if" :named("testop"))
.annotate 'line', 1297
    .return ($P107)
  control_1488:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("60_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1495
    .param pmc param_1496 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1301
    new $P1494, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1494, control_1493
    push_eh $P1494
    .lex "self", self
    .lex "$node", param_1495
    .lex "%options", param_1496
.annotate 'line', 1302
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."while"($P105, $P106 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1301
    .return ($P107)
  control_1493:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("61_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1500
    .param pmc param_1501 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1305
    new $P1499, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1499, control_1498
    push_eh $P1499
    .lex "self", self
    .lex "$node", param_1500
    .lex "%options", param_1501
.annotate 'line', 1306
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."while"($P105, $P106 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1305
    .return ($P107)
  control_1498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("62_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1505
    .param pmc param_1506 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1314
    .const 'Sub' $P1524 = "63_1308507553.18311" 
    capture_lex $P1524
    new $P1504, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1504, control_1503
    push_eh $P1504
    .lex "self", self
    .lex "$node", param_1505
    .lex "%options", param_1506
.annotate 'line', 1315
    new $P104, "Undef"
    set $P1507, $P104
    .lex "$ops", $P1507
.annotate 'line', 1316
    new $P105, "Undef"
    set $P1508, $P105
    .lex "$prepost", $P1508
.annotate 'line', 1317
    new $P106, "Undef"
    set $P1509, $P106
    .lex "$testpost", $P1509
.annotate 'line', 1319
    new $P107, "Undef"
    set $P1510, $P107
    .lex "$collpast", $P1510
.annotate 'line', 1320
    new $P108, "Undef"
    set $P1511, $P108
    .lex "$bodypast", $P1511
.annotate 'line', 1322
    new $P109, "Undef"
    set $P1512, $P109
    .lex "$collpost", $P1512
.annotate 'line', 1326
    new $P110, "Undef"
    set $P1513, $P110
    .lex "$undeflabel", $P1513
.annotate 'line', 1327
    new $P111, "Undef"
    set $P1514, $P111
    .lex "$S0", $P1514
.annotate 'line', 1335
    new $P112, "Undef"
    set $P1515, $P112
    .lex "$arity", $P1515
.annotate 'line', 1344
    $P1517 = root_new ['parrot';'ResizablePMCArray']
    set $P1516, $P1517
    .lex "@arglist", $P1516
.annotate 'line', 1354
    new $P113, "Undef"
    set $P1518, $P113
    .lex "$bodypost", $P1518
.annotate 'line', 1315
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1316
    get_hll_global $P114, ["POST"], "Ops"
    $P115 = $P114."new"()
    store_lex "$prepost", $P115
.annotate 'line', 1317
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "self"
    $P116 = $P115."tempreg"("P")
    $P117 = $P114."new"($P116 :named("result"))
    store_lex "$testpost", $P117
.annotate 'line', 1319
    find_lex $P1519, "$node"
    unless_null $P1519, vivify_327
    $P1519 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P114, $P1519[0]
    unless_null $P114, vivify_328
    new $P114, "Undef"
  vivify_328:
    store_lex "$collpast", $P114
.annotate 'line', 1320
    find_lex $P1520, "$node"
    unless_null $P1520, vivify_329
    $P1520 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P114, $P1520[1]
    unless_null $P114, vivify_330
    new $P114, "Undef"
  vivify_330:
    store_lex "$bodypast", $P114
.annotate 'line', 1322
    find_lex $P114, "self"
    find_lex $P115, "$collpast"
    $P116 = $P114."as_post"($P115, "P" :named("rtype"))
    store_lex "$collpost", $P116
.annotate 'line', 1323
    find_lex $P114, "$ops"
    find_lex $P115, "$collpost"
    $P114."push"($P115)
.annotate 'line', 1326
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P115
.annotate 'line', 1327
    find_lex $P114, "self"
    $P115 = $P114."tempreg"("I")
    store_lex "$S0", $P115
.annotate 'line', 1328
    find_lex $P114, "$ops"
    find_lex $P115, "$S0"
    find_lex $P116, "$collpost"
    $P114."push_pirop"("defined", $P115, $P116)
.annotate 'line', 1329
    find_lex $P114, "$ops"
    find_lex $P115, "$S0"
    find_lex $P116, "$undeflabel"
    $P114."push_pirop"("unless", $P115, $P116)
.annotate 'line', 1331
    find_lex $P114, "$ops"
    find_lex $P115, "$testpost"
    find_lex $P116, "$collpost"
    $P114."push_pirop"("iter", $P115, $P116)
.annotate 'line', 1335
    new $P114, "Integer"
    assign $P114, 1
    store_lex "$arity", $P114
.annotate 'line', 1336
    find_lex $P114, "$node"
    $P115 = $P114."arity"()
    defined $I101, $P115
    if $I101, if_1521
.annotate 'line', 1339
    find_lex $P116, "$bodypast"
    $P117 = $P116."arity"()
    defined $I102, $P117
    unless $I102, if_1522_end
.annotate 'line', 1340
    find_lex $P118, "$bodypast"
    $P119 = $P118."arity"()
    store_lex "$arity", $P119
  if_1522_end:
.annotate 'line', 1339
    goto if_1521_end
  if_1521:
.annotate 'line', 1337
    find_lex $P116, "$node"
    $P117 = $P116."arity"()
    store_lex "$arity", $P117
  if_1521_end:
.annotate 'line', 1344
    new $P114, "ResizablePMCArray"
    store_lex "@arglist", $P114
.annotate 'line', 1345
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1528_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
    goto loop1528_redo
  loop1528_test:
    find_lex $P114, "$arity"
    set $N101, $P114
    isgt $I101, $N101, 0.0
    unless $I101, loop1528_done
  loop1528_redo:
    .const 'Sub' $P1524 = "63_1308507553.18311" 
    capture_lex $P1524
    $P1524()
  loop1528_next:
    goto loop1528_test
  loop1528_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1528_next
    eq $P117, .CONTROL_LOOP_REDO, loop1528_redo
  loop1528_done:
    pop_eh 
.annotate 'line', 1354
    find_lex $P114, "self"
    find_lex $P115, "$bodypast"
    find_lex $P116, "@arglist"
    $P117 = $P114."as_post"($P115, "v" :named("rtype"), $P116 :named("arglist"))
    store_lex "$bodypost", $P117
.annotate 'line', 1357
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$testpost"
    find_lex $P117, "$prepost"
    find_lex $P118, "$bodypost"
    $P119 = $P115."loop_gen"($P116 :named("test"), $P117 :named("pre"), $P118 :named("body"))
    $P114."push"($P119)
.annotate 'line', 1359
    find_lex $P114, "$ops"
    find_lex $P115, "$undeflabel"
    $P114."push"($P115)
.annotate 'line', 1360
    find_lex $P114, "$ops"
    find_lex $P115, "$testpost"
    $P114."result"($P115)
.annotate 'line', 1314
    find_lex $P114, "$ops"
    .return ($P114)
  control_1503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1523"  :anon :subid("63_1308507553.18311") :outer("62_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1346
    new $P115, "Undef"
    set $P1525, $P115
    .lex "$nextarg", $P1525
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("P")
    store_lex "$nextarg", $P117
.annotate 'line', 1347
    find_lex $P116, "$prepost"
    find_lex $P117, "$nextarg"
    find_lex $P118, "$testpost"
    $P116."push_pirop"("shift", $P117, $P118)
.annotate 'line', 1348
    find_lex $P116, "$arity"
    set $N102, $P116
    islt $I102, $N102, 1.0
    unless $I102, if_1526_end
    die 0, .CONTROL_LOOP_LAST
  if_1526_end:
.annotate 'line', 1349
    find_lex $P116, "@arglist"
    find_lex $P117, "$nextarg"
    push $P116, $P117
.annotate 'line', 1345
    find_lex $P116, "$arity"
    clone $P1527, $P116
    dec $P116
    .return ($P1527)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("64_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1532
    .param pmc param_1533 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1370
    .const 'Sub' $P1541 = "65_1308507553.18311" 
    capture_lex $P1541
    new $P1531, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1531, control_1530
    push_eh $P1531
    .lex "self", self
    .lex "$node", param_1532
    .lex "%options", param_1533
.annotate 'line', 1372
    new $P104, "Undef"
    set $P1534, $P104
    .lex "$ops", $P1534
.annotate 'line', 1373
    $P1536 = root_new ['parrot';'ResizablePMCArray']
    set $P1535, $P1536
    .lex "@posargs", $P1535
.annotate 'line', 1381
    new $P105, "Undef"
    set $P1537, $P105
    .lex "$returns", $P1537
.annotate 'line', 1384
    new $P106, "Undef"
    set $P1538, $P106
    .lex "$listpost", $P1538
.annotate 'line', 1370
    find_lex $P107, "$ops"
    find_lex $P107, "@posargs"
.annotate 'line', 1374

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1381
    find_lex $P107, "$node"
    $P108 = $P107."returns"()
    store_lex "$returns", $P108
.annotate 'line', 1382
    find_lex $P107, "$returns"
    if $P107, unless_1539_end
    new $P108, "String"
    assign $P108, "ResizablePMCArray"
    store_lex "$returns", $P108
  unless_1539_end:
.annotate 'line', 1384
    find_lex $P107, "self"
    find_lex $P108, "$returns"
    $P109 = $P107."as_vivipost"($P108, "P" :named("rtype"))
    store_lex "$listpost", $P109
.annotate 'line', 1385
    find_lex $P107, "$ops"
    find_lex $P108, "$listpost"
    $P107."result"($P108)
.annotate 'line', 1386
    find_lex $P107, "$ops"
    find_lex $P108, "$listpost"
    $P107."push"($P108)
.annotate 'line', 1387
    find_lex $P108, "@posargs"
    defined $I101, $P108
    unless $I101, for_undef_331
    iter $P107, $P108
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1543_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1543_test:
    unless $P107, loop1543_done
    shift $P109, $P107
  loop1543_redo:
    .const 'Sub' $P1541 = "65_1308507553.18311" 
    capture_lex $P1541
    $P1541($P109)
  loop1543_next:
    goto loop1543_test
  loop1543_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1543_next
    eq $P115, .CONTROL_LOOP_REDO, loop1543_redo
  loop1543_done:
    pop_eh 
  for_undef_331:
.annotate 'line', 1370
    find_lex $P107, "$ops"
    .return ($P107)
  control_1530:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1540"  :anon :subid("65_1308507553.18311") :outer("64_1308507553.18311")
    .param pmc param_1542
.annotate 'file', ''
.annotate 'line', 1387
    .lex "$_", param_1542
    find_lex $P110, "$ops"
    find_lex $P111, "$listpost"
    find_lex $P112, "$_"
    $P113 = $P110."push_pirop"("push", $P111, $P112)
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("66_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1547
    .param pmc param_1548 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1396
    new $P1546, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1546, control_1545
    push_eh $P1546
    .lex "self", self
    .lex "$node", param_1547
    .lex "%options", param_1548
.annotate 'line', 1397
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "%options"
    $P107 = $P104."node_as_post"($P105, $P106)
.annotate 'line', 1396
    .return ($P107)
  control_1545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("67_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1552
    .param pmc param_1553 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1407
    new $P1551, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1551, control_1550
    push_eh $P1551
    .lex "self", self
    .lex "$node", param_1552
    .lex "%options", param_1553
.annotate 'line', 1408
    get_hll_global $P104, ["POST"], "Ops"
    find_lex $P105, "$node"
    $P106 = $P104."new"($P105 :named("node"))
.annotate 'line', 1407
    .return ($P106)
  control_1550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("68_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1557
    .param pmc param_1558 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1416
    .const 'Sub' $P1566 = "69_1308507553.18311" 
    capture_lex $P1566
    new $P1556, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1556, control_1555
    push_eh $P1556
    .lex "self", self
    .lex "$node", param_1557
    .lex "%options", param_1558
.annotate 'line', 1417
    new $P104, "Undef"
    set $P1559, $P104
    .lex "$ops", $P1559
.annotate 'line', 1419
    new $P105, "Undef"
    set $P1560, $P105
    .lex "$exreg", $P1560
.annotate 'line', 1420
    new $P106, "Undef"
    set $P1561, $P106
    .lex "$extype", $P1561
.annotate 'line', 1425
    new $P107, "Undef"
    set $P1562, $P107
    .lex "$cpast", $P1562
.annotate 'line', 1417
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$node"
    $P110 = $P108."new"($P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1419
    find_lex $P108, "self"
    $P109 = $P108."tempreg"("P")
    store_lex "$exreg", $P109
.annotate 'line', 1420
    find_lex $P108, "$exreg"
    concat $P109, $P108, "['type']"
    store_lex "$extype", $P109
.annotate 'line', 1421
    find_lex $P108, "$ops"
    find_lex $P109, "$exreg"
    $P108."push_pirop"("new", $P109, "\"Exception\"")
.annotate 'line', 1422
    find_lex $P108, "$ops"
    find_lex $P109, "$extype"
    $P108."push_pirop"("set", $P109, ".CONTROL_RETURN")
.annotate 'line', 1423
    find_dynamic_lex $P108, "$*SUB"
    unless_null $P108, vivify_332
    get_hll_global $P108, "$SUB"
    unless_null $P108, vivify_333
    die "Contextual $*SUB not found"
  vivify_333:
  vivify_332:
    $P108."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1425
    find_lex $P1563, "$node"
    unless_null $P1563, vivify_334
    $P1563 = root_new ['parrot';'ResizablePMCArray']
  vivify_334:
    set $P108, $P1563[0]
    unless_null $P108, vivify_335
    new $P108, "Undef"
  vivify_335:
    store_lex "$cpast", $P108
.annotate 'line', 1426
    find_lex $P108, "$cpast"
    unless $P108, if_1564_end
    .const 'Sub' $P1566 = "69_1308507553.18311" 
    capture_lex $P1566
    $P1566()
  if_1564_end:
.annotate 'line', 1432
    find_lex $P108, "$ops"
    find_lex $P109, "$exreg"
    $P108."push_pirop"("throw", $P109)
.annotate 'line', 1416
    find_lex $P108, "$ops"
    .return ($P108)
  control_1555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1565"  :anon :subid("69_1308507553.18311") :outer("68_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1427
    new $P109, "Undef"
    set $P1567, $P109
    .lex "$cpost", $P1567
    find_lex $P110, "self"
    find_lex $P111, "$cpast"
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$cpost", $P112
.annotate 'line', 1428
    find_lex $P110, "self"
    find_lex $P111, "$cpost"
    $P112 = $P110."coerce"($P111, "P")
    store_lex "$cpost", $P112
.annotate 'line', 1429
    find_lex $P110, "$ops"
    find_lex $P111, "$cpost"
    $P110."push"($P111)
.annotate 'line', 1430
    find_lex $P110, "$ops"
    find_lex $P111, "$exreg"
    find_lex $P112, "$cpost"
    $P113 = $P110."push_pirop"("setattribute", $P111, "'payload'", $P112)
.annotate 'line', 1426
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("70_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1571
    .param pmc param_1572 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1444
    new $P1570, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1570, control_1569
    push_eh $P1570
    .lex "self", self
    .lex "$node", param_1571
    .lex "%options", param_1572
.annotate 'line', 1445
    new $P104, "Undef"
    set $P1573, $P104
    .lex "$ops", $P1573
.annotate 'line', 1447
    new $P105, "Undef"
    set $P1574, $P105
    .lex "$S0", $P1574
.annotate 'line', 1448
    new $P106, "Undef"
    set $P1575, $P106
    .lex "$catchlabel", $P1575
.annotate 'line', 1449
    new $P107, "Undef"
    set $P1576, $P107
    .lex "$endlabel", $P1576
.annotate 'line', 1451
    new $P108, "Undef"
    set $P1577, $P108
    .lex "$rtype", $P1577
.annotate 'line', 1453
    new $P109, "Undef"
    set $P1578, $P109
    .lex "$trypost", $P1578
.annotate 'line', 1457
    new $P110, "Undef"
    set $P1579, $P110
    .lex "$elsepast", $P1579
.annotate 'line', 1463
    new $P111, "Undef"
    set $P1580, $P111
    .lex "$catchpast", $P1580
.annotate 'line', 1445
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1447
    find_lex $P112, "self"
    $P113 = $P112."unique"("catch_")
    store_lex "$S0", $P113
.annotate 'line', 1448
    get_hll_global $P112, ["POST"], "Label"
    find_lex $P113, "$S0"
    $P114 = $P112."new"($P113 :named("result"))
    store_lex "$catchlabel", $P114
.annotate 'line', 1449
    get_hll_global $P112, ["POST"], "Lable"
    find_lex $P113, "$S0"
    concat $P114, $P113, "_end"
    $P115 = $P112."new"($P114 :named("result"))
    store_lex "$endlabel", $P115
.annotate 'line', 1451
    find_lex $P1581, "%options"
    unless_null $P1581, vivify_336
    $P1581 = root_new ['parrot';'Hash']
  vivify_336:
    set $P112, $P1581["rtype"]
    unless_null $P112, vivify_337
    new $P112, "Undef"
  vivify_337:
    store_lex "$rtype", $P112
.annotate 'line', 1453
    find_lex $P112, "self"
    find_lex $P1582, "$node"
    unless_null $P1582, vivify_338
    $P1582 = root_new ['parrot';'ResizablePMCArray']
  vivify_338:
    set $P113, $P1582[0]
    unless_null $P113, vivify_339
    new $P113, "Undef"
  vivify_339:
    find_lex $P114, "$rtype"
    $P115 = $P112."as_post"($P113, $P114 :named("rtype"))
    store_lex "$trypost", $P115
.annotate 'line', 1454
    find_lex $P112, "$ops"
    find_lex $P113, "$catchlabel"
    $P112."push_pirop"("push_eh", $P113)
.annotate 'line', 1455
    find_lex $P112, "$ops"
    find_lex $P113, "$trypost"
    $P112."push"($P113)
.annotate 'line', 1456
    find_lex $P112, "$ops"
    $P112."push_pirop"("pop_eh")
.annotate 'line', 1457
    find_lex $P1583, "$node"
    unless_null $P1583, vivify_340
    $P1583 = root_new ['parrot';'ResizablePMCArray']
  vivify_340:
    set $P112, $P1583[2]
    unless_null $P112, vivify_341
    new $P112, "Undef"
  vivify_341:
    store_lex "$elsepast", $P112
.annotate 'line', 1458
    find_lex $P112, "$elsepast"
    unless $P112, if_1584_end
.annotate 'line', 1459
    find_lex $P113, "$ops"
    find_lex $P114, "self"
    find_lex $P115, "$elsepast"
    $P116 = $P114."as_post"($P115, "v" :named("rtype"))
    $P113."push"($P116)
  if_1584_end:
.annotate 'line', 1461
    find_lex $P112, "$ops"
    find_lex $P113, "$endlabel"
    $P112."push_pirop"("goto", $P113)
.annotate 'line', 1462
    find_lex $P112, "$ops"
    find_lex $P113, "$catchlabel"
    $P112."push"($P113)
.annotate 'line', 1463
    find_lex $P1585, "$node"
    unless_null $P1585, vivify_342
    $P1585 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P112, $P1585[1]
    unless_null $P112, vivify_343
    new $P112, "Undef"
  vivify_343:
    store_lex "$catchpast", $P112
.annotate 'line', 1464
    find_lex $P112, "$catchpast"
    unless $P112, if_1586_end
.annotate 'line', 1465
    find_lex $P113, "$ops"
    find_lex $P114, "self"
    find_lex $P115, "$catchpast"
    $P116 = $P114."as_post"($P115, "v" :named("rtype"))
    $P113."push"($P116)
.annotate 'line', 1466
    find_lex $P113, "$ops"
    $P113."push_pirop"("pop_eh")
  if_1586_end:
.annotate 'line', 1468
    find_lex $P112, "$ops"
    find_lex $P113, "$endlabel"
    $P112."push"($P113)
.annotate 'line', 1469
    find_lex $P112, "$ops"
    find_lex $P113, "$trypost"
    $P112."result"($P113)
.annotate 'line', 1444
    find_lex $P112, "$ops"
    .return ($P112)
  control_1569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("71_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1590
    .param pmc param_1591 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1482
    .const 'Sub' $P1606 = "73_1308507553.18311" 
    capture_lex $P1606
    .const 'Sub' $P1599 = "72_1308507553.18311" 
    capture_lex $P1599
    new $P1589, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1589, control_1588
    push_eh $P1589
    .lex "self", self
    .lex "$node", param_1590
    .lex "%options", param_1591
.annotate 'line', 1484
    $P1593 = root_new ['parrot';'ResizablePMCArray']
    set $P1592, $P1593
    .lex "@clist", $P1592
.annotate 'line', 1485
    new $P104, "Undef"
    set $P1594, $P104
    .lex "$cpast", $P1594
.annotate 'line', 1493
    new $P105, "Undef"
    set $P1595, $P105
    .lex "$ops", $P1595
.annotate 'line', 1495
    new $P106, "Undef"
    set $P1596, $P106
    .lex "$endlabel", $P1596
.annotate 'line', 1498
    new $P107, "Undef"
    set $P1597, $P107
    .lex "$apost", $P1597
.annotate 'line', 1484
    new $P108, "ResizablePMCArray"
    store_lex "@clist", $P108
.annotate 'line', 1485
    find_lex $P108, "$node"
    store_lex "$cpast", $P108
.annotate 'line', 1486
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1603_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1603_test:
    find_lex $P108, "$cpast"
    get_hll_global $P109, ["PAST"], "Op"
    $P110 = $P108."isa"($P109)
    unless $P110, loop1603_done
  loop1603_redo:
    .const 'Sub' $P1599 = "72_1308507553.18311" 
    capture_lex $P1599
    $P1599()
  loop1603_next:
    goto loop1603_test
  loop1603_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1603_next
    eq $P114, .CONTROL_LOOP_REDO, loop1603_redo
  loop1603_done:
    pop_eh 
.annotate 'line', 1493
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$node"
    $P110 = $P108."new"($P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1494
    find_lex $P108, "$ops"
    find_lex $P109, "self"
    $P110 = $P109."unique"("$P")
    $P108."result"($P110)
.annotate 'line', 1495
    get_hll_global $P108, ["POST"], "Label"
    $P109 = $P108("chain_end_" :named("name"))
    store_lex "$endlabel", $P109
.annotate 'line', 1497
    find_lex $P108, "@clist"
    pop $P109, $P108
    store_lex "$cpast", $P109
.annotate 'line', 1498
    find_lex $P108, "self"
    find_lex $P1604, "$cpast"
    unless_null $P1604, vivify_346
    $P1604 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P109, $P1604[0]
    unless_null $P109, vivify_347
    new $P109, "Undef"
  vivify_347:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$apost", $P110
.annotate 'line', 1499
    find_lex $P108, "$ops"
    find_lex $P109, "$apost"
    $P108."push"($P109)
.annotate 'line', 1501
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1611_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1611_test:
    new $P108, "Integer"
    assign $P108, 1
    unless $P108, loop1611_done
  loop1611_redo:
    .const 'Sub' $P1606 = "73_1308507553.18311" 
    capture_lex $P1606
    $P1606()
  loop1611_next:
    goto loop1611_test
  loop1611_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1611_next
    eq $P113, .CONTROL_LOOP_REDO, loop1611_redo
  loop1611_done:
    pop_eh 
.annotate 'line', 1511
    find_lex $P108, "$ops"
    find_lex $P109, "$endlabel"
    $P108."push"($P109)
.annotate 'line', 1482
    find_lex $P108, "$ops"
    .return ($P108)
  control_1588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1598"  :anon :subid("72_1308507553.18311") :outer("71_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1487
    new $P111, "Undef"
    set $P1600, $P111
    .lex "$pasttype", $P1600
    find_lex $P112, "$cpast"
    $P113 = $P112."pasttype"()
    store_lex "$pasttype", $P113
.annotate 'line', 1488
    find_lex $P112, "$pasttype"
    set $S101, $P112
    isne $I101, $S101, "chain"
    unless $I101, if_1601_end
    die 0, .CONTROL_LOOP_LAST
  if_1601_end:
.annotate 'line', 1489
    find_lex $P112, "@clist"
    find_lex $P113, "$cpast"
    push $P112, $P113
.annotate 'line', 1490
    find_lex $P1602, "$cpast"
    unless_null $P1602, vivify_344
    $P1602 = root_new ['parrot';'ResizablePMCArray']
  vivify_344:
    set $P112, $P1602[0]
    unless_null $P112, vivify_345
    new $P112, "Undef"
  vivify_345:
    store_lex "$cpast", $P112
.annotate 'line', 1486
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1605"  :anon :subid("73_1308507553.18311") :outer("71_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1502
    new $P109, "Undef"
    set $P1607, $P109
    .lex "$bpost", $P1607
.annotate 'line', 1504
    new $P110, "Undef"
    set $P1608, $P110
    .lex "$name", $P1608
.annotate 'line', 1502
    find_lex $P111, "self"
    find_lex $P1609, "$cpast"
    unless_null $P1609, vivify_348
    $P1609 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P112, $P1609[1]
    unless_null $P112, vivify_349
    new $P112, "Undef"
  vivify_349:
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$bpost", $P113
.annotate 'line', 1503
    find_lex $P111, "$ops"
    find_lex $P112, "$bpost"
    $P111."push"($P112)
.annotate 'line', 1504
    find_lex $P111, "self"
    find_lex $P112, "$cpast"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1505
    find_lex $P111, "$ops"
    find_lex $P112, "$name"
    find_lex $P113, "$apost"
    find_lex $P114, "$bpost"
    find_lex $P115, "$ops"
    $P111."push_pirop"("call", $P112, $P113, $P114, $P115 :named("result"))
.annotate 'line', 1506
    find_lex $P111, "@clist"
    if $P111, unless_1610_end
    die 0, .CONTROL_LOOP_LAST
  unless_1610_end:
.annotate 'line', 1507
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$endlabel"
    $P111."push_pirop"("unless", $P112, $P113)
.annotate 'line', 1508
    find_lex $P111, "@clist"
    pop $P112, $P111
    store_lex "$cpast", $P112
.annotate 'line', 1509
    find_lex $P111, "$bpost"
    store_lex "$apost", $P111
.annotate 'line', 1501
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("74_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1615
    .param pmc param_1616 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1522
    new $P1614, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1614, control_1613
    push_eh $P1614
    .lex "self", self
    .lex "$node", param_1615
    .lex "%options", param_1616
.annotate 'line', 1523
    new $P104, "Undef"
    set $P1617, $P104
    .lex "$ops", $P1617
.annotate 'line', 1525
    new $P105, "Undef"
    set $P1618, $P105
    .lex "$lpost", $P1618
.annotate 'line', 1529
    new $P106, "Undef"
    set $P1619, $P106
    .lex "$endlabel", $P1619
.annotate 'line', 1531
    new $P107, "Undef"
    set $P1620, $P107
    .lex "$reg", $P1620
.annotate 'line', 1534
    new $P108, "Undef"
    set $P1621, $P108
    .lex "$rpost", $P1621
.annotate 'line', 1523
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    $P113 = $P109."new"($P110 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1525
    find_lex $P109, "self"
    find_lex $P1622, "$node"
    unless_null $P1622, vivify_350
    $P1622 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P110, $P1622[0]
    unless_null $P110, vivify_351
    new $P110, "Undef"
  vivify_351:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$lpost", $P111
.annotate 'line', 1526
    find_lex $P109, "$ops"
    find_lex $P110, "$lpost"
    $P109."push"($P110)
.annotate 'line', 1527
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P109."push_pirop"("set", $P110, $P111)
.annotate 'line', 1529
    get_hll_global $P109, ["POST"], "Label"
    find_lex $P110, "self"
    $P111 = $P110."unique"("default_")
    $P112 = $P109."new"($P111 :named("result"))
    store_lex "$endlabel", $P112
.annotate 'line', 1531
    find_lex $P109, "self"
    $P110 = $P109."unique"("$I")
    store_lex "$reg", $P110
.annotate 'line', 1532
    find_lex $P109, "$ops"
    find_lex $P110, "$reg"
    find_lex $P111, "$ops"
    $P109."push_pirop"("defined", $P110, $P111)
.annotate 'line', 1533
    find_lex $P109, "$ops"
    find_lex $P110, "$reg"
    find_lex $P111, "$endlabel"
    $P109."push_pirop"("if", $P110, $P111)
.annotate 'line', 1534
    find_lex $P109, "self"
    find_lex $P1623, "$node"
    unless_null $P1623, vivify_352
    $P1623 = root_new ['parrot';'ResizablePMCArray']
  vivify_352:
    set $P110, $P1623[1]
    unless_null $P110, vivify_353
    new $P110, "Undef"
  vivify_353:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$rpost", $P111
.annotate 'line', 1535
    find_lex $P109, "$ops"
    find_lex $P110, "$rpost"
    $P109."push"($P110)
.annotate 'line', 1536
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P109."push_pirop"("set", $P110, $P111)
.annotate 'line', 1537
    find_lex $P109, "$ops"
    find_lex $P110, "$endlabel"
    $P109."push"($P110)
.annotate 'line', 1522
    find_lex $P109, "$ops"
    .return ($P109)
  control_1613:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("75_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1627
    .param pmc param_1628 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1548
    .const 'Sub' $P1639 = "76_1308507553.18311" 
    capture_lex $P1639
    new $P1626, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1626, control_1625
    push_eh $P1626
    .lex "self", self
    .lex "$node", param_1627
    .lex "%options", param_1628
.annotate 'line', 1549
    new $P104, "Undef"
    set $P1629, $P104
    .lex "$ops", $P1629
.annotate 'line', 1552
    new $P105, "Undef"
    set $P1630, $P105
    .lex "$falselabel", $P1630
.annotate 'line', 1553
    new $P106, "Undef"
    set $P1631, $P106
    .lex "$endlabel", $P1631
.annotate 'line', 1555
    new $P107, "Undef"
    set $P1632, $P107
    .lex "$i", $P1632
.annotate 'line', 1556
    new $P108, "Undef"
    set $P1633, $P108
    .lex "$t", $P1633
.annotate 'line', 1557
    new $P109, "Undef"
    set $P1634, $P109
    .lex "$u", $P1634
.annotate 'line', 1558
    new $P110, "Undef"
    set $P1635, $P110
    .lex "$iter", $P1635
.annotate 'line', 1559
    new $P111, "Undef"
    set $P1636, $P111
    .lex "$apost", $P1636
.annotate 'line', 1560
    new $P112, "Undef"
    set $P1637, $P112
    .lex "$bpost", $P1637
.annotate 'line', 1549
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1550
    find_lex $P113, "$ops"
    find_lex $P114, "self"
    $P115 = $P114."unique"("$P")
    $P113."result"($P115)
.annotate 'line', 1552
    get_hll_global $P113, ["POST"], "Label"
    $P114 = $P113."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P114
.annotate 'line', 1553
    get_hll_global $P113, ["POST"], "Label"
    $P114 = $P113."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P114
.annotate 'line', 1555
    find_lex $P113, "self"
    $P114 = $P113."unique"("$I")
    store_lex "$i", $P114
.annotate 'line', 1556
    find_lex $P113, "self"
    $P114 = $P113."unique"("$i")
    store_lex "$t", $P114
.annotate 'line', 1557
    find_lex $P113, "self"
    $P114 = $P113."unique"("$i")
    store_lex "$u", $P114
.annotate 'line', 1558
    get_hll_global $P113, "node"
    $P114 = $P113."iterator"()
    store_lex "$iter", $P114
.annotate 'line', 1559
    find_lex $P113, "self"
    find_lex $P114, "$iter"
    shift $P115, $P114
    $P116 = $P113."as_post"($P115, "P" :named("rtype"))
    store_lex "$apost", $P116
.annotate 'line', 1548
    find_lex $P113, "$bpost"
.annotate 'line', 1561
    find_lex $P113, "$ops"
    find_lex $P114, "$apost"
    $P113."push"($P114)
.annotate 'line', 1562
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$apost"
    $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1563
    find_lex $P113, "$ops"
    find_lex $P114, "$t"
    find_lex $P115, "$apost"
    $P113."push_pirop"("istrue", $P114, $P115)
.annotate 'line', 1564
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1642_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1642_test:
    new $P113, "Integer"
    assign $P113, 1
    unless $P113, loop1642_done
  loop1642_redo:
    .const 'Sub' $P1639 = "76_1308507553.18311" 
    capture_lex $P1639
    $P1639()
  loop1642_next:
    goto loop1642_test
  loop1642_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1642_next
    eq $P116, .CONTROL_LOOP_REDO, loop1642_redo
  loop1642_done:
    pop_eh 
.annotate 'line', 1577
    find_lex $P113, "$ops"
    find_lex $P114, "$t"
    find_lex $P115, "$endlabel"
    $P113."push_pirop"("if", $P114, $P115)
.annotate 'line', 1578
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$bpost"
    $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1579
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push_pirop"("goto", $P114)
.annotate 'line', 1580
    find_lex $P113, "$ops"
    find_lex $P114, "$falselabel"
    $P113."push"($P114)
.annotate 'line', 1581
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    $P113."push_pirop"("new", $P114, "\"Undef\"")
.annotate 'line', 1582
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push"($P114)
.annotate 'line', 1548
    find_lex $P113, "$ops"
    .return ($P113)
  control_1625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1638"  :anon :subid("76_1308507553.18311") :outer("75_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1571
    new $P114, "Undef"
    set $P1640, $P114
    .lex "$truelabel", $P1640
.annotate 'line', 1565
    find_lex $P115, "self"
    find_lex $P116, "$iter"
    shift $P117, $P116
    $P118 = $P115."as_post"($P117, "P" :named("rtype"))
    store_lex "$bpost", $P118
.annotate 'line', 1566
    find_lex $P115, "$ops"
    find_lex $P116, "$bpost"
    $P115."push"($P116)
.annotate 'line', 1567
    find_lex $P115, "$ops"
    find_lex $P116, "$u"
    find_lex $P117, "$bpost"
    $P115."push_pirop"("istrue", $P116, $P117)
.annotate 'line', 1568
    find_lex $P115, "$ops"
    find_lex $P116, "$i"
    find_lex $P117, "$t"
    find_lex $P118, "$u"
    $P115."push_pirop"("and", $P116, $P117, $P118)
.annotate 'line', 1569
    find_lex $P115, "$ops"
    find_lex $P116, "$i"
    find_lex $P117, "$falselabel"
    $P115."push_pirop"("if", $P116, $P117)
.annotate 'line', 1570
    find_lex $P115, "$iter"
    if $P115, unless_1641_end
    die 0, .CONTROL_LOOP_LAST
  unless_1641_end:
.annotate 'line', 1571
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P116
.annotate 'line', 1572
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$truelabel"
    $P115."push_pirop"("if", $P116, $P117)
.annotate 'line', 1573
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1574
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$u"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1575
    find_lex $P115, "$ops"
    find_lex $P116, "$truelabel"
    $P117 = $P115."push"($P116)
.annotate 'line', 1564
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("77_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1646
    .param pmc param_1647 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1591
    new $P1645, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1645, control_1644
    push_eh $P1645
    .lex "self", self
    .lex "$node", param_1646
    .lex "%options", param_1647
.annotate 'line', 1592
    new $P104, "Undef"
    set $P1648, $P104
    .lex "$lpast", $P1648
.annotate 'line', 1593
    new $P105, "Undef"
    set $P1649, $P105
    .lex "$rpast", $P1649
.annotate 'line', 1595
    new $P106, "Undef"
    set $P1650, $P106
    .lex "$ops", $P1650
.annotate 'line', 1596
    new $P107, "Undef"
    set $P1651, $P107
    .lex "$rpost", $P1651
.annotate 'line', 1601
    new $P108, "Undef"
    set $P1652, $P108
    .lex "$lpost", $P1652
.annotate 'line', 1592
    find_lex $P1653, "$node"
    unless_null $P1653, vivify_354
    $P1653 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P109, $P1653[0]
    unless_null $P109, vivify_355
    new $P109, "Undef"
  vivify_355:
    store_lex "$lpast", $P109
.annotate 'line', 1593
    find_lex $P1654, "$node"
    unless_null $P1654, vivify_356
    $P1654 = root_new ['parrot';'ResizablePMCArray']
  vivify_356:
    set $P109, $P1654[1]
    unless_null $P109, vivify_357
    new $P109, "Undef"
  vivify_357:
    store_lex "$rpast", $P109
.annotate 'line', 1595
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1596
    find_lex $P109, "self"
    find_lex $P110, "$rpast"
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$rpost", $P111
.annotate 'line', 1597
    find_lex $P109, "self"
    find_lex $P110, "$rpost"
    $P111 = $P109."coerce"($P110, "P")
    store_lex "$rpost", $P111
.annotate 'line', 1598
    find_lex $P109, "$ops"
    find_lex $P110, "$rpost"
    $P109."push"($P110)
.annotate 'line', 1600
    find_lex $P109, "$lpast"
    $P109."lvalue"(1)
.annotate 'line', 1601
    find_lex $P109, "self"
    find_lex $P110, "$lpast"
    find_lex $P111, "$rpost"
    $P112 = $P109."as_post"($P110, $P111 :named("bindpost"))
    store_lex "$lpost", $P112
.annotate 'line', 1602
    find_lex $P109, "$ops"
    find_lex $P110, "$lpost"
    $P109."push"($P110)
.annotate 'line', 1603
    find_lex $P109, "$ops"
    find_lex $P110, "$lpost"
    $P109."result"($P110)
.annotate 'line', 1591
    find_lex $P109, "$ops"
    .return ($P109)
  control_1644:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("78_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1658
    .param pmc param_1659 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1611
    new $P1657, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1657, control_1656
    push_eh $P1657
    .lex "self", self
    .lex "$node", param_1658
    .lex "%options", param_1659
.annotate 'line', 1612
    new $P104, "Undef"
    set $P1660, $P104
    .lex "$rpost", $P1660
.annotate 'line', 1613
    new $P105, "Undef"
    set $P1661, $P105
    .lex "$lpost", $P1661
.annotate 'line', 1614
    new $P106, "Undef"
    set $P1662, $P106
    .lex "$ops", $P1662
.annotate 'line', 1612
    find_lex $P107, "self"
    find_lex $P1663, "$node"
    unless_null $P1663, vivify_358
    $P1663 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P108, $P1663[1]
    unless_null $P108, vivify_359
    new $P108, "Undef"
  vivify_359:
    $P109 = $P107."as_post"($P108, "P" :named("rtype"))
    store_lex "$rpost", $P109
.annotate 'line', 1613
    find_lex $P107, "self"
    find_lex $P1664, "$node"
    unless_null $P1664, vivify_360
    $P1664 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P108, $P1664[0]
    unless_null $P108, vivify_361
    new $P108, "Undef"
  vivify_361:
    $P109 = $P107."as_post"($P108, "P" :named("rtype"))
    store_lex "$lpost", $P109
.annotate 'line', 1614
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$rpost"
    find_lex $P109, "$lpost"
    find_lex $P110, "$node"
    find_lex $P111, "$lpost"
    $P112 = $P107."new"($P108, $P109, $P110 :named("node"), $P111 :named("result"))
    store_lex "$ops", $P112
.annotate 'line', 1616
    find_lex $P107, "$ops"
    find_lex $P108, "$lpost"
    find_lex $P109, "$rpost"
    $P107."push_pirop"("copy", $P108, $P109)
.annotate 'line', 1611
    find_lex $P107, "$ops"
    .return ($P107)
  control_1656:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("79_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Op"])
    .param pmc param_1668
    .param pmc param_1669 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1625
    new $P1667, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1667, control_1666
    push_eh $P1667
    .lex "self", self
    .lex "$node", param_1668
    .lex "%options", param_1669
.annotate 'line', 1630
    new $P104, "Undef"
    set $P1670, $P104
    .lex "$ops", $P1670
.annotate 'line', 1631
    new $P105, "Undef"
    set $P1671, $P105
    .lex "$inline", $P1671
.annotate 'line', 1634
    new $P106, "Undef"
    set $P1672, $P106
    .lex "$result", $P1672
.annotate 'line', 1635
    new $P107, "Undef"
    set $P1673, $P107
    .lex "$i", $P1673
.annotate 'line', 1648
    $P1675 = root_new ['parrot';'ResizablePMCArray']
    set $P1674, $P1675
    .lex "@arglist", $P1674
.annotate 'line', 1650
    new $P108, "Undef"
    set $P1676, $P108
    .lex "$s", $P1676
.annotate 'line', 1630
    find_lex $P109, "self"
    find_lex $P110, "$node"
    $P111 = $P109."post_children"($P110, "vP" :named("signature"))
    store_lex "$ops", $P111
.annotate 'line', 1631
    find_lex $P109, "$node"
    $P110 = $P109."inline"()
    store_lex "$inline", $P110
.annotate 'line', 1632
    find_lex $P109, "$inline"
    does $I101, $P109, "array"
    unless $I101, if_1677_end
    find_lex $P110, "$inline"
    join $S101, "\n", $P110
    new $P111, 'String'
    set $P111, $S101
    store_lex "$inline", $P111
  if_1677_end:
.annotate 'line', 1634
    new $P109, "String"
    assign $P109, ""
    store_lex "$result", $P109
.annotate 'line', 1635
    find_lex $P109, "$inline"
    set $S101, $P109
    index $I101, $S101, "%t"
    new $P110, 'Integer'
    set $P110, $I101
    store_lex "$i", $P110
.annotate 'line', 1636
    find_lex $P109, "$i"
    set $N101, $P109
    isge $I101, $N101, 0.0
    if $I101, if_1678
.annotate 'line', 1642
    find_lex $P110, "$inline"
    set $S101, $P110
    index $I102, $S101, "%r"
    new $P111, 'Integer'
    set $P111, $I102
    store_lex "$i", $P111
.annotate 'line', 1643
    find_lex $P110, "$i"
    set $N102, $P110
    isge $I102, $N102, 0.0
    unless $I102, if_1679_end
.annotate 'line', 1644
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    store_lex "$result", $P112
.annotate 'line', 1645
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
  if_1679_end:
.annotate 'line', 1641
    goto if_1678_end
  if_1678:
.annotate 'line', 1637
    find_lex $P110, "self"
    $P111 = $P110."unique"("$P")
    store_lex "$result", $P111
.annotate 'line', 1638
    find_lex $P110, "$ops"
    find_lex $P111, "$result"
    $P110."push_pirop"("new", $P111, "'Undef'")
.annotate 'line', 1639
    find_lex $P110, "$ops"
    find_lex $P111, "$result"
    $P110."result"($P111)
  if_1678_end:
.annotate 'line', 1648
    find_lex $P109, "$ops"
    $P110 = $P109."list"()
    store_lex "@arglist", $P110
.annotate 'line', 1649
    find_lex $P109, "$ops"
    find_lex $P110, "@arglist"
    find_lex $P111, "$inline"
    find_lex $P112, "$result"
    $P109."push_pirop"("inline", $P110 :flat, $P111 :named("inline"), $P112 :named("result"))
.annotate 'line', 1650
    find_lex $P1680, "%options"
    unless_null $P1680, vivify_362
    $P1680 = root_new ['parrot';'Hash']
  vivify_362:
    set $P109, $P1680["rtype"]
    unless_null $P109, vivify_363
    new $P109, "Undef"
  vivify_363:
    store_lex "$s", $P109
.annotate 'line', 1625
    find_lex $P109, "$ops"
    .return ($P109)
  control_1666:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("80_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"])
    .param pmc param_1684
    .param pmc param_1685 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1662
    .const 'Sub' $P1725 = "84_1308507553.18311" 
    capture_lex $P1725
    .const 'Sub' $P1714 = "83_1308507553.18311" 
    capture_lex $P1714
    .const 'Sub' $P1690 = "81_1308507553.18311" 
    capture_lex $P1690
    new $P1683, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1683, control_1682
    push_eh $P1683
    .lex "self", self
    .lex "$node", param_1684
    .lex "%options", param_1685
.annotate 'line', 1664
    new $P104, "Undef"
    set $P1686, $P104
    .lex "$bindpost", $P1686
.annotate 'line', 1668
    new $P105, "Undef"
    set $P1687, $P105
    .lex "$scope", $P1687
.annotate 'line', 1669
    new $P106, "Undef"
    set $P1688, $P106
    .lex "$name", $P1688
.annotate 'line', 1688
    .const 'Sub' $P1690 = "81_1308507553.18311" 
    newclosure $P1709, $P1690
    set $P1689, $P1709
    .lex "scope_error", $P1689
.annotate 'line', 1664
    find_lex $P1710, "%options"
    unless_null $P1710, vivify_371
    $P1710 = root_new ['parrot';'Hash']
  vivify_371:
    set $P113, $P1710["bindpost"]
    unless_null $P113, vivify_372
    new $P113, "Undef"
  vivify_372:
    store_lex "$bindpost", $P113
.annotate 'line', 1665
    find_lex $P113, "$bindpost"
    if $P113, unless_1711_end
    new $P114, "Undef"
    store_lex "$bindpost", $P114
  unless_1711_end:
.annotate 'line', 1668
    find_lex $P113, "$node"
    $P114 = $P113."scope"()
    store_lex "$scope", $P114
.annotate 'line', 1669
    find_lex $P113, "$node"
    $P114 = $P113."name"()
    store_lex "$name", $P114
.annotate 'line', 1670
    find_lex $P113, "$scope"
    if $P113, unless_1712_end
    .const 'Sub' $P1714 = "83_1308507553.18311" 
    capture_lex $P1714
    $P1714()
  unless_1712_end:
.annotate 'line', 1683
    .const 'Sub' $P1725 = "84_1308507553.18311" 
    capture_lex $P1725
    $P1725()
.annotate 'line', 1662
    find_lex $P113, "scope_error"
    .return ($P113)
  control_1682:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("81_1308507553.18311") :outer("80_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1688
    .const 'Sub' $P1700 = "82_1308507553.18311" 
    capture_lex $P1700
    new $P1692, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1692, control_1691
    push_eh $P1692
.annotate 'line', 1690
    new $P107, "Undef"
    set $P1693, $P107
    .lex "$blockname", $P1693
.annotate 'line', 1697
    new $P108, "Undef"
    set $P1694, $P108
    .lex "$sourceline", $P1694
.annotate 'line', 1698
    new $P109, "Undef"
    set $P1695, $P109
    .lex "$source", $P1695
.annotate 'line', 1699
    new $P110, "Undef"
    set $P1696, $P110
    .lex "$pos", $P1696
.annotate 'line', 1700
    new $P111, "Undef"
    set $P1697, $P111
    .lex "$files", $P1697
.annotate 'line', 1689
    find_lex $P112, "$scope"
    unless $P112, if_1698_end
    new $P113, 'String'
    set $P113, " in '"
    find_lex $P114, "$scope"
    concat $P115, $P113, $P114
    concat $P116, $P115, "' scope"
    store_lex "$scope", $P116
  if_1698_end:
.annotate 'line', 1690
    new $P112, "String"
    assign $P112, ""
    store_lex "$blockname", $P112
.annotate 'line', 1691
    find_dynamic_lex $P113, "@*BLOCKPAST"
    unless_null $P113, vivify_364
    get_hll_global $P113, "@BLOCKPAST"
    unless_null $P113, vivify_365
    die "Contextual @*BLOCKPAST not found"
  vivify_365:
  vivify_364:
    defined $I101, $P113
    unless $I101, for_undef_366
    iter $P112, $P113
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1703_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1703_test:
    unless $P112, loop1703_done
    shift $P114, $P112
  loop1703_redo:
    .const 'Sub' $P1700 = "82_1308507553.18311" 
    capture_lex $P1700
    $P1700($P114)
  loop1703_next:
    goto loop1703_test
  loop1703_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1703_next
    eq $P117, .CONTROL_LOOP_REDO, loop1703_redo
  loop1703_done:
    pop_eh 
  for_undef_366:
.annotate 'line', 1695
    find_lex $P112, "$blockname"
    if $P112, unless_1704_end
    new $P113, "String"
    assign $P113, "<anonymous>"
    store_lex "$blockname", $P113
  unless_1704_end:
.annotate 'line', 1697
    new $P112, "String"
    assign $P112, ""
    store_lex "$sourceline", $P112
.annotate 'line', 1698
    find_lex $P1705, "$node"
    unless_null $P1705, vivify_367
    $P1705 = root_new ['parrot';'Hash']
  vivify_367:
    set $P112, $P1705["source"]
    unless_null $P112, vivify_368
    new $P112, "Undef"
  vivify_368:
    store_lex "$source", $P112
.annotate 'line', 1699
    find_lex $P1706, "$node"
    unless_null $P1706, vivify_369
    $P1706 = root_new ['parrot';'Hash']
  vivify_369:
    set $P112, $P1706["pos"]
    unless_null $P112, vivify_370
    new $P112, "Undef"
  vivify_370:
    store_lex "$pos", $P112
.annotate 'line', 1700
    find_caller_lex $P112, "$?FILES"
    store_lex "$files", $P112
.annotate 'line', 1701
    find_lex $P113, "$source"
    if $P113, if_1708
    set $P112, $P113
    goto if_1708_end
  if_1708:
    find_lex $P114, "$files"
    set $P112, $P114
  if_1708_end:
    if $P112, unless_1707_end
.annotate 'line', 1702
    new $P115, "String"
    assign $P115, " ("
    find_lex $P116, "$files"
    concat $P117, $P115, $P116
    concat $P118, $P117, ":"
.annotate 'line', 1703
    find_lex $P119, "self"
    find_lex $P120, "$source"
    find_lex $P121, "$pos"
    $P122 = $P119."lineof"($P120, $P121)
    add $P123, $P122, 1
    concat $P124, $P118, $P123
.annotate 'line', 1702
    concat $P125, $P124, ")"
.annotate 'line', 1703
    store_lex "$sourceline", $P125
  unless_1707_end:
.annotate 'line', 1705
    find_lex $P112, "self"
    new $P113, 'String'
    set $P113, "Symbol '"
    find_lex $P114, "$name"
    concat $P115, $P113, $P114
    concat $P116, $P115, "' not predeclared"
    find_lex $P117, "$scope"
    find_lex $P118, "$blockname"
    find_lex $P119, "$sourceline"
    $P120 = $P112."panic"($P116, $P117, " in ", $P118, $P119)
.annotate 'line', 1688
    .return ($P120)
  control_1691:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1699"  :anon :subid("82_1308507553.18311") :outer("81_1308507553.18311")
    .param pmc param_1701
.annotate 'file', ''
.annotate 'line', 1691
    .lex "$_", param_1701
.annotate 'line', 1692
    find_lex $P115, "$_"
    $P116 = $P115."name"()
    store_lex "$blockname", $P116
.annotate 'line', 1693
    find_lex $P116, "$blockname"
    if $P116, if_1702
    set $P115, $P116
    goto if_1702_end
  if_1702:
    die 0, .CONTROL_LOOP_LAST
  if_1702_end:
.annotate 'line', 1691
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1713"  :anon :subid("83_1308507553.18311") :outer("80_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1672
    new $P114, "Undef"
    set $P1715, $P114
    .lex "$P0", $P1715
    find_lex $P115, "$name"
    find_lex $P116, "self"
    getattribute $P1716, $P116, "%!symtable"
    unless_null $P1716, vivify_373
    $P1716 = root_new ['parrot';'Hash']
  vivify_373:
    set $P117, $P1716[$P115]
    unless_null $P117, vivify_374
    new $P117, "Undef"
  vivify_374:
    store_lex "$P0", $P117
.annotate 'line', 1673
    find_lex $P115, "$P0"
    unless $P115, if_1717_end
    find_lex $P1718, "$P0"
    unless_null $P1718, vivify_375
    $P1718 = root_new ['parrot';'Hash']
  vivify_375:
    set $P116, $P1718["scope"]
    unless_null $P116, vivify_376
    new $P116, "Undef"
  vivify_376:
    store_lex "$scope", $P116
  if_1717_end:
.annotate 'line', 1674
    find_lex $P116, "$scope"
    unless $P116, unless_1719
    set $P115, $P116
    goto unless_1719_end
  unless_1719:
.annotate 'line', 1676
    find_lex $P117, "self"
    getattribute $P1720, $P117, "%!symtable"
    unless_null $P1720, vivify_377
    $P1720 = root_new ['parrot';'Hash']
  vivify_377:
    set $P118, $P1720[""]
    unless_null $P118, vivify_378
    new $P118, "Undef"
  vivify_378:
    store_lex "$P0", $P118
.annotate 'line', 1677
    find_lex $P117, "$P0"
    if $P117, unless_1721_end
    "scope_error"()
  unless_1721_end:
.annotate 'line', 1678
    find_lex $P1722, "$P0"
    unless_null $P1722, vivify_379
    $P1722 = root_new ['parrot';'Hash']
  vivify_379:
    set $P117, $P1722["scope"]
    unless_null $P117, vivify_380
    new $P117, "Undef"
  vivify_380:
    store_lex "$scope", $P117
.annotate 'line', 1679
    find_lex $P118, "$scope"
    unless $P118, unless_1723
    set $P117, $P118
    goto unless_1723_end
  unless_1723:
    $P119 = "scope_error"()
    set $P117, $P119
  unless_1723_end:
.annotate 'line', 1674
    set $P115, $P117
  unless_1719_end:
.annotate 'line', 1670
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1724"  :anon :subid("84_1308507553.18311") :outer("80_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1683
    .const 'Sub' $P1732 = "85_1308507553.18311" 
    capture_lex $P1732
    new $P1728, 'ExceptionHandler'
    set_label $P1728, control_1727
    $P1728."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1728
.annotate 'line', 1684
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "self"
    find_lex $P115, "$node"
    find_lex $P116, "$bindpost"
    find_lex $P117, "$scope"
    set $S101, $P117
    $P118 = $P114.$S101($P115, $P116)
    setattribute $P113, 'payload', $P118
    throw $P113
.annotate 'line', 1683
    pop_eh 
    goto skip_handler_1726
  control_1727:
.annotate 'line', 1685
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1732 = "85_1308507553.18311" 
    newclosure $P1737, $P1732
    $P1737(exception)
    new $P1738, 'Integer'
    set $P1738, 1
    set exception["handled"], $P1738
    set $I1739, exception["handled"]
    ne $I1739, 1, nothandled_1730
  handled_1729:
    .return (exception)
  nothandled_1730:
    rethrow exception
  skip_handler_1726:
.annotate 'line', 1683
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1731"  :anon :subid("85_1308507553.18311") :outer("84_1308507553.18311")
    .param pmc param_1733
.annotate 'file', ''
.annotate 'line', 1685
    .lex "$_", param_1733
    find_lex $P1734, "$_"
    set $P1735, $P1734
    .lex "$!", $P1735
    $P1736 = "scope_error"()
    .return ($P1736)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("86_1308507553.18311") :method :outer("11_1308507553.18311")
    .param pmc param_1743
    .param pmc param_1744
    .param pmc param_1745
    .param pmc param_1746
.annotate 'file', ''
.annotate 'line', 1711
    .const 'Sub' $P1753 = "87_1308507553.18311" 
    capture_lex $P1753
    new $P1742, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1742, control_1741
    push_eh $P1742
    .lex "self", self
    .lex "$node", param_1743
    .lex "$ops", param_1744
    .lex "$fetchop", param_1745
    .lex "$storeop", param_1746
.annotate 'line', 1712
    new $P104, "Undef"
    set $P1747, $P104
    .lex "$viviself", $P1747
.annotate 'line', 1713
    new $P105, "Undef"
    set $P1748, $P105
    .lex "$vivipost", $P1748
.annotate 'line', 1714
    new $P106, "Undef"
    set $P1749, $P106
    .lex "$result", $P1749
.annotate 'line', 1712
    find_lex $P107, "$node"
    $P108 = $P107."viviself"()
    store_lex "$viviself", $P108
.annotate 'line', 1713
    find_lex $P107, "self"
    find_lex $P108, "$viviself"
    $P109 = $P107."as_vivipost"($P108, "P" :named("rtype"))
    store_lex "$vivipost", $P109
.annotate 'line', 1714
    find_lex $P107, "$vivipost"
    $P108 = $P107."result"()
    store_lex "$result", $P108
.annotate 'line', 1715
    find_lex $P107, "$result"
    set $S101, $P107
    iseq $I101, $S101, ""
    unless $I101, if_1750_end
    find_lex $P108, "self"
    $P109 = $P108."tempreg"("P")
    store_lex "$result", $P109
  if_1750_end:
.annotate 'line', 1717
    find_lex $P107, "$ops"
    find_lex $P108, "$result"
    $P107."result"($P108)
.annotate 'line', 1718
    find_lex $P107, "$ops"
    find_lex $P108, "$fetchop"
    $P107."push"($P108)
.annotate 'line', 1719
    find_lex $P107, "$viviself"
    unless $P107, if_1751_end
    .const 'Sub' $P1753 = "87_1308507553.18311" 
    capture_lex $P1753
    $P1753()
  if_1751_end:
.annotate 'line', 1711
    find_lex $P107, "$ops"
    .return ($P107)
  control_1741:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1752"  :anon :subid("87_1308507553.18311") :outer("86_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1720
    new $P108, "Undef"
    set $P1754, $P108
    .lex "$vivilabel", $P1754
    get_hll_global $P109, ["POST"], "Label"
    $P110 = $P109."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P110
.annotate 'line', 1721
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    find_lex $P111, "$vivilabel"
    $P109."push_pirop"("unless_null", $P110, $P111)
.annotate 'line', 1722
    find_lex $P109, "$ops"
    find_lex $P110, "$vivipost"
    $P109."push"($P110)
.annotate 'line', 1723
    find_lex $P109, "$node"
    $P110 = $P109."lvalue"()
    unless $P110, if_1755_end
    find_lex $P111, "$ops"
    find_lex $P112, "$storeop"
    $P111."push"($P112)
  if_1755_end:
.annotate 'line', 1724
    find_lex $P109, "$ops"
    find_lex $P110, "$vivilabel"
    $P111 = $P109."push"($P110)
.annotate 'line', 1719
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("88_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1759
    .param pmc param_1760
.annotate 'file', ''
.annotate 'line', 1730
    .const 'Sub' $P1768 = "89_1308507553.18311" 
    capture_lex $P1768
    new $P1758, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1758, control_1757
    push_eh $P1758
    .lex "self", self
    .lex "$node", param_1759
    .lex "$bindpost", param_1760
.annotate 'line', 1732
    new $P104, "Undef"
    set $P1761, $P104
    .lex "$name", $P1761
.annotate 'line', 1733
    new $P105, "Undef"
    set $P1762, $P105
    .lex "$named", $P1762
.annotate 'line', 1734
    new $P106, "Undef"
    set $P1763, $P106
    .lex "$pname", $P1763
.annotate 'line', 1737
    new $P107, "Undef"
    set $P1764, $P107
    .lex "$ops", $P1764
.annotate 'line', 1739
    new $P108, "Undef"
    set $P1765, $P108
    .lex "$viviself", $P1765
.annotate 'line', 1732
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    store_lex "$name", $P110
.annotate 'line', 1733
    find_lex $P109, "$node"
    $P110 = $P109."named"()
    store_lex "$named", $P110
.annotate 'line', 1734
    find_lex $P109, "self"
    $P110 = $P109."unique"("param_")
    store_lex "$pname", $P110
.annotate 'line', 1737
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    find_lex $P111, "$pname"
    $P112 = $P109."new"($P110 :named("node"), $P111 :named("result"))
    store_lex "$ops", $P112
.annotate 'line', 1739
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 1740
    find_lex $P109, "$viviself"
    if $P109, if_1766
.annotate 'line', 1751
    find_dynamic_lex $P112, "$*SUB"
    unless_null $P112, vivify_381
    get_hll_global $P112, "$SUB"
    unless_null $P112, vivify_382
    die "Contextual $*SUB not found"
  vivify_382:
  vivify_381:
    find_lex $P113, "$pname"
    find_lex $P115, "$named"
.annotate 'line', 1752
    find_lex $P116, "$node"
    $P117 = $P116."slurpy"()
    find_lex $P118, "$node"
    $P119 = $P118."call_sig"()
.annotate 'line', 1751
    $P112."add_param"($P113, $P115 :named("named"), $P117 :named("slurpy"), $P119 :named("call_sig"))
.annotate 'line', 1750
    goto if_1766_end
  if_1766:
.annotate 'line', 1740
    .const 'Sub' $P1768 = "89_1308507553.18311" 
    capture_lex $P1768
    $P1768()
  if_1766_end:
.annotate 'line', 1755
    find_lex $P109, "$name"
    defined $I101, $P109
    unless $I101, if_1771_end
.annotate 'line', 1756
    find_lex $P110, "$ops"
    find_lex $P111, "self"
    find_lex $P112, "$name"
    $P113 = $P111."escape"($P112)
    find_lex $P114, "$ops"
    $P110."push_pirop"(".lex", $P113, $P114)
  if_1771_end:
.annotate 'line', 1730
    find_lex $P109, "$ops"
    .return ($P109)
  control_1757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1767"  :anon :subid("89_1308507553.18311") :outer("88_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1742
    new $P110, "Undef"
    set $P1769, $P110
    .lex "$vivipost", $P1769
.annotate 'line', 1743
    new $P111, "Undef"
    set $P1770, $P111
    .lex "$vivilabel", $P1770
.annotate 'line', 1742
    find_lex $P112, "self"
    find_lex $P113, "$viviself"
    $P114 = $P112."as_vivipost"($P113, "P" :named("rtype"))
    store_lex "$vivipost", $P114
.annotate 'line', 1743
    get_hll_global $P112, ["POST"], "Label"
    $P113 = $P112."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P113
.annotate 'line', 1744
    find_dynamic_lex $P112, "$*SUB"
    unless_null $P112, vivify_383
    get_hll_global $P112, "$SUB"
    unless_null $P112, vivify_384
    die "Contextual $*SUB not found"
  vivify_384:
  vivify_383:
    find_lex $P113, "$pname"
    find_lex $P114, "$named"
    $P112."add_param"($P113, $P114 :named("named"), 1 :named("optional"))
.annotate 'line', 1745
    find_lex $P112, "$ops"
    new $P113, 'String'
    set $P113, "has_"
    find_lex $P114, "$pname"
    concat $P115, $P113, $P114
    find_lex $P116, "$vivilabel"
    $P112."push_pirop"("if", $P115, $P116)
.annotate 'line', 1746
    find_lex $P112, "$ops"
    find_lex $P113, "$vivipost"
    $P112."push"($P113)
.annotate 'line', 1747
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P112."push_pirop"("set", $P113, $P114)
.annotate 'line', 1748
    find_lex $P112, "$ops"
    find_lex $P113, "$vivilabel"
    $P114 = $P112."push"($P113)
.annotate 'line', 1740
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("90_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1775
    .param pmc param_1776
.annotate 'file', ''
.annotate 'line', 1763
    new $P1774, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1774, control_1773
    push_eh $P1774
    .lex "self", self
    .lex "$node", param_1775
    .lex "$bindpost", param_1776
.annotate 'line', 1764
    new $P104, "Undef"
    set $P1777, $P104
    .lex "$ops", $P1777
.annotate 'line', 1765
    new $P105, "Undef"
    set $P1778, $P105
    .lex "$name", $P1778
.annotate 'line', 1766
    new $P106, "Undef"
    set $P1779, $P106
    .lex "$ns", $P1779
.annotate 'line', 1768
    new $P107, "Undef"
    set $P1780, $P107
    .lex "$fetchop", $P1780
.annotate 'line', 1769
    new $P108, "Undef"
    set $P1781, $P108
    .lex "$storeop", $P1781
.annotate 'line', 1770
    $P1783 = root_new ['parrot';'ResizablePMCArray']
    set $P1782, $P1783
    .lex "@name", $P1782
.annotate 'line', 1764
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1765
    find_lex $P109, "self"
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    $P112 = $P109."escape"($P111)
    store_lex "$name", $P112
.annotate 'line', 1766
    find_lex $P109, "$node"
    $P110 = $P109."namespace"()
    store_lex "$ns", $P110
.annotate 'line', 1768
    new $P109, "String"
    assign $P109, "get_global"
    store_lex "$fetchop", $P109
.annotate 'line', 1769
    new $P109, "String"
    assign $P109, "set_global"
    store_lex "$storeop", $P109
.annotate 'line', 1770
    find_lex $P109, "$name"
    new $P110, "ResizablePMCArray"
    push $P110, $P109
    store_lex "@name", $P110
.annotate 'line', 1772
    find_lex $P109, "$ns"
    defined $I101, $P109
    unless $I101, if_1784_end
.annotate 'line', 1773
    new $P110, "String"
    assign $P110, "get_hll_global"
    store_lex "$fetchop", $P110
.annotate 'line', 1774
    new $P110, "String"
    assign $P110, "set_hll_global"
    store_lex "$storeop", $P110
.annotate 'line', 1776
    find_lex $P110, "$ns"
    unless $P110, if_1785_end
.annotate 'line', 1777
    get_hll_global $P111, ["POST"], "Compiler"
    find_lex $P112, "$ns"
    $P113 = $P111."key_pir"($P112)
    store_lex "$ns", $P113
.annotate 'line', 1778
    find_lex $P111, "@name"
    find_lex $P112, "$ns"
    $P111."unshift"($P112)
  if_1785_end:
  if_1784_end:
.annotate 'line', 1782
    find_lex $P109, "$bindpost"
    unless $P109, if_1786_end
.annotate 'line', 1783
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@name"
    find_lex $P113, "$bindpost"
    find_lex $P114, "$storeop"
    find_lex $P115, "$bindpost"
    $P116 = $P111."new"($P112 :flat, $P113, $P114 :named("pirop"), $P115 :named("result"))
    setattribute $P110, 'payload', $P116
    throw $P110
  if_1786_end:
.annotate 'line', 1787
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$ops"
    find_lex $P111, "@name"
    find_lex $P112, "$fetchop"
    $P113 = $P109."new"($P110, $P111 :flat, $P112 :named("pirop"))
    store_lex "$fetchop", $P113
.annotate 'line', 1788
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "@name"
    find_lex $P111, "$ops"
    find_lex $P112, "$storeop"
    $P113 = $P109."new"($P110 :flat, $P111, $P112 :named("pirop"))
    store_lex "$storeop", $P113
.annotate 'line', 1789
    new $P109, "Exception"
    set $P109['type'], .CONTROL_RETURN
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$ops"
    find_lex $P113, "$fetchop"
    find_lex $P114, "$storeop"
    $P115 = $P110."vivify"($P111, $P112, $P113, $P114)
    setattribute $P109, 'payload', $P115
    throw $P109
.annotate 'line', 1763
    .return ()
  control_1773:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("91_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1790
    .param pmc param_1791
.annotate 'file', ''
.annotate 'line', 1793
    .const 'Sub' $P1804 = "93_1308507553.18311" 
    capture_lex $P1804
    .const 'Sub' $P1796 = "92_1308507553.18311" 
    capture_lex $P1796
    new $P1789, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1789, control_1788
    push_eh $P1789
    .lex "self", self
    .lex "$node", param_1790
    .lex "$bindpost", param_1791
.annotate 'line', 1794
    new $P104, "Undef"
    set $P1792, $P104
    .lex "$name", $P1792
.annotate 'line', 1795
    new $P105, "Undef"
    set $P1793, $P105
    .lex "$isdecl", $P1793
.annotate 'line', 1794
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P107."name"()
    $P109 = $P106."escape"($P108)
    store_lex "$name", $P109
.annotate 'line', 1795
    find_lex $P106, "$node"
    $P107 = $P106."isdecl"()
    store_lex "$isdecl", $P107
.annotate 'line', 1797
    find_lex $P107, "$isdecl"
    if $P107, if_1794
.annotate 'line', 1814
    .const 'Sub' $P1804 = "93_1308507553.18311" 
    capture_lex $P1804
    $P115 = $P1804()
    set $P106, $P115
.annotate 'line', 1797
    goto if_1794_end
  if_1794:
    .const 'Sub' $P1796 = "92_1308507553.18311" 
    capture_lex $P1796
    $P111 = $P1796()
    set $P106, $P111
  if_1794_end:
.annotate 'line', 1793
    .return ($P106)
  control_1788:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1803"  :anon :subid("93_1308507553.18311") :outer("91_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1820
    new $P112, "Undef"
    set $P1805, $P112
    .lex "$ops", $P1805
.annotate 'line', 1821
    new $P113, "Undef"
    set $P1806, $P113
    .lex "$fetchop", $P1806
.annotate 'line', 1822
    new $P114, "Undef"
    set $P1807, $P114
    .lex "$storeop", $P1807
.annotate 'line', 1815
    find_lex $P115, "$bindpost"
    unless $P115, if_1808_end
.annotate 'line', 1816
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    get_hll_global $P117, ["POST"], "Op"
    find_lex $P118, "$name"
    find_lex $P119, "$bindpost"
    find_lex $P120, "$bindpost"
    $P121 = $P117."new"($P118, $P119, "store_lex" :named("pirop"), $P120 :named("result"))
    setattribute $P116, 'payload', $P121
    throw $P116
  if_1808_end:
.annotate 'line', 1820
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1821
    get_hll_global $P115, ["POST"], "Op"
    find_lex $P116, "$ops"
    find_lex $P117, "$name"
    $P118 = $P115."new"($P116, $P117, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P118
.annotate 'line', 1822
    get_hll_global $P115, ["POST"], "Op"
    find_lex $P116, "$name"
    find_lex $P117, "$ops"
    $P118 = $P115."new"($P116, $P117, "store_lex" :named("pirop"))
    store_lex "$storeop", $P118
.annotate 'line', 1823
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "self"
    find_lex $P117, "$node"
    find_lex $P118, "$ops"
    find_lex $P119, "$fetchop"
    find_lex $P120, "$storeop"
    $P121 = $P116."vivify"($P117, $P118, $P119, $P120)
    setattribute $P115, 'payload', $P121
    throw $P115
.annotate 'line', 1814
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1795"  :anon :subid("92_1308507553.18311") :outer("91_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1799
    new $P108, "Undef"
    set $P1797, $P108
    .lex "$lexreg", $P1797
.annotate 'line', 1800
    new $P109, "Undef"
    set $P1798, $P109
    .lex "$ops", $P1798
.annotate 'line', 1801
    new $P110, "Undef"
    set $P1799, $P110
    .lex "$viviself", $P1799
.annotate 'line', 1799
    find_lex $P111, "self"
    $P112 = $P111."uniquereg"("P")
    store_lex "$lexreg", $P112
.annotate 'line', 1800
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1801
    find_lex $P111, "$node"
    $P112 = $P111."viviself"()
    store_lex "$viviself", $P112
.annotate 'line', 1803
    find_lex $P112, "$bindpost"
    isfalse $I101, $P112
    if $I101, if_1801
    new $P111, 'Integer'
    set $P111, $I101
    goto if_1801_end
  if_1801:
    find_lex $P113, "$viviself"
    set $P111, $P113
  if_1801_end:
    unless $P111, if_1800_end
.annotate 'line', 1804
    find_lex $P114, "self"
    find_lex $P115, "$viviself"
    $P116 = $P114."as_vivipost"($P115, "P" :named("rtype"))
    store_lex "$bindpost", $P116
.annotate 'line', 1805
    find_lex $P114, "$ops"
    find_lex $P115, "$bindpost"
    $P114."push"($P115)
  if_1800_end:
.annotate 'line', 1808
    find_lex $P111, "$bindpost"
    unless $P111, if_1802_end
    find_lex $P112, "$ops"
    find_lex $P113, "$lexreg"
    find_lex $P114, "$bindpost"
    $P112."push_pirop"("set", $P113, $P114)
  if_1802_end:
.annotate 'line', 1810
    find_lex $P111, "$ops"
    find_lex $P112, "$name"
    find_lex $P113, "$lexreg"
    $P111."push_pirop"(".lex", $P112, $P113)
.annotate 'line', 1811
    find_lex $P111, "$ops"
    find_lex $P112, "$lexreg"
    $P111."result"($P112)
.annotate 'line', 1812
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
.annotate 'line', 1797
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("94_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1812
    .param pmc param_1813
.annotate 'file', ''
.annotate 'line', 1828
    .const 'Sub' $P1824 = "95_1308507553.18311" 
    capture_lex $P1824
    new $P1811, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1811, control_1810
    push_eh $P1811
    .lex "self", self
    .lex "$node", param_1812
    .lex "$bindpost", param_1813
.annotate 'line', 1833
    new $P104, "Undef"
    set $P1814, $P104
    .lex "$name", $P1814
.annotate 'line', 1835
    $P1816 = root_new ['parrot';'Hash']
    set $P1815, $P1816
    .lex "%symtable", $P1815
.annotate 'line', 1857
    new $P105, "Undef"
    set $P1817, $P105
    .lex "$ops", $P1817
.annotate 'line', 1858
    new $P106, "Undef"
    set $P1818, $P106
    .lex "$fetchop", $P1818
.annotate 'line', 1859
    new $P107, "Undef"
    set $P1819, $P107
    .lex "$storeop", $P1819
.annotate 'line', 1833
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    store_lex "$name", $P109
.annotate 'line', 1835
    find_dynamic_lex $P108, "@*BLOCKPAST"
    unless_null $P108, vivify_385
    get_hll_global $P108, "@BLOCKPAST"
    unless_null $P108, vivify_386
    die "Contextual @*BLOCKPAST not found"
  vivify_386:
  vivify_385:
    set $P109, $P108[0]
    unless_null $P109, vivify_387
    new $P109, "Undef"
  vivify_387:
    $P110 = $P109."symtable"()
    store_lex "%symtable", $P110
.annotate 'line', 1836
    find_lex $P108, "%symtable"
    defined $I101, $P108
    unless $I101, if_1820_end
.annotate 'line', 1837
    find_lex $P109, "$name"
    find_lex $P1821, "%symtable"
    unless_null $P1821, vivify_388
    $P1821 = root_new ['parrot';'Hash']
  vivify_388:
    set $P110, $P1821[$P109]
    unless_null $P110, vivify_389
    new $P110, "Undef"
  vivify_389:
    store_lex "%symtable", $P110
.annotate 'line', 1838
    find_lex $P109, "%symtable"
    defined $I102, $P109
    unless $I102, if_1822_end
    .const 'Sub' $P1824 = "95_1308507553.18311" 
    capture_lex $P1824
    $P1824()
  if_1822_end:
  if_1820_end:
.annotate 'line', 1847
    find_lex $P108, "$node"
    $P109 = $P108."isdecl"()
    unless $P109, if_1829_end
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$bindpost"
    $P114 = $P111."lexical"($P112, $P113)
    setattribute $P110, 'payload', $P114
    throw $P110
  if_1829_end:
.annotate 'line', 1849
    find_lex $P108, "self"
    find_lex $P109, "$name"
    $P110 = $P108."escape"($P109)
    store_lex "$name", $P110
.annotate 'line', 1851
    find_lex $P108, "$bindpost"
    unless $P108, if_1830_end
.annotate 'line', 1852
    new $P109, "Exception"
    set $P109['type'], .CONTROL_RETURN
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$name"
    find_lex $P112, "$bindpost"
    find_lex $P113, "$bindpost"
    $P114 = $P110."new"($P111, $P112, "store_dynamic_lex" :named("pirop"), $P113 :named("result"))
    setattribute $P109, 'payload', $P114
    throw $P109
  if_1830_end:
.annotate 'line', 1857
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$node"
    $P110 = $P108."new"($P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1858
    get_hll_global $P108, ["POST"], "Op"
    find_lex $P109, "$ops"
    find_lex $P110, "$name"
    $P111 = $P108."new"($P109, $P110, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P111
.annotate 'line', 1859
    get_hll_global $P108, ["POST"], "Op"
    find_lex $P109, "$name"
    find_lex $P110, "$ops"
    $P111 = $P108."new"($P109, $P110, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P111
.annotate 'line', 1860
    find_lex $P108, "self"
    find_lex $P109, "$node"
    find_lex $P110, "$ops"
    find_lex $P111, "$fetchop"
    find_lex $P112, "$storeop"
    $P113 = $P108."vivify"($P109, $P110, $P111, $P112)
.annotate 'line', 1828
    .return ($P113)
  control_1810:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1823"  :anon :subid("95_1308507553.18311") :outer("94_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1839
    new $P110, "Undef"
    set $P1825, $P110
    .lex "$scope", $P1825
    find_lex $P1826, "%symtable"
    unless_null $P1826, vivify_390
    $P1826 = root_new ['parrot';'Hash']
  vivify_390:
    set $P111, $P1826["scope"]
    unless_null $P111, vivify_391
    new $P111, "Undef"
  vivify_391:
    store_lex "$scope", $P111
.annotate 'line', 1840
    find_lex $P113, "$scope"
    if $P113, if_1828
    set $P112, $P113
    goto if_1828_end
  if_1828:
    find_lex $P114, "$scope"
    set $S101, $P114
    isne $I103, $S101, "contextual"
    new $P112, 'Integer'
    set $P112, $I103
  if_1828_end:
    if $P112, if_1827
    set $P111, $P112
    goto if_1827_end
  if_1827:
.annotate 'line', 1841
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "self"
    find_lex $P117, "$node"
    find_lex $P118, "$bindpost"
    find_lex $P119, "$scope"
    set $S102, $P119
    $P120 = $P116.$S102($P117, $P118)
    setattribute $P115, 'payload', $P120
    throw $P115
  if_1827_end:
.annotate 'line', 1838
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("96_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1834
    .param pmc param_1835
    .param pmc param_1836 :optional
    .param int has_param_1836 :opt_flag
.annotate 'file', ''
.annotate 'line', 1864
    new $P1833, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1833, control_1832
    push_eh $P1833
    .lex "self", self
    .lex "$node", param_1834
    .lex "$bindpost", param_1835
    if has_param_1836, optparam_392
    new $P104, "Undef"
    set param_1836, $P104
  optparam_392:
    .lex "$keyrtype", param_1836
.annotate 'line', 1865

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
    
.annotate 'line', 1864
    .return ()
  control_1832:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("97_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1840
    .param pmc param_1841
.annotate 'file', ''
.annotate 'line', 1933
    new $P1839, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1839, control_1838
    push_eh $P1839
    .lex "self", self
    .lex "$node", param_1840
    .lex "$bindpost", param_1841
.annotate 'line', 1934
    find_lex $P104, "self"
    find_lex $P105, "$node"
    find_lex $P106, "$bindpost"
    $P107 = $P104."keyed"($P105, $P106, "i")
.annotate 'line', 1933
    .return ($P107)
  control_1838:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("98_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1845
    .param pmc param_1846
.annotate 'file', ''
.annotate 'line', 1938
    new $P1844, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1844, control_1843
    push_eh $P1844
    .lex "self", self
    .lex "$node", param_1845
    .lex "$bindpost", param_1846
.annotate 'line', 1939

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
    
.annotate 'line', 1938
    .return ()
  control_1843:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("99_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Var"],_)
    .param pmc param_1850
    .param pmc param_1851
.annotate 'file', ''
.annotate 'line', 2006
    .const 'Sub' $P1858 = "100_1308507553.18311" 
    capture_lex $P1858
    new $P1849, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1849, control_1848
    push_eh $P1849
    .lex "self", self
    .lex "$node", param_1850
    .lex "$bindpost", param_1851
.annotate 'line', 2007
    new $P104, "Undef"
    set $P1852, $P104
    .lex "$name", $P1852
.annotate 'line', 2014
    new $P105, "Undef"
    set $P1853, $P105
    .lex "$ops", $P1853
.annotate 'line', 2007
    find_lex $P106, "$node"
    $P107 = $P106."name"()
    store_lex "$name", $P107
.annotate 'line', 2009
    find_lex $P106, "$name"
    if $P106, unless_1854_end
.annotate 'line', 2010
    find_lex $P107, "self"
    $P108 = $P107."uniquereg"("P")
    store_lex "$name", $P108
.annotate 'line', 2011
    find_lex $P107, "$node"
    find_lex $P108, "$name"
    $P107."name"($P108)
  unless_1854_end:
.annotate 'line', 2014
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$name"
    find_lex $P108, "$node"
    $P109 = $P106."new"($P107 :named("result"), $P108 :named("node"))
    store_lex "$ops", $P109
.annotate 'line', 2016
    find_lex $P106, "$node"
    $P107 = $P106."isdecl"()
    unless $P107, if_1855_end
    find_lex $P108, "$ops"
    find_lex $P109, "$ops"
    $P108."push_pirop"(".local pmc", $P109)
  if_1855_end:
.annotate 'line', 2018
    find_lex $P106, "$bindpost"
    if $P106, if_1856
.annotate 'line', 2021
    .const 'Sub' $P1858 = "100_1308507553.18311" 
    capture_lex $P1858
    $P1858()
    goto if_1856_end
  if_1856:
.annotate 'line', 2019
    find_lex $P107, "$ops"
    find_lex $P108, "$ops"
    find_lex $P109, "$bindpost"
    $P107."push_pirop"("set", $P108, $P109)
  if_1856_end:
.annotate 'line', 2006
    find_lex $P106, "$ops"
    .return ($P106)
  control_1848:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1857"  :anon :subid("100_1308507553.18311") :outer("99_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 2021
    .const 'Sub' $P1862 = "101_1308507553.18311" 
    capture_lex $P1862
.annotate 'line', 2022
    new $P107, "Undef"
    set $P1859, $P107
    .lex "$viviself", $P1859
    find_lex $P108, "$node"
    $P109 = $P108."viviself"()
    store_lex "$viviself", $P109
.annotate 'line', 2023
    find_lex $P109, "$viviself"
    if $P109, if_1860
    set $P108, $P109
    goto if_1860_end
  if_1860:
    .const 'Sub' $P1862 = "101_1308507553.18311" 
    capture_lex $P1862
    $P111 = $P1862()
    set $P108, $P111
  if_1860_end:
.annotate 'line', 2021
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1861"  :anon :subid("101_1308507553.18311") :outer("100_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 2024
    new $P110, "Undef"
    set $P1863, $P110
    .lex "$vivipost", $P1863
    find_lex $P111, "self"
    find_lex $P112, "$viviself"
    $P113 = $P111."as_vivipost"($P112, "P" :named("rtype"))
    store_lex "$vivipost", $P113
.annotate 'line', 2025
    find_lex $P111, "$ops"
    find_lex $P112, "$vivipost"
    $P111."push"($P112)
.annotate 'line', 2026
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$vivipost"
    $P114 = $P111."push_pirop"("set", $P112, $P113)
.annotate 'line', 2023
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("102_1308507553.18311") :method :outer("11_1308507553.18311") :multi(_,["PAST";"Val"])
    .param pmc param_1867
    .param pmc param_1868 :slurpy :named
.annotate 'file', ''
.annotate 'line', 2042
    new $P1866, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1866, control_1865
    push_eh $P1866
    .lex "self", self
    .lex "$node", param_1867
    .lex "%options", param_1868
.annotate 'line', 2043

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
        result = self.'tempreg'('P')
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
    
.annotate 'line', 2042
    .return ()
  control_1865:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1870" :load :anon :subid("103_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1872 = "11_1308507553.18311" 
    $P104 = $P1872()
    .return ($P104)
.end


.namespace []
.sub "_block1964" :load :anon :subid("104_1308507553.18311")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1966 = "10_1308507553.18311" 
    $P101 = $P1966()
    .return ($P101)
.end

