
.namespace []
.sub "_block11"  :anon :subid("10_1307980071.79615")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307980071.79615" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1307980071.79615" 
    capture_lex $P14
    $P2026 = $P14()
.annotate 'line', 1
    .return ($P2026)
    .const 'Sub' $P2028 = "88_1307980071.79615" 
    .return ($P2028)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1307980071.79615")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307980071.79615" 
    .local pmc block
    set block, $P12
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2031 = get_root_global ["parrot"], "P6metaclass"
    new $P2032, "ResizablePMCArray"
    push $P2032, "%!symtable"
    $P2031."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P2032 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block13"  :subid("11_1307980071.79615") :outer("10_1307980071.79615")
.annotate 'line', 41
    .const 'Sub' $P1829 = "86_1307980071.79615" 
    capture_lex $P1829
    .const 'Sub' $P1777 = "83_1307980071.79615" 
    capture_lex $P1777
    .const 'Sub' $P1771 = "82_1307980071.79615" 
    capture_lex $P1771
    .const 'Sub' $P1761 = "81_1307980071.79615" 
    capture_lex $P1761
    .const 'Sub' $P1753 = "80_1307980071.79615" 
    capture_lex $P1753
    .const 'Sub' $P1672 = "78_1307980071.79615" 
    capture_lex $P1672
    .const 'Sub' $P1595 = "74_1307980071.79615" 
    capture_lex $P1595
    .const 'Sub' $P1589 = "73_1307980071.79615" 
    capture_lex $P1589
    .const 'Sub' $P1583 = "72_1307980071.79615" 
    capture_lex $P1583
    .const 'Sub' $P1534 = "70_1307980071.79615" 
    capture_lex $P1534
    .const 'Sub' $P1528 = "69_1307980071.79615" 
    capture_lex $P1528
    .const 'Sub' $P1469 = "68_1307980071.79615" 
    capture_lex $P1469
    .const 'Sub' $P1442 = "67_1307980071.79615" 
    capture_lex $P1442
    .const 'Sub' $P1406 = "66_1307980071.79615" 
    capture_lex $P1406
    .const 'Sub' $P1400 = "65_1307980071.79615" 
    capture_lex $P1400
    .const 'Sub' $P1351 = "64_1307980071.79615" 
    capture_lex $P1351
    .const 'Sub' $P1345 = "63_1307980071.79615" 
    capture_lex $P1345
    .const 'Sub' $P1339 = "62_1307980071.79615" 
    capture_lex $P1339
    .const 'Sub' $P1333 = "61_1307980071.79615" 
    capture_lex $P1333
    .const 'Sub' $P1324 = "60_1307980071.79615" 
    capture_lex $P1324
    .const 'Sub' $P1314 = "59_1307980071.79615" 
    capture_lex $P1314
    .const 'Sub' $P1308 = "58_1307980071.79615" 
    capture_lex $P1308
    .const 'Sub' $P1302 = "57_1307980071.79615" 
    capture_lex $P1302
    .const 'Sub' $P1292 = "56_1307980071.79615" 
    capture_lex $P1292
    .const 'Sub' $P1282 = "55_1307980071.79615" 
    capture_lex $P1282
    .const 'Sub' $P1272 = "54_1307980071.79615" 
    capture_lex $P1272
    .const 'Sub' $P1266 = "53_1307980071.79615" 
    capture_lex $P1266
    .const 'Sub' $P1261 = "52_1307980071.79615" 
    capture_lex $P1261
    .const 'Sub' $P1251 = "51_1307980071.79615" 
    capture_lex $P1251
    .const 'Sub' $P1082 = "47_1307980071.79615" 
    capture_lex $P1082
    .const 'Sub' $P1072 = "46_1307980071.79615" 
    capture_lex $P1072
    .const 'Sub' $P1000 = "44_1307980071.79615" 
    capture_lex $P1000
    .const 'Sub' $P890 = "43_1307980071.79615" 
    capture_lex $P890
    .const 'Sub' $P828 = "42_1307980071.79615" 
    capture_lex $P828
    .const 'Sub' $P453 = "32_1307980071.79615" 
    capture_lex $P453
    .const 'Sub' $P341 = "28_1307980071.79615" 
    capture_lex $P341
    .const 'Sub' $P286 = "27_1307980071.79615" 
    capture_lex $P286
    .const 'Sub' $P248 = "26_1307980071.79615" 
    capture_lex $P248
    .const 'Sub' $P238 = "25_1307980071.79615" 
    capture_lex $P238
    .const 'Sub' $P228 = "24_1307980071.79615" 
    capture_lex $P228
    .const 'Sub' $P210 = "23_1307980071.79615" 
    capture_lex $P210
    .const 'Sub' $P193 = "22_1307980071.79615" 
    capture_lex $P193
    .const 'Sub' $P180 = "21_1307980071.79615" 
    capture_lex $P180
    .const 'Sub' $P167 = "20_1307980071.79615" 
    capture_lex $P167
    .const 'Sub' $P157 = "19_1307980071.79615" 
    capture_lex $P157
    .const 'Sub' $P136 = "18_1307980071.79615" 
    capture_lex $P136
    .const 'Sub' $P130 = "17_1307980071.79615" 
    capture_lex $P130
    .const 'Sub' $P124 = "16_1307980071.79615" 
    capture_lex $P124
    .const 'Sub' $P89 = "15_1307980071.79615" 
    capture_lex $P89
    .const 'Sub' $P75 = "14_1307980071.79615" 
    capture_lex $P75
    .const 'Sub' $P44 = "13_1307980071.79615" 
    capture_lex $P44
    .const 'Sub' $P25 = "12_1307980071.79615" 
    capture_lex $P25
.annotate 'line', 43
    get_global $P15, "%piropsig"
    unless_null $P15, vivify_182
    $P15 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P15
  vivify_182:
.annotate 'line', 44
    get_global $P16, "%valflags"
    unless_null $P16, vivify_183
    $P16 = root_new ['parrot';'Hash']
    set_global "%valflags", $P16
  vivify_183:
.annotate 'line', 45
    get_global $P17, "%controltypes"
    unless_null $P17, vivify_184
    $P17 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P17
  vivify_184:
.annotate 'line', 46
    get_global $P18, "$serno"
    unless_null $P18, vivify_185
    new $P18, "Undef"
    set_global "$serno", $P18
  vivify_185:
.annotate 'line', 160
    get_global $P19, "@?BLOCK"
    unless_null $P19, vivify_186
    $P19 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P19
  vivify_186:
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
.annotate 'line', 2118
    .const 'Sub' $P1829 = "86_1307980071.79615" 
    newclosure $P1835, $P1829
.annotate 'line', 41
    .return ($P1835)
    .const 'Sub' $P1837 = "87_1307980071.79615" 
    .return ($P1837)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post90") :outer("11_1307980071.79615")
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1307980071.79615" 
    .local pmc block
    set block, $P14
.annotate 'line', 49
    get_hll_global $P1840, ["PAST"], "Compiler"
    $P1840."language"("PAST")
.annotate 'line', 50
    get_hll_global $P1841, ["PAST"], "Compiler"
    new $P1842, "ResizablePMCArray"
    push $P1842, "post"
    push $P1842, "pir"
    push $P1842, "evalpmc"
    $P1841."stages"($P1842)
.annotate 'line', 53
    new $P1843, "String"
    assign $P1843, "PP+"
    get_global $P1844, "%piropsig"
    unless_null $P1844, vivify_91
    $P1844 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1844
  vivify_91:
    set $P1844["add"], $P1843
.annotate 'line', 54
    new $P1845, "String"
    assign $P1845, "PPP"
    get_global $P1846, "%piropsig"
    unless_null $P1846, vivify_92
    $P1846 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1846
  vivify_92:
    set $P1846["band"], $P1845
.annotate 'line', 55
    new $P1847, "String"
    assign $P1847, "PPP"
    get_global $P1848, "%piropsig"
    unless_null $P1848, vivify_93
    $P1848 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1848
  vivify_93:
    set $P1848["bxor"], $P1847
.annotate 'line', 56
    new $P1849, "String"
    assign $P1849, "PP"
    get_global $P1850, "%piropsig"
    unless_null $P1850, vivify_94
    $P1850 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1850
  vivify_94:
    set $P1850["bnot"], $P1849
.annotate 'line', 57
    new $P1851, "String"
    assign $P1851, "PPP"
    get_global $P1852, "%piropsig"
    unless_null $P1852, vivify_95
    $P1852 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1852
  vivify_95:
    set $P1852["bor"], $P1851
.annotate 'line', 58
    new $P1853, "String"
    assign $P1853, "IPs"
    get_global $P1854, "%piropsig"
    unless_null $P1854, vivify_96
    $P1854 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1854
  vivify_96:
    set $P1854["can"], $P1853
.annotate 'line', 59
    new $P1855, "String"
    assign $P1855, "Si"
    get_global $P1856, "%piropsig"
    unless_null $P1856, vivify_97
    $P1856 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1856
  vivify_97:
    set $P1856["chr"], $P1855
.annotate 'line', 60
    new $P1857, "String"
    assign $P1857, "PP"
    get_global $P1858, "%piropsig"
    unless_null $P1858, vivify_98
    $P1858 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1858
  vivify_98:
    set $P1858["clone"], $P1857
.annotate 'line', 61
    new $P1859, "String"
    assign $P1859, "PP~"
    get_global $P1860, "%piropsig"
    unless_null $P1860, vivify_99
    $P1860 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1860
  vivify_99:
    set $P1860["concat"], $P1859
.annotate 'line', 62
    new $P1861, "String"
    assign $P1861, "0PP"
    get_global $P1862, "%piropsig"
    unless_null $P1862, vivify_100
    $P1862 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1862
  vivify_100:
    set $P1862["copy"], $P1861
.annotate 'line', 63
    new $P1863, "String"
    assign $P1863, "IP"
    get_global $P1864, "%piropsig"
    unless_null $P1864, vivify_101
    $P1864 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1864
  vivify_101:
    set $P1864["defined"], $P1863
.annotate 'line', 64
    new $P1865, "String"
    assign $P1865, "vQ*"
    get_global $P1866, "%piropsig"
    unless_null $P1866, vivify_102
    $P1866 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1866
  vivify_102:
    set $P1866["delete"], $P1865
.annotate 'line', 65
    new $P1867, "String"
    assign $P1867, "v~"
    get_global $P1868, "%piropsig"
    unless_null $P1868, vivify_103
    $P1868 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1868
  vivify_103:
    set $P1868["die"], $P1867
.annotate 'line', 66
    new $P1869, "String"
    assign $P1869, "PP+"
    get_global $P1870, "%piropsig"
    unless_null $P1870, vivify_104
    $P1870 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1870
  vivify_104:
    set $P1870["div"], $P1869
.annotate 'line', 67
    new $P1871, "String"
    assign $P1871, "IPs"
    get_global $P1872, "%piropsig"
    unless_null $P1872, vivify_105
    $P1872 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1872
  vivify_105:
    set $P1872["does"], $P1871
.annotate 'line', 68
    new $P1873, "String"
    assign $P1873, "Ss"
    get_global $P1874, "%piropsig"
    unless_null $P1874, vivify_106
    $P1874 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1874
  vivify_106:
    set $P1874["downcase"], $P1873
.annotate 'line', 69
    new $P1875, "String"
    assign $P1875, "IP"
    get_global $P1876, "%piropsig"
    unless_null $P1876, vivify_107
    $P1876 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1876
  vivify_107:
    set $P1876["elements"], $P1875
.annotate 'line', 70
    new $P1877, "String"
    assign $P1877, "IQ*"
    get_global $P1878, "%piropsig"
    unless_null $P1878, vivify_108
    $P1878 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1878
  vivify_108:
    set $P1878["exists"], $P1877
.annotate 'line', 71
    new $P1879, "String"
    assign $P1879, "vi"
    get_global $P1880, "%piropsig"
    unless_null $P1880, vivify_109
    $P1880 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1880
  vivify_109:
    set $P1880["exit"], $P1879
.annotate 'line', 72
    new $P1881, "String"
    assign $P1881, "PP+"
    get_global $P1882, "%piropsig"
    unless_null $P1882, vivify_110
    $P1882 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1882
  vivify_110:
    set $P1882["fdiv"], $P1881
.annotate 'line', 73
    new $P1883, "String"
    assign $P1883, "Is"
    get_global $P1884, "%piropsig"
    unless_null $P1884, vivify_111
    $P1884 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1884
  vivify_111:
    set $P1884["find_codepoint"], $P1883
.annotate 'line', 74
    new $P1885, "String"
    assign $P1885, "Ps"
    get_global $P1886, "%piropsig"
    unless_null $P1886, vivify_112
    $P1886 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1886
  vivify_112:
    set $P1886["find_dynamic_lex"], $P1885
.annotate 'line', 75
    new $P1887, "String"
    assign $P1887, "Ps"
    get_global $P1888, "%piropsig"
    unless_null $P1888, vivify_113
    $P1888 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1888
  vivify_113:
    set $P1888["find_name"], $P1887
.annotate 'line', 76
    new $P1889, "String"
    assign $P1889, "P"
    get_global $P1890, "%piropsig"
    unless_null $P1890, vivify_114
    $P1890 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1890
  vivify_114:
    set $P1890["getinterp"], $P1889
.annotate 'line', 77
    new $P1891, "String"
    assign $P1891, "P~P"
    get_global $P1892, "%piropsig"
    unless_null $P1892, vivify_115
    $P1892 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1892
  vivify_115:
    set $P1892["getprop"], $P1891
.annotate 'line', 78
    new $P1893, "String"
    assign $P1893, "P"
    get_global $P1894, "%piropsig"
    unless_null $P1894, vivify_116
    $P1894 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1894
  vivify_116:
    set $P1894["getstderr"], $P1893
.annotate 'line', 79
    new $P1895, "String"
    assign $P1895, "P"
    get_global $P1896, "%piropsig"
    unless_null $P1896, vivify_117
    $P1896 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1896
  vivify_117:
    set $P1896["getstdin"], $P1895
.annotate 'line', 80
    new $P1897, "String"
    assign $P1897, "P"
    get_global $P1898, "%piropsig"
    unless_null $P1898, vivify_118
    $P1898 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1898
  vivify_118:
    set $P1898["getstdout"], $P1897
.annotate 'line', 81
    new $P1899, "String"
    assign $P1899, "Issi"
    get_global $P1900, "%piropsig"
    unless_null $P1900, vivify_119
    $P1900 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1900
  vivify_119:
    set $P1900["index"], $P1899
.annotate 'line', 82
    new $P1901, "String"
    assign $P1901, "IP~"
    get_global $P1902, "%piropsig"
    unless_null $P1902, vivify_120
    $P1902 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1902
  vivify_120:
    set $P1902["isa"], $P1901
.annotate 'line', 83
    new $P1903, "String"
    assign $P1903, "IP"
    get_global $P1904, "%piropsig"
    unless_null $P1904, vivify_121
    $P1904 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1904
  vivify_121:
    set $P1904["isfalse"], $P1903
.annotate 'line', 84
    new $P1905, "String"
    assign $P1905, "IP"
    get_global $P1906, "%piropsig"
    unless_null $P1906, vivify_122
    $P1906 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1906
  vivify_122:
    set $P1906["isnull"], $P1905
.annotate 'line', 85
    new $P1907, "String"
    assign $P1907, "IPP"
    get_global $P1908, "%piropsig"
    unless_null $P1908, vivify_123
    $P1908 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1908
  vivify_123:
    set $P1908["issame"], $P1907
.annotate 'line', 86
    new $P1909, "String"
    assign $P1909, "IP"
    get_global $P1910, "%piropsig"
    unless_null $P1910, vivify_124
    $P1910 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1910
  vivify_124:
    set $P1910["istrue"], $P1909
.annotate 'line', 87
    new $P1911, "String"
    assign $P1911, "SsP"
    get_global $P1912, "%piropsig"
    unless_null $P1912, vivify_125
    $P1912 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1912
  vivify_125:
    set $P1912["join"], $P1911
.annotate 'line', 88
    new $P1913, "String"
    assign $P1913, "Is"
    get_global $P1914, "%piropsig"
    unless_null $P1914, vivify_126
    $P1914 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1914
  vivify_126:
    set $P1914["length"], $P1913
.annotate 'line', 89
    new $P1915, "String"
    assign $P1915, "vs"
    get_global $P1916, "%piropsig"
    unless_null $P1916, vivify_127
    $P1916 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1916
  vivify_127:
    set $P1916["load_bytecode"], $P1915
.annotate 'line', 90
    new $P1917, "String"
    assign $P1917, "vs"
    get_global $P1918, "%piropsig"
    unless_null $P1918, vivify_128
    $P1918 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1918
  vivify_128:
    set $P1918["load_language"], $P1917
.annotate 'line', 91
    new $P1919, "String"
    assign $P1919, "P~"
    get_global $P1920, "%piropsig"
    unless_null $P1920, vivify_129
    $P1920 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1920
  vivify_129:
    set $P1920["loadlib"], $P1919
.annotate 'line', 92
    new $P1921, "String"
    assign $P1921, "PP+"
    get_global $P1922, "%piropsig"
    unless_null $P1922, vivify_130
    $P1922 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1922
  vivify_130:
    set $P1922["mod"], $P1921
.annotate 'line', 93
    new $P1923, "String"
    assign $P1923, "PP+"
    get_global $P1924, "%piropsig"
    unless_null $P1924, vivify_131
    $P1924 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1924
  vivify_131:
    set $P1924["mul"], $P1923
.annotate 'line', 94
    new $P1925, "String"
    assign $P1925, "PP"
    get_global $P1926, "%piropsig"
    unless_null $P1926, vivify_132
    $P1926 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1926
  vivify_132:
    set $P1926["neg"], $P1925
.annotate 'line', 95
    new $P1927, "String"
    assign $P1927, "P~"
    get_global $P1928, "%piropsig"
    unless_null $P1928, vivify_133
    $P1928 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1928
  vivify_133:
    set $P1928["new"], $P1927
.annotate 'line', 96
    new $P1929, "String"
    assign $P1929, "PP"
    get_global $P1930, "%piropsig"
    unless_null $P1930, vivify_134
    $P1930 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1930
  vivify_134:
    set $P1930["newclosure"], $P1929
.annotate 'line', 97
    new $P1931, "String"
    assign $P1931, "PP"
    get_global $P1932, "%piropsig"
    unless_null $P1932, vivify_135
    $P1932 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1932
  vivify_135:
    set $P1932["not"], $P1931
.annotate 'line', 98
    new $P1933, "String"
    assign $P1933, "Isi"
    get_global $P1934, "%piropsig"
    unless_null $P1934, vivify_136
    $P1934 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1934
  vivify_136:
    set $P1934["ord"], $P1933
.annotate 'line', 99
    new $P1935, "String"
    assign $P1935, "PP"
    get_global $P1936, "%piropsig"
    unless_null $P1936, vivify_137
    $P1936 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1936
  vivify_137:
    set $P1936["pop"], $P1935
.annotate 'line', 100
    new $P1937, "String"
    assign $P1937, "NN+"
    get_global $P1938, "%piropsig"
    unless_null $P1938, vivify_138
    $P1938 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1938
  vivify_138:
    set $P1938["pow"], $P1937
.annotate 'line', 101
    new $P1939, "String"
    assign $P1939, "v*"
    get_global $P1940, "%piropsig"
    unless_null $P1940, vivify_139
    $P1940 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1940
  vivify_139:
    set $P1940["print"], $P1939
.annotate 'line', 102
    new $P1941, "String"
    assign $P1941, "v*"
    get_global $P1942, "%piropsig"
    unless_null $P1942, vivify_140
    $P1942 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1942
  vivify_140:
    set $P1942["printerr"], $P1941
.annotate 'line', 103
    new $P1943, "String"
    assign $P1943, "0P*"
    get_global $P1944, "%piropsig"
    unless_null $P1944, vivify_141
    $P1944 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1944
  vivify_141:
    set $P1944["push"], $P1943
.annotate 'line', 104
    new $P1945, "String"
    assign $P1945, "Ssi"
    get_global $P1946, "%piropsig"
    unless_null $P1946, vivify_142
    $P1946 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1946
  vivify_142:
    set $P1946["repeat"], $P1945
.annotate 'line', 105
    new $P1947, "String"
    assign $P1947, "Ssiis"
    get_global $P1948, "%piropsig"
    unless_null $P1948, vivify_143
    $P1948 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1948
  vivify_143:
    set $P1948["replace"], $P1947
.annotate 'line', 106
    new $P1949, "String"
    assign $P1949, "v*"
    get_global $P1950, "%piropsig"
    unless_null $P1950, vivify_144
    $P1950 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1950
  vivify_144:
    set $P1950["say"], $P1949
.annotate 'line', 107
    new $P1951, "String"
    assign $P1951, "PP"
    get_global $P1952, "%piropsig"
    unless_null $P1952, vivify_145
    $P1952 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1952
  vivify_145:
    set $P1952["set"], $P1951
.annotate 'line', 108
    new $P1953, "String"
    assign $P1953, "0P~P"
    get_global $P1954, "%piropsig"
    unless_null $P1954, vivify_146
    $P1954 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1954
  vivify_146:
    set $P1954["setprop"], $P1953
.annotate 'line', 109
    new $P1955, "String"
    assign $P1955, "0P~P"
    get_global $P1956, "%piropsig"
    unless_null $P1956, vivify_147
    $P1956 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1956
  vivify_147:
    set $P1956["setattribute"], $P1955
.annotate 'line', 110
    new $P1957, "String"
    assign $P1957, "PP"
    get_global $P1958, "%piropsig"
    unless_null $P1958, vivify_148
    $P1958 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1958
  vivify_148:
    set $P1958["shift"], $P1957
.annotate 'line', 111
    new $P1959, "String"
    assign $P1959, "PP+"
    get_global $P1960, "%piropsig"
    unless_null $P1960, vivify_149
    $P1960 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1960
  vivify_149:
    set $P1960["shl"], $P1959
.annotate 'line', 112
    new $P1961, "String"
    assign $P1961, "PP+"
    get_global $P1962, "%piropsig"
    unless_null $P1962, vivify_150
    $P1962 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1962
  vivify_150:
    set $P1962["shr"], $P1961
.annotate 'line', 113
    new $P1963, "String"
    assign $P1963, "v+"
    get_global $P1964, "%piropsig"
    unless_null $P1964, vivify_151
    $P1964 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1964
  vivify_151:
    set $P1964["sleep"], $P1963
.annotate 'line', 114
    new $P1965, "String"
    assign $P1965, "0PPii"
    get_global $P1966, "%piropsig"
    unless_null $P1966, vivify_152
    $P1966 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1966
  vivify_152:
    set $P1966["splice"], $P1965
.annotate 'line', 115
    new $P1967, "String"
    assign $P1967, "Pss"
    get_global $P1968, "%piropsig"
    unless_null $P1968, vivify_153
    $P1968 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1968
  vivify_153:
    set $P1968["split"], $P1967
.annotate 'line', 116
    new $P1969, "String"
    assign $P1969, "PP+"
    get_global $P1970, "%piropsig"
    unless_null $P1970, vivify_154
    $P1970 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1970
  vivify_154:
    set $P1970["sub"], $P1969
.annotate 'line', 117
    new $P1971, "String"
    assign $P1971, "Ssii"
    get_global $P1972, "%piropsig"
    unless_null $P1972, vivify_155
    $P1972 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1972
  vivify_155:
    set $P1972["substr"], $P1971
.annotate 'line', 118
    new $P1973, "String"
    assign $P1973, "Ss"
    get_global $P1974, "%piropsig"
    unless_null $P1974, vivify_156
    $P1974 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1974
  vivify_156:
    set $P1974["titlecase"], $P1973
.annotate 'line', 119
    new $P1975, "String"
    assign $P1975, "vi"
    get_global $P1976, "%piropsig"
    unless_null $P1976, vivify_157
    $P1976 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1976
  vivify_157:
    set $P1976["trace"], $P1975
.annotate 'line', 120
    new $P1977, "String"
    assign $P1977, "SP"
    get_global $P1978, "%piropsig"
    unless_null $P1978, vivify_158
    $P1978 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1978
  vivify_158:
    set $P1978["typeof"], $P1977
.annotate 'line', 121
    new $P1979, "String"
    assign $P1979, "0P*"
    get_global $P1980, "%piropsig"
    unless_null $P1980, vivify_159
    $P1980 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1980
  vivify_159:
    set $P1980["unshift"], $P1979
.annotate 'line', 122
    new $P1981, "String"
    assign $P1981, "Ss"
    get_global $P1982, "%piropsig"
    unless_null $P1982, vivify_160
    $P1982 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1982
  vivify_160:
    set $P1982["upcase"], $P1981
.annotate 'line', 127
    new $P1983, "String"
    assign $P1983, "s~*:e"
    get_global $P1984, "%valflags"
    unless_null $P1984, vivify_161
    $P1984 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1984
  vivify_161:
    set $P1984["String"], $P1983
.annotate 'line', 128
    new $P1985, "String"
    assign $P1985, "i+*:"
    get_global $P1986, "%valflags"
    unless_null $P1986, vivify_162
    $P1986 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1986
  vivify_162:
    set $P1986["Integer"], $P1985
.annotate 'line', 129
    new $P1987, "String"
    assign $P1987, "n+*:"
    get_global $P1988, "%valflags"
    unless_null $P1988, vivify_163
    $P1988 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1988
  vivify_163:
    set $P1988["Float"], $P1987
.annotate 'line', 130
    new $P1989, "String"
    assign $P1989, "i+*:c"
    get_global $P1990, "%valflags"
    unless_null $P1990, vivify_164
    $P1990 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1990
  vivify_164:
    set $P1990["!macro_const"], $P1989
.annotate 'line', 131
    new $P1991, "String"
    assign $P1991, "i+*:c"
    get_global $P1992, "%valflags"
    unless_null $P1992, vivify_165
    $P1992 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1992
  vivify_165:
    set $P1992["!cclass"], $P1991
.annotate 'line', 132
    new $P1993, "String"
    assign $P1993, "i+*:c"
    get_global $P1994, "%valflags"
    unless_null $P1994, vivify_166
    $P1994 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1994
  vivify_166:
    set $P1994["!except_severity"], $P1993
.annotate 'line', 133
    new $P1995, "String"
    assign $P1995, "i+*:c"
    get_global $P1996, "%valflags"
    unless_null $P1996, vivify_167
    $P1996 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1996
  vivify_167:
    set $P1996["!except_types"], $P1995
.annotate 'line', 134
    new $P1997, "String"
    assign $P1997, "i+*:c"
    get_global $P1998, "%valflags"
    unless_null $P1998, vivify_168
    $P1998 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1998
  vivify_168:
    set $P1998["!iterator"], $P1997
.annotate 'line', 135
    new $P1999, "String"
    assign $P1999, "i+*:c"
    get_global $P2000, "%valflags"
    unless_null $P2000, vivify_169
    $P2000 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2000
  vivify_169:
    set $P2000["!socket"], $P1999
.annotate 'line', 139
    new $P2001, "String"
    assign $P2001, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2002, "%controltypes"
    unless_null $P2002, vivify_170
    $P2002 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2002
  vivify_170:
    set $P2002["CONTROL"], $P2001
.annotate 'line', 140
    new $P2003, "String"
    assign $P2003, ".CONTROL_RETURN"
    get_global $P2004, "%controltypes"
    unless_null $P2004, vivify_171
    $P2004 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2004
  vivify_171:
    set $P2004["RETURN"], $P2003
.annotate 'line', 141
    new $P2005, "String"
    assign $P2005, ".CONTROL_OK"
    get_global $P2006, "%controltypes"
    unless_null $P2006, vivify_172
    $P2006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2006
  vivify_172:
    set $P2006["OK"], $P2005
.annotate 'line', 142
    new $P2007, "String"
    assign $P2007, ".CONTROL_BREAK"
    get_global $P2008, "%controltypes"
    unless_null $P2008, vivify_173
    $P2008 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2008
  vivify_173:
    set $P2008["BREAK"], $P2007
.annotate 'line', 143
    new $P2009, "String"
    assign $P2009, ".CONTROL_CONTINUE"
    get_global $P2010, "%controltypes"
    unless_null $P2010, vivify_174
    $P2010 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2010
  vivify_174:
    set $P2010["CONTINUE"], $P2009
.annotate 'line', 144
    new $P2011, "String"
    assign $P2011, ".CONTROL_ERROR"
    get_global $P2012, "%controltypes"
    unless_null $P2012, vivify_175
    $P2012 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2012
  vivify_175:
    set $P2012["ERROR"], $P2011
.annotate 'line', 145
    new $P2013, "String"
    assign $P2013, ".CONTROL_TAKE"
    get_global $P2014, "%controltypes"
    unless_null $P2014, vivify_176
    $P2014 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2014
  vivify_176:
    set $P2014["GATHER"], $P2013
.annotate 'line', 146
    new $P2015, "String"
    assign $P2015, ".CONTROL_LEAVE"
    get_global $P2016, "%controltypes"
    unless_null $P2016, vivify_177
    $P2016 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2016
  vivify_177:
    set $P2016["LEAVE"], $P2015
.annotate 'line', 147
    new $P2017, "String"
    assign $P2017, ".CONTROL_EXIT"
    get_global $P2018, "%controltypes"
    unless_null $P2018, vivify_178
    $P2018 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2018
  vivify_178:
    set $P2018["EXIT"], $P2017
.annotate 'line', 148
    new $P2019, "String"
    assign $P2019, ".CONTROL_NEXT"
    get_global $P2020, "%controltypes"
    unless_null $P2020, vivify_179
    $P2020 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2020
  vivify_179:
    set $P2020["NEXT"], $P2019
.annotate 'line', 149
    new $P2021, "String"
    assign $P2021, ".CONTROL_LAST"
    get_global $P2022, "%controltypes"
    unless_null $P2022, vivify_180
    $P2022 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2022
  vivify_180:
    set $P2022["LAST"], $P2021
.annotate 'line', 150
    new $P2023, "String"
    assign $P2023, ".CONTROL_REDO"
    get_global $P2024, "%controltypes"
    unless_null $P2024, vivify_181
    $P2024 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2024
  vivify_181:
    set $P2024["REDO"], $P2023
.annotate 'line', 152
    new $P2025, "Integer"
    assign $P2025, 11
    set_global "$serno", $P2025
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1307980071.79615") :method :outer("11_1307980071.79615")
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
    unless_null $P39, vivify_187
    get_hll_global $P39, "$SUB"
    unless_null $P39, vivify_188
    die "Contextual $*SUB not found"
  vivify_188:
  vivify_187:
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
.sub "escape"  :subid("13_1307980071.79615") :method :outer("11_1307980071.79615")
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
.annotate 'line', 183
    new $P69, "String"
    assign $P69, "\""
    find_lex $P70, "$estr"
    concat $P71, $P69, $P70
    store_lex "$estr", $P71
.annotate 'line', 182
    goto if_53_end
  if_53:
.annotate 'line', 181
    new $P66, "String"
    assign $P66, "unicode:\""
    find_lex $P67, "$estr"
    concat $P68, $P66, $P67
    store_lex "$estr", $P68
  if_53_end:
.annotate 'line', 185
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
.sub "unique"  :subid("14_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_78 :optional
    .param int has_param_78 :opt_flag
.annotate 'line', 193
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P77, control_76
    push_eh $P77
    .lex "self", self
    if has_param_78, optparam_189
    new $P79, "Undef"
    set param_78, $P79
  optparam_189:
    .lex "$fmt", param_78
.annotate 'line', 194
    find_lex $P81, "$fmt"
    defined $I82, $P81
    if $I82, unless_80_end
    new $P83, "String"
    assign $P83, ""
    store_lex "$fmt", $P83
  unless_80_end:
.annotate 'line', 195
    find_lex $P84, "$fmt"
    get_global $P85, "$serno"
    clone $P86, $P85
    inc $P85
    concat $P87, $P84, $P86
    store_lex "$fmt", $P87
.annotate 'line', 193
    .return ($P87)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P88, exception, "payload"
    .return ($P88)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("15_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_92
.annotate 'line', 202
    new $P91, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P91, control_90
    push_eh $P91
    .lex "self", self
    .lex "$rtype", param_92
.annotate 'line', 207
    new $P93, "Undef"
    .lex "$reg", $P93
.annotate 'line', 208
    new $P94, "Undef"
    .lex "$i", $P94
.annotate 'line', 203
    find_lex $P96, "$rtype"
    if $P96, unless_95_end
    find_lex $P97, "self"
    $P97."panic"("rtype not set")
  unless_95_end:
.annotate 'line', 205
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
.annotate 'line', 207
    new $P104, "String"
    assign $P104, "P"
    store_lex "$reg", $P104
.annotate 'line', 208
    find_lex $P105, "$rtype"
    set $S106, $P105
    index $I107, "Ss~Nn+Ii", $S106
    new $P108, 'Integer'
    set $P108, $I107
    store_lex "$i", $P108
.annotate 'line', 209
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
.annotate 'line', 210
    new $P117, "String"
    assign $P117, "$"
    find_lex $P118, "$reg"
    concat $P119, $P117, $P118
    store_lex "$reg", $P119
.annotate 'line', 211
    find_lex $P120, "self"
    find_lex $P121, "$reg"
    $P122 = $P120."unique"($P121)
.annotate 'line', 202
    .return ($P122)
  control_90:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("16_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_127
    .param pmc param_128
.annotate 'line', 220
    new $P126, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P126, control_125
    push_eh $P126
    .lex "self", self
    .lex "$post", param_127
    .lex "$rtype", param_128
.annotate 'line', 221

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
    
.annotate 'line', 220
    .return ()
  control_125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("17_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_133
    .param pmc param_134 :slurpy :named
.annotate 'line', 360
    new $P132, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P132, control_131
    push_eh $P132
    .lex "self", self
    .lex "$node", param_133
    .lex "%options", param_134
.annotate 'line', 361

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
    
.annotate 'line', 360
    .return ()
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,_)
    .param pmc param_139
    .param pmc param_140 :slurpy :named
.annotate 'line', 497
    new $P138, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P138, control_137
    push_eh $P138
    .lex "self", self
    .lex "$node", param_139
    .lex "%options", param_140
.annotate 'line', 498
    new $P141, "Undef"
    .lex "$what", $P141
.annotate 'line', 497
    find_lex $P142, "$what"
.annotate 'line', 500
    find_lex $P144, "$node"
    isnull $I145, $P144
    if $I145, if_143
.annotate 'line', 503
    new $P147, "String"
    assign $P147, "node of type "
    find_lex $P148, "$node"
    typeof $S149, $P148
    concat $P150, $P147, $S149
    store_lex "$what", $P150
.annotate 'line', 502
    goto if_143_end
  if_143:
.annotate 'line', 501
    new $P146, "String"
    assign $P146, "a null node"
    store_lex "$what", $P146
  if_143_end:
.annotate 'line', 506
    find_lex $P151, "self"
    new $P152, "String"
    assign $P152, "PAST::Compiler can't compile "
    find_lex $P153, "$what"
    concat $P154, $P152, $P153
    $P155 = $P151."panic"($P154)
.annotate 'line', 497
    .return ($P155)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("19_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["Undef"])
    .param pmc param_160
    .param pmc param_161 :slurpy :named
.annotate 'line', 512
    new $P159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P159, control_158
    push_eh $P159
    .lex "self", self
    .lex "$node", param_160
    .lex "%options", param_161
.annotate 'line', 513
    get_hll_global $P162, ["POST"], "Ops"
    find_lex $P163, "self"
    $P164 = $P163."uniquereg"("P")
    $P165 = $P162."new"($P164 :named("result"))
.annotate 'line', 512
    .return ($P165)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("20_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["Integer"])
    .param pmc param_170
    .param pmc param_171 :slurpy :named
.annotate 'line', 523
    new $P169, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P169, control_168
    push_eh $P169
    .lex "self", self
    .lex "$node", param_170
    .lex "%options", param_171
.annotate 'line', 524
    find_lex $P172, "self"
    get_hll_global $P173, ["POST"], "Ops"
    find_lex $P174, "$node"
    $P175 = $P173."new"($P174 :named("result"))
    find_lex $P176, "%options"
    unless_null $P176, vivify_190
    $P176 = root_new ['parrot';'Hash']
  vivify_190:
    set $P177, $P176["rtype"]
    unless_null $P177, vivify_191
    new $P177, "Undef"
  vivify_191:
    $P178 = $P172."coerce"($P175, $P177)
.annotate 'line', 523
    .return ($P178)
  control_168:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P179, exception, "payload"
    .return ($P179)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("21_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["Float"])
    .param pmc param_183
    .param pmc param_184 :slurpy :named
.annotate 'line', 527
    new $P182, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P182, control_181
    push_eh $P182
    .lex "self", self
    .lex "$node", param_183
    .lex "%options", param_184
.annotate 'line', 528
    find_lex $P185, "self"
    get_hll_global $P186, ["POST"], "Ops"
    find_lex $P187, "$node"
    $P188 = $P186."new"($P187 :named("result"))
    find_lex $P189, "%options"
    unless_null $P189, vivify_192
    $P189 = root_new ['parrot';'Hash']
  vivify_192:
    set $P190, $P189["rtype"]
    unless_null $P190, vivify_193
    new $P190, "Undef"
  vivify_193:
    $P191 = $P185."coerce"($P188, $P190)
.annotate 'line', 527
    .return ($P191)
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("22_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["String"])
    .param pmc param_196
    .param pmc param_197 :slurpy :named
.annotate 'line', 531
    new $P195, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P195, control_194
    push_eh $P195
    .lex "self", self
    .lex "$node", param_196
    .lex "%options", param_197
.annotate 'line', 532
    new $P198, "Undef"
    .lex "$value", $P198
    find_lex $P199, "self"
    find_lex $P200, "$node"
    $P201 = $P199."escape"($P200)
    store_lex "$value", $P201
.annotate 'line', 533
    find_lex $P202, "self"
    get_hll_global $P203, ["POST"], "Ops"
    find_lex $P204, "$value"
    $P205 = $P203."new"($P204 :named("result"))
    find_lex $P206, "%options"
    unless_null $P206, vivify_194
    $P206 = root_new ['parrot';'Hash']
  vivify_194:
    set $P207, $P206["rtype"]
    unless_null $P207, vivify_195
    new $P207, "Undef"
  vivify_195:
    $P208 = $P202."coerce"($P205, $P207)
.annotate 'line', 531
    .return ($P208)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P209, exception, "payload"
    .return ($P209)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("23_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["String"])
    .param pmc param_213
    .param pmc param_214 :slurpy :named
.annotate 'line', 542
    new $P212, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P212, control_211
    push_eh $P212
    .lex "self", self
    .lex "$node", param_213
    .lex "%options", param_214
.annotate 'line', 543
    new $P215, "Undef"
    .lex "$result", $P215
.annotate 'line', 544
    new $P216, "Undef"
    .lex "$s", $P216
.annotate 'line', 543
    find_lex $P217, "self"
    $P218 = $P217."uniquereg"("P")
    store_lex "$result", $P218
.annotate 'line', 544
    find_lex $P219, "self"
    find_lex $P220, "$node"
    $P221 = $P219."escape"($P220)
    store_lex "$s", $P221
.annotate 'line', 545
    get_hll_global $P222, ["POST"], "Op"
    find_lex $P223, "$result"
    find_lex $P224, "$s"
    find_lex $P225, "$result"
    $P226 = $P222."new"($P223, $P224, "new" :named("pirop"), $P225 :named("result"))
.annotate 'line', 542
    .return ($P226)
  control_211:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P227, exception, "payload"
    .return ($P227)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("24_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,_)
    .param pmc param_231
    .param pmc param_232 :slurpy :named
.annotate 'line', 550
    new $P230, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P230, control_229
    push_eh $P230
    .lex "self", self
    .lex "$node", param_231
    .lex "%options", param_232
.annotate 'line', 551
    find_lex $P233, "self"
    find_lex $P234, "$node"
    find_lex $P235, "%options"
    $P236 = $P233."as_post"($P234, $P235 :flat)
.annotate 'line', 550
    .return ($P236)
  control_229:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P237, exception, "payload"
    .return ($P237)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Node"])
    .param pmc param_241
    .param pmc param_242 :slurpy :named
.annotate 'line', 566
    new $P240, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P240, control_239
    push_eh $P240
    .lex "self", self
    .lex "$node", param_241
    .lex "%options", param_242
.annotate 'line', 567
    find_lex $P243, "self"
    find_lex $P244, "$node"
    find_lex $P245, "%options"
    $P246 = $P243."node_as_post"($P244, $P245)
.annotate 'line', 566
    .return ($P246)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P247, exception, "payload"
    .return ($P247)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("26_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_251
    .param pmc param_252
.annotate 'line', 571
    new $P250, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P250, control_249
    push_eh $P250
    .lex "self", self
    .lex "$node", param_251
    .lex "%options", param_252
.annotate 'line', 572
    new $P253, "Undef"
    .lex "$rtype", $P253
.annotate 'line', 574
    new $P254, "Undef"
    .lex "$signature", $P254
.annotate 'line', 577
    new $P255, "Undef"
    .lex "$ops", $P255
.annotate 'line', 580
    new $P256, "Undef"
    .lex "$eh", $P256
.annotate 'line', 572
    find_lex $P257, "%options"
    unless_null $P257, vivify_196
    $P257 = root_new ['parrot';'Hash']
  vivify_196:
    set $P258, $P257["rtype"]
    unless_null $P258, vivify_197
    new $P258, "Undef"
  vivify_197:
    store_lex "$rtype", $P258
.annotate 'line', 574
    find_lex $P259, "$node"
    $P260 = $P259."list"()
    set $N261, $P260
    set $I262, $N261
    repeat $S263, "v", $I262
    new $P264, 'String'
    set $P264, $S263
    store_lex "$signature", $P264
.annotate 'line', 575
    find_lex $P265, "$signature"
    find_lex $P266, "$rtype"
    concat $P267, $P265, $P266
    store_lex "$signature", $P267
.annotate 'line', 577
    find_lex $P268, "self"
    find_lex $P269, "$node"
    find_lex $P270, "$signature"
    $P271 = $P268."post_children"($P269, $P270 :named("signature"))
    store_lex "$ops", $P271
.annotate 'line', 578
    find_lex $P272, "$ops"
    find_lex $P273, "$ops"
    unless_null $P273, vivify_198
    $P273 = root_new ['parrot';'ResizablePMCArray']
  vivify_198:
    set $P274, $P273[-1]
    unless_null $P274, vivify_199
    new $P274, "Undef"
  vivify_199:
    $P272."result"($P274)
.annotate 'line', 580
    find_lex $P275, "$node"
    $P276 = $P275."handlers"()
    store_lex "$eh", $P276
.annotate 'line', 581
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
.annotate 'line', 571
    .return ($P284)
  control_249:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("27_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Control"])
    .param pmc param_289
    .param pmc param_290 :slurpy :named
.annotate 'line', 591
    new $P288, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P288, control_287
    push_eh $P288
    .lex "self", self
    .lex "$node", param_289
    .lex "%options", param_290
.annotate 'line', 592
    new $P291, "Undef"
    .lex "$ishandled", $P291
.annotate 'line', 593
    new $P292, "Undef"
    .lex "$nothandled", $P292
.annotate 'line', 595
    new $P293, "Undef"
    .lex "$ops", $P293
.annotate 'line', 597
    new $P294, "Undef"
    .lex "$signature", $P294
.annotate 'line', 602
    new $P295, "Undef"
    .lex "$children", $P295
.annotate 'line', 604
    new $P296, "Undef"
    .lex "$handled", $P296
.annotate 'line', 592
    get_hll_global $P297, ["POST"], "Label"
    find_lex $P298, "self"
    $P299 = $P298."unique"("handled_")
    $P300 = $P297."new"($P299 :named("result"))
    store_lex "$ishandled", $P300
.annotate 'line', 593
    get_hll_global $P301, ["POST"], "Label"
    find_lex $P302, "self"
    $P303 = $P302."unique"("nothandled_")
    $P304 = $P301."new"($P303 :named("result"))
    store_lex "$nothandled", $P304
.annotate 'line', 595
    get_hll_global $P305, ["POST"], "Ops"
    find_lex $P306, "$node"
    $P307 = $P305."new"($P306 :named("node"))
    store_lex "$ops", $P307
.annotate 'line', 597
    find_lex $P308, "$node"
    $P309 = $P308."list"()
    set $N310, $P309
    set $I311, $N310
    repeat $S312, "v", $I311
    new $P313, 'String'
    set $P313, $S312
    store_lex "$signature", $P313
.annotate 'line', 598
    find_lex $P314, "$signature"
    find_lex $P315, "%options"
    unless_null $P315, vivify_200
    $P315 = root_new ['parrot';'Hash']
  vivify_200:
    set $P316, $P315["rtype"]
    unless_null $P316, vivify_201
    new $P316, "Undef"
  vivify_201:
    concat $P317, $P314, $P316
    store_lex "$signature", $P317
.annotate 'line', 600
    find_lex $P318, "$ops"
    $P318."push_pirop"(".local pmc exception")
.annotate 'line', 601
    find_lex $P319, "$ops"
    $P319."push_pirop"(".get_results (exception)")
.annotate 'line', 602
    find_lex $P320, "self"
    find_lex $P321, "$node"
    find_lex $P322, "$signature"
    $P323 = $P320."post_children"($P321, $P322 :named("signature"))
    store_lex "$children", $P323
.annotate 'line', 603
    find_lex $P324, "$ops"
    find_lex $P325, "$children"
    $P324."push"($P325)
.annotate 'line', 604
    find_lex $P326, "self"
    $P327 = $P326."uniquereg"("I")
    store_lex "$handled", $P327
.annotate 'line', 606
    find_lex $P328, "$ops"
    find_lex $P329, "$handled"
    $P328."push_pirop"("set", $P329, "exception[\"handled\"]")
.annotate 'line', 607
    find_lex $P330, "$ops"
    find_lex $P331, "$handled"
    find_lex $P332, "$nothandled"
    $P330."push_pirop"("ne", $P331, 1, $P332)
.annotate 'line', 608
    find_lex $P333, "$ops"
    find_lex $P334, "$ishandled"
    $P333."push"($P334)
.annotate 'line', 609
    find_lex $P335, "$ops"
    $P335."push_pirop"("return", "exception")
.annotate 'line', 610
    find_lex $P336, "$ops"
    find_lex $P337, "$nothandled"
    $P336."push"($P337)
.annotate 'line', 611
    find_lex $P338, "$ops"
    $P338."push_pirop"("rethrow", "exception")
    find_lex $P339, "$ops"
.annotate 'line', 591
    .return ($P339)
  control_287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P340, exception, "payload"
    .return ($P340)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("28_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_344
    .param pmc param_345
    .param pmc param_346 :slurpy :named
.annotate 'line', 615
    .const 'Sub' $P369 = "29_1307980071.79615" 
    capture_lex $P369
    new $P343, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P343, control_342
    push_eh $P343
    .lex "self", self
    .lex "$child", param_344
    .lex "$ehs", param_345
    .lex "%options", param_346
.annotate 'line', 616
    new $P347, "Undef"
    .lex "$rtype", $P347
.annotate 'line', 618
    new $P348, "Undef"
    .lex "$ops", $P348
.annotate 'line', 619
    new $P349, "Undef"
    .lex "$pops", $P349
.annotate 'line', 620
    new $P350, "Undef"
    .lex "$tail", $P350
.annotate 'line', 621
    new $P351, "Undef"
    .lex "$skip", $P351
.annotate 'line', 616
    find_lex $P352, "%options"
    unless_null $P352, vivify_202
    $P352 = root_new ['parrot';'Hash']
  vivify_202:
    set $P353, $P352["rtype"]
    unless_null $P353, vivify_203
    new $P353, "Undef"
  vivify_203:
    store_lex "$rtype", $P353
.annotate 'line', 618
    get_hll_global $P354, ["POST"], "Ops"
    $P355 = $P354."new"()
    store_lex "$ops", $P355
.annotate 'line', 619
    get_hll_global $P356, ["POST"], "Ops"
    $P357 = $P356."new"()
    store_lex "$pops", $P357
.annotate 'line', 620
    get_hll_global $P358, ["POST"], "Ops"
    $P359 = $P358."new"()
    store_lex "$tail", $P359
.annotate 'line', 621
    get_hll_global $P360, ["POST"], "Label"
    find_lex $P361, "self"
    $P362 = $P361."unique"("skip_handler_")
    $P363 = $P360."new"($P362 :named("result"))
    store_lex "$skip", $P363
.annotate 'line', 623
    find_lex $P365, "$ehs"
    defined $I366, $P365
    unless $I366, for_undef_204
    iter $P364, $P365
    new $P439, 'ExceptionHandler'
    set_label $P439, loop438_handler
    $P439."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P439
  loop438_test:
    unless $P364, loop438_done
    shift $P367, $P364
  loop438_redo:
    .const 'Sub' $P369 = "29_1307980071.79615" 
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
  for_undef_204:
.annotate 'line', 656
    find_lex $P441, "$ops"
    find_lex $P442, "$child"
    $P441."push"($P442)
.annotate 'line', 658
    find_lex $P443, "$ops"
    find_lex $P444, "$pops"
    $P443."push"($P444)
.annotate 'line', 659
    find_lex $P445, "$ops"
    find_lex $P446, "$skip"
    $P445."push_pirop"("goto", $P446)
.annotate 'line', 660
    find_lex $P447, "$ops"
    find_lex $P448, "$tail"
    $P447."push"($P448)
.annotate 'line', 661
    find_lex $P449, "$ops"
    find_lex $P450, "$skip"
    $P449."push"($P450)
    find_lex $P451, "$ops"
.annotate 'line', 615
    .return ($P451)
  control_342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P452, exception, "payload"
    .return ($P452)
.end


.namespace ["PAST";"Compiler"]
.sub "_block368"  :anon :subid("29_1307980071.79615") :outer("28_1307980071.79615")
    .param pmc param_374
.annotate 'line', 623
    .const 'Sub' $P417 = "31_1307980071.79615" 
    capture_lex $P417
    .const 'Sub' $P397 = "30_1307980071.79615" 
    capture_lex $P397
.annotate 'line', 624
    new $P370, "Undef"
    .lex "$node", $P370
.annotate 'line', 625
    new $P371, "Undef"
    .lex "$label", $P371
.annotate 'line', 626
    new $P372, "Undef"
    .lex "$ehreg", $P372
.annotate 'line', 631
    new $P373, "Undef"
    .lex "$type", $P373
    .lex "$_", param_374
.annotate 'line', 624
    find_lex $P375, "$_"
    store_lex "$node", $P375
.annotate 'line', 625
    get_hll_global $P376, ["POST"], "Label"
    find_lex $P377, "self"
    $P378 = $P377."unique"("control_")
    $P379 = $P376."new"($P378 :named("result"))
    store_lex "$label", $P379
.annotate 'line', 626
    find_lex $P380, "self"
    $P381 = $P380."uniquereg"("P")
    store_lex "$ehreg", $P381
.annotate 'line', 628
    find_lex $P382, "$ops"
    find_lex $P383, "$ehreg"
    $P382."push_pirop"("new", $P383, "'ExceptionHandler'")
.annotate 'line', 629
    find_lex $P384, "$ops"
    find_lex $P385, "$ehreg"
    find_lex $P386, "$label"
    $P384."push_pirop"("set_label", $P385, $P386)
.annotate 'line', 631
    find_lex $P387, "$node"
    $P388 = $P387."handle_types"()
    store_lex "$type", $P388
.annotate 'line', 632
    find_lex $P392, "$type"
    if $P392, if_391
    set $P390, $P392
    goto if_391_end
  if_391:
    find_lex $P393, "$type"
    get_global $P394, "%controltypes"
    unless_null $P394, vivify_205
    $P394 = root_new ['parrot';'Hash']
  vivify_205:
    set $P395, $P394[$P393]
    unless_null $P395, vivify_206
    new $P395, "Undef"
  vivify_206:
    store_lex "$type", $P395
    set $P390, $P395
  if_391_end:
    unless $P390, if_389_end
    .const 'Sub' $P397 = "30_1307980071.79615" 
    capture_lex $P397
    $P397()
  if_389_end:
.annotate 'line', 638
    find_lex $P407, "$node"
    $P408 = $P407."handle_types_except"()
    store_lex "$type", $P408
.annotate 'line', 639
    find_lex $P412, "$type"
    if $P412, if_411
    set $P410, $P412
    goto if_411_end
  if_411:
    find_lex $P413, "$type"
    get_global $P414, "%controltypes"
    unless_null $P414, vivify_209
    $P414 = root_new ['parrot';'Hash']
  vivify_209:
    set $P415, $P414[$P413]
    unless_null $P415, vivify_210
    new $P415, "Undef"
  vivify_210:
    store_lex "$type", $P415
    set $P410, $P415
  if_411_end:
    unless $P410, if_409_end
    .const 'Sub' $P417 = "31_1307980071.79615" 
    capture_lex $P417
    $P417()
  if_409_end:
.annotate 'line', 646
    find_lex $P427, "$ops"
    find_lex $P428, "$ehreg"
    $P427."push_pirop"("push_eh", $P428)
.annotate 'line', 649
    find_lex $P429, "$pops"
    $P429."push_pirop"("pop_eh")
.annotate 'line', 652
    find_lex $P430, "$tail"
    find_lex $P431, "$label"
    $P430."push"($P431)
.annotate 'line', 653
    find_lex $P432, "$tail"
    find_lex $P433, "self"
    find_lex $P434, "$node"
    find_lex $P435, "$rtype"
    $P436 = $P433."as_post"($P434, $P435 :named("rtype"))
    $P437 = $P432."push"($P436)
.annotate 'line', 623
    .return ($P437)
.end


.namespace ["PAST";"Compiler"]
.sub "_block396"  :anon :subid("30_1307980071.79615") :outer("29_1307980071.79615")
.annotate 'line', 633
    $P398 = root_new ['parrot';'ResizablePMCArray']
    .lex "@types", $P398
    find_lex $P399, "$type"
    set $S400, $P399
    split $P401, ",", $S400
    store_lex "@types", $P401
.annotate 'line', 634
    find_lex $P402, "$ops"
    find_lex $P403, "$ehreg"
    find_lex $P404, "@types"
    $P402."push_pirop"("callmethod", "\"handle_types\"", $P403, $P404 :flat)
.annotate 'line', 635
    find_dynamic_lex $P405, "$*SUB"
    unless_null $P405, vivify_207
    get_hll_global $P405, "$SUB"
    unless_null $P405, vivify_208
    die "Contextual $*SUB not found"
  vivify_208:
  vivify_207:
    $P406 = $P405."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 632
    .return ($P406)
.end


.namespace ["PAST";"Compiler"]
.sub "_block416"  :anon :subid("31_1307980071.79615") :outer("29_1307980071.79615")
.annotate 'line', 640
    $P418 = root_new ['parrot';'ResizablePMCArray']
    .lex "@types", $P418
    find_lex $P419, "$type"
    set $S420, $P419
    split $P421, ",", $S420
    store_lex "@types", $P421
.annotate 'line', 641
    find_lex $P422, "$ops"
    find_lex $P423, "$ehreg"
    find_lex $P424, "@types"
    $P422."push_pirop"("callmethod", "\"handle_types_except\"", $P423, $P424 :flat)
.annotate 'line', 643
    find_dynamic_lex $P425, "$*SUB"
    unless_null $P425, vivify_211
    get_hll_global $P425, "$SUB"
    unless_null $P425, vivify_212
    die "Contextual $*SUB not found"
  vivify_212:
  vivify_211:
    $P426 = $P425."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 639
    .return ($P426)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Block"])
    .param pmc param_456
    .param pmc param_457 :slurpy :named
.annotate 'line', 671
    .const 'Sub' $P555 = "33_1307980071.79615" 
    capture_lex $P555
    new $P455, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P455, control_454
    push_eh $P455
    .lex "self", self
    .lex "$node", param_456
    .lex "%options", param_457
.annotate 'line', 675
    new $P458, "Undef"
    .lex "$name", $P458
.annotate 'line', 676
    new $P459, "Undef"
    .lex "$pirflags", $P459
.annotate 'line', 677
    new $P460, "Undef"
    .lex "$blocktype", $P460
.annotate 'line', 678
    new $P461, "Undef"
    .lex "$nsentry", $P461
.annotate 'line', 679
    new $P462, "Undef"
    .lex "$subid", $P462
.annotate 'line', 680
    new $P463, "Undef"
    .lex "$ns", $P463
.annotate 'line', 681
    new $P464, "Undef"
    .lex "$hll", $P464
.annotate 'line', 682
    new $P465, "Undef"
    .lex "$multi", $P465
.annotate 'line', 683
    new $P466, "Undef"
    .lex "$loadlibs", $P466
.annotate 'line', 707
    new $P467, "Undef"
    .lex "$bpost", $P467
.annotate 'line', 715
    new $P468, "Undef"
    .lex "$blockreg", $P468
.annotate 'line', 716
    new $P469, "Undef"
    .lex "$blockref", $P469
.annotate 'line', 721
    new $P470, "Undef"
    .lex "$outerpost", $P470
.annotate 'line', 673
    find_dynamic_lex $P471, "@*BLOCKPAST"
    unless_null $P471, vivify_213
    get_hll_global $P471, "@BLOCKPAST"
    unless_null $P471, vivify_214
    die "Contextual @*BLOCKPAST not found"
  vivify_214:
  vivify_213:
    find_lex $P472, "$node"
    unshift $P471, $P472
.annotate 'line', 675
    find_lex $P473, "$node"
    $P474 = $P473."name"()
    store_lex "$name", $P474
.annotate 'line', 676
    find_lex $P475, "$node"
    $P476 = $P475."pirflags"()
    store_lex "$pirflags", $P476
.annotate 'line', 677
    find_lex $P477, "$node"
    $P478 = $P477."blocktype"()
    store_lex "$blocktype", $P478
.annotate 'line', 678
    find_lex $P479, "$node"
    $P480 = $P479."nsentry"()
    store_lex "$nsentry", $P480
.annotate 'line', 679
    find_lex $P481, "$node"
    $P482 = $P481."subid"()
    store_lex "$subid", $P482
.annotate 'line', 680
    find_lex $P483, "$node"
    $P484 = $P483."namespace"()
    store_lex "$ns", $P484
.annotate 'line', 681
    find_lex $P485, "$node"
    $P486 = $P485."hll"()
    store_lex "$hll", $P486
.annotate 'line', 682
    find_lex $P487, "$node"
    $P488 = $P487."multi"()
    store_lex "$multi", $P488
.annotate 'line', 683
    find_lex $P489, "$node"
    $P490 = $P489."loadlibs"()
    store_lex "$loadlibs", $P490
.annotate 'line', 686
    find_lex $P492, "$name"
    defined $I493, $P492
    if $I493, unless_491_end
    new $P494, "String"
    assign $P494, ""
    store_lex "$name", $P494
  unless_491_end:
.annotate 'line', 687
    find_lex $P496, "$pirflags"
    defined $I497, $P496
    if $I497, unless_495_end
    new $P498, "String"
    assign $P498, ""
    store_lex "$pirflags", $P498
  unless_495_end:
.annotate 'line', 688
    find_lex $P500, "$blocktype"
    defined $I501, $P500
    if $I501, unless_499_end
    new $P502, "String"
    assign $P502, ""
    store_lex "$blocktype", $P502
  unless_499_end:
.annotate 'line', 691
    find_lex $P504, "$nsentry"
    defined $I505, $P504
    unless $I505, if_503_end
.annotate 'line', 692
    find_lex $P507, "$nsentry"
    if $P507, if_506
.annotate 'line', 696
    find_lex $P515, "$pirflags"
    concat $P516, $P515, " :anon"
    store_lex "$pirflags", $P516
.annotate 'line', 695
    goto if_506_end
  if_506:
.annotate 'line', 694
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
.annotate 'line', 701
    find_lex $P518, "$name"
    if $P518, unless_517_end
.annotate 'line', 702
    find_lex $P519, "self"
    $P520 = $P519."unique"("_block")
    store_lex "$name", $P520
.annotate 'line', 703
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
.annotate 'line', 707
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
.annotate 'line', 712
    find_lex $P539, "$pirflags"
    unless $P539, if_538_end
    find_lex $P540, "$bpost"
    find_lex $P541, "$pirflags"
    $P540."pirflags"($P541)
  if_538_end:
.annotate 'line', 715
    find_lex $P542, "self"
    $P543 = $P542."uniquereg"("P")
    store_lex "$blockreg", $P543
.annotate 'line', 716
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
.annotate 'line', 721
    find_dynamic_lex $P553, "$*SUB"
    unless_null $P553, vivify_215
    get_hll_global $P553, "$SUB"
    unless_null $P553, vivify_216
    die "Contextual $*SUB not found"
  vivify_216:
  vivify_215:
    store_lex "$outerpost", $P553
.annotate 'line', 722
    .const 'Sub' $P555 = "33_1307980071.79615" 
    capture_lex $P555
    $P555()
.annotate 'line', 853
    find_dynamic_lex $P824, "@*BLOCKPAST"
    unless_null $P824, vivify_235
    get_hll_global $P824, "@BLOCKPAST"
    unless_null $P824, vivify_236
    die "Contextual @*BLOCKPAST not found"
  vivify_236:
  vivify_235:
    shift $P825, $P824
    find_lex $P826, "$bpost"
.annotate 'line', 671
    .return ($P826)
  control_454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P827, exception, "payload"
    .return ($P827)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block554"  :anon :subid("33_1307980071.79615") :outer("32_1307980071.79615")
.annotate 'line', 722
    .const 'Sub' $P810 = "41_1307980071.79615" 
    capture_lex $P810
    .const 'Sub' $P760 = "40_1307980071.79615" 
    capture_lex $P760
    .const 'Sub' $P733 = "39_1307980071.79615" 
    capture_lex $P733
    .const 'Sub' $P634 = "36_1307980071.79615" 
    capture_lex $P634
    .const 'Sub' $P604 = "35_1307980071.79615" 
    capture_lex $P604
    .const 'Sub' $P573 = "34_1307980071.79615" 
    capture_lex $P573
.annotate 'line', 723
    new $P556, "Undef"
    .lex "$*SUB", $P556
.annotate 'line', 725
    new $P557, "Undef"
    .lex "$islexical", $P557
.annotate 'line', 739
    $P558 = root_new ['parrot';'Hash']
    .lex "%outersym", $P558
.annotate 'line', 740
    $P559 = root_new ['parrot';'Hash']
    .lex "%symtable", $P559
.annotate 'line', 757
    new $P560, "Undef"
    .lex "$compiler", $P560
.annotate 'line', 825
    new $P561, "Undef"
    .lex "$rtype", $P561
.annotate 'line', 723
    find_lex $P562, "$bpost"
    store_lex "$*SUB", $P562
.annotate 'line', 725
    find_lex $P563, "$node"
    $P564 = $P563."lexical"()
    store_lex "$islexical", $P564
.annotate 'line', 726
    find_lex $P566, "$islexical"
    unless $P566, if_565_end
.annotate 'line', 727
    find_lex $P567, "$bpost"
    find_lex $P568, "$outerpost"
    $P567."outer"($P568)
.annotate 'line', 730
    find_lex $P570, "$outerpost"
    defined $I571, $P570
    unless $I571, if_569_end
    .const 'Sub' $P573 = "34_1307980071.79615" 
    capture_lex $P573
    $P573()
  if_569_end:
  if_565_end:
.annotate 'line', 739
    find_lex $P585, "self"
    getattribute $P586, $P585, "%!symtable"
    unless_null $P586, vivify_217
    $P586 = root_new ['parrot';'Hash']
  vivify_217:
    store_lex "%outersym", $P586
.annotate 'line', 740
    find_lex $P587, "%outersym"
    store_lex "%symtable", $P587
.annotate 'line', 742
    find_lex $P589, "$node"
    $P590 = $P589."symtable"()
    unless $P590, if_588_end
.annotate 'line', 745
    find_lex $P591, "$node"
    $P592 = $P591."symtable"()
    store_lex "%symtable", $P592
.annotate 'line', 746
    find_lex $P594, "%symtable"
    unless_null $P594, vivify_218
    $P594 = root_new ['parrot';'Hash']
  vivify_218:
    set $P595, $P594[""]
    unless_null $P595, vivify_219
    new $P595, "Undef"
  vivify_219:
    defined $I596, $P595
    if $I596, unless_593_end
.annotate 'line', 748
    find_lex $P597, "%symtable"
    clone $P598, $P597
    store_lex "%symtable", $P598
.annotate 'line', 749
    find_lex $P600, "%outersym"
    defined $I601, $P600
    unless $I601, for_undef_220
    iter $P599, $P600
    new $P617, 'ExceptionHandler'
    set_label $P617, loop616_handler
    $P617."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P617
  loop616_test:
    unless $P599, loop616_done
    shift $P602, $P599
  loop616_redo:
    .const 'Sub' $P604 = "35_1307980071.79615" 
    capture_lex $P604
    $P604($P602)
  loop616_next:
    goto loop616_test
  loop616_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P618, exception, 'type'
    eq $P618, .CONTROL_LOOP_NEXT, loop616_next
    eq $P618, .CONTROL_LOOP_REDO, loop616_redo
  loop616_done:
    pop_eh 
  for_undef_220:
  unless_593_end:
  if_588_end:
.annotate 'line', 755
    find_lex $P619, "%symtable"
    find_lex $P620, "self"
    setattribute $P620, "%!symtable", $P619
.annotate 'line', 757
    find_lex $P621, "$node"
    $P622 = $P621."compiler"()
    store_lex "$compiler", $P622
.annotate 'line', 758
    find_lex $P624, "$compiler"
    if $P624, if_623
.annotate 'line', 764
    .const 'Sub' $P634 = "36_1307980071.79615" 
    capture_lex $P634
    $P634()
    goto if_623_end
  if_623:
.annotate 'line', 761
    find_lex $P625, "$bpost"
    find_lex $P626, "$compiler"
    $P625."compiler"($P626)
.annotate 'line', 762
    find_lex $P627, "$bpost"
    find_lex $P628, "$node"
    $P629 = $P628."compiler_args"()
    $P627."compiler_args"($P629)
.annotate 'line', 763
    find_lex $P630, "$bpost"
    find_lex $P631, "$node"
    unless_null $P631, vivify_228
    $P631 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P632, $P631[0]
    unless_null $P632, vivify_229
    new $P632, "Undef"
  vivify_229:
    $P630."push"($P632)
  if_623_end:
.annotate 'line', 812
    find_lex $P730, "$node"
    exists $I731, $P730["loadinit"]
    unless $I731, if_729_end
    .const 'Sub' $P733 = "39_1307980071.79615" 
    capture_lex $P733
    $P733()
  if_729_end:
.annotate 'line', 822
    find_lex $P750, "%outersym"
    find_lex $P751, "self"
    setattribute $P751, "%!symtable", $P750
.annotate 'line', 825
    find_lex $P752, "%options"
    unless_null $P752, vivify_231
    $P752 = root_new ['parrot';'Hash']
  vivify_231:
    set $P753, $P752["rtype"]
    unless_null $P753, vivify_232
    new $P753, "Undef"
  vivify_232:
    store_lex "$rtype", $P753
.annotate 'line', 827
    find_lex $P756, "$blocktype"
    set $S757, $P756
    iseq $I758, $S757, "immediate"
    if $I758, if_755
.annotate 'line', 835
    find_lex $P791, "$rtype"
    set $S792, $P791
    isne $I793, $S792, "v"
    if $I793, if_790
    new $P789, 'Integer'
    set $P789, $I793
    goto if_790_end
  if_790:
.annotate 'line', 836
    get_hll_global $P794, ["POST"], "Ops"
    find_lex $P795, "$bpost"
    find_lex $P796, "$node"
    find_lex $P797, "$blockreg"
    $P798 = $P794."new"($P795, $P796 :named("node"), $P797 :named("result"))
    store_lex "$bpost", $P798
.annotate 'line', 837
    find_lex $P799, "$bpost"
    find_lex $P800, "$blockref"
    find_lex $P801, "$blockreg"
    $P799."push_pirop"($P800, $P801 :named("result"))
.annotate 'line', 838
    find_lex $P804, "$islexical"
    if $P804, if_803
    set $P802, $P804
    goto if_803_end
  if_803:
.annotate 'line', 839
    find_lex $P807, "$node"
    $P808 = $P807."closure"()
    if $P808, if_806
.annotate 'line', 846
    find_lex $P821, "$bpost"
    find_lex $P822, "$blockreg"
    $P823 = $P821."push_pirop"("capture_lex", $P822)
.annotate 'line', 845
    set $P805, $P823
.annotate 'line', 839
    goto if_806_end
  if_806:
    .const 'Sub' $P810 = "41_1307980071.79615" 
    capture_lex $P810
    $P820 = $P810()
    set $P805, $P820
  if_806_end:
.annotate 'line', 838
    set $P802, $P805
  if_803_end:
.annotate 'line', 835
    set $P789, $P802
  if_790_end:
    set $P754, $P789
.annotate 'line', 827
    goto if_755_end
  if_755:
    .const 'Sub' $P760 = "40_1307980071.79615" 
    capture_lex $P760
    $P788 = $P760()
    set $P754, $P788
  if_755_end:
.annotate 'line', 722
    .return ($P754)
.end


.namespace ["PAST";"Compiler"]
.sub "_block572"  :anon :subid("34_1307980071.79615") :outer("33_1307980071.79615")
.annotate 'line', 731
    new $P574, "Undef"
    .lex "$cpost", $P574
    get_hll_global $P575, ["POST"], "Ops"
    find_lex $P576, "$blockreg"
    $P577 = $P575."new"($P576 :named("result"))
    store_lex "$cpost", $P577
.annotate 'line', 732
    find_lex $P578, "$cpost"
    find_lex $P579, "$blockref"
    $P578."push_pirop"($P579)
.annotate 'line', 733
    find_lex $P580, "$cpost"
    find_lex $P581, "$blockreg"
    $P580."push_pirop"("capture_lex", $P581)
.annotate 'line', 734
    find_lex $P582, "$outerpost"
    find_lex $P583, "$cpost"
    $P584 = $P582."unshift"($P583)
.annotate 'line', 730
    .return ($P584)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block603"  :anon :subid("35_1307980071.79615") :outer("33_1307980071.79615")
    .param pmc param_605
.annotate 'line', 749
    .lex "$_", param_605
.annotate 'line', 750
    find_lex $P608, "$_"
    find_lex $P607, "%symtable"
    exists $I609, $P607[$P608]
    unless $I609, if_606_end
    set $I610, .CONTROL_LOOP_NEXT
    die 0, $I610
  if_606_end:
.annotate 'line', 751
    find_lex $P611, "$_"
    find_lex $P612, "%outersym"
    unless_null $P612, vivify_221
    $P612 = root_new ['parrot';'Hash']
  vivify_221:
    set $P613, $P612[$P611]
    unless_null $P613, vivify_222
    new $P613, "Undef"
  vivify_222:
    find_lex $P614, "$_"
    find_lex $P615, "%symtable"
    unless_null $P615, vivify_223
    $P615 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P615
  vivify_223:
    set $P615[$P614], $P613
.annotate 'line', 749
    .return ($P613)
.end


.namespace ["PAST";"Compiler"]
.sub "_block633"  :anon :subid("36_1307980071.79615") :outer("33_1307980071.79615")
.annotate 'line', 764
    .const 'Sub' $P703 = "38_1307980071.79615" 
    capture_lex $P703
    .const 'Sub' $P647 = "37_1307980071.79615" 
    capture_lex $P647
.annotate 'line', 766
    new $P635, "Undef"
    .lex "$ctrlpast", $P635
.annotate 'line', 767
    new $P636, "Undef"
    .lex "$ctrllabel", $P636
.annotate 'line', 780
    new $P637, "Undef"
    .lex "$sig", $P637
.annotate 'line', 782
    new $P638, "Undef"
    .lex "$ops", $P638
.annotate 'line', 784
    new $P639, "Undef"
    .lex "$retval", $P639
.annotate 'line', 786
    new $P640, "Undef"
    .lex "$eh", $P640
.annotate 'line', 766
    find_lex $P641, "$node"
    $P642 = $P641."control"()
    store_lex "$ctrlpast", $P642
    find_lex $P643, "$ctrllabel"
.annotate 'line', 769
    find_lex $P645, "$ctrlpast"
    unless $P645, if_644_end
    .const 'Sub' $P647 = "37_1307980071.79615" 
    capture_lex $P647
    $P647()
  if_644_end:
.annotate 'line', 780
    find_lex $P664, "$node"
    $P665 = $P664."list"()
    elements $I666, $P665
    repeat $S667, "v", $I666
    new $P668, 'String'
    set $P668, $S667
    concat $P669, $P668, "*"
    store_lex "$sig", $P669
.annotate 'line', 782
    find_lex $P670, "self"
    find_lex $P671, "$node"
    find_lex $P672, "$sig"
    $P673 = $P670."post_children"($P671, $P672 :named("signature"))
    store_lex "$ops", $P673
.annotate 'line', 784
    find_lex $P674, "$ops"
    unless_null $P674, vivify_224
    $P674 = root_new ['parrot';'ResizablePMCArray']
  vivify_224:
    set $P675, $P674[-1]
    unless_null $P675, vivify_225
    new $P675, "Undef"
  vivify_225:
    store_lex "$retval", $P675
.annotate 'line', 786
    find_lex $P676, "$node"
    $P677 = $P676."handlers"()
    store_lex "$eh", $P677
.annotate 'line', 787
    find_lex $P679, "$eh"
    unless $P679, if_678_end
.annotate 'line', 788
    find_lex $P680, "self"
    find_lex $P681, "$ops"
    find_lex $P682, "$eh"
    find_lex $P683, "%options"
    unless_null $P683, vivify_226
    $P683 = root_new ['parrot';'Hash']
  vivify_226:
    set $P684, $P683["rtype"]
    unless_null $P684, vivify_227
    new $P684, "Undef"
  vivify_227:
    $P685 = $P680."wrap_handlers"($P681, $P682, $P684 :named("rtype"))
    store_lex "$ops", $P685
  if_678_end:
.annotate 'line', 790
    find_lex $P686, "$bpost"
    find_lex $P687, "$ops"
    $P686."push"($P687)
.annotate 'line', 791
    find_lex $P688, "$bpost"
    find_lex $P689, "$retval"
    $P688."push_pirop"("return", $P689)
.annotate 'line', 793
    find_lex $P692, "$ctrlpast"
    if $P692, if_691
    set $P690, $P692
    goto if_691_end
  if_691:
.annotate 'line', 794
    find_lex $P693, "$bpost"
    find_lex $P694, "$ctrllabel"
    $P693."push"($P694)
.annotate 'line', 795
    find_lex $P695, "$bpost"
    $P695."push_pirop"(".local pmc exception")
.annotate 'line', 796
    find_lex $P696, "$bpost"
    $P696."push_pirop"(".get_results (exception)")
.annotate 'line', 797
    find_lex $P699, "$ctrlpast"
    set $S700, $P699
    iseq $I701, $S700, "return_pir"
    if $I701, if_698
.annotate 'line', 803
    find_lex $P715, "$ctrlpast"
    get_hll_global $P716, ["PAST"], "Node"
    $P717 = $P715."isa"($P716)
    if $P717, if_714
.annotate 'line', 806
    find_lex $P723, "self"
    new $P724, 'String'
    set $P724, "Unrecognized control handler '"
    find_lex $P725, "$ctrlpast"
    concat $P726, $P724, $P725
    concat $P727, $P726, "'"
    $P728 = $P723."panic"($P727)
.annotate 'line', 805
    set $P713, $P728
.annotate 'line', 803
    goto if_714_end
  if_714:
.annotate 'line', 804
    find_lex $P718, "$bpost"
    find_lex $P719, "self"
    find_lex $P720, "$ctrlpast"
    $P721 = $P719."as_post"($P720, "*" :named("rtype"))
    $P722 = $P718."push"($P721)
.annotate 'line', 803
    set $P713, $P722
  if_714_end:
    set $P697, $P713
.annotate 'line', 797
    goto if_698_end
  if_698:
    .const 'Sub' $P703 = "38_1307980071.79615" 
    capture_lex $P703
    $P712 = $P703()
    set $P697, $P712
  if_698_end:
.annotate 'line', 793
    set $P690, $P697
  if_691_end:
.annotate 'line', 764
    .return ($P690)
.end


.namespace ["PAST";"Compiler"]
.sub "_block646"  :anon :subid("37_1307980071.79615") :outer("36_1307980071.79615")
.annotate 'line', 771
    new $P648, "Undef"
    .lex "$reg", $P648
.annotate 'line', 770
    get_hll_global $P649, ["POST"], "Label"
    find_lex $P650, "self"
    $P651 = $P650."unique"("control_")
    $P652 = $P649."new"($P651 :named("result"))
    store_lex "$ctrllabel", $P652
.annotate 'line', 771
    find_lex $P653, "self"
    $P654 = $P653."uniquereg"("P")
    store_lex "$reg", $P654
.annotate 'line', 772
    find_lex $P655, "$bpost"
    find_lex $P656, "$reg"
    $P655."push_pirop"("new", $P656, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 774
    find_lex $P657, "$bpost"
    find_lex $P658, "$reg"
    find_lex $P659, "$ctrllabel"
    $P657."push_pirop"("set_label", $P658, $P659)
.annotate 'line', 775
    find_lex $P660, "$bpost"
    find_lex $P661, "$reg"
    $P660."push_pirop"("push_eh", $P661)
.annotate 'line', 776
    find_lex $P662, "$bpost"
    $P663 = $P662."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 769
    .return ($P663)
.end


.namespace ["PAST";"Compiler"]
.sub "_block702"  :anon :subid("38_1307980071.79615") :outer("36_1307980071.79615")
.annotate 'line', 799
    new $P704, "Undef"
    .lex "$reg", $P704
    find_lex $P705, "self"
    $P706 = $P705."uniquereg"("P")
    store_lex "$reg", $P706
.annotate 'line', 800
    find_lex $P707, "$bpost"
    find_lex $P708, "$reg"
    $P707."push_pirop"("getattribute", $P708, "exception", "\"payload\"")
.annotate 'line', 802
    find_lex $P709, "$bpost"
    find_lex $P710, "$reg"
    $P711 = $P709."push_pirop"("return", $P710)
.annotate 'line', 797
    .return ($P711)
.end


.namespace ["PAST";"Compiler"]
.sub "_block732"  :anon :subid("39_1307980071.79615") :outer("33_1307980071.79615")
.annotate 'line', 813
    new $P734, "Undef"
    .lex "$lisub", $P734
    get_hll_global $P735, ["POST"], "Sub"
    find_lex $P736, "$bpost"
    $P737 = $P735."new"($P736 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P737
.annotate 'line', 814
    find_lex $P738, "$lisub"
    find_lex $P739, "$blockref"
    $P738."push_pirop"($P739)
.annotate 'line', 815
    find_lex $P740, "$lisub"
    $P740."push_pirop"(".local pmc", "block")
.annotate 'line', 816
    find_lex $P741, "$lisub"
    find_lex $P742, "$blockreg"
    $P741."push_pirop"("set", "block", $P742)
.annotate 'line', 817
    find_lex $P743, "$lisub"
    find_lex $P744, "self"
    find_lex $P745, "$node"
    $P746 = $P745."loadinit"()
    $P747 = $P744."as_post"($P746, "v" :named("rtype"))
    $P743."push"($P747)
.annotate 'line', 818
    find_lex $P748, "$lisub"
    find_lex $P749, "$bpost"
    unless_null $P749, vivify_230
    $P749 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P749
  vivify_230:
    set $P749["loadinit"], $P748
.annotate 'line', 812
    .return ($P748)
.end


.namespace ["PAST";"Compiler"]
.sub "_block809"  :anon :subid("41_1307980071.79615") :outer("33_1307980071.79615")
.annotate 'line', 842
    new $P811, "Undef"
    .lex "$result", $P811
    find_lex $P812, "self"
    $P813 = $P812."uniquereg"("P")
    store_lex "$result", $P813
.annotate 'line', 843
    find_lex $P814, "$bpost"
    find_lex $P815, "$result"
    find_lex $P816, "$blockreg"
    $P814."push_pirop"("newclosure", $P815, $P816)
.annotate 'line', 844
    find_lex $P817, "$bpost"
    find_lex $P818, "$result"
    $P819 = $P817."result"($P818)
.annotate 'line', 839
    .return ($P819)
.end


.namespace ["PAST";"Compiler"]
.sub "_block759"  :anon :subid("40_1307980071.79615") :outer("33_1307980071.79615")
.annotate 'line', 828
    $P761 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P761
.annotate 'line', 830
    new $P762, "Undef"
    .lex "$result", $P762
.annotate 'line', 828
    find_lex $P763, "%options"
    unless_null $P763, vivify_233
    $P763 = root_new ['parrot';'Hash']
  vivify_233:
    set $P764, $P763["arglist"]
    unless_null $P764, vivify_234
    new $P764, "Undef"
  vivify_234:
    store_lex "@arglist", $P764
.annotate 'line', 829
    find_lex $P766, "@arglist"
    defined $I767, $P766
    if $I767, unless_765_end
    new $P768, "ResizablePMCArray"
    store_lex "@arglist", $P768
  unless_765_end:
.annotate 'line', 830
    find_lex $P769, "self"
    find_lex $P770, "$rtype"
    $P771 = $P769."uniquereg"($P770)
    store_lex "$result", $P771
.annotate 'line', 831
    get_hll_global $P772, ["POST"], "Ops"
    find_lex $P773, "$bpost"
    find_lex $P774, "$node"
    find_lex $P775, "$result"
    $P776 = $P772."new"($P773, $P774 :named("node"), $P775 :named("result"))
    store_lex "$bpost", $P776
.annotate 'line', 832
    find_lex $P777, "$bpost"
    find_lex $P778, "$blockref"
    $P777."push_pirop"($P778)
.annotate 'line', 833
    find_lex $P780, "$islexical"
    unless $P780, if_779_end
    find_lex $P781, "$bpost"
    find_lex $P782, "$blockreg"
    $P781."push_pirop"("capture_lex", $P782)
  if_779_end:
.annotate 'line', 834
    find_lex $P783, "$bpost"
    find_lex $P784, "$blockreg"
    find_lex $P785, "@arglist"
    find_lex $P786, "$result"
    $P787 = $P783."push_pirop"("call", $P784, $P785 :flat, $P786 :named("result"))
.annotate 'line', 827
    .return ($P787)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("42_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_831
    .param pmc param_832 :slurpy :named
.annotate 'line', 865
    new $P830, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P830, control_829
    push_eh $P830
    .lex "self", self
    .lex "$node", param_831
    .lex "%options", param_832
.annotate 'line', 867
    new $P833, "Undef"
    .lex "$lvalue", $P833
.annotate 'line', 868
    new $P834, "Undef"
    .lex "$child", $P834
.annotate 'line', 873
    new $P835, "Undef"
    .lex "$pasttype", $P835
.annotate 'line', 878
    new $P836, "Undef"
    .lex "$pirop", $P836
.annotate 'line', 883
    new $P837, "Undef"
    .lex "$inline", $P837
.annotate 'line', 867
    find_lex $P838, "$node"
    $P839 = $P838."lvalue"()
    store_lex "$lvalue", $P839
.annotate 'line', 868
    find_lex $P840, "$node"
    unless_null $P840, vivify_237
    $P840 = root_new ['parrot';'ResizablePMCArray']
  vivify_237:
    set $P841, $P840[0]
    unless_null $P841, vivify_238
    new $P841, "Undef"
  vivify_238:
    store_lex "$child", $P841
.annotate 'line', 869
    find_lex $P847, "$lvalue"
    if $P847, if_846
    set $P845, $P847
    goto if_846_end
  if_846:
    find_lex $P848, "$child"
    defined $I849, $P848
    new $P845, 'Integer'
    set $P845, $I849
  if_846_end:
    if $P845, if_844
    set $P843, $P845
    goto if_844_end
  if_844:
    find_lex $P850, "$child"
    exists $I851, $P850["lvalue"]
    new $P852, 'Integer'
    set $P852, $I851
    isfalse $I853, $P852
    new $P843, 'Integer'
    set $P843, $I853
  if_844_end:
    unless $P843, if_842_end
.annotate 'line', 870
    find_lex $P854, "$child"
    find_lex $P855, "$lvalue"
    $P854."lvalue"($P855)
  if_842_end:
.annotate 'line', 873
    find_lex $P856, "$node"
    $P857 = $P856."pasttype"()
    store_lex "$pasttype", $P857
.annotate 'line', 874
    find_lex $P859, "$pasttype"
    unless $P859, if_858_end
.annotate 'line', 875
    new $P860, "Exception"
    set $P860['type'], .CONTROL_RETURN
    find_lex $P861, "self"
    find_lex $P862, "$node"
    find_lex $P863, "%options"
    find_lex $P864, "$pasttype"
    set $S865, $P864
    $P866 = $P861.$S865($P862, $P863 :flat)
    setattribute $P860, 'payload', $P866
    throw $P860
  if_858_end:
.annotate 'line', 878
    find_lex $P867, "$node"
    $P868 = $P867."pirop"()
    store_lex "$pirop", $P868
.annotate 'line', 879
    find_lex $P870, "$pirop"
    unless $P870, if_869_end
.annotate 'line', 880
    new $P871, "Exception"
    set $P871['type'], .CONTROL_RETURN
    find_lex $P872, "self"
    find_lex $P873, "$node"
    find_lex $P874, "%options"
    $P875 = $P872."pirop"($P873, $P874 :flat)
    setattribute $P871, 'payload', $P875
    throw $P871
  if_869_end:
.annotate 'line', 883
    find_lex $P876, "$node"
    $P877 = $P876."inline"()
    store_lex "$inline", $P877
.annotate 'line', 884
    find_lex $P879, "$inline"
    unless $P879, if_878_end
.annotate 'line', 885
    new $P880, "Exception"
    set $P880['type'], .CONTROL_RETURN
    find_lex $P881, "self"
    find_lex $P882, "$node"
    find_lex $P883, "%options"
    $P884 = $P881."inline"($P882, $P883 :flat)
    setattribute $P880, 'payload', $P884
    throw $P880
  if_878_end:
.annotate 'line', 888
    find_lex $P885, "self"
    find_lex $P886, "$node"
    find_lex $P887, "%options"
    $P888 = $P885."call"($P886, $P887 :flat)
.annotate 'line', 865
    .return ($P888)
  control_829:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P889, exception, "payload"
    .return ($P889)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("43_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_893
    .param pmc param_894 :slurpy :named
.annotate 'line', 896
    new $P892, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P892, control_891
    push_eh $P892
    .lex "self", self
    .lex "$node", param_893
    .lex "%options", param_894
.annotate 'line', 897
    new $P895, "Undef"
    .lex "$pirop", $P895
.annotate 'line', 898
    new $P896, "Undef"
    .lex "$signature", $P896
.annotate 'line', 899
    new $P897, "Undef"
    .lex "$I0", $P897
.annotate 'line', 913
    new $P898, "Undef"
    .lex "$ops", $P898
.annotate 'line', 914
    $P899 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P899
.annotate 'line', 924
    $P900 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P900
.annotate 'line', 926
    new $P901, "Undef"
    .lex "$S0", $P901
.annotate 'line', 937
    new $P902, "Undef"
    .lex "$result", $P902
.annotate 'line', 897
    find_lex $P903, "$node"
    $P904 = $P903."pirop"()
    store_lex "$pirop", $P904
    find_lex $P905, "$signature"
    find_lex $P906, "$I0"
.annotate 'line', 900
    find_lex $P908, "$pirop"
    set $S909, $P908
    index $I910, $S909, " "
    new $P911, 'Integer'
    set $P911, $I910
    store_lex "$I0", $P911
    set $N912, $P911
    isge $I913, $N912, 0.0
    if $I913, if_907
.annotate 'line', 904
    find_lex $P928, "$pirop"
    set $S929, $P928
    index $I930, $S929, "__"
    new $P931, 'Integer'
    set $P931, $I930
    store_lex "$I0", $P931
    set $N932, $P931
    isge $I933, $N932, 0.0
    if $I933, if_927
.annotate 'line', 909
    find_lex $P947, "$pirop"
    get_global $P948, "%piropsig"
    unless_null $P948, vivify_239
    $P948 = root_new ['parrot';'Hash']
  vivify_239:
    set $P949, $P948[$P947]
    unless_null $P949, vivify_240
    new $P949, "Undef"
  vivify_240:
    store_lex "$signature", $P949
.annotate 'line', 910
    find_lex $P951, "$signature"
    if $P951, unless_950_end
    new $P952, "String"
    assign $P952, "vP"
    store_lex "$signature", $P952
  unless_950_end:
.annotate 'line', 908
    goto if_927_end
  if_927:
.annotate 'line', 906
    find_lex $P934, "$pirop"
    set $S935, $P934
    find_lex $P936, "$I0"
    add $P937, $P936, 2
    set $I938, $P937
    substr $S939, $S935, $I938
    new $P940, 'String'
    set $P940, $S939
    store_lex "$signature", $P940
.annotate 'line', 907
    find_lex $P941, "$pirop"
    set $S942, $P941
    find_lex $P943, "$I0"
    set $I944, $P943
    substr $S945, $S942, 0, $I944
    new $P946, 'String'
    set $P946, $S945
    store_lex "$pirop", $P946
  if_927_end:
.annotate 'line', 904
    goto if_907_end
  if_907:
.annotate 'line', 902
    find_lex $P914, "$pirop"
    set $S915, $P914
    find_lex $P916, "$I0"
    add $P917, $P916, 1
    set $I918, $P917
    substr $S919, $S915, $I918
    new $P920, 'String'
    set $P920, $S919
    store_lex "$signature", $P920
.annotate 'line', 903
    find_lex $P921, "$pirop"
    set $S922, $P921
    find_lex $P923, "$I0"
    set $I924, $P923
    substr $S925, $S922, 0, $I924
    new $P926, 'String'
    set $P926, $S925
    store_lex "$pirop", $P926
  if_907_end:
.annotate 'line', 900
    find_lex $P953, "$ops"
    find_lex $P954, "@posargs"
.annotate 'line', 916

		$P0 = find_lex '$node'
		$P1 = find_lex '$signature'
		($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
		store_lex '$ops', $P0
		store_lex '@posargs', $P1
	
.annotate 'line', 924
    find_lex $P955, "$ops"
    $P956 = $P955."list"()
    store_lex "@arglist", $P956
.annotate 'line', 926
    find_lex $P957, "$signature"
    set $S958, $P957
    substr $S959, $S958, 0, 1
    new $P960, 'String'
    set $P960, $S959
    store_lex "$S0", $P960
.annotate 'line', 927
    find_lex $P962, "$S0"
    set $S963, $P962
    iseq $I964, $S963, "v"
    unless $I964, if_961_end
.annotate 'line', 928
    find_lex $P965, "$ops"
    find_lex $P966, "$pirop"
    find_lex $P967, "@posargs"
    $P965."push_pirop"($P966, $P967 :flat)
.annotate 'line', 929
    new $P968, "Exception"
    set $P968['type'], .CONTROL_RETURN
    find_lex $P969, "$ops"
    setattribute $P968, 'payload', $P969
    throw $P968
  if_961_end:
.annotate 'line', 931
    find_lex $P970, "$S0"
    set $S971, $P970
    index $I972, "0123456789", $S971
    new $P973, 'Integer'
    set $P973, $I972
    store_lex "$I0", $P973
.annotate 'line', 932
    find_lex $P975, "$I0"
    set $N976, $P975
    isge $I977, $N976, 0.0
    unless $I977, if_974_end
.annotate 'line', 933
    find_lex $P978, "$ops"
    find_lex $P979, "$I0"
    set $I980, $P979
    find_lex $P981, "@arglist"
    unless_null $P981, vivify_241
    $P981 = root_new ['parrot';'ResizablePMCArray']
  vivify_241:
    set $P982, $P981[$I980]
    unless_null $P982, vivify_242
    new $P982, "Undef"
  vivify_242:
    $P978."result"($P982)
.annotate 'line', 934
    find_lex $P983, "$ops"
    find_lex $P984, "$pirop"
    find_lex $P985, "@posargs"
    $P983."push_pirop"($P984, $P985 :flat)
.annotate 'line', 935
    new $P986, "Exception"
    set $P986['type'], .CONTROL_RETURN
    find_lex $P987, "$ops"
    setattribute $P986, 'payload', $P987
    throw $P986
  if_974_end:
.annotate 'line', 937
    find_lex $P988, "self"
    find_lex $P989, "$S0"
    $P990 = $P988."uniquereg"($P989)
    store_lex "$result", $P990
.annotate 'line', 938
    find_lex $P991, "$ops"
    find_lex $P992, "$result"
    $P991."result"($P992)
.annotate 'line', 939
    find_lex $P993, "$ops"
    find_lex $P994, "$pirop"
    find_lex $P995, "$result"
    find_lex $P996, "@posargs"
    $P993."push_pirop"($P994, $P995, $P996 :flat)
.annotate 'line', 940
    new $P997, "Exception"
    set $P997['type'], .CONTROL_RETURN
    find_lex $P998, "$ops"
    setattribute $P997, 'payload', $P998
    throw $P997
.annotate 'line', 896
    .return ()
  control_891:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P999, exception, "payload"
    .return ($P999)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("44_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1003
    .param pmc param_1004 :slurpy :named
.annotate 'line', 948
    .const 'Sub' $P1042 = "45_1307980071.79615" 
    capture_lex $P1042
    new $P1002, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1002, control_1001
    push_eh $P1002
    .lex "self", self
    .lex "$node", param_1003
    .lex "%options", param_1004
.annotate 'line', 949
    new $P1005, "Undef"
    .lex "$pasttype", $P1005
.annotate 'line', 952
    new $P1006, "Undef"
    .lex "$signature", $P1006
.annotate 'line', 956
    new $P1007, "Undef"
    .lex "$name", $P1007
.annotate 'line', 957
    new $P1008, "Undef"
    .lex "$ops", $P1008
.annotate 'line', 958
    $P1009 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P1009
.annotate 'line', 959
    $P1010 = root_new ['parrot';'Hash']
    .lex "%namedargs", $P1010
.annotate 'line', 983
    new $P1011, "Undef"
    .lex "$rtype", $P1011
.annotate 'line', 984
    new $P1012, "Undef"
    .lex "$result", $P1012
.annotate 'line', 949
    find_lex $P1013, "$node"
    $P1014 = $P1013."pasttype"()
    store_lex "$pasttype", $P1014
.annotate 'line', 950
    find_lex $P1016, "$pasttype"
    if $P1016, unless_1015_end
    new $P1017, "String"
    assign $P1017, "call"
    store_lex "$pasttype", $P1017
  unless_1015_end:
.annotate 'line', 952
    new $P1018, "String"
    assign $P1018, "v:"
    store_lex "$signature", $P1018
.annotate 'line', 954
    find_lex $P1020, "$pasttype"
    set $S1021, $P1020
    iseq $I1022, $S1021, "callmethod"
    unless $I1022, if_1019_end
    new $P1023, "String"
    assign $P1023, "vP:"
    store_lex "$signature", $P1023
  if_1019_end:
.annotate 'line', 956
    find_lex $P1024, "$node"
    $P1025 = $P1024."name"()
    store_lex "$name", $P1025
    find_lex $P1026, "$ops"
    find_lex $P1027, "@posargs"
    find_lex $P1028, "%namedargs"
.annotate 'line', 961
    find_lex $P1030, "$name"
    if $P1030, unless_1029_end
    find_lex $P1031, "$signature"
    set $S1032, $P1031
    replace $S1033, $S1032, 1, 0, "P"
    new $P1034, 'String'
    set $P1034, $S1033
    store_lex "$signature", $P1034
  unless_1029_end:
.annotate 'line', 963

		$P0 = find_lex '$node'
		$P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
	
.annotate 'line', 971
    find_lex $P1036, "$name"
    unless $P1036, if_1035_end
.annotate 'line', 972
    find_lex $P1038, "$name"
    get_hll_global $P1039, ["PAST"], "Node"
    isa $I1040, $P1038, $P1039
    if $I1040, if_1037
.annotate 'line', 978
    find_lex $P1054, "@posargs"
    find_lex $P1055, "self"
    find_lex $P1056, "$name"
    $P1057 = $P1055."escape"($P1056)
    unshift $P1054, $P1057
.annotate 'line', 977
    goto if_1037_end
  if_1037:
.annotate 'line', 972
    .const 'Sub' $P1042 = "45_1307980071.79615" 
    capture_lex $P1042
    $P1042()
  if_1037_end:
  if_1035_end:
.annotate 'line', 983
    find_lex $P1058, "%options"
    unless_null $P1058, vivify_243
    $P1058 = root_new ['parrot';'Hash']
  vivify_243:
    set $P1059, $P1058["rtype"]
    unless_null $P1059, vivify_244
    new $P1059, "Undef"
  vivify_244:
    store_lex "$rtype", $P1059
.annotate 'line', 984
    find_lex $P1060, "self"
    find_lex $P1061, "$rtype"
    $P1062 = $P1060."uniquereg"($P1061)
    store_lex "$result", $P1062
.annotate 'line', 985
    find_lex $P1063, "$ops"
    find_lex $P1064, "$pasttype"
    find_lex $P1065, "@posargs"
    find_lex $P1066, "%namedargs"
    find_lex $P1067, "$result"
    $P1063."push_pirop"($P1064, $P1065 :flat, $P1066 :flat, $P1067 :named("result"))
.annotate 'line', 986
    find_lex $P1068, "$ops"
    find_lex $P1069, "$result"
    $P1068."result"($P1069)
    find_lex $P1070, "$ops"
.annotate 'line', 948
    .return ($P1070)
  control_1001:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1071, exception, "payload"
    .return ($P1071)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1041"  :anon :subid("45_1307980071.79615") :outer("44_1307980071.79615")
.annotate 'line', 973
    new $P1043, "Undef"
    .lex "$name_post", $P1043
    find_lex $P1044, "self"
    find_lex $P1045, "$name"
    $P1046 = $P1044."as_post"($P1045, "s" :named("rtype"))
    store_lex "$name_post", $P1046
.annotate 'line', 974
    find_lex $P1047, "self"
    find_lex $P1048, "$name_post"
    $P1049 = $P1047."coerce"($P1048, "s")
    store_lex "$name_post", $P1049
.annotate 'line', 975
    find_lex $P1050, "$ops"
    find_lex $P1051, "$name_post"
    $P1050."push"($P1051)
.annotate 'line', 976
    find_lex $P1052, "@posargs"
    find_lex $P1053, "$name_post"
    unshift $P1052, $P1053
.annotate 'line', 972
    .return ($P1052)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("46_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1075
    .param pmc param_1076 :slurpy :named
.annotate 'line', 995
    new $P1074, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1074, control_1073
    push_eh $P1074
    .lex "self", self
    .lex "$node", param_1075
    .lex "%options", param_1076
.annotate 'line', 996
    find_lex $P1077, "self"
    find_lex $P1078, "$node"
    find_lex $P1079, "%options"
    $P1080 = $P1077."call"($P1078, $P1079 :flat)
.annotate 'line', 995
    .return ($P1080)
  control_1073:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1081, exception, "payload"
    .return ($P1081)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("47_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1085
    .param pmc param_1086 :slurpy :named
.annotate 'line', 1005
    .const 'Sub' $P1224 = "50_1307980071.79615" 
    capture_lex $P1224
    .const 'Sub' $P1102 = "48_1307980071.79615" 
    capture_lex $P1102
    new $P1084, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1084, control_1083
    push_eh $P1084
    .lex "self", self
    .lex "$node", param_1085
    .lex "%options", param_1086
.annotate 'line', 1006
    new $P1087, "Undef"
    .lex "$ops", $P1087
.annotate 'line', 1008
    new $P1088, "Undef"
    .lex "$rtype", $P1088
.annotate 'line', 1009
    new $P1089, "Undef"
    .lex "$result", $P1089
.annotate 'line', 1012
    new $P1090, "Undef"
    .lex "$pasttype", $P1090
.annotate 'line', 1014
    new $P1091, "Undef"
    .lex "$exprpast", $P1091
.annotate 'line', 1015
    new $P1092, "Undef"
    .lex "$thenpast", $P1092
.annotate 'line', 1016
    new $P1093, "Undef"
    .lex "$elsepast", $P1093
.annotate 'line', 1018
    new $P1094, "Undef"
    .lex "$S0", $P1094
.annotate 'line', 1019
    new $P1095, "Undef"
    .lex "$thenlabel", $P1095
.annotate 'line', 1020
    new $P1096, "Undef"
    .lex "$endlabel", $P1096
.annotate 'line', 1022
    new $P1097, "Undef"
    .lex "$exprrtype", $P1097
.annotate 'line', 1024
    new $P1098, "Undef"
    .lex "$childrtype", $P1098
.annotate 'line', 1027
    new $P1099, "Undef"
    .lex "$exprpost", $P1099
.annotate 'line', 1029
    new $P1100, "Undef"
    .lex "$thenpost", $P1100
.annotate 'line', 1030
    new $P1101, "Undef"
    .lex "$elsepost", $P1101
.annotate 'line', 1051
    .const 'Sub' $P1102 = "48_1307980071.79615" 
    newclosure $P1144, $P1102
    .lex "make_childpost", $P1144
.annotate 'line', 1006
    get_hll_global $P1145, ["POST"], "Ops"
    find_lex $P1146, "$node"
    $P1147 = $P1145."new"($P1146 :named("node"))
    store_lex "$ops", $P1147
.annotate 'line', 1008
    find_lex $P1148, "%options"
    unless_null $P1148, vivify_246
    $P1148 = root_new ['parrot';'Hash']
  vivify_246:
    set $P1149, $P1148["rtype"]
    unless_null $P1149, vivify_247
    new $P1149, "Undef"
  vivify_247:
    store_lex "$rtype", $P1149
.annotate 'line', 1009
    find_lex $P1150, "self"
    find_lex $P1151, "$rtype"
    $P1152 = $P1150."uniquereg"($P1151)
    store_lex "$result", $P1152
.annotate 'line', 1010
    find_lex $P1153, "$ops"
    find_lex $P1154, "$result"
    $P1153."result"($P1154)
.annotate 'line', 1012
    find_lex $P1155, "$node"
    $P1156 = $P1155."pasttype"()
    store_lex "$pasttype", $P1156
.annotate 'line', 1014
    find_lex $P1157, "$node"
    unless_null $P1157, vivify_248
    $P1157 = root_new ['parrot';'ResizablePMCArray']
  vivify_248:
    set $P1158, $P1157[0]
    unless_null $P1158, vivify_249
    new $P1158, "Undef"
  vivify_249:
    store_lex "$exprpast", $P1158
.annotate 'line', 1015
    find_lex $P1159, "$node"
    unless_null $P1159, vivify_250
    $P1159 = root_new ['parrot';'ResizablePMCArray']
  vivify_250:
    set $P1160, $P1159[1]
    unless_null $P1160, vivify_251
    new $P1160, "Undef"
  vivify_251:
    store_lex "$thenpast", $P1160
.annotate 'line', 1016
    find_lex $P1161, "$node"
    unless_null $P1161, vivify_252
    $P1161 = root_new ['parrot';'ResizablePMCArray']
  vivify_252:
    set $P1162, $P1161[2]
    unless_null $P1162, vivify_253
    new $P1162, "Undef"
  vivify_253:
    store_lex "$elsepast", $P1162
.annotate 'line', 1018
    find_lex $P1163, "self"
    find_lex $P1164, "$pasttype"
    concat $P1165, $P1164, "_"
    $P1166 = $P1163."unique"($P1165)
    store_lex "$S0", $P1166
.annotate 'line', 1019
    get_hll_global $P1167, ["POST"], "Label"
    find_lex $P1168, "$S0"
    $P1169 = $P1167."new"($P1168 :named("result"))
    store_lex "$thenlabel", $P1169
.annotate 'line', 1020
    get_hll_global $P1170, ["POST"], "Label"
    find_lex $P1171, "$S0"
    concat $P1172, $P1171, "_end"
    $P1173 = $P1170."new"($P1172 :named("result"))
    store_lex "$endlabel", $P1173
.annotate 'line', 1022
    new $P1174, "String"
    assign $P1174, "r"
    store_lex "$exprrtype", $P1174
.annotate 'line', 1023
    find_lex $P1176, "$rtype"
    set $S1177, $P1176
    iseq $I1178, $S1177, "v"
    unless $I1178, if_1175_end
    new $P1179, "String"
    assign $P1179, "*"
    store_lex "$exprrtype", $P1179
  if_1175_end:
.annotate 'line', 1024
    find_lex $P1180, "$rtype"
    store_lex "$childrtype", $P1180
.annotate 'line', 1025
    find_lex $P1182, "$rtype"
    set $S1183, $P1182
    index $I1184, "*:", $S1183
    set $N1185, $I1184
    isge $I1186, $N1185, 0.0
    unless $I1186, if_1181_end
    new $P1187, "String"
    assign $P1187, "P"
    store_lex "$childrtype", $P1187
  if_1181_end:
.annotate 'line', 1027
    find_lex $P1188, "self"
    find_lex $P1189, "$exprpast"
    find_lex $P1190, "$exprrtype"
    $P1191 = $P1188."as_post"($P1189, $P1190 :named("rtype"))
    store_lex "$exprpost", $P1191
.annotate 'line', 1029
    find_lex $P1192, "$thenpast"
    $P1193 = "make_childpost"($P1192)
    store_lex "$thenpost", $P1193
.annotate 'line', 1030
    find_lex $P1194, "$elsepast"
    $P1195 = "make_childpost"($P1194)
    store_lex "$elsepost", $P1195
.annotate 'line', 1032
    find_lex $P1197, "$elsepost"
    defined $I1198, $P1197
    if $I1198, if_1196
.annotate 'line', 1041
    .const 'Sub' $P1224 = "50_1307980071.79615" 
    capture_lex $P1224
    $P1224()
    goto if_1196_end
  if_1196:
.annotate 'line', 1033
    find_lex $P1199, "$ops"
    find_lex $P1200, "$exprpost"
    $P1199."push"($P1200)
.annotate 'line', 1034
    find_lex $P1201, "$ops"
    find_lex $P1202, "$pasttype"
    find_lex $P1203, "$exprpost"
    find_lex $P1204, "$thenlabel"
    $P1201."push_pirop"($P1202, $P1203, $P1204)
.annotate 'line', 1035
    find_lex $P1206, "$elsepost"
    defined $I1207, $P1206
    unless $I1207, if_1205_end
    find_lex $P1208, "$ops"
    find_lex $P1209, "$elsepost"
    $P1208."push"($P1209)
  if_1205_end:
.annotate 'line', 1036
    find_lex $P1210, "$ops"
    find_lex $P1211, "$endlabel"
    $P1210."push_pirop"("goto", $P1211)
.annotate 'line', 1037
    find_lex $P1212, "$ops"
    find_lex $P1213, "$thenlabel"
    $P1212."push"($P1213)
.annotate 'line', 1038
    find_lex $P1215, "$thenpost"
    defined $I1216, $P1215
    unless $I1216, if_1214_end
    find_lex $P1217, "$ops"
    find_lex $P1218, "$thenpost"
    $P1217."push"($P1218)
  if_1214_end:
.annotate 'line', 1039
    find_lex $P1219, "$ops"
    find_lex $P1220, "$endlabel"
    $P1219."push"($P1220)
.annotate 'line', 1040
    new $P1221, "Exception"
    set $P1221['type'], .CONTROL_RETURN
    find_lex $P1222, "$ops"
    setattribute $P1221, 'payload', $P1222
    throw $P1221
  if_1196_end:
.annotate 'line', 1032
    find_lex $P1249, "make_childpost"
.annotate 'line', 1005
    .return ($P1249)
  control_1083:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1250, exception, "payload"
    .return ($P1250)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("48_1307980071.79615") :outer("47_1307980071.79615")
    .param pmc param_1105 :optional
    .param int has_param_1105 :opt_flag
.annotate 'line', 1051
    .const 'Sub' $P1113 = "49_1307980071.79615" 
    capture_lex $P1113
    new $P1104, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1104, control_1103
    push_eh $P1104
    if has_param_1105, optparam_245
    new $P1106, "Undef"
    set param_1105, $P1106
  optparam_245:
    .lex "$childpast", param_1105
.annotate 'line', 1052
    new $P1107, "Undef"
    .lex "$childpost", $P1107
.annotate 'line', 1051
    find_lex $P1108, "$childpost"
.annotate 'line', 1053
    find_lex $P1110, "$childpast"
    defined $I1111, $P1110
    if $I1111, if_1109
.annotate 'line', 1059
    find_lex $P1128, "$rtype"
    set $S1129, $P1128
    iseq $I1130, $S1129, "v"
    unless $I1130, if_1127_end
    new $P1131, "Exception"
    set $P1131['type'], .CONTROL_RETURN
    find_lex $P1132, "$childpost"
    setattribute $P1131, 'payload', $P1132
    throw $P1131
  if_1127_end:
.annotate 'line', 1060
    get_hll_global $P1133, ["POST"], "Ops"
    find_lex $P1134, "$exprpost"
    $P1135 = $P1133."new"($P1134 :named("result"))
    store_lex "$childpost", $P1135
.annotate 'line', 1058
    goto if_1109_end
  if_1109:
.annotate 'line', 1053
    .const 'Sub' $P1113 = "49_1307980071.79615" 
    capture_lex $P1113
    $P1113()
  if_1109_end:
.annotate 'line', 1062
    find_lex $P1137, "$result"
    unless $P1137, if_1136_end
    find_lex $P1138, "self"
    find_lex $P1139, "$childpost"
    find_lex $P1140, "$result"
    $P1141 = $P1138."coerce"($P1139, $P1140)
    store_lex "$childpost", $P1141
  if_1136_end:
    find_lex $P1142, "$childpost"
.annotate 'line', 1051
    .return ($P1142)
  control_1103:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1143, exception, "payload"
    .return ($P1143)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1112"  :anon :subid("49_1307980071.79615") :outer("48_1307980071.79615")
.annotate 'line', 1054
    $P1114 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1114
    new $P1115, "ResizablePMCArray"
    store_lex "@arglist", $P1115
.annotate 'line', 1055
    find_lex $P1117, "$childpast"
    $N1118 = $P1117."arity"()
    isgt $I1119, $N1118, 0.0
    unless $I1119, if_1116_end
    find_lex $P1120, "@arglist"
    find_lex $P1121, "$exprpost"
    push $P1120, $P1121
  if_1116_end:
.annotate 'line', 1056
    find_lex $P1122, "self"
    find_lex $P1123, "$childpast"
    find_lex $P1124, "$childrtype"
    find_lex $P1125, "@arglist"
    $P1126 = $P1122."as_post"($P1123, $P1124 :named("rtype"), $P1125 :named("arglist"))
    store_lex "$childpost", $P1126
.annotate 'line', 1053
    .return ($P1126)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1223"  :anon :subid("50_1307980071.79615") :outer("47_1307980071.79615")
.annotate 'line', 1042
    new $P1225, "Undef"
    .lex "$S0", $P1225
    new $P1226, "String"
    assign $P1226, "if"
    store_lex "$S0", $P1226
.annotate 'line', 1043
    find_lex $P1228, "$pasttype"
    set $S1229, $P1228
    find_lex $P1230, "$S0"
    set $S1231, $P1230
    iseq $I1232, $S1229, $S1231
    unless $I1232, if_1227_end
    new $P1233, "String"
    assign $P1233, "unless"
    store_lex "$S0", $P1233
  if_1227_end:
.annotate 'line', 1044
    find_lex $P1234, "$ops"
    find_lex $P1235, "$exprpost"
    $P1234."push"($P1235)
.annotate 'line', 1045
    find_lex $P1236, "$ops"
    find_lex $P1237, "$S0"
    find_lex $P1238, "$exprpost"
    find_lex $P1239, "$endlabel"
    $P1236."push_pirop"($P1237, $P1238, $P1239)
.annotate 'line', 1046
    find_lex $P1241, "$thenpost"
    defined $I1242, $P1241
    unless $I1242, if_1240_end
    find_lex $P1243, "$ops"
    find_lex $P1244, "$thenpost"
    $P1243."push"($P1244)
  if_1240_end:
.annotate 'line', 1047
    find_lex $P1245, "$ops"
    find_lex $P1246, "$endlabel"
    $P1245."push"($P1246)
.annotate 'line', 1048
    new $P1247, "Exception"
    set $P1247['type'], .CONTROL_RETURN
    find_lex $P1248, "$ops"
    setattribute $P1247, 'payload', $P1248
    throw $P1247
.annotate 'line', 1041
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("51_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1254
    .param pmc param_1255 :slurpy :named
.annotate 'line', 1067
    new $P1253, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1253, control_1252
    push_eh $P1253
    .lex "self", self
    .lex "$node", param_1254
    .lex "%options", param_1255
.annotate 'line', 1068
    find_lex $P1256, "self"
    find_lex $P1257, "$node"
    find_lex $P1258, "%options"
    $P1259 = $P1256."if"($P1257, $P1258 :flat)
.annotate 'line', 1067
    .return ($P1259)
  control_1252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1260, exception, "payload"
    .return ($P1260)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("52_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_1264 :slurpy :named
.annotate 'line', 1075
    new $P1263, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1263, control_1262
    push_eh $P1263
    .lex "self", self
    .lex "%options", param_1264
.annotate 'line', 1076

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
    
.annotate 'line', 1075
    .return ()
  control_1262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1265, exception, "payload"
    .return ($P1265)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("53_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1269
    .param pmc param_1270 :slurpy :named
.annotate 'line', 1163
    new $P1268, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1268, control_1267
    push_eh $P1268
    .lex "self", self
    .lex "$node", param_1269
    .lex "%options", param_1270
.annotate 'line', 1164

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
    
.annotate 'line', 1163
    .return ()
  control_1267:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1271, exception, "payload"
    .return ($P1271)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("54_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1275
    .param pmc param_1276 :slurpy :named
.annotate 'line', 1203
    new $P1274, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1274, control_1273
    push_eh $P1274
    .lex "self", self
    .lex "$node", param_1275
    .lex "%options", param_1276
.annotate 'line', 1204
    find_lex $P1277, "self"
    find_lex $P1278, "$node"
    find_lex $P1279, "%options"
    $P1280 = $P1277."while"($P1278, $P1279 :flat, "if" :named("testop"))
.annotate 'line', 1203
    .return ($P1280)
  control_1273:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1281, exception, "payload"
    .return ($P1281)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("55_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1285
    .param pmc param_1286 :slurpy :named
.annotate 'line', 1207
    new $P1284, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1284, control_1283
    push_eh $P1284
    .lex "self", self
    .lex "$node", param_1285
    .lex "%options", param_1286
.annotate 'line', 1208
    find_lex $P1287, "self"
    find_lex $P1288, "$node"
    find_lex $P1289, "%options"
    $P1290 = $P1287."while"($P1288, $P1289 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1207
    .return ($P1290)
  control_1283:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1291, exception, "payload"
    .return ($P1291)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("56_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1295
    .param pmc param_1296 :slurpy :named
.annotate 'line', 1211
    new $P1294, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1294, control_1293
    push_eh $P1294
    .lex "self", self
    .lex "$node", param_1295
    .lex "%options", param_1296
.annotate 'line', 1212
    find_lex $P1297, "self"
    find_lex $P1298, "$node"
    find_lex $P1299, "%options"
    $P1300 = $P1297."while"($P1298, $P1299 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1211
    .return ($P1300)
  control_1293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1301, exception, "payload"
    .return ($P1301)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("57_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1305
    .param pmc param_1306 :slurpy :named
.annotate 'line', 1220
    new $P1304, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1304, control_1303
    push_eh $P1304
    .lex "self", self
    .lex "$node", param_1305
    .lex "%options", param_1306
.annotate 'line', 1221

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
    
.annotate 'line', 1220
    .return ()
  control_1303:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1307, exception, "payload"
    .return ($P1307)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("58_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1311
    .param pmc param_1312 :slurpy :named
.annotate 'line', 1300
    new $P1310, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1310, control_1309
    push_eh $P1310
    .lex "self", self
    .lex "$node", param_1311
    .lex "%options", param_1312
.annotate 'line', 1301

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
    
.annotate 'line', 1300
    .return ()
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1313, exception, "payload"
    .return ($P1313)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("59_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1317
    .param pmc param_1318 :slurpy :named
.annotate 'line', 1336
    new $P1316, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1316, control_1315
    push_eh $P1316
    .lex "self", self
    .lex "$node", param_1317
    .lex "%options", param_1318
.annotate 'line', 1337
    find_lex $P1319, "self"
    find_lex $P1320, "$node"
    find_lex $P1321, "%options"
    $P1322 = $P1319."node_as_post"($P1320, $P1321)
.annotate 'line', 1336
    .return ($P1322)
  control_1315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1323, exception, "payload"
    .return ($P1323)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("60_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1327
    .param pmc param_1328 :slurpy :named
.annotate 'line', 1347
    new $P1326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1326, control_1325
    push_eh $P1326
    .lex "self", self
    .lex "$node", param_1327
    .lex "%options", param_1328
.annotate 'line', 1348
    get_hll_global $P1329, ["POST"], "Ops"
    find_lex $P1330, "$node"
    $P1331 = $P1329."new"($P1330 :named("node"))
.annotate 'line', 1347
    .return ($P1331)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1332, exception, "payload"
    .return ($P1332)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("61_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1336
    .param pmc param_1337 :slurpy :named
.annotate 'line', 1356
    new $P1335, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1335, control_1334
    push_eh $P1335
    .lex "self", self
    .lex "$node", param_1336
    .lex "%options", param_1337
.annotate 'line', 1357

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
    
.annotate 'line', 1356
    .return ()
  control_1334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, "payload"
    .return ($P1338)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("62_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1342
    .param pmc param_1343 :slurpy :named
.annotate 'line', 1396
    new $P1341, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1341, control_1340
    push_eh $P1341
    .lex "self", self
    .lex "$node", param_1342
    .lex "%options", param_1343
.annotate 'line', 1397

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
    
.annotate 'line', 1396
    .return ()
  control_1340:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1344, exception, "payload"
    .return ($P1344)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("63_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1348
    .param pmc param_1349 :slurpy :named
.annotate 'line', 1453
    new $P1347, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1347, control_1346
    push_eh $P1347
    .lex "self", self
    .lex "$node", param_1348
    .lex "%options", param_1349
.annotate 'line', 1454

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
    
.annotate 'line', 1453
    .return ()
  control_1346:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1350, exception, "payload"
    .return ($P1350)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("64_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1354
    .param pmc param_1355 :slurpy :named
.annotate 'line', 1516
    new $P1353, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1353, control_1352
    push_eh $P1353
    .lex "self", self
    .lex "$node", param_1354
    .lex "%options", param_1355
.annotate 'line', 1517
    new $P1356, "Undef"
    .lex "$ops", $P1356
.annotate 'line', 1519
    new $P1357, "Undef"
    .lex "$lpost", $P1357
.annotate 'line', 1523
    new $P1358, "Undef"
    .lex "$endlabel", $P1358
.annotate 'line', 1525
    new $P1359, "Undef"
    .lex "$reg", $P1359
.annotate 'line', 1528
    new $P1360, "Undef"
    .lex "$rpost", $P1360
.annotate 'line', 1517
    get_hll_global $P1361, ["POST"], "Ops"
    find_lex $P1362, "$node"
    find_lex $P1363, "self"
    $P1364 = $P1363."unique"("$P")
    $P1365 = $P1361."new"($P1362 :named("node"), $P1364 :named("result"))
    store_lex "$ops", $P1365
.annotate 'line', 1519
    find_lex $P1366, "self"
    find_lex $P1367, "$node"
    unless_null $P1367, vivify_254
    $P1367 = root_new ['parrot';'ResizablePMCArray']
  vivify_254:
    set $P1368, $P1367[0]
    unless_null $P1368, vivify_255
    new $P1368, "Undef"
  vivify_255:
    $P1369 = $P1366."as_post"($P1368, "P" :named("rtype"))
    store_lex "$lpost", $P1369
.annotate 'line', 1520
    find_lex $P1370, "$ops"
    find_lex $P1371, "$lpost"
    $P1370."push"($P1371)
.annotate 'line', 1521
    find_lex $P1372, "$ops"
    find_lex $P1373, "$ops"
    find_lex $P1374, "$lpost"
    $P1372."push_pirop"("set", $P1373, $P1374)
.annotate 'line', 1523
    get_hll_global $P1375, ["POST"], "Label"
    find_lex $P1376, "self"
    $P1377 = $P1376."unique"("default_")
    $P1378 = $P1375."new"($P1377 :named("result"))
    store_lex "$endlabel", $P1378
.annotate 'line', 1525
    find_lex $P1379, "self"
    $P1380 = $P1379."unique"("$I")
    store_lex "$reg", $P1380
.annotate 'line', 1526
    find_lex $P1381, "$ops"
    find_lex $P1382, "$reg"
    find_lex $P1383, "$ops"
    $P1381."push_pirop"("defined", $P1382, $P1383)
.annotate 'line', 1527
    find_lex $P1384, "$ops"
    find_lex $P1385, "$reg"
    find_lex $P1386, "$endlabel"
    $P1384."push_pirop"("if", $P1385, $P1386)
.annotate 'line', 1528
    find_lex $P1387, "self"
    find_lex $P1388, "$node"
    unless_null $P1388, vivify_256
    $P1388 = root_new ['parrot';'ResizablePMCArray']
  vivify_256:
    set $P1389, $P1388[1]
    unless_null $P1389, vivify_257
    new $P1389, "Undef"
  vivify_257:
    $P1390 = $P1387."as_post"($P1389, "P" :named("rtype"))
    store_lex "$rpost", $P1390
.annotate 'line', 1529
    find_lex $P1391, "$ops"
    find_lex $P1392, "$rpost"
    $P1391."push"($P1392)
.annotate 'line', 1530
    find_lex $P1393, "$ops"
    find_lex $P1394, "$ops"
    find_lex $P1395, "$rpost"
    $P1393."push_pirop"("set", $P1394, $P1395)
.annotate 'line', 1531
    find_lex $P1396, "$ops"
    find_lex $P1397, "$endlabel"
    $P1396."push"($P1397)
    find_lex $P1398, "$ops"
.annotate 'line', 1516
    .return ($P1398)
  control_1352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1399, exception, "payload"
    .return ($P1399)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("65_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1403
    .param pmc param_1404 :slurpy :named
.annotate 'line', 1542
    new $P1402, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1402, control_1401
    push_eh $P1402
    .lex "self", self
    .lex "$node", param_1403
    .lex "%options", param_1404
.annotate 'line', 1543

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
    
.annotate 'line', 1542
    .return ()
  control_1401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1405, exception, "payload"
    .return ($P1405)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("66_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1409
    .param pmc param_1410 :slurpy :named
.annotate 'line', 1602
    new $P1408, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1408, control_1407
    push_eh $P1408
    .lex "self", self
    .lex "$node", param_1409
    .lex "%options", param_1410
.annotate 'line', 1603
    new $P1411, "Undef"
    .lex "$lpast", $P1411
.annotate 'line', 1604
    new $P1412, "Undef"
    .lex "$rpast", $P1412
.annotate 'line', 1606
    new $P1413, "Undef"
    .lex "$ops", $P1413
.annotate 'line', 1607
    new $P1414, "Undef"
    .lex "$rpost", $P1414
.annotate 'line', 1612
    new $P1415, "Undef"
    .lex "$lpost", $P1415
.annotate 'line', 1603
    find_lex $P1416, "$node"
    unless_null $P1416, vivify_258
    $P1416 = root_new ['parrot';'ResizablePMCArray']
  vivify_258:
    set $P1417, $P1416[0]
    unless_null $P1417, vivify_259
    new $P1417, "Undef"
  vivify_259:
    store_lex "$lpast", $P1417
.annotate 'line', 1604
    find_lex $P1418, "$node"
    unless_null $P1418, vivify_260
    $P1418 = root_new ['parrot';'ResizablePMCArray']
  vivify_260:
    set $P1419, $P1418[1]
    unless_null $P1419, vivify_261
    new $P1419, "Undef"
  vivify_261:
    store_lex "$rpast", $P1419
.annotate 'line', 1606
    get_hll_global $P1420, ["POST"], "Ops"
    find_lex $P1421, "$node"
    $P1422 = $P1420."new"($P1421 :named("node"))
    store_lex "$ops", $P1422
.annotate 'line', 1607
    find_lex $P1423, "self"
    find_lex $P1424, "$rpast"
    $P1425 = $P1423."as_post"($P1424, "P" :named("rtype"))
    store_lex "$rpost", $P1425
.annotate 'line', 1608
    find_lex $P1426, "self"
    find_lex $P1427, "$rpost"
    $P1428 = $P1426."coerce"($P1427, "P")
    store_lex "$rpost", $P1428
.annotate 'line', 1609
    find_lex $P1429, "$ops"
    find_lex $P1430, "$rpost"
    $P1429."push"($P1430)
.annotate 'line', 1611
    find_lex $P1431, "$lpast"
    $P1431."lvalue"(1)
.annotate 'line', 1612
    find_lex $P1432, "self"
    find_lex $P1433, "$lpast"
    find_lex $P1434, "$rpost"
    $P1435 = $P1432."as_post"($P1433, $P1434 :named("bindpost"))
    store_lex "$lpost", $P1435
.annotate 'line', 1613
    find_lex $P1436, "$ops"
    find_lex $P1437, "$lpost"
    $P1436."push"($P1437)
.annotate 'line', 1614
    find_lex $P1438, "$ops"
    find_lex $P1439, "$lpost"
    $P1438."result"($P1439)
    find_lex $P1440, "$ops"
.annotate 'line', 1602
    .return ($P1440)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1441, exception, "payload"
    .return ($P1441)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("67_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1445
    .param pmc param_1446 :slurpy :named
.annotate 'line', 1622
    new $P1444, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1444, control_1443
    push_eh $P1444
    .lex "self", self
    .lex "$node", param_1445
    .lex "%options", param_1446
.annotate 'line', 1623
    new $P1447, "Undef"
    .lex "$rpost", $P1447
.annotate 'line', 1624
    new $P1448, "Undef"
    .lex "$lpost", $P1448
.annotate 'line', 1625
    new $P1449, "Undef"
    .lex "$ops", $P1449
.annotate 'line', 1623
    find_lex $P1450, "self"
    find_lex $P1451, "$node"
    unless_null $P1451, vivify_262
    $P1451 = root_new ['parrot';'ResizablePMCArray']
  vivify_262:
    set $P1452, $P1451[1]
    unless_null $P1452, vivify_263
    new $P1452, "Undef"
  vivify_263:
    $P1453 = $P1450."as_post"($P1452, "P" :named("rtype"))
    store_lex "$rpost", $P1453
.annotate 'line', 1624
    find_lex $P1454, "self"
    find_lex $P1455, "$node"
    unless_null $P1455, vivify_264
    $P1455 = root_new ['parrot';'ResizablePMCArray']
  vivify_264:
    set $P1456, $P1455[0]
    unless_null $P1456, vivify_265
    new $P1456, "Undef"
  vivify_265:
    $P1457 = $P1454."as_post"($P1456, "P" :named("rtype"))
    store_lex "$lpost", $P1457
.annotate 'line', 1625
    get_hll_global $P1458, ["POST"], "Ops"
    find_lex $P1459, "$rpost"
    find_lex $P1460, "$lpost"
    find_lex $P1461, "$node"
    find_lex $P1462, "$lpost"
    $P1463 = $P1458."new"($P1459, $P1460, $P1461 :named("node"), $P1462 :named("result"))
    store_lex "$ops", $P1463
.annotate 'line', 1627
    find_lex $P1464, "$ops"
    find_lex $P1465, "$lpost"
    find_lex $P1466, "$rpost"
    $P1464."push_pirop"("copy", $P1465, $P1466)
    find_lex $P1467, "$ops"
.annotate 'line', 1622
    .return ($P1467)
  control_1443:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1468, exception, "payload"
    .return ($P1468)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("68_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Op"])
    .param pmc param_1472
    .param pmc param_1473 :slurpy :named
.annotate 'line', 1636
    new $P1471, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1471, control_1470
    push_eh $P1471
    .lex "self", self
    .lex "$node", param_1472
    .lex "%options", param_1473
.annotate 'line', 1641
    new $P1474, "Undef"
    .lex "$ops", $P1474
.annotate 'line', 1642
    new $P1475, "Undef"
    .lex "$inline", $P1475
.annotate 'line', 1645
    new $P1476, "Undef"
    .lex "$result", $P1476
.annotate 'line', 1646
    new $P1477, "Undef"
    .lex "$i", $P1477
.annotate 'line', 1659
    $P1478 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1478
.annotate 'line', 1661
    new $P1479, "Undef"
    .lex "$s", $P1479
.annotate 'line', 1641
    find_lex $P1480, "self"
    find_lex $P1481, "$node"
    $P1482 = $P1480."post_children"($P1481, "vP" :named("signature"))
    store_lex "$ops", $P1482
.annotate 'line', 1642
    find_lex $P1483, "$node"
    $P1484 = $P1483."inline"()
    store_lex "$inline", $P1484
.annotate 'line', 1643
    find_lex $P1486, "$inline"
    does $I1487, $P1486, "array"
    unless $I1487, if_1485_end
    find_lex $P1488, "$inline"
    join $S1489, "\n", $P1488
    new $P1490, 'String'
    set $P1490, $S1489
    store_lex "$inline", $P1490
  if_1485_end:
.annotate 'line', 1645
    new $P1491, "String"
    assign $P1491, ""
    store_lex "$result", $P1491
.annotate 'line', 1646
    find_lex $P1492, "$inline"
    set $S1493, $P1492
    index $I1494, $S1493, "%t"
    new $P1495, 'Integer'
    set $P1495, $I1494
    store_lex "$i", $P1495
.annotate 'line', 1647
    find_lex $P1497, "$i"
    set $N1498, $P1497
    isge $I1499, $N1498, 0.0
    if $I1499, if_1496
.annotate 'line', 1653
    find_lex $P1506, "$inline"
    set $S1507, $P1506
    index $I1508, $S1507, "%r"
    new $P1509, 'Integer'
    set $P1509, $I1508
    store_lex "$i", $P1509
.annotate 'line', 1654
    find_lex $P1511, "$i"
    set $N1512, $P1511
    isge $I1513, $N1512, 0.0
    unless $I1513, if_1510_end
.annotate 'line', 1655
    find_lex $P1514, "self"
    $P1515 = $P1514."unique"("$P")
    store_lex "$result", $P1515
.annotate 'line', 1656
    find_lex $P1516, "$ops"
    find_lex $P1517, "$result"
    $P1516."result"($P1517)
  if_1510_end:
.annotate 'line', 1652
    goto if_1496_end
  if_1496:
.annotate 'line', 1648
    find_lex $P1500, "self"
    $P1501 = $P1500."unique"("$P")
    store_lex "$result", $P1501
.annotate 'line', 1649
    find_lex $P1502, "$ops"
    find_lex $P1503, "$result"
    $P1502."push_pirop"("new", $P1503, "'Undef'")
.annotate 'line', 1650
    find_lex $P1504, "$ops"
    find_lex $P1505, "$result"
    $P1504."result"($P1505)
  if_1496_end:
.annotate 'line', 1659
    find_lex $P1518, "$ops"
    $P1519 = $P1518."list"()
    store_lex "@arglist", $P1519
.annotate 'line', 1660
    find_lex $P1520, "$ops"
    find_lex $P1521, "@arglist"
    find_lex $P1522, "$inline"
    find_lex $P1523, "$result"
    $P1520."push_pirop"("inline", $P1521 :flat, $P1522 :named("inline"), $P1523 :named("result"))
.annotate 'line', 1661
    find_lex $P1524, "%options"
    unless_null $P1524, vivify_266
    $P1524 = root_new ['parrot';'Hash']
  vivify_266:
    set $P1525, $P1524["rtype"]
    unless_null $P1525, vivify_267
    new $P1525, "Undef"
  vivify_267:
    store_lex "$s", $P1525
    find_lex $P1526, "$ops"
.annotate 'line', 1636
    .return ($P1526)
  control_1470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1527, exception, "payload"
    .return ($P1527)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("69_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"])
    .param pmc param_1531
    .param pmc param_1532 :slurpy :named
.annotate 'line', 1673
    new $P1530, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1530, control_1529
    push_eh $P1530
    .lex "self", self
    .lex "$node", param_1531
    .lex "%options", param_1532
.annotate 'line', 1674

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
    
.annotate 'line', 1673
    .return ()
  control_1529:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1533, exception, "payload"
    .return ($P1533)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("70_1307980071.79615") :method :outer("11_1307980071.79615")
    .param pmc param_1537
    .param pmc param_1538
    .param pmc param_1539
    .param pmc param_1540
.annotate 'line', 1755
    .const 'Sub' $P1564 = "71_1307980071.79615" 
    capture_lex $P1564
    new $P1536, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1536, control_1535
    push_eh $P1536
    .lex "self", self
    .lex "$node", param_1537
    .lex "$ops", param_1538
    .lex "$fetchop", param_1539
    .lex "$storeop", param_1540
.annotate 'line', 1756
    new $P1541, "Undef"
    .lex "$viviself", $P1541
.annotate 'line', 1757
    new $P1542, "Undef"
    .lex "$vivipost", $P1542
.annotate 'line', 1758
    new $P1543, "Undef"
    .lex "$result", $P1543
.annotate 'line', 1756
    find_lex $P1544, "$node"
    $P1545 = $P1544."viviself"()
    store_lex "$viviself", $P1545
.annotate 'line', 1757
    find_lex $P1546, "self"
    find_lex $P1547, "$viviself"
    $P1548 = $P1546."as_vivipost"($P1547, "P" :named("rtype"))
    store_lex "$vivipost", $P1548
.annotate 'line', 1758
    find_lex $P1549, "$vivipost"
    $P1550 = $P1549."result"()
    store_lex "$result", $P1550
.annotate 'line', 1759
    find_lex $P1552, "$result"
    set $S1553, $P1552
    iseq $I1554, $S1553, ""
    unless $I1554, if_1551_end
    find_lex $P1555, "self"
    $P1556 = $P1555."uniquereg"("P")
    store_lex "$result", $P1556
  if_1551_end:
.annotate 'line', 1761
    find_lex $P1557, "$ops"
    find_lex $P1558, "$result"
    $P1557."result"($P1558)
.annotate 'line', 1762
    find_lex $P1559, "$ops"
    find_lex $P1560, "$fetchop"
    $P1559."push"($P1560)
.annotate 'line', 1763
    find_lex $P1562, "$viviself"
    unless $P1562, if_1561_end
    .const 'Sub' $P1564 = "71_1307980071.79615" 
    capture_lex $P1564
    $P1564()
  if_1561_end:
    find_lex $P1581, "$ops"
.annotate 'line', 1755
    .return ($P1581)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1582, exception, "payload"
    .return ($P1582)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1563"  :anon :subid("71_1307980071.79615") :outer("70_1307980071.79615")
.annotate 'line', 1764
    new $P1565, "Undef"
    .lex "$vivilabel", $P1565
    get_hll_global $P1566, ["POST"], "Label"
    $P1567 = $P1566."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P1567
.annotate 'line', 1765
    find_lex $P1568, "$ops"
    find_lex $P1569, "$ops"
    find_lex $P1570, "$vivilabel"
    $P1568."push_pirop"("unless_null", $P1569, $P1570)
.annotate 'line', 1766
    find_lex $P1571, "$ops"
    find_lex $P1572, "$vivipost"
    $P1571."push"($P1572)
.annotate 'line', 1767
    find_lex $P1574, "$node"
    $P1575 = $P1574."lvalue"()
    unless $P1575, if_1573_end
    find_lex $P1576, "$ops"
    find_lex $P1577, "$storeop"
    $P1576."push"($P1577)
  if_1573_end:
.annotate 'line', 1768
    find_lex $P1578, "$ops"
    find_lex $P1579, "$vivilabel"
    $P1580 = $P1578."push"($P1579)
.annotate 'line', 1763
    .return ($P1580)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("72_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1586
    .param pmc param_1587
.annotate 'line', 1774
    new $P1585, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1585, control_1584
    push_eh $P1585
    .lex "self", self
    .lex "$node", param_1586
    .lex "$bindpost", param_1587
.annotate 'line', 1775

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
    
.annotate 'line', 1774
    .return ()
  control_1584:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1588, exception, "payload"
    .return ($P1588)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("73_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1592
    .param pmc param_1593
.annotate 'line', 1829
    new $P1591, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1591, control_1590
    push_eh $P1591
    .lex "self", self
    .lex "$node", param_1592
    .lex "$bindpost", param_1593
.annotate 'line', 1830

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
    
.annotate 'line', 1829
    .return ()
  control_1590:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1594, exception, "payload"
    .return ($P1594)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("74_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1598
    .param pmc param_1599
.annotate 'line', 1878
    .const 'Sub' $P1652 = "77_1307980071.79615" 
    capture_lex $P1652
    .const 'Sub' $P1633 = "76_1307980071.79615" 
    capture_lex $P1633
    .const 'Sub' $P1612 = "75_1307980071.79615" 
    capture_lex $P1612
    new $P1597, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1597, control_1596
    push_eh $P1597
    .lex "self", self
    .lex "$node", param_1598
    .lex "$bindpost", param_1599
.annotate 'line', 1879
    new $P1600, "Undef"
    .lex "$name", $P1600
.annotate 'line', 1880
    new $P1601, "Undef"
    .lex "$isdecl", $P1601
.annotate 'line', 1888
    new $P1602, "Undef"
    .lex "$ops", $P1602
.annotate 'line', 1879
    find_lex $P1603, "self"
    find_lex $P1604, "$node"
    $P1605 = $P1604."name"()
    $P1606 = $P1603."escape"($P1605)
    store_lex "$name", $P1606
.annotate 'line', 1880
    find_lex $P1607, "$node"
    $P1608 = $P1607."isdecl"()
    store_lex "$isdecl", $P1608
.annotate 'line', 1882
    find_lex $P1610, "$bindpost"
    unless $P1610, if_1609_end
    .const 'Sub' $P1612 = "75_1307980071.79615" 
    capture_lex $P1612
    $P1612()
  if_1609_end:
.annotate 'line', 1888
    get_hll_global $P1626, ["POST"], "Ops"
    find_lex $P1627, "$node"
    $P1628 = $P1626."new"($P1627 :named("node"))
    store_lex "$ops", $P1628
.annotate 'line', 1890
    find_lex $P1631, "$isdecl"
    if $P1631, if_1630
.annotate 'line', 1897
    .const 'Sub' $P1652 = "77_1307980071.79615" 
    capture_lex $P1652
    $P1670 = $P1652()
    set $P1629, $P1670
.annotate 'line', 1890
    goto if_1630_end
  if_1630:
    .const 'Sub' $P1633 = "76_1307980071.79615" 
    capture_lex $P1633
    $P1650 = $P1633()
    set $P1629, $P1650
  if_1630_end:
.annotate 'line', 1878
    .return ($P1629)
  control_1596:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1671, exception, "payload"
    .return ($P1671)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1611"  :anon :subid("75_1307980071.79615") :outer("74_1307980071.79615")
.annotate 'line', 1883
    new $P1613, "Undef"
    .lex "$pirop", $P1613
    find_lex $P1616, "$isdecl"
    if $P1616, if_1615
    new $P1618, "String"
    assign $P1618, "store_lex"
    set $P1614, $P1618
    goto if_1615_end
  if_1615:
    new $P1617, "String"
    assign $P1617, ".lex"
    set $P1614, $P1617
  if_1615_end:
    store_lex "$pirop", $P1614
.annotate 'line', 1884
    new $P1619, "Exception"
    set $P1619['type'], .CONTROL_RETURN
    get_hll_global $P1620, ["POST"], "Op"
    find_lex $P1621, "$name"
    find_lex $P1622, "$bindpost"
    find_lex $P1623, "$pirop"
    find_lex $P1624, "$bindpost"
    $P1625 = $P1620."new"($P1621, $P1622, $P1623 :named("pirop"), $P1624 :named("result"))
    setattribute $P1619, 'payload', $P1625
    throw $P1619
.annotate 'line', 1882
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1651"  :anon :subid("77_1307980071.79615") :outer("74_1307980071.79615")
.annotate 'line', 1898
    new $P1653, "Undef"
    .lex "$fetchop", $P1653
.annotate 'line', 1899
    new $P1654, "Undef"
    .lex "$storeop", $P1654
.annotate 'line', 1898
    get_hll_global $P1655, ["POST"], "Op"
    find_lex $P1656, "$ops"
    find_lex $P1657, "$name"
    $P1658 = $P1655."new"($P1656, $P1657, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P1658
.annotate 'line', 1899
    get_hll_global $P1659, ["POST"], "Op"
    find_lex $P1660, "$name"
    find_lex $P1661, "$ops"
    $P1662 = $P1659."new"($P1660, $P1661, "store_lex" :named("pirop"))
    store_lex "$storeop", $P1662
.annotate 'line', 1900
    new $P1663, "Exception"
    set $P1663['type'], .CONTROL_RETURN
    find_lex $P1664, "self"
    find_lex $P1665, "$node"
    find_lex $P1666, "$ops"
    find_lex $P1667, "$fetchop"
    find_lex $P1668, "$storeop"
    $P1669 = $P1664."vivify"($P1665, $P1666, $P1667, $P1668)
    setattribute $P1663, 'payload', $P1669
    throw $P1663
.annotate 'line', 1897
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1632"  :anon :subid("76_1307980071.79615") :outer("74_1307980071.79615")
.annotate 'line', 1891
    new $P1634, "Undef"
    .lex "$viviself", $P1634
.annotate 'line', 1892
    new $P1635, "Undef"
    .lex "$vivipost", $P1635
.annotate 'line', 1891
    find_lex $P1636, "$node"
    $P1637 = $P1636."viviself"()
    store_lex "$viviself", $P1637
.annotate 'line', 1892
    find_lex $P1638, "self"
    find_lex $P1639, "$viviself"
    $P1640 = $P1638."as_vivipost"($P1639, "P" :named("rtype"))
    store_lex "$vivipost", $P1640
.annotate 'line', 1893
    find_lex $P1641, "$ops"
    find_lex $P1642, "$vivipost"
    $P1641."push"($P1642)
.annotate 'line', 1894
    find_lex $P1643, "$ops"
    find_lex $P1644, "$name"
    find_lex $P1645, "$vivipost"
    $P1643."push_pirop"(".lex", $P1644, $P1645)
.annotate 'line', 1895
    find_lex $P1646, "$ops"
    find_lex $P1647, "$vivipost"
    $P1646."result"($P1647)
.annotate 'line', 1896
    new $P1648, "Exception"
    set $P1648['type'], .CONTROL_RETURN
    find_lex $P1649, "$ops"
    setattribute $P1648, 'payload', $P1649
    throw $P1648
.annotate 'line', 1890
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("78_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1675
    .param pmc param_1676
.annotate 'line', 1905
    .const 'Sub' $P1697 = "79_1307980071.79615" 
    capture_lex $P1697
    new $P1674, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1674, control_1673
    push_eh $P1674
    .lex "self", self
    .lex "$node", param_1675
    .lex "$bindpost", param_1676
.annotate 'line', 1910
    new $P1677, "Undef"
    .lex "$name", $P1677
.annotate 'line', 1912
    $P1678 = root_new ['parrot';'Hash']
    .lex "%symtable", $P1678
.annotate 'line', 1934
    new $P1679, "Undef"
    .lex "$ops", $P1679
.annotate 'line', 1935
    new $P1680, "Undef"
    .lex "$fetchop", $P1680
.annotate 'line', 1936
    new $P1681, "Undef"
    .lex "$storeop", $P1681
.annotate 'line', 1910
    find_lex $P1682, "$node"
    $P1683 = $P1682."name"()
    store_lex "$name", $P1683
.annotate 'line', 1912
    find_dynamic_lex $P1684, "@*BLOCKPAST"
    unless_null $P1684, vivify_268
    get_hll_global $P1684, "@BLOCKPAST"
    unless_null $P1684, vivify_269
    die "Contextual @*BLOCKPAST not found"
  vivify_269:
  vivify_268:
    set $P1685, $P1684[0]
    unless_null $P1685, vivify_270
    new $P1685, "Undef"
  vivify_270:
    $P1686 = $P1685."symtable"()
    store_lex "%symtable", $P1686
.annotate 'line', 1913
    find_lex $P1688, "%symtable"
    defined $I1689, $P1688
    unless $I1689, if_1687_end
.annotate 'line', 1914
    find_lex $P1690, "$name"
    find_lex $P1691, "%symtable"
    unless_null $P1691, vivify_271
    $P1691 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1692, $P1691[$P1690]
    unless_null $P1692, vivify_272
    new $P1692, "Undef"
  vivify_272:
    store_lex "%symtable", $P1692
.annotate 'line', 1915
    find_lex $P1694, "%symtable"
    defined $I1695, $P1694
    unless $I1695, if_1693_end
    .const 'Sub' $P1697 = "79_1307980071.79615" 
    capture_lex $P1697
    $P1697()
  if_1693_end:
  if_1687_end:
.annotate 'line', 1924
    find_lex $P1717, "$node"
    $P1718 = $P1717."isdecl"()
    unless $P1718, if_1716_end
    new $P1719, "Exception"
    set $P1719['type'], .CONTROL_RETURN
    find_lex $P1720, "self"
    find_lex $P1721, "$node"
    find_lex $P1722, "$bindpost"
    $P1723 = $P1720."lexical"($P1721, $P1722)
    setattribute $P1719, 'payload', $P1723
    throw $P1719
  if_1716_end:
.annotate 'line', 1926
    find_lex $P1724, "self"
    find_lex $P1725, "$name"
    $P1726 = $P1724."escape"($P1725)
    store_lex "$name", $P1726
.annotate 'line', 1928
    find_lex $P1728, "$bindpost"
    unless $P1728, if_1727_end
.annotate 'line', 1929
    new $P1729, "Exception"
    set $P1729['type'], .CONTROL_RETURN
    get_hll_global $P1730, ["POST"], "Op"
    find_lex $P1731, "$name"
    find_lex $P1732, "$bindpost"
    find_lex $P1733, "$bindpost"
    $P1734 = $P1730."new"($P1731, $P1732, "store_dynamic_lex" :named("pirop"), $P1733 :named("result"))
    setattribute $P1729, 'payload', $P1734
    throw $P1729
  if_1727_end:
.annotate 'line', 1934
    get_hll_global $P1735, ["POST"], "Ops"
    find_lex $P1736, "$node"
    $P1737 = $P1735."new"($P1736 :named("node"))
    store_lex "$ops", $P1737
.annotate 'line', 1935
    get_hll_global $P1738, ["POST"], "Op"
    find_lex $P1739, "$ops"
    find_lex $P1740, "$name"
    $P1741 = $P1738."new"($P1739, $P1740, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P1741
.annotate 'line', 1936
    get_hll_global $P1742, ["POST"], "Op"
    find_lex $P1743, "$ops"
    find_lex $P1744, "$name"
    $P1745 = $P1742."new"($P1743, $P1744, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P1745
.annotate 'line', 1937
    find_lex $P1746, "self"
    find_lex $P1747, "$node"
    find_lex $P1748, "$ops"
    find_lex $P1749, "$fetchop"
    find_lex $P1750, "$storeop"
    $P1751 = $P1746."vivify"($P1747, $P1748, $P1749, $P1750)
.annotate 'line', 1905
    .return ($P1751)
  control_1673:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1752, exception, "payload"
    .return ($P1752)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1696"  :anon :subid("79_1307980071.79615") :outer("78_1307980071.79615")
.annotate 'line', 1916
    new $P1698, "Undef"
    .lex "$scope", $P1698
    find_lex $P1699, "%symtable"
    unless_null $P1699, vivify_273
    $P1699 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1700, $P1699["scope"]
    unless_null $P1700, vivify_274
    new $P1700, "Undef"
  vivify_274:
    store_lex "$scope", $P1700
.annotate 'line', 1917
    find_lex $P1705, "$scope"
    if $P1705, if_1704
    set $P1703, $P1705
    goto if_1704_end
  if_1704:
    find_lex $P1706, "$scope"
    set $S1707, $P1706
    isne $I1708, $S1707, "contextual"
    new $P1703, 'Integer'
    set $P1703, $I1708
  if_1704_end:
    if $P1703, if_1702
    set $P1701, $P1703
    goto if_1702_end
  if_1702:
.annotate 'line', 1918
    new $P1709, "Exception"
    set $P1709['type'], .CONTROL_RETURN
    find_lex $P1710, "self"
    find_lex $P1711, "$node"
    find_lex $P1712, "$bindpost"
    find_lex $P1713, "$scope"
    set $S1714, $P1713
    $P1715 = $P1710.$S1714($P1711, $P1712)
    setattribute $P1709, 'payload', $P1715
    throw $P1709
  if_1702_end:
.annotate 'line', 1915
    .return ($P1701)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("80_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1756
    .param pmc param_1757
    .param pmc param_1758 :optional
    .param int has_param_1758 :opt_flag
.annotate 'line', 1941
    new $P1755, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1755, control_1754
    push_eh $P1755
    .lex "self", self
    .lex "$node", param_1756
    .lex "$bindpost", param_1757
    if has_param_1758, optparam_275
    new $P1759, "Undef"
    set param_1758, $P1759
  optparam_275:
    .lex "$keyrtype", param_1758
.annotate 'line', 1942

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
    
.annotate 'line', 1941
    .return ()
  control_1754:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1760, exception, "payload"
    .return ($P1760)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("81_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1764
    .param pmc param_1765
.annotate 'line', 2010
    new $P1763, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1763, control_1762
    push_eh $P1763
    .lex "self", self
    .lex "$node", param_1764
    .lex "$bindpost", param_1765
.annotate 'line', 2011
    find_lex $P1766, "self"
    find_lex $P1767, "$node"
    find_lex $P1768, "$bindpost"
    $P1769 = $P1766."keyed"($P1767, $P1768, "i")
.annotate 'line', 2010
    .return ($P1769)
  control_1762:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1770, exception, "payload"
    .return ($P1770)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("82_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1774
    .param pmc param_1775
.annotate 'line', 2015
    new $P1773, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1773, control_1772
    push_eh $P1773
    .lex "self", self
    .lex "$node", param_1774
    .lex "$bindpost", param_1775
.annotate 'line', 2016

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
    
.annotate 'line', 2015
    .return ()
  control_1772:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1776, exception, "payload"
    .return ($P1776)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("83_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Var"],_)
    .param pmc param_1780
    .param pmc param_1781
.annotate 'line', 2083
    .const 'Sub' $P1807 = "84_1307980071.79615" 
    capture_lex $P1807
    new $P1779, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1779, control_1778
    push_eh $P1779
    .lex "self", self
    .lex "$node", param_1780
    .lex "$bindpost", param_1781
.annotate 'line', 2084
    new $P1782, "Undef"
    .lex "$name", $P1782
.annotate 'line', 2091
    new $P1783, "Undef"
    .lex "$ops", $P1783
.annotate 'line', 2084
    find_lex $P1784, "$node"
    $P1785 = $P1784."name"()
    store_lex "$name", $P1785
.annotate 'line', 2086
    find_lex $P1787, "$name"
    if $P1787, unless_1786_end
.annotate 'line', 2087
    find_lex $P1788, "self"
    $P1789 = $P1788."uniquereg"("P")
    store_lex "$name", $P1789
.annotate 'line', 2088
    find_lex $P1790, "$node"
    find_lex $P1791, "$name"
    $P1790."name"($P1791)
  unless_1786_end:
.annotate 'line', 2091
    get_hll_global $P1792, ["POST"], "Ops"
    find_lex $P1793, "$name"
    find_lex $P1794, "$node"
    $P1795 = $P1792."new"($P1793 :named("result"), $P1794 :named("node"))
    store_lex "$ops", $P1795
.annotate 'line', 2093
    find_lex $P1797, "$node"
    $P1798 = $P1797."isdecl"()
    unless $P1798, if_1796_end
    find_lex $P1799, "$ops"
    find_lex $P1800, "$ops"
    $P1799."push_pirop"(".local pmc", $P1800)
  if_1796_end:
.annotate 'line', 2095
    find_lex $P1802, "$bindpost"
    if $P1802, if_1801
.annotate 'line', 2097
    .const 'Sub' $P1807 = "84_1307980071.79615" 
    capture_lex $P1807
    $P1807()
    goto if_1801_end
  if_1801:
.annotate 'line', 2096
    find_lex $P1803, "$ops"
    find_lex $P1804, "$ops"
    find_lex $P1805, "$bindpost"
    $P1803."push_pirop"("set", $P1804, $P1805)
  if_1801_end:
.annotate 'line', 2095
    find_lex $P1827, "$ops"
.annotate 'line', 2083
    .return ($P1827)
  control_1778:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1828, exception, "payload"
    .return ($P1828)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1806"  :anon :subid("84_1307980071.79615") :outer("83_1307980071.79615")
.annotate 'line', 2097
    .const 'Sub' $P1815 = "85_1307980071.79615" 
    capture_lex $P1815
.annotate 'line', 2098
    new $P1808, "Undef"
    .lex "$viviself", $P1808
    find_lex $P1809, "$node"
    $P1810 = $P1809."viviself"()
    store_lex "$viviself", $P1810
.annotate 'line', 2099
    find_lex $P1813, "$viviself"
    if $P1813, if_1812
    set $P1811, $P1813
    goto if_1812_end
  if_1812:
    .const 'Sub' $P1815 = "85_1307980071.79615" 
    capture_lex $P1815
    $P1826 = $P1815()
    set $P1811, $P1826
  if_1812_end:
.annotate 'line', 2097
    .return ($P1811)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1814"  :anon :subid("85_1307980071.79615") :outer("84_1307980071.79615")
.annotate 'line', 2100
    new $P1816, "Undef"
    .lex "$vivipost", $P1816
    find_lex $P1817, "self"
    find_lex $P1818, "$viviself"
    $P1819 = $P1817."as_vivipost"($P1818, "P" :named("rtype"))
    store_lex "$vivipost", $P1819
.annotate 'line', 2101
    find_lex $P1820, "$ops"
    find_lex $P1821, "$vivipost"
    $P1820."push"($P1821)
.annotate 'line', 2102
    find_lex $P1822, "$ops"
    find_lex $P1823, "$ops"
    find_lex $P1824, "$vivipost"
    $P1825 = $P1822."push_pirop"("set", $P1823, $P1824)
.annotate 'line', 2099
    .return ($P1825)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("86_1307980071.79615") :method :outer("11_1307980071.79615") :multi(_,["PAST";"Val"])
    .param pmc param_1832
    .param pmc param_1833 :slurpy :named
.annotate 'line', 2118
    new $P1831, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1831, control_1830
    push_eh $P1831
    .lex "self", self
    .lex "$node", param_1832
    .lex "%options", param_1833
.annotate 'line', 2119

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
    
.annotate 'line', 2118
    .return ()
  control_1830:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1834, exception, "payload"
    .return ($P1834)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1836" :load :anon :subid("87_1307980071.79615")
.annotate 'line', 41
    .const 'Sub' $P1838 = "11_1307980071.79615" 
    $P1839 = $P1838()
    .return ($P1839)
.end


.namespace []
.sub "_block2027" :load :anon :subid("88_1307980071.79615")
.annotate 'line', 1
    .const 'Sub' $P2029 = "10_1307980071.79615" 
    $P2030 = $P2029()
    .return ($P2030)
.end

