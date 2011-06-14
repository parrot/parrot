
.namespace []
.sub "_block11"  :anon :subid("10_1308013488.88323")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013488.88323" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1308013488.88323" 
    capture_lex $P14
    $P2029 = $P14()
.annotate 'line', 1
    .return ($P2029)
    .const 'Sub' $P2031 = "88_1308013488.88323" 
    .return ($P2031)
.end


.namespace []
.sub "" :load :init :subid("post89") :outer("10_1308013488.88323")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013488.88323" 
    .local pmc block
    set block, $P12
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2034 = get_root_global ["parrot"], "P6metaclass"
    new $P2035, "ResizablePMCArray"
    push $P2035, "%!symtable"
    $P2034."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P2035 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block13"  :subid("11_1308013488.88323") :outer("10_1308013488.88323")
.annotate 'line', 41
    .const 'Sub' $P1832 = "86_1308013488.88323" 
    capture_lex $P1832
    .const 'Sub' $P1780 = "83_1308013488.88323" 
    capture_lex $P1780
    .const 'Sub' $P1774 = "82_1308013488.88323" 
    capture_lex $P1774
    .const 'Sub' $P1764 = "81_1308013488.88323" 
    capture_lex $P1764
    .const 'Sub' $P1756 = "80_1308013488.88323" 
    capture_lex $P1756
    .const 'Sub' $P1675 = "78_1308013488.88323" 
    capture_lex $P1675
    .const 'Sub' $P1598 = "74_1308013488.88323" 
    capture_lex $P1598
    .const 'Sub' $P1592 = "73_1308013488.88323" 
    capture_lex $P1592
    .const 'Sub' $P1586 = "72_1308013488.88323" 
    capture_lex $P1586
    .const 'Sub' $P1537 = "70_1308013488.88323" 
    capture_lex $P1537
    .const 'Sub' $P1531 = "69_1308013488.88323" 
    capture_lex $P1531
    .const 'Sub' $P1472 = "68_1308013488.88323" 
    capture_lex $P1472
    .const 'Sub' $P1445 = "67_1308013488.88323" 
    capture_lex $P1445
    .const 'Sub' $P1409 = "66_1308013488.88323" 
    capture_lex $P1409
    .const 'Sub' $P1403 = "65_1308013488.88323" 
    capture_lex $P1403
    .const 'Sub' $P1354 = "64_1308013488.88323" 
    capture_lex $P1354
    .const 'Sub' $P1348 = "63_1308013488.88323" 
    capture_lex $P1348
    .const 'Sub' $P1342 = "62_1308013488.88323" 
    capture_lex $P1342
    .const 'Sub' $P1336 = "61_1308013488.88323" 
    capture_lex $P1336
    .const 'Sub' $P1327 = "60_1308013488.88323" 
    capture_lex $P1327
    .const 'Sub' $P1317 = "59_1308013488.88323" 
    capture_lex $P1317
    .const 'Sub' $P1311 = "58_1308013488.88323" 
    capture_lex $P1311
    .const 'Sub' $P1305 = "57_1308013488.88323" 
    capture_lex $P1305
    .const 'Sub' $P1295 = "56_1308013488.88323" 
    capture_lex $P1295
    .const 'Sub' $P1285 = "55_1308013488.88323" 
    capture_lex $P1285
    .const 'Sub' $P1275 = "54_1308013488.88323" 
    capture_lex $P1275
    .const 'Sub' $P1269 = "53_1308013488.88323" 
    capture_lex $P1269
    .const 'Sub' $P1264 = "52_1308013488.88323" 
    capture_lex $P1264
    .const 'Sub' $P1254 = "51_1308013488.88323" 
    capture_lex $P1254
    .const 'Sub' $P1085 = "47_1308013488.88323" 
    capture_lex $P1085
    .const 'Sub' $P1075 = "46_1308013488.88323" 
    capture_lex $P1075
    .const 'Sub' $P999 = "44_1308013488.88323" 
    capture_lex $P999
    .const 'Sub' $P889 = "43_1308013488.88323" 
    capture_lex $P889
    .const 'Sub' $P827 = "42_1308013488.88323" 
    capture_lex $P827
    .const 'Sub' $P453 = "32_1308013488.88323" 
    capture_lex $P453
    .const 'Sub' $P341 = "28_1308013488.88323" 
    capture_lex $P341
    .const 'Sub' $P286 = "27_1308013488.88323" 
    capture_lex $P286
    .const 'Sub' $P248 = "26_1308013488.88323" 
    capture_lex $P248
    .const 'Sub' $P238 = "25_1308013488.88323" 
    capture_lex $P238
    .const 'Sub' $P228 = "24_1308013488.88323" 
    capture_lex $P228
    .const 'Sub' $P210 = "23_1308013488.88323" 
    capture_lex $P210
    .const 'Sub' $P193 = "22_1308013488.88323" 
    capture_lex $P193
    .const 'Sub' $P180 = "21_1308013488.88323" 
    capture_lex $P180
    .const 'Sub' $P167 = "20_1308013488.88323" 
    capture_lex $P167
    .const 'Sub' $P157 = "19_1308013488.88323" 
    capture_lex $P157
    .const 'Sub' $P136 = "18_1308013488.88323" 
    capture_lex $P136
    .const 'Sub' $P130 = "17_1308013488.88323" 
    capture_lex $P130
    .const 'Sub' $P124 = "16_1308013488.88323" 
    capture_lex $P124
    .const 'Sub' $P89 = "15_1308013488.88323" 
    capture_lex $P89
    .const 'Sub' $P75 = "14_1308013488.88323" 
    capture_lex $P75
    .const 'Sub' $P44 = "13_1308013488.88323" 
    capture_lex $P44
    .const 'Sub' $P25 = "12_1308013488.88323" 
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
    .const 'Sub' $P1832 = "86_1308013488.88323" 
    newclosure $P1838, $P1832
.annotate 'line', 41
    .return ($P1838)
    .const 'Sub' $P1840 = "87_1308013488.88323" 
    .return ($P1840)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post90") :outer("11_1308013488.88323")
.annotate 'line', 41
    .const 'Sub' $P14 = "11_1308013488.88323" 
    .local pmc block
    set block, $P14
.annotate 'line', 49
    get_hll_global $P1843, ["PAST"], "Compiler"
    $P1843."language"("PAST")
.annotate 'line', 50
    get_hll_global $P1844, ["PAST"], "Compiler"
    new $P1845, "ResizablePMCArray"
    push $P1845, "post"
    push $P1845, "pir"
    push $P1845, "evalpmc"
    $P1844."stages"($P1845)
.annotate 'line', 53
    new $P1846, "String"
    assign $P1846, "PP+"
    get_global $P1847, "%piropsig"
    unless_null $P1847, vivify_91
    $P1847 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1847
  vivify_91:
    set $P1847["add"], $P1846
.annotate 'line', 54
    new $P1848, "String"
    assign $P1848, "PPP"
    get_global $P1849, "%piropsig"
    unless_null $P1849, vivify_92
    $P1849 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1849
  vivify_92:
    set $P1849["band"], $P1848
.annotate 'line', 55
    new $P1850, "String"
    assign $P1850, "PPP"
    get_global $P1851, "%piropsig"
    unless_null $P1851, vivify_93
    $P1851 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1851
  vivify_93:
    set $P1851["bxor"], $P1850
.annotate 'line', 56
    new $P1852, "String"
    assign $P1852, "PP"
    get_global $P1853, "%piropsig"
    unless_null $P1853, vivify_94
    $P1853 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1853
  vivify_94:
    set $P1853["bnot"], $P1852
.annotate 'line', 57
    new $P1854, "String"
    assign $P1854, "PPP"
    get_global $P1855, "%piropsig"
    unless_null $P1855, vivify_95
    $P1855 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1855
  vivify_95:
    set $P1855["bor"], $P1854
.annotate 'line', 58
    new $P1856, "String"
    assign $P1856, "IPs"
    get_global $P1857, "%piropsig"
    unless_null $P1857, vivify_96
    $P1857 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1857
  vivify_96:
    set $P1857["can"], $P1856
.annotate 'line', 59
    new $P1858, "String"
    assign $P1858, "Si"
    get_global $P1859, "%piropsig"
    unless_null $P1859, vivify_97
    $P1859 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1859
  vivify_97:
    set $P1859["chr"], $P1858
.annotate 'line', 60
    new $P1860, "String"
    assign $P1860, "PP"
    get_global $P1861, "%piropsig"
    unless_null $P1861, vivify_98
    $P1861 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1861
  vivify_98:
    set $P1861["clone"], $P1860
.annotate 'line', 61
    new $P1862, "String"
    assign $P1862, "PP~"
    get_global $P1863, "%piropsig"
    unless_null $P1863, vivify_99
    $P1863 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1863
  vivify_99:
    set $P1863["concat"], $P1862
.annotate 'line', 62
    new $P1864, "String"
    assign $P1864, "0PP"
    get_global $P1865, "%piropsig"
    unless_null $P1865, vivify_100
    $P1865 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1865
  vivify_100:
    set $P1865["copy"], $P1864
.annotate 'line', 63
    new $P1866, "String"
    assign $P1866, "IP"
    get_global $P1867, "%piropsig"
    unless_null $P1867, vivify_101
    $P1867 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1867
  vivify_101:
    set $P1867["defined"], $P1866
.annotate 'line', 64
    new $P1868, "String"
    assign $P1868, "vQ*"
    get_global $P1869, "%piropsig"
    unless_null $P1869, vivify_102
    $P1869 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1869
  vivify_102:
    set $P1869["delete"], $P1868
.annotate 'line', 65
    new $P1870, "String"
    assign $P1870, "v~"
    get_global $P1871, "%piropsig"
    unless_null $P1871, vivify_103
    $P1871 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1871
  vivify_103:
    set $P1871["die"], $P1870
.annotate 'line', 66
    new $P1872, "String"
    assign $P1872, "PP+"
    get_global $P1873, "%piropsig"
    unless_null $P1873, vivify_104
    $P1873 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1873
  vivify_104:
    set $P1873["div"], $P1872
.annotate 'line', 67
    new $P1874, "String"
    assign $P1874, "IPs"
    get_global $P1875, "%piropsig"
    unless_null $P1875, vivify_105
    $P1875 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1875
  vivify_105:
    set $P1875["does"], $P1874
.annotate 'line', 68
    new $P1876, "String"
    assign $P1876, "Ss"
    get_global $P1877, "%piropsig"
    unless_null $P1877, vivify_106
    $P1877 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1877
  vivify_106:
    set $P1877["downcase"], $P1876
.annotate 'line', 69
    new $P1878, "String"
    assign $P1878, "IP"
    get_global $P1879, "%piropsig"
    unless_null $P1879, vivify_107
    $P1879 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1879
  vivify_107:
    set $P1879["elements"], $P1878
.annotate 'line', 70
    new $P1880, "String"
    assign $P1880, "IQ*"
    get_global $P1881, "%piropsig"
    unless_null $P1881, vivify_108
    $P1881 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1881
  vivify_108:
    set $P1881["exists"], $P1880
.annotate 'line', 71
    new $P1882, "String"
    assign $P1882, "vi"
    get_global $P1883, "%piropsig"
    unless_null $P1883, vivify_109
    $P1883 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1883
  vivify_109:
    set $P1883["exit"], $P1882
.annotate 'line', 72
    new $P1884, "String"
    assign $P1884, "PP+"
    get_global $P1885, "%piropsig"
    unless_null $P1885, vivify_110
    $P1885 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1885
  vivify_110:
    set $P1885["fdiv"], $P1884
.annotate 'line', 73
    new $P1886, "String"
    assign $P1886, "Is"
    get_global $P1887, "%piropsig"
    unless_null $P1887, vivify_111
    $P1887 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1887
  vivify_111:
    set $P1887["find_codepoint"], $P1886
.annotate 'line', 74
    new $P1888, "String"
    assign $P1888, "Ps"
    get_global $P1889, "%piropsig"
    unless_null $P1889, vivify_112
    $P1889 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1889
  vivify_112:
    set $P1889["find_dynamic_lex"], $P1888
.annotate 'line', 75
    new $P1890, "String"
    assign $P1890, "Ps"
    get_global $P1891, "%piropsig"
    unless_null $P1891, vivify_113
    $P1891 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1891
  vivify_113:
    set $P1891["find_name"], $P1890
.annotate 'line', 76
    new $P1892, "String"
    assign $P1892, "P"
    get_global $P1893, "%piropsig"
    unless_null $P1893, vivify_114
    $P1893 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1893
  vivify_114:
    set $P1893["getinterp"], $P1892
.annotate 'line', 77
    new $P1894, "String"
    assign $P1894, "P~P"
    get_global $P1895, "%piropsig"
    unless_null $P1895, vivify_115
    $P1895 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1895
  vivify_115:
    set $P1895["getprop"], $P1894
.annotate 'line', 78
    new $P1896, "String"
    assign $P1896, "P"
    get_global $P1897, "%piropsig"
    unless_null $P1897, vivify_116
    $P1897 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1897
  vivify_116:
    set $P1897["getstderr"], $P1896
.annotate 'line', 79
    new $P1898, "String"
    assign $P1898, "P"
    get_global $P1899, "%piropsig"
    unless_null $P1899, vivify_117
    $P1899 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1899
  vivify_117:
    set $P1899["getstdin"], $P1898
.annotate 'line', 80
    new $P1900, "String"
    assign $P1900, "P"
    get_global $P1901, "%piropsig"
    unless_null $P1901, vivify_118
    $P1901 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1901
  vivify_118:
    set $P1901["getstdout"], $P1900
.annotate 'line', 81
    new $P1902, "String"
    assign $P1902, "Issi"
    get_global $P1903, "%piropsig"
    unless_null $P1903, vivify_119
    $P1903 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1903
  vivify_119:
    set $P1903["index"], $P1902
.annotate 'line', 82
    new $P1904, "String"
    assign $P1904, "IP~"
    get_global $P1905, "%piropsig"
    unless_null $P1905, vivify_120
    $P1905 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1905
  vivify_120:
    set $P1905["isa"], $P1904
.annotate 'line', 83
    new $P1906, "String"
    assign $P1906, "IP"
    get_global $P1907, "%piropsig"
    unless_null $P1907, vivify_121
    $P1907 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1907
  vivify_121:
    set $P1907["isfalse"], $P1906
.annotate 'line', 84
    new $P1908, "String"
    assign $P1908, "IP"
    get_global $P1909, "%piropsig"
    unless_null $P1909, vivify_122
    $P1909 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1909
  vivify_122:
    set $P1909["isnull"], $P1908
.annotate 'line', 85
    new $P1910, "String"
    assign $P1910, "IPP"
    get_global $P1911, "%piropsig"
    unless_null $P1911, vivify_123
    $P1911 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1911
  vivify_123:
    set $P1911["issame"], $P1910
.annotate 'line', 86
    new $P1912, "String"
    assign $P1912, "IP"
    get_global $P1913, "%piropsig"
    unless_null $P1913, vivify_124
    $P1913 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1913
  vivify_124:
    set $P1913["istrue"], $P1912
.annotate 'line', 87
    new $P1914, "String"
    assign $P1914, "SsP"
    get_global $P1915, "%piropsig"
    unless_null $P1915, vivify_125
    $P1915 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1915
  vivify_125:
    set $P1915["join"], $P1914
.annotate 'line', 88
    new $P1916, "String"
    assign $P1916, "Is"
    get_global $P1917, "%piropsig"
    unless_null $P1917, vivify_126
    $P1917 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1917
  vivify_126:
    set $P1917["length"], $P1916
.annotate 'line', 89
    new $P1918, "String"
    assign $P1918, "vs"
    get_global $P1919, "%piropsig"
    unless_null $P1919, vivify_127
    $P1919 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1919
  vivify_127:
    set $P1919["load_bytecode"], $P1918
.annotate 'line', 90
    new $P1920, "String"
    assign $P1920, "vs"
    get_global $P1921, "%piropsig"
    unless_null $P1921, vivify_128
    $P1921 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1921
  vivify_128:
    set $P1921["load_language"], $P1920
.annotate 'line', 91
    new $P1922, "String"
    assign $P1922, "P~"
    get_global $P1923, "%piropsig"
    unless_null $P1923, vivify_129
    $P1923 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1923
  vivify_129:
    set $P1923["loadlib"], $P1922
.annotate 'line', 92
    new $P1924, "String"
    assign $P1924, "PP+"
    get_global $P1925, "%piropsig"
    unless_null $P1925, vivify_130
    $P1925 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1925
  vivify_130:
    set $P1925["mod"], $P1924
.annotate 'line', 93
    new $P1926, "String"
    assign $P1926, "PP+"
    get_global $P1927, "%piropsig"
    unless_null $P1927, vivify_131
    $P1927 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1927
  vivify_131:
    set $P1927["mul"], $P1926
.annotate 'line', 94
    new $P1928, "String"
    assign $P1928, "PP"
    get_global $P1929, "%piropsig"
    unless_null $P1929, vivify_132
    $P1929 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1929
  vivify_132:
    set $P1929["neg"], $P1928
.annotate 'line', 95
    new $P1930, "String"
    assign $P1930, "P~"
    get_global $P1931, "%piropsig"
    unless_null $P1931, vivify_133
    $P1931 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1931
  vivify_133:
    set $P1931["new"], $P1930
.annotate 'line', 96
    new $P1932, "String"
    assign $P1932, "PP"
    get_global $P1933, "%piropsig"
    unless_null $P1933, vivify_134
    $P1933 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1933
  vivify_134:
    set $P1933["newclosure"], $P1932
.annotate 'line', 97
    new $P1934, "String"
    assign $P1934, "PP"
    get_global $P1935, "%piropsig"
    unless_null $P1935, vivify_135
    $P1935 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1935
  vivify_135:
    set $P1935["not"], $P1934
.annotate 'line', 98
    new $P1936, "String"
    assign $P1936, "Isi"
    get_global $P1937, "%piropsig"
    unless_null $P1937, vivify_136
    $P1937 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1937
  vivify_136:
    set $P1937["ord"], $P1936
.annotate 'line', 99
    new $P1938, "String"
    assign $P1938, "PP"
    get_global $P1939, "%piropsig"
    unless_null $P1939, vivify_137
    $P1939 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1939
  vivify_137:
    set $P1939["pop"], $P1938
.annotate 'line', 100
    new $P1940, "String"
    assign $P1940, "NN+"
    get_global $P1941, "%piropsig"
    unless_null $P1941, vivify_138
    $P1941 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1941
  vivify_138:
    set $P1941["pow"], $P1940
.annotate 'line', 101
    new $P1942, "String"
    assign $P1942, "v*"
    get_global $P1943, "%piropsig"
    unless_null $P1943, vivify_139
    $P1943 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1943
  vivify_139:
    set $P1943["print"], $P1942
.annotate 'line', 102
    new $P1944, "String"
    assign $P1944, "v*"
    get_global $P1945, "%piropsig"
    unless_null $P1945, vivify_140
    $P1945 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1945
  vivify_140:
    set $P1945["printerr"], $P1944
.annotate 'line', 103
    new $P1946, "String"
    assign $P1946, "0P*"
    get_global $P1947, "%piropsig"
    unless_null $P1947, vivify_141
    $P1947 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1947
  vivify_141:
    set $P1947["push"], $P1946
.annotate 'line', 104
    new $P1948, "String"
    assign $P1948, "Ssi"
    get_global $P1949, "%piropsig"
    unless_null $P1949, vivify_142
    $P1949 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1949
  vivify_142:
    set $P1949["repeat"], $P1948
.annotate 'line', 105
    new $P1950, "String"
    assign $P1950, "Ssiis"
    get_global $P1951, "%piropsig"
    unless_null $P1951, vivify_143
    $P1951 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1951
  vivify_143:
    set $P1951["replace"], $P1950
.annotate 'line', 106
    new $P1952, "String"
    assign $P1952, "v*"
    get_global $P1953, "%piropsig"
    unless_null $P1953, vivify_144
    $P1953 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1953
  vivify_144:
    set $P1953["say"], $P1952
.annotate 'line', 107
    new $P1954, "String"
    assign $P1954, "PP"
    get_global $P1955, "%piropsig"
    unless_null $P1955, vivify_145
    $P1955 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1955
  vivify_145:
    set $P1955["set"], $P1954
.annotate 'line', 108
    new $P1956, "String"
    assign $P1956, "0P~P"
    get_global $P1957, "%piropsig"
    unless_null $P1957, vivify_146
    $P1957 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1957
  vivify_146:
    set $P1957["setprop"], $P1956
.annotate 'line', 109
    new $P1958, "String"
    assign $P1958, "0P~P"
    get_global $P1959, "%piropsig"
    unless_null $P1959, vivify_147
    $P1959 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1959
  vivify_147:
    set $P1959["setattribute"], $P1958
.annotate 'line', 110
    new $P1960, "String"
    assign $P1960, "PP"
    get_global $P1961, "%piropsig"
    unless_null $P1961, vivify_148
    $P1961 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1961
  vivify_148:
    set $P1961["shift"], $P1960
.annotate 'line', 111
    new $P1962, "String"
    assign $P1962, "PP+"
    get_global $P1963, "%piropsig"
    unless_null $P1963, vivify_149
    $P1963 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1963
  vivify_149:
    set $P1963["shl"], $P1962
.annotate 'line', 112
    new $P1964, "String"
    assign $P1964, "PP+"
    get_global $P1965, "%piropsig"
    unless_null $P1965, vivify_150
    $P1965 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1965
  vivify_150:
    set $P1965["shr"], $P1964
.annotate 'line', 113
    new $P1966, "String"
    assign $P1966, "v+"
    get_global $P1967, "%piropsig"
    unless_null $P1967, vivify_151
    $P1967 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1967
  vivify_151:
    set $P1967["sleep"], $P1966
.annotate 'line', 114
    new $P1968, "String"
    assign $P1968, "0PPii"
    get_global $P1969, "%piropsig"
    unless_null $P1969, vivify_152
    $P1969 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1969
  vivify_152:
    set $P1969["splice"], $P1968
.annotate 'line', 115
    new $P1970, "String"
    assign $P1970, "Pss"
    get_global $P1971, "%piropsig"
    unless_null $P1971, vivify_153
    $P1971 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1971
  vivify_153:
    set $P1971["split"], $P1970
.annotate 'line', 116
    new $P1972, "String"
    assign $P1972, "PP+"
    get_global $P1973, "%piropsig"
    unless_null $P1973, vivify_154
    $P1973 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1973
  vivify_154:
    set $P1973["sub"], $P1972
.annotate 'line', 117
    new $P1974, "String"
    assign $P1974, "Ssii"
    get_global $P1975, "%piropsig"
    unless_null $P1975, vivify_155
    $P1975 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1975
  vivify_155:
    set $P1975["substr"], $P1974
.annotate 'line', 118
    new $P1976, "String"
    assign $P1976, "Ss"
    get_global $P1977, "%piropsig"
    unless_null $P1977, vivify_156
    $P1977 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1977
  vivify_156:
    set $P1977["titlecase"], $P1976
.annotate 'line', 119
    new $P1978, "String"
    assign $P1978, "vi"
    get_global $P1979, "%piropsig"
    unless_null $P1979, vivify_157
    $P1979 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1979
  vivify_157:
    set $P1979["trace"], $P1978
.annotate 'line', 120
    new $P1980, "String"
    assign $P1980, "SP"
    get_global $P1981, "%piropsig"
    unless_null $P1981, vivify_158
    $P1981 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1981
  vivify_158:
    set $P1981["typeof"], $P1980
.annotate 'line', 121
    new $P1982, "String"
    assign $P1982, "0P*"
    get_global $P1983, "%piropsig"
    unless_null $P1983, vivify_159
    $P1983 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1983
  vivify_159:
    set $P1983["unshift"], $P1982
.annotate 'line', 122
    new $P1984, "String"
    assign $P1984, "Ss"
    get_global $P1985, "%piropsig"
    unless_null $P1985, vivify_160
    $P1985 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1985
  vivify_160:
    set $P1985["upcase"], $P1984
.annotate 'line', 127
    new $P1986, "String"
    assign $P1986, "s~*:e"
    get_global $P1987, "%valflags"
    unless_null $P1987, vivify_161
    $P1987 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1987
  vivify_161:
    set $P1987["String"], $P1986
.annotate 'line', 128
    new $P1988, "String"
    assign $P1988, "i+*:"
    get_global $P1989, "%valflags"
    unless_null $P1989, vivify_162
    $P1989 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1989
  vivify_162:
    set $P1989["Integer"], $P1988
.annotate 'line', 129
    new $P1990, "String"
    assign $P1990, "n+*:"
    get_global $P1991, "%valflags"
    unless_null $P1991, vivify_163
    $P1991 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1991
  vivify_163:
    set $P1991["Float"], $P1990
.annotate 'line', 130
    new $P1992, "String"
    assign $P1992, "i+*:c"
    get_global $P1993, "%valflags"
    unless_null $P1993, vivify_164
    $P1993 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1993
  vivify_164:
    set $P1993["!macro_const"], $P1992
.annotate 'line', 131
    new $P1994, "String"
    assign $P1994, "i+*:c"
    get_global $P1995, "%valflags"
    unless_null $P1995, vivify_165
    $P1995 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1995
  vivify_165:
    set $P1995["!cclass"], $P1994
.annotate 'line', 132
    new $P1996, "String"
    assign $P1996, "i+*:c"
    get_global $P1997, "%valflags"
    unless_null $P1997, vivify_166
    $P1997 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1997
  vivify_166:
    set $P1997["!except_severity"], $P1996
.annotate 'line', 133
    new $P1998, "String"
    assign $P1998, "i+*:c"
    get_global $P1999, "%valflags"
    unless_null $P1999, vivify_167
    $P1999 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1999
  vivify_167:
    set $P1999["!except_types"], $P1998
.annotate 'line', 134
    new $P2000, "String"
    assign $P2000, "i+*:c"
    get_global $P2001, "%valflags"
    unless_null $P2001, vivify_168
    $P2001 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2001
  vivify_168:
    set $P2001["!iterator"], $P2000
.annotate 'line', 135
    new $P2002, "String"
    assign $P2002, "i+*:c"
    get_global $P2003, "%valflags"
    unless_null $P2003, vivify_169
    $P2003 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2003
  vivify_169:
    set $P2003["!socket"], $P2002
.annotate 'line', 139
    new $P2004, "String"
    assign $P2004, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2005, "%controltypes"
    unless_null $P2005, vivify_170
    $P2005 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2005
  vivify_170:
    set $P2005["CONTROL"], $P2004
.annotate 'line', 140
    new $P2006, "String"
    assign $P2006, ".CONTROL_RETURN"
    get_global $P2007, "%controltypes"
    unless_null $P2007, vivify_171
    $P2007 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2007
  vivify_171:
    set $P2007["RETURN"], $P2006
.annotate 'line', 141
    new $P2008, "String"
    assign $P2008, ".CONTROL_OK"
    get_global $P2009, "%controltypes"
    unless_null $P2009, vivify_172
    $P2009 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2009
  vivify_172:
    set $P2009["OK"], $P2008
.annotate 'line', 142
    new $P2010, "String"
    assign $P2010, ".CONTROL_BREAK"
    get_global $P2011, "%controltypes"
    unless_null $P2011, vivify_173
    $P2011 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2011
  vivify_173:
    set $P2011["BREAK"], $P2010
.annotate 'line', 143
    new $P2012, "String"
    assign $P2012, ".CONTROL_CONTINUE"
    get_global $P2013, "%controltypes"
    unless_null $P2013, vivify_174
    $P2013 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2013
  vivify_174:
    set $P2013["CONTINUE"], $P2012
.annotate 'line', 144
    new $P2014, "String"
    assign $P2014, ".CONTROL_ERROR"
    get_global $P2015, "%controltypes"
    unless_null $P2015, vivify_175
    $P2015 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2015
  vivify_175:
    set $P2015["ERROR"], $P2014
.annotate 'line', 145
    new $P2016, "String"
    assign $P2016, ".CONTROL_TAKE"
    get_global $P2017, "%controltypes"
    unless_null $P2017, vivify_176
    $P2017 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2017
  vivify_176:
    set $P2017["GATHER"], $P2016
.annotate 'line', 146
    new $P2018, "String"
    assign $P2018, ".CONTROL_LEAVE"
    get_global $P2019, "%controltypes"
    unless_null $P2019, vivify_177
    $P2019 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2019
  vivify_177:
    set $P2019["LEAVE"], $P2018
.annotate 'line', 147
    new $P2020, "String"
    assign $P2020, ".CONTROL_EXIT"
    get_global $P2021, "%controltypes"
    unless_null $P2021, vivify_178
    $P2021 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2021
  vivify_178:
    set $P2021["EXIT"], $P2020
.annotate 'line', 148
    new $P2022, "String"
    assign $P2022, ".CONTROL_NEXT"
    get_global $P2023, "%controltypes"
    unless_null $P2023, vivify_179
    $P2023 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2023
  vivify_179:
    set $P2023["NEXT"], $P2022
.annotate 'line', 149
    new $P2024, "String"
    assign $P2024, ".CONTROL_LAST"
    get_global $P2025, "%controltypes"
    unless_null $P2025, vivify_180
    $P2025 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2025
  vivify_180:
    set $P2025["LAST"], $P2024
.annotate 'line', 150
    new $P2026, "String"
    assign $P2026, ".CONTROL_REDO"
    get_global $P2027, "%controltypes"
    unless_null $P2027, vivify_181
    $P2027 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2027
  vivify_181:
    set $P2027["REDO"], $P2026
.annotate 'line', 152
    new $P2028, "Integer"
    assign $P2028, 11
    set_global "$serno", $P2028
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "escape"  :subid("13_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "unique"  :subid("14_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "uniquereg"  :subid("15_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "coerce"  :subid("16_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "post_children"  :subid("17_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "as_post"  :subid("18_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,_)
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
.sub "as_post"  :subid("19_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["Undef"])
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
.sub "as_post"  :subid("20_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["Integer"])
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
.sub "as_post"  :subid("21_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["Float"])
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
.sub "as_post"  :subid("22_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["String"])
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
.sub "as_vivipost"  :subid("23_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["String"])
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
.sub "as_vivipost"  :subid("24_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,_)
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
.sub "as_post"  :subid("25_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Node"])
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
.sub "node_as_post"  :subid("26_1308013488.88323") :method :outer("11_1308013488.88323")
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
.sub "as_post"  :subid("27_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Control"])
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
.sub "wrap_handlers"  :subid("28_1308013488.88323") :method :outer("11_1308013488.88323")
    .param pmc param_344
    .param pmc param_345
    .param pmc param_346 :slurpy :named
.annotate 'line', 615
    .const 'Sub' $P369 = "29_1308013488.88323" 
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
    .const 'Sub' $P369 = "29_1308013488.88323" 
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
.sub "_block368"  :anon :subid("29_1308013488.88323") :outer("28_1308013488.88323")
    .param pmc param_374
.annotate 'line', 623
    .const 'Sub' $P417 = "31_1308013488.88323" 
    capture_lex $P417
    .const 'Sub' $P397 = "30_1308013488.88323" 
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
    .const 'Sub' $P397 = "30_1308013488.88323" 
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
    .const 'Sub' $P417 = "31_1308013488.88323" 
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
.sub "_block396"  :anon :subid("30_1308013488.88323") :outer("29_1308013488.88323")
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
.sub "_block416"  :anon :subid("31_1308013488.88323") :outer("29_1308013488.88323")
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
.sub "as_post"  :subid("32_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Block"])
    .param pmc param_456
    .param pmc param_457 :slurpy :named
.annotate 'line', 671
    .const 'Sub' $P555 = "33_1308013488.88323" 
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
    .const 'Sub' $P555 = "33_1308013488.88323" 
    capture_lex $P555
    $P555()
.annotate 'line', 853
    find_dynamic_lex $P823, "@*BLOCKPAST"
    unless_null $P823, vivify_235
    get_hll_global $P823, "@BLOCKPAST"
    unless_null $P823, vivify_236
    die "Contextual @*BLOCKPAST not found"
  vivify_236:
  vivify_235:
    shift $P824, $P823
    find_lex $P825, "$bpost"
.annotate 'line', 671
    .return ($P825)
  control_454:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P826, exception, "payload"
    .return ($P826)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block554"  :anon :subid("33_1308013488.88323") :outer("32_1308013488.88323")
.annotate 'line', 722
    .const 'Sub' $P809 = "41_1308013488.88323" 
    capture_lex $P809
    .const 'Sub' $P759 = "40_1308013488.88323" 
    capture_lex $P759
    .const 'Sub' $P732 = "39_1308013488.88323" 
    capture_lex $P732
    .const 'Sub' $P633 = "36_1308013488.88323" 
    capture_lex $P633
    .const 'Sub' $P604 = "35_1308013488.88323" 
    capture_lex $P604
    .const 'Sub' $P573 = "34_1308013488.88323" 
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
    .const 'Sub' $P573 = "34_1308013488.88323" 
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
    new $P616, 'ExceptionHandler'
    set_label $P616, loop615_handler
    $P616."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P616
  loop615_test:
    unless $P599, loop615_done
    shift $P602, $P599
  loop615_redo:
    .const 'Sub' $P604 = "35_1308013488.88323" 
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
  for_undef_220:
  unless_593_end:
  if_588_end:
.annotate 'line', 755
    find_lex $P618, "%symtable"
    find_lex $P619, "self"
    setattribute $P619, "%!symtable", $P618
.annotate 'line', 757
    find_lex $P620, "$node"
    $P621 = $P620."compiler"()
    store_lex "$compiler", $P621
.annotate 'line', 758
    find_lex $P623, "$compiler"
    if $P623, if_622
.annotate 'line', 764
    .const 'Sub' $P633 = "36_1308013488.88323" 
    capture_lex $P633
    $P633()
    goto if_622_end
  if_622:
.annotate 'line', 761
    find_lex $P624, "$bpost"
    find_lex $P625, "$compiler"
    $P624."compiler"($P625)
.annotate 'line', 762
    find_lex $P626, "$bpost"
    find_lex $P627, "$node"
    $P628 = $P627."compiler_args"()
    $P626."compiler_args"($P628)
.annotate 'line', 763
    find_lex $P629, "$bpost"
    find_lex $P630, "$node"
    unless_null $P630, vivify_228
    $P630 = root_new ['parrot';'ResizablePMCArray']
  vivify_228:
    set $P631, $P630[0]
    unless_null $P631, vivify_229
    new $P631, "Undef"
  vivify_229:
    $P629."push"($P631)
  if_622_end:
.annotate 'line', 812
    find_lex $P729, "$node"
    exists $I730, $P729["loadinit"]
    unless $I730, if_728_end
    .const 'Sub' $P732 = "39_1308013488.88323" 
    capture_lex $P732
    $P732()
  if_728_end:
.annotate 'line', 822
    find_lex $P749, "%outersym"
    find_lex $P750, "self"
    setattribute $P750, "%!symtable", $P749
.annotate 'line', 825
    find_lex $P751, "%options"
    unless_null $P751, vivify_231
    $P751 = root_new ['parrot';'Hash']
  vivify_231:
    set $P752, $P751["rtype"]
    unless_null $P752, vivify_232
    new $P752, "Undef"
  vivify_232:
    store_lex "$rtype", $P752
.annotate 'line', 827
    find_lex $P755, "$blocktype"
    set $S756, $P755
    iseq $I757, $S756, "immediate"
    if $I757, if_754
.annotate 'line', 835
    find_lex $P790, "$rtype"
    set $S791, $P790
    isne $I792, $S791, "v"
    if $I792, if_789
    new $P788, 'Integer'
    set $P788, $I792
    goto if_789_end
  if_789:
.annotate 'line', 836
    get_hll_global $P793, ["POST"], "Ops"
    find_lex $P794, "$bpost"
    find_lex $P795, "$node"
    find_lex $P796, "$blockreg"
    $P797 = $P793."new"($P794, $P795 :named("node"), $P796 :named("result"))
    store_lex "$bpost", $P797
.annotate 'line', 837
    find_lex $P798, "$bpost"
    find_lex $P799, "$blockref"
    find_lex $P800, "$blockreg"
    $P798."push_pirop"($P799, $P800 :named("result"))
.annotate 'line', 838
    find_lex $P803, "$islexical"
    if $P803, if_802
    set $P801, $P803
    goto if_802_end
  if_802:
.annotate 'line', 839
    find_lex $P806, "$node"
    $P807 = $P806."closure"()
    if $P807, if_805
.annotate 'line', 846
    find_lex $P820, "$bpost"
    find_lex $P821, "$blockreg"
    $P822 = $P820."push_pirop"("capture_lex", $P821)
.annotate 'line', 845
    set $P804, $P822
.annotate 'line', 839
    goto if_805_end
  if_805:
    .const 'Sub' $P809 = "41_1308013488.88323" 
    capture_lex $P809
    $P819 = $P809()
    set $P804, $P819
  if_805_end:
.annotate 'line', 838
    set $P801, $P804
  if_802_end:
.annotate 'line', 835
    set $P788, $P801
  if_789_end:
    set $P753, $P788
.annotate 'line', 827
    goto if_754_end
  if_754:
    .const 'Sub' $P759 = "40_1308013488.88323" 
    capture_lex $P759
    $P787 = $P759()
    set $P753, $P787
  if_754_end:
.annotate 'line', 722
    .return ($P753)
.end


.namespace ["PAST";"Compiler"]
.sub "_block572"  :anon :subid("34_1308013488.88323") :outer("33_1308013488.88323")
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
.sub "_block603"  :anon :subid("35_1308013488.88323") :outer("33_1308013488.88323")
    .param pmc param_605
.annotate 'line', 749
    .lex "$_", param_605
.annotate 'line', 750
    find_lex $P608, "$_"
    find_lex $P607, "%symtable"
    exists $I609, $P607[$P608]
    unless $I609, if_606_end
    die 0, .CONTROL_LOOP_NEXT
  if_606_end:
.annotate 'line', 751
    find_lex $P610, "$_"
    find_lex $P611, "%outersym"
    unless_null $P611, vivify_221
    $P611 = root_new ['parrot';'Hash']
  vivify_221:
    set $P612, $P611[$P610]
    unless_null $P612, vivify_222
    new $P612, "Undef"
  vivify_222:
    find_lex $P613, "$_"
    find_lex $P614, "%symtable"
    unless_null $P614, vivify_223
    $P614 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P614
  vivify_223:
    set $P614[$P613], $P612
.annotate 'line', 749
    .return ($P612)
.end


.namespace ["PAST";"Compiler"]
.sub "_block632"  :anon :subid("36_1308013488.88323") :outer("33_1308013488.88323")
.annotate 'line', 764
    .const 'Sub' $P702 = "38_1308013488.88323" 
    capture_lex $P702
    .const 'Sub' $P646 = "37_1308013488.88323" 
    capture_lex $P646
.annotate 'line', 766
    new $P634, "Undef"
    .lex "$ctrlpast", $P634
.annotate 'line', 767
    new $P635, "Undef"
    .lex "$ctrllabel", $P635
.annotate 'line', 780
    new $P636, "Undef"
    .lex "$sig", $P636
.annotate 'line', 782
    new $P637, "Undef"
    .lex "$ops", $P637
.annotate 'line', 784
    new $P638, "Undef"
    .lex "$retval", $P638
.annotate 'line', 786
    new $P639, "Undef"
    .lex "$eh", $P639
.annotate 'line', 766
    find_lex $P640, "$node"
    $P641 = $P640."control"()
    store_lex "$ctrlpast", $P641
    find_lex $P642, "$ctrllabel"
.annotate 'line', 769
    find_lex $P644, "$ctrlpast"
    unless $P644, if_643_end
    .const 'Sub' $P646 = "37_1308013488.88323" 
    capture_lex $P646
    $P646()
  if_643_end:
.annotate 'line', 780
    find_lex $P663, "$node"
    $P664 = $P663."list"()
    elements $I665, $P664
    repeat $S666, "v", $I665
    new $P667, 'String'
    set $P667, $S666
    concat $P668, $P667, "*"
    store_lex "$sig", $P668
.annotate 'line', 782
    find_lex $P669, "self"
    find_lex $P670, "$node"
    find_lex $P671, "$sig"
    $P672 = $P669."post_children"($P670, $P671 :named("signature"))
    store_lex "$ops", $P672
.annotate 'line', 784
    find_lex $P673, "$ops"
    unless_null $P673, vivify_224
    $P673 = root_new ['parrot';'ResizablePMCArray']
  vivify_224:
    set $P674, $P673[-1]
    unless_null $P674, vivify_225
    new $P674, "Undef"
  vivify_225:
    store_lex "$retval", $P674
.annotate 'line', 786
    find_lex $P675, "$node"
    $P676 = $P675."handlers"()
    store_lex "$eh", $P676
.annotate 'line', 787
    find_lex $P678, "$eh"
    unless $P678, if_677_end
.annotate 'line', 788
    find_lex $P679, "self"
    find_lex $P680, "$ops"
    find_lex $P681, "$eh"
    find_lex $P682, "%options"
    unless_null $P682, vivify_226
    $P682 = root_new ['parrot';'Hash']
  vivify_226:
    set $P683, $P682["rtype"]
    unless_null $P683, vivify_227
    new $P683, "Undef"
  vivify_227:
    $P684 = $P679."wrap_handlers"($P680, $P681, $P683 :named("rtype"))
    store_lex "$ops", $P684
  if_677_end:
.annotate 'line', 790
    find_lex $P685, "$bpost"
    find_lex $P686, "$ops"
    $P685."push"($P686)
.annotate 'line', 791
    find_lex $P687, "$bpost"
    find_lex $P688, "$retval"
    $P687."push_pirop"("return", $P688)
.annotate 'line', 793
    find_lex $P691, "$ctrlpast"
    if $P691, if_690
    set $P689, $P691
    goto if_690_end
  if_690:
.annotate 'line', 794
    find_lex $P692, "$bpost"
    find_lex $P693, "$ctrllabel"
    $P692."push"($P693)
.annotate 'line', 795
    find_lex $P694, "$bpost"
    $P694."push_pirop"(".local pmc exception")
.annotate 'line', 796
    find_lex $P695, "$bpost"
    $P695."push_pirop"(".get_results (exception)")
.annotate 'line', 797
    find_lex $P698, "$ctrlpast"
    set $S699, $P698
    iseq $I700, $S699, "return_pir"
    if $I700, if_697
.annotate 'line', 803
    find_lex $P714, "$ctrlpast"
    get_hll_global $P715, ["PAST"], "Node"
    $P716 = $P714."isa"($P715)
    if $P716, if_713
.annotate 'line', 806
    find_lex $P722, "self"
    new $P723, 'String'
    set $P723, "Unrecognized control handler '"
    find_lex $P724, "$ctrlpast"
    concat $P725, $P723, $P724
    concat $P726, $P725, "'"
    $P727 = $P722."panic"($P726)
.annotate 'line', 805
    set $P712, $P727
.annotate 'line', 803
    goto if_713_end
  if_713:
.annotate 'line', 804
    find_lex $P717, "$bpost"
    find_lex $P718, "self"
    find_lex $P719, "$ctrlpast"
    $P720 = $P718."as_post"($P719, "*" :named("rtype"))
    $P721 = $P717."push"($P720)
.annotate 'line', 803
    set $P712, $P721
  if_713_end:
    set $P696, $P712
.annotate 'line', 797
    goto if_697_end
  if_697:
    .const 'Sub' $P702 = "38_1308013488.88323" 
    capture_lex $P702
    $P711 = $P702()
    set $P696, $P711
  if_697_end:
.annotate 'line', 793
    set $P689, $P696
  if_690_end:
.annotate 'line', 764
    .return ($P689)
.end


.namespace ["PAST";"Compiler"]
.sub "_block645"  :anon :subid("37_1308013488.88323") :outer("36_1308013488.88323")
.annotate 'line', 771
    new $P647, "Undef"
    .lex "$reg", $P647
.annotate 'line', 770
    get_hll_global $P648, ["POST"], "Label"
    find_lex $P649, "self"
    $P650 = $P649."unique"("control_")
    $P651 = $P648."new"($P650 :named("result"))
    store_lex "$ctrllabel", $P651
.annotate 'line', 771
    find_lex $P652, "self"
    $P653 = $P652."uniquereg"("P")
    store_lex "$reg", $P653
.annotate 'line', 772
    find_lex $P654, "$bpost"
    find_lex $P655, "$reg"
    $P654."push_pirop"("new", $P655, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 774
    find_lex $P656, "$bpost"
    find_lex $P657, "$reg"
    find_lex $P658, "$ctrllabel"
    $P656."push_pirop"("set_label", $P657, $P658)
.annotate 'line', 775
    find_lex $P659, "$bpost"
    find_lex $P660, "$reg"
    $P659."push_pirop"("push_eh", $P660)
.annotate 'line', 776
    find_lex $P661, "$bpost"
    $P662 = $P661."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 769
    .return ($P662)
.end


.namespace ["PAST";"Compiler"]
.sub "_block701"  :anon :subid("38_1308013488.88323") :outer("36_1308013488.88323")
.annotate 'line', 799
    new $P703, "Undef"
    .lex "$reg", $P703
    find_lex $P704, "self"
    $P705 = $P704."uniquereg"("P")
    store_lex "$reg", $P705
.annotate 'line', 800
    find_lex $P706, "$bpost"
    find_lex $P707, "$reg"
    $P706."push_pirop"("getattribute", $P707, "exception", "\"payload\"")
.annotate 'line', 802
    find_lex $P708, "$bpost"
    find_lex $P709, "$reg"
    $P710 = $P708."push_pirop"("return", $P709)
.annotate 'line', 797
    .return ($P710)
.end


.namespace ["PAST";"Compiler"]
.sub "_block731"  :anon :subid("39_1308013488.88323") :outer("33_1308013488.88323")
.annotate 'line', 813
    new $P733, "Undef"
    .lex "$lisub", $P733
    get_hll_global $P734, ["POST"], "Sub"
    find_lex $P735, "$bpost"
    $P736 = $P734."new"($P735 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P736
.annotate 'line', 814
    find_lex $P737, "$lisub"
    find_lex $P738, "$blockref"
    $P737."push_pirop"($P738)
.annotate 'line', 815
    find_lex $P739, "$lisub"
    $P739."push_pirop"(".local pmc", "block")
.annotate 'line', 816
    find_lex $P740, "$lisub"
    find_lex $P741, "$blockreg"
    $P740."push_pirop"("set", "block", $P741)
.annotate 'line', 817
    find_lex $P742, "$lisub"
    find_lex $P743, "self"
    find_lex $P744, "$node"
    $P745 = $P744."loadinit"()
    $P746 = $P743."as_post"($P745, "v" :named("rtype"))
    $P742."push"($P746)
.annotate 'line', 818
    find_lex $P747, "$lisub"
    find_lex $P748, "$bpost"
    unless_null $P748, vivify_230
    $P748 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P748
  vivify_230:
    set $P748["loadinit"], $P747
.annotate 'line', 812
    .return ($P747)
.end


.namespace ["PAST";"Compiler"]
.sub "_block808"  :anon :subid("41_1308013488.88323") :outer("33_1308013488.88323")
.annotate 'line', 842
    new $P810, "Undef"
    .lex "$result", $P810
    find_lex $P811, "self"
    $P812 = $P811."uniquereg"("P")
    store_lex "$result", $P812
.annotate 'line', 843
    find_lex $P813, "$bpost"
    find_lex $P814, "$result"
    find_lex $P815, "$blockreg"
    $P813."push_pirop"("newclosure", $P814, $P815)
.annotate 'line', 844
    find_lex $P816, "$bpost"
    find_lex $P817, "$result"
    $P818 = $P816."result"($P817)
.annotate 'line', 839
    .return ($P818)
.end


.namespace ["PAST";"Compiler"]
.sub "_block758"  :anon :subid("40_1308013488.88323") :outer("33_1308013488.88323")
.annotate 'line', 828
    $P760 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P760
.annotate 'line', 830
    new $P761, "Undef"
    .lex "$result", $P761
.annotate 'line', 828
    find_lex $P762, "%options"
    unless_null $P762, vivify_233
    $P762 = root_new ['parrot';'Hash']
  vivify_233:
    set $P763, $P762["arglist"]
    unless_null $P763, vivify_234
    new $P763, "Undef"
  vivify_234:
    store_lex "@arglist", $P763
.annotate 'line', 829
    find_lex $P765, "@arglist"
    defined $I766, $P765
    if $I766, unless_764_end
    new $P767, "ResizablePMCArray"
    store_lex "@arglist", $P767
  unless_764_end:
.annotate 'line', 830
    find_lex $P768, "self"
    find_lex $P769, "$rtype"
    $P770 = $P768."uniquereg"($P769)
    store_lex "$result", $P770
.annotate 'line', 831
    get_hll_global $P771, ["POST"], "Ops"
    find_lex $P772, "$bpost"
    find_lex $P773, "$node"
    find_lex $P774, "$result"
    $P775 = $P771."new"($P772, $P773 :named("node"), $P774 :named("result"))
    store_lex "$bpost", $P775
.annotate 'line', 832
    find_lex $P776, "$bpost"
    find_lex $P777, "$blockref"
    $P776."push_pirop"($P777)
.annotate 'line', 833
    find_lex $P779, "$islexical"
    unless $P779, if_778_end
    find_lex $P780, "$bpost"
    find_lex $P781, "$blockreg"
    $P780."push_pirop"("capture_lex", $P781)
  if_778_end:
.annotate 'line', 834
    find_lex $P782, "$bpost"
    find_lex $P783, "$blockreg"
    find_lex $P784, "@arglist"
    find_lex $P785, "$result"
    $P786 = $P782."push_pirop"("call", $P783, $P784 :flat, $P785 :named("result"))
.annotate 'line', 827
    .return ($P786)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("42_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_830
    .param pmc param_831 :slurpy :named
.annotate 'line', 865
    new $P829, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P829, control_828
    push_eh $P829
    .lex "self", self
    .lex "$node", param_830
    .lex "%options", param_831
.annotate 'line', 867
    new $P832, "Undef"
    .lex "$lvalue", $P832
.annotate 'line', 868
    new $P833, "Undef"
    .lex "$child", $P833
.annotate 'line', 873
    new $P834, "Undef"
    .lex "$pasttype", $P834
.annotate 'line', 878
    new $P835, "Undef"
    .lex "$pirop", $P835
.annotate 'line', 883
    new $P836, "Undef"
    .lex "$inline", $P836
.annotate 'line', 867
    find_lex $P837, "$node"
    $P838 = $P837."lvalue"()
    store_lex "$lvalue", $P838
.annotate 'line', 868
    find_lex $P839, "$node"
    unless_null $P839, vivify_237
    $P839 = root_new ['parrot';'ResizablePMCArray']
  vivify_237:
    set $P840, $P839[0]
    unless_null $P840, vivify_238
    new $P840, "Undef"
  vivify_238:
    store_lex "$child", $P840
.annotate 'line', 869
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
.annotate 'line', 870
    find_lex $P853, "$child"
    find_lex $P854, "$lvalue"
    $P853."lvalue"($P854)
  if_841_end:
.annotate 'line', 873
    find_lex $P855, "$node"
    $P856 = $P855."pasttype"()
    store_lex "$pasttype", $P856
.annotate 'line', 874
    find_lex $P858, "$pasttype"
    unless $P858, if_857_end
.annotate 'line', 875
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
.annotate 'line', 878
    find_lex $P866, "$node"
    $P867 = $P866."pirop"()
    store_lex "$pirop", $P867
.annotate 'line', 879
    find_lex $P869, "$pirop"
    unless $P869, if_868_end
.annotate 'line', 880
    new $P870, "Exception"
    set $P870['type'], .CONTROL_RETURN
    find_lex $P871, "self"
    find_lex $P872, "$node"
    find_lex $P873, "%options"
    $P874 = $P871."pirop"($P872, $P873 :flat)
    setattribute $P870, 'payload', $P874
    throw $P870
  if_868_end:
.annotate 'line', 883
    find_lex $P875, "$node"
    $P876 = $P875."inline"()
    store_lex "$inline", $P876
.annotate 'line', 884
    find_lex $P878, "$inline"
    unless $P878, if_877_end
.annotate 'line', 885
    new $P879, "Exception"
    set $P879['type'], .CONTROL_RETURN
    find_lex $P880, "self"
    find_lex $P881, "$node"
    find_lex $P882, "%options"
    $P883 = $P880."inline"($P881, $P882 :flat)
    setattribute $P879, 'payload', $P883
    throw $P879
  if_877_end:
.annotate 'line', 888
    find_lex $P884, "self"
    find_lex $P885, "$node"
    find_lex $P886, "%options"
    $P887 = $P884."call"($P885, $P886 :flat)
.annotate 'line', 865
    .return ($P887)
  control_828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P888, exception, "payload"
    .return ($P888)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("43_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_892
    .param pmc param_893 :slurpy :named
.annotate 'line', 896
    new $P891, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P891, control_890
    push_eh $P891
    .lex "self", self
    .lex "$node", param_892
    .lex "%options", param_893
.annotate 'line', 897
    new $P894, "Undef"
    .lex "$pirop", $P894
.annotate 'line', 898
    new $P895, "Undef"
    .lex "$signature", $P895
.annotate 'line', 899
    new $P896, "Undef"
    .lex "$I0", $P896
.annotate 'line', 913
    new $P897, "Undef"
    .lex "$ops", $P897
.annotate 'line', 914
    $P898 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P898
.annotate 'line', 924
    $P899 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P899
.annotate 'line', 926
    new $P900, "Undef"
    .lex "$S0", $P900
.annotate 'line', 937
    new $P901, "Undef"
    .lex "$result", $P901
.annotate 'line', 897
    find_lex $P902, "$node"
    $P903 = $P902."pirop"()
    store_lex "$pirop", $P903
    find_lex $P904, "$signature"
    find_lex $P905, "$I0"
.annotate 'line', 900
    find_lex $P907, "$pirop"
    set $S908, $P907
    index $I909, $S908, " "
    new $P910, 'Integer'
    set $P910, $I909
    store_lex "$I0", $P910
    set $N911, $P910
    isge $I912, $N911, 0.0
    if $I912, if_906
.annotate 'line', 904
    find_lex $P927, "$pirop"
    set $S928, $P927
    index $I929, $S928, "__"
    new $P930, 'Integer'
    set $P930, $I929
    store_lex "$I0", $P930
    set $N931, $P930
    isge $I932, $N931, 0.0
    if $I932, if_926
.annotate 'line', 909
    find_lex $P946, "$pirop"
    get_global $P947, "%piropsig"
    unless_null $P947, vivify_239
    $P947 = root_new ['parrot';'Hash']
  vivify_239:
    set $P948, $P947[$P946]
    unless_null $P948, vivify_240
    new $P948, "Undef"
  vivify_240:
    store_lex "$signature", $P948
.annotate 'line', 910
    find_lex $P950, "$signature"
    if $P950, unless_949_end
    new $P951, "String"
    assign $P951, "vP"
    store_lex "$signature", $P951
  unless_949_end:
.annotate 'line', 908
    goto if_926_end
  if_926:
.annotate 'line', 906
    find_lex $P933, "$pirop"
    set $S934, $P933
    find_lex $P935, "$I0"
    add $P936, $P935, 2
    set $I937, $P936
    substr $S938, $S934, $I937
    new $P939, 'String'
    set $P939, $S938
    store_lex "$signature", $P939
.annotate 'line', 907
    find_lex $P940, "$pirop"
    set $S941, $P940
    find_lex $P942, "$I0"
    set $I943, $P942
    substr $S944, $S941, 0, $I943
    new $P945, 'String'
    set $P945, $S944
    store_lex "$pirop", $P945
  if_926_end:
.annotate 'line', 904
    goto if_906_end
  if_906:
.annotate 'line', 902
    find_lex $P913, "$pirop"
    set $S914, $P913
    find_lex $P915, "$I0"
    add $P916, $P915, 1
    set $I917, $P916
    substr $S918, $S914, $I917
    new $P919, 'String'
    set $P919, $S918
    store_lex "$signature", $P919
.annotate 'line', 903
    find_lex $P920, "$pirop"
    set $S921, $P920
    find_lex $P922, "$I0"
    set $I923, $P922
    substr $S924, $S921, 0, $I923
    new $P925, 'String'
    set $P925, $S924
    store_lex "$pirop", $P925
  if_906_end:
.annotate 'line', 900
    find_lex $P952, "$ops"
    find_lex $P953, "@posargs"
.annotate 'line', 916

		$P0 = find_lex '$node'
		$P1 = find_lex '$signature'
		($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
		store_lex '$ops', $P0
		store_lex '@posargs', $P1
	
.annotate 'line', 924
    find_lex $P954, "$ops"
    $P955 = $P954."list"()
    store_lex "@arglist", $P955
.annotate 'line', 926
    find_lex $P956, "$signature"
    set $S957, $P956
    substr $S958, $S957, 0, 1
    new $P959, 'String'
    set $P959, $S958
    store_lex "$S0", $P959
.annotate 'line', 927
    find_lex $P961, "$S0"
    set $S962, $P961
    iseq $I963, $S962, "v"
    unless $I963, if_960_end
.annotate 'line', 928
    find_lex $P964, "$ops"
    find_lex $P965, "$pirop"
    find_lex $P966, "@posargs"
    $P964."push_pirop"($P965, $P966 :flat)
.annotate 'line', 929
    new $P967, "Exception"
    set $P967['type'], .CONTROL_RETURN
    find_lex $P968, "$ops"
    setattribute $P967, 'payload', $P968
    throw $P967
  if_960_end:
.annotate 'line', 931
    find_lex $P969, "$S0"
    set $S970, $P969
    index $I971, "0123456789", $S970
    new $P972, 'Integer'
    set $P972, $I971
    store_lex "$I0", $P972
.annotate 'line', 932
    find_lex $P974, "$I0"
    set $N975, $P974
    isge $I976, $N975, 0.0
    unless $I976, if_973_end
.annotate 'line', 933
    find_lex $P977, "$ops"
    find_lex $P978, "$I0"
    set $I979, $P978
    find_lex $P980, "@arglist"
    unless_null $P980, vivify_241
    $P980 = root_new ['parrot';'ResizablePMCArray']
  vivify_241:
    set $P981, $P980[$I979]
    unless_null $P981, vivify_242
    new $P981, "Undef"
  vivify_242:
    $P977."result"($P981)
.annotate 'line', 934
    find_lex $P982, "$ops"
    find_lex $P983, "$pirop"
    find_lex $P984, "@posargs"
    $P982."push_pirop"($P983, $P984 :flat)
.annotate 'line', 935
    new $P985, "Exception"
    set $P985['type'], .CONTROL_RETURN
    find_lex $P986, "$ops"
    setattribute $P985, 'payload', $P986
    throw $P985
  if_973_end:
.annotate 'line', 937
    find_lex $P987, "self"
    find_lex $P988, "$S0"
    $P989 = $P987."uniquereg"($P988)
    store_lex "$result", $P989
.annotate 'line', 938
    find_lex $P990, "$ops"
    find_lex $P991, "$result"
    $P990."result"($P991)
.annotate 'line', 939
    find_lex $P992, "$ops"
    find_lex $P993, "$pirop"
    find_lex $P994, "$result"
    find_lex $P995, "@posargs"
    $P992."push_pirop"($P993, $P994, $P995 :flat)
.annotate 'line', 940
    new $P996, "Exception"
    set $P996['type'], .CONTROL_RETURN
    find_lex $P997, "$ops"
    setattribute $P996, 'payload', $P997
    throw $P996
.annotate 'line', 896
    .return ()
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P998, exception, "payload"
    .return ($P998)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("44_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1002
    .param pmc param_1003 :slurpy :named
.annotate 'line', 948
    .const 'Sub' $P1045 = "45_1308013488.88323" 
    capture_lex $P1045
    new $P1001, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1001, control_1000
    push_eh $P1001
    .lex "self", self
    .lex "$node", param_1002
    .lex "%options", param_1003
.annotate 'line', 949
    new $P1004, "Undef"
    .lex "$pasttype", $P1004
.annotate 'line', 952
    new $P1005, "Undef"
    .lex "$signature", $P1005
.annotate 'line', 956
    new $P1006, "Undef"
    .lex "$name", $P1006
.annotate 'line', 957
    new $P1007, "Undef"
    .lex "$ops", $P1007
.annotate 'line', 958
    $P1008 = root_new ['parrot';'ResizablePMCArray']
    .lex "@posargs", $P1008
.annotate 'line', 959
    $P1009 = root_new ['parrot';'Hash']
    .lex "%namedargs", $P1009
.annotate 'line', 983
    new $P1010, "Undef"
    .lex "$rtype", $P1010
.annotate 'line', 984
    new $P1011, "Undef"
    .lex "$result", $P1011
.annotate 'line', 949
    find_lex $P1012, "$node"
    $P1013 = $P1012."pasttype"()
    store_lex "$pasttype", $P1013
.annotate 'line', 950
    find_lex $P1015, "$pasttype"
    if $P1015, unless_1014_end
    new $P1016, "String"
    assign $P1016, "call"
    store_lex "$pasttype", $P1016
  unless_1014_end:
.annotate 'line', 952
    new $P1017, "String"
    assign $P1017, "v:"
    store_lex "$signature", $P1017
.annotate 'line', 954
    find_lex $P1019, "$pasttype"
    set $S1020, $P1019
    iseq $I1021, $S1020, "callmethod"
    unless $I1021, if_1018_end
    new $P1022, "String"
    assign $P1022, "vP:"
    store_lex "$signature", $P1022
  if_1018_end:
.annotate 'line', 956
    find_lex $P1023, "$node"
    $P1024 = $P1023."name"()
    store_lex "$name", $P1024
    find_lex $P1025, "$ops"
    find_lex $P1026, "@posargs"
    find_lex $P1027, "%namedargs"
.annotate 'line', 961
    find_lex $P1029, "$name"
    if $P1029, unless_1028_end
    find_lex $P1030, "$signature"
    set $S1031, $P1030
    replace $S1032, $S1031, 1, 0, "P"
    new $P1033, 'String'
    set $P1033, $S1032
    store_lex "$signature", $P1033
  unless_1028_end:
.annotate 'line', 963

		$P0 = find_lex '$node'
		$P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
	
.annotate 'line', 971
    find_lex $P1035, "$name"
    unless $P1035, if_1034_end
.annotate 'line', 972
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
.annotate 'line', 978
    find_lex $P1057, "@posargs"
    find_lex $P1058, "self"
    find_lex $P1059, "$name"
    $P1060 = $P1058."escape"($P1059)
    unshift $P1057, $P1060
.annotate 'line', 977
    goto if_1036_end
  if_1036:
.annotate 'line', 972
    .const 'Sub' $P1045 = "45_1308013488.88323" 
    capture_lex $P1045
    $P1045()
  if_1036_end:
  if_1034_end:
.annotate 'line', 983
    find_lex $P1061, "%options"
    unless_null $P1061, vivify_243
    $P1061 = root_new ['parrot';'Hash']
  vivify_243:
    set $P1062, $P1061["rtype"]
    unless_null $P1062, vivify_244
    new $P1062, "Undef"
  vivify_244:
    store_lex "$rtype", $P1062
.annotate 'line', 984
    find_lex $P1063, "self"
    find_lex $P1064, "$rtype"
    $P1065 = $P1063."uniquereg"($P1064)
    store_lex "$result", $P1065
.annotate 'line', 985
    find_lex $P1066, "$ops"
    find_lex $P1067, "$pasttype"
    find_lex $P1068, "@posargs"
    find_lex $P1069, "%namedargs"
    find_lex $P1070, "$result"
    $P1066."push_pirop"($P1067, $P1068 :flat, $P1069 :flat, $P1070 :named("result"))
.annotate 'line', 986
    find_lex $P1071, "$ops"
    find_lex $P1072, "$result"
    $P1071."result"($P1072)
    find_lex $P1073, "$ops"
.annotate 'line', 948
    .return ($P1073)
  control_1000:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1044"  :anon :subid("45_1308013488.88323") :outer("44_1308013488.88323")
.annotate 'line', 973
    new $P1046, "Undef"
    .lex "$name_post", $P1046
    find_lex $P1047, "self"
    find_lex $P1048, "$name"
    $P1049 = $P1047."as_post"($P1048, "s" :named("rtype"))
    store_lex "$name_post", $P1049
.annotate 'line', 974
    find_lex $P1050, "self"
    find_lex $P1051, "$name_post"
    $P1052 = $P1050."coerce"($P1051, "s")
    store_lex "$name_post", $P1052
.annotate 'line', 975
    find_lex $P1053, "$ops"
    find_lex $P1054, "$name_post"
    $P1053."push"($P1054)
.annotate 'line', 976
    find_lex $P1055, "@posargs"
    find_lex $P1056, "$name_post"
    unshift $P1055, $P1056
.annotate 'line', 972
    .return ($P1055)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("46_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1078
    .param pmc param_1079 :slurpy :named
.annotate 'line', 995
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    .lex "$node", param_1078
    .lex "%options", param_1079
.annotate 'line', 996
    find_lex $P1080, "self"
    find_lex $P1081, "$node"
    find_lex $P1082, "%options"
    $P1083 = $P1080."call"($P1081, $P1082 :flat)
.annotate 'line', 995
    .return ($P1083)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1084, exception, "payload"
    .return ($P1084)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("47_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1088
    .param pmc param_1089 :slurpy :named
.annotate 'line', 1005
    .const 'Sub' $P1227 = "50_1308013488.88323" 
    capture_lex $P1227
    .const 'Sub' $P1105 = "48_1308013488.88323" 
    capture_lex $P1105
    new $P1087, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1087, control_1086
    push_eh $P1087
    .lex "self", self
    .lex "$node", param_1088
    .lex "%options", param_1089
.annotate 'line', 1006
    new $P1090, "Undef"
    .lex "$ops", $P1090
.annotate 'line', 1008
    new $P1091, "Undef"
    .lex "$rtype", $P1091
.annotate 'line', 1009
    new $P1092, "Undef"
    .lex "$result", $P1092
.annotate 'line', 1012
    new $P1093, "Undef"
    .lex "$pasttype", $P1093
.annotate 'line', 1014
    new $P1094, "Undef"
    .lex "$exprpast", $P1094
.annotate 'line', 1015
    new $P1095, "Undef"
    .lex "$thenpast", $P1095
.annotate 'line', 1016
    new $P1096, "Undef"
    .lex "$elsepast", $P1096
.annotate 'line', 1018
    new $P1097, "Undef"
    .lex "$S0", $P1097
.annotate 'line', 1019
    new $P1098, "Undef"
    .lex "$thenlabel", $P1098
.annotate 'line', 1020
    new $P1099, "Undef"
    .lex "$endlabel", $P1099
.annotate 'line', 1022
    new $P1100, "Undef"
    .lex "$exprrtype", $P1100
.annotate 'line', 1024
    new $P1101, "Undef"
    .lex "$childrtype", $P1101
.annotate 'line', 1027
    new $P1102, "Undef"
    .lex "$exprpost", $P1102
.annotate 'line', 1029
    new $P1103, "Undef"
    .lex "$thenpost", $P1103
.annotate 'line', 1030
    new $P1104, "Undef"
    .lex "$elsepost", $P1104
.annotate 'line', 1051
    .const 'Sub' $P1105 = "48_1308013488.88323" 
    newclosure $P1147, $P1105
    .lex "make_childpost", $P1147
.annotate 'line', 1006
    get_hll_global $P1148, ["POST"], "Ops"
    find_lex $P1149, "$node"
    $P1150 = $P1148."new"($P1149 :named("node"))
    store_lex "$ops", $P1150
.annotate 'line', 1008
    find_lex $P1151, "%options"
    unless_null $P1151, vivify_246
    $P1151 = root_new ['parrot';'Hash']
  vivify_246:
    set $P1152, $P1151["rtype"]
    unless_null $P1152, vivify_247
    new $P1152, "Undef"
  vivify_247:
    store_lex "$rtype", $P1152
.annotate 'line', 1009
    find_lex $P1153, "self"
    find_lex $P1154, "$rtype"
    $P1155 = $P1153."uniquereg"($P1154)
    store_lex "$result", $P1155
.annotate 'line', 1010
    find_lex $P1156, "$ops"
    find_lex $P1157, "$result"
    $P1156."result"($P1157)
.annotate 'line', 1012
    find_lex $P1158, "$node"
    $P1159 = $P1158."pasttype"()
    store_lex "$pasttype", $P1159
.annotate 'line', 1014
    find_lex $P1160, "$node"
    unless_null $P1160, vivify_248
    $P1160 = root_new ['parrot';'ResizablePMCArray']
  vivify_248:
    set $P1161, $P1160[0]
    unless_null $P1161, vivify_249
    new $P1161, "Undef"
  vivify_249:
    store_lex "$exprpast", $P1161
.annotate 'line', 1015
    find_lex $P1162, "$node"
    unless_null $P1162, vivify_250
    $P1162 = root_new ['parrot';'ResizablePMCArray']
  vivify_250:
    set $P1163, $P1162[1]
    unless_null $P1163, vivify_251
    new $P1163, "Undef"
  vivify_251:
    store_lex "$thenpast", $P1163
.annotate 'line', 1016
    find_lex $P1164, "$node"
    unless_null $P1164, vivify_252
    $P1164 = root_new ['parrot';'ResizablePMCArray']
  vivify_252:
    set $P1165, $P1164[2]
    unless_null $P1165, vivify_253
    new $P1165, "Undef"
  vivify_253:
    store_lex "$elsepast", $P1165
.annotate 'line', 1018
    find_lex $P1166, "self"
    find_lex $P1167, "$pasttype"
    concat $P1168, $P1167, "_"
    $P1169 = $P1166."unique"($P1168)
    store_lex "$S0", $P1169
.annotate 'line', 1019
    get_hll_global $P1170, ["POST"], "Label"
    find_lex $P1171, "$S0"
    $P1172 = $P1170."new"($P1171 :named("result"))
    store_lex "$thenlabel", $P1172
.annotate 'line', 1020
    get_hll_global $P1173, ["POST"], "Label"
    find_lex $P1174, "$S0"
    concat $P1175, $P1174, "_end"
    $P1176 = $P1173."new"($P1175 :named("result"))
    store_lex "$endlabel", $P1176
.annotate 'line', 1022
    new $P1177, "String"
    assign $P1177, "r"
    store_lex "$exprrtype", $P1177
.annotate 'line', 1023
    find_lex $P1179, "$rtype"
    set $S1180, $P1179
    iseq $I1181, $S1180, "v"
    unless $I1181, if_1178_end
    new $P1182, "String"
    assign $P1182, "*"
    store_lex "$exprrtype", $P1182
  if_1178_end:
.annotate 'line', 1024
    find_lex $P1183, "$rtype"
    store_lex "$childrtype", $P1183
.annotate 'line', 1025
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
.annotate 'line', 1027
    find_lex $P1191, "self"
    find_lex $P1192, "$exprpast"
    find_lex $P1193, "$exprrtype"
    $P1194 = $P1191."as_post"($P1192, $P1193 :named("rtype"))
    store_lex "$exprpost", $P1194
.annotate 'line', 1029
    find_lex $P1195, "$thenpast"
    $P1196 = "make_childpost"($P1195)
    store_lex "$thenpost", $P1196
.annotate 'line', 1030
    find_lex $P1197, "$elsepast"
    $P1198 = "make_childpost"($P1197)
    store_lex "$elsepost", $P1198
.annotate 'line', 1032
    find_lex $P1200, "$elsepost"
    defined $I1201, $P1200
    if $I1201, if_1199
.annotate 'line', 1041
    .const 'Sub' $P1227 = "50_1308013488.88323" 
    capture_lex $P1227
    $P1227()
    goto if_1199_end
  if_1199:
.annotate 'line', 1033
    find_lex $P1202, "$ops"
    find_lex $P1203, "$exprpost"
    $P1202."push"($P1203)
.annotate 'line', 1034
    find_lex $P1204, "$ops"
    find_lex $P1205, "$pasttype"
    find_lex $P1206, "$exprpost"
    find_lex $P1207, "$thenlabel"
    $P1204."push_pirop"($P1205, $P1206, $P1207)
.annotate 'line', 1035
    find_lex $P1209, "$elsepost"
    defined $I1210, $P1209
    unless $I1210, if_1208_end
    find_lex $P1211, "$ops"
    find_lex $P1212, "$elsepost"
    $P1211."push"($P1212)
  if_1208_end:
.annotate 'line', 1036
    find_lex $P1213, "$ops"
    find_lex $P1214, "$endlabel"
    $P1213."push_pirop"("goto", $P1214)
.annotate 'line', 1037
    find_lex $P1215, "$ops"
    find_lex $P1216, "$thenlabel"
    $P1215."push"($P1216)
.annotate 'line', 1038
    find_lex $P1218, "$thenpost"
    defined $I1219, $P1218
    unless $I1219, if_1217_end
    find_lex $P1220, "$ops"
    find_lex $P1221, "$thenpost"
    $P1220."push"($P1221)
  if_1217_end:
.annotate 'line', 1039
    find_lex $P1222, "$ops"
    find_lex $P1223, "$endlabel"
    $P1222."push"($P1223)
.annotate 'line', 1040
    new $P1224, "Exception"
    set $P1224['type'], .CONTROL_RETURN
    find_lex $P1225, "$ops"
    setattribute $P1224, 'payload', $P1225
    throw $P1224
  if_1199_end:
.annotate 'line', 1032
    find_lex $P1252, "make_childpost"
.annotate 'line', 1005
    .return ($P1252)
  control_1086:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1253, exception, "payload"
    .return ($P1253)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("48_1308013488.88323") :outer("47_1308013488.88323")
    .param pmc param_1108 :optional
    .param int has_param_1108 :opt_flag
.annotate 'line', 1051
    .const 'Sub' $P1116 = "49_1308013488.88323" 
    capture_lex $P1116
    new $P1107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1107, control_1106
    push_eh $P1107
    if has_param_1108, optparam_245
    new $P1109, "Undef"
    set param_1108, $P1109
  optparam_245:
    .lex "$childpast", param_1108
.annotate 'line', 1052
    new $P1110, "Undef"
    .lex "$childpost", $P1110
.annotate 'line', 1051
    find_lex $P1111, "$childpost"
.annotate 'line', 1053
    find_lex $P1113, "$childpast"
    defined $I1114, $P1113
    if $I1114, if_1112
.annotate 'line', 1059
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
.annotate 'line', 1060
    get_hll_global $P1136, ["POST"], "Ops"
    find_lex $P1137, "$exprpost"
    $P1138 = $P1136."new"($P1137 :named("result"))
    store_lex "$childpost", $P1138
.annotate 'line', 1058
    goto if_1112_end
  if_1112:
.annotate 'line', 1053
    .const 'Sub' $P1116 = "49_1308013488.88323" 
    capture_lex $P1116
    $P1116()
  if_1112_end:
.annotate 'line', 1062
    find_lex $P1140, "$result"
    unless $P1140, if_1139_end
    find_lex $P1141, "self"
    find_lex $P1142, "$childpost"
    find_lex $P1143, "$result"
    $P1144 = $P1141."coerce"($P1142, $P1143)
    store_lex "$childpost", $P1144
  if_1139_end:
    find_lex $P1145, "$childpost"
.annotate 'line', 1051
    .return ($P1145)
  control_1106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1146, exception, "payload"
    .return ($P1146)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1115"  :anon :subid("49_1308013488.88323") :outer("48_1308013488.88323")
.annotate 'line', 1054
    $P1117 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1117
    new $P1118, "ResizablePMCArray"
    store_lex "@arglist", $P1118
.annotate 'line', 1055
    find_lex $P1120, "$childpast"
    $N1121 = $P1120."arity"()
    isgt $I1122, $N1121, 0.0
    unless $I1122, if_1119_end
    find_lex $P1123, "@arglist"
    find_lex $P1124, "$exprpost"
    push $P1123, $P1124
  if_1119_end:
.annotate 'line', 1056
    find_lex $P1125, "self"
    find_lex $P1126, "$childpast"
    find_lex $P1127, "$childrtype"
    find_lex $P1128, "@arglist"
    $P1129 = $P1125."as_post"($P1126, $P1127 :named("rtype"), $P1128 :named("arglist"))
    store_lex "$childpost", $P1129
.annotate 'line', 1053
    .return ($P1129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1226"  :anon :subid("50_1308013488.88323") :outer("47_1308013488.88323")
.annotate 'line', 1042
    new $P1228, "Undef"
    .lex "$S0", $P1228
    new $P1229, "String"
    assign $P1229, "if"
    store_lex "$S0", $P1229
.annotate 'line', 1043
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
.annotate 'line', 1044
    find_lex $P1237, "$ops"
    find_lex $P1238, "$exprpost"
    $P1237."push"($P1238)
.annotate 'line', 1045
    find_lex $P1239, "$ops"
    find_lex $P1240, "$S0"
    find_lex $P1241, "$exprpost"
    find_lex $P1242, "$endlabel"
    $P1239."push_pirop"($P1240, $P1241, $P1242)
.annotate 'line', 1046
    find_lex $P1244, "$thenpost"
    defined $I1245, $P1244
    unless $I1245, if_1243_end
    find_lex $P1246, "$ops"
    find_lex $P1247, "$thenpost"
    $P1246."push"($P1247)
  if_1243_end:
.annotate 'line', 1047
    find_lex $P1248, "$ops"
    find_lex $P1249, "$endlabel"
    $P1248."push"($P1249)
.annotate 'line', 1048
    new $P1250, "Exception"
    set $P1250['type'], .CONTROL_RETURN
    find_lex $P1251, "$ops"
    setattribute $P1250, 'payload', $P1251
    throw $P1250
.annotate 'line', 1041
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("51_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1257
    .param pmc param_1258 :slurpy :named
.annotate 'line', 1067
    new $P1256, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1256, control_1255
    push_eh $P1256
    .lex "self", self
    .lex "$node", param_1257
    .lex "%options", param_1258
.annotate 'line', 1068
    find_lex $P1259, "self"
    find_lex $P1260, "$node"
    find_lex $P1261, "%options"
    $P1262 = $P1259."if"($P1260, $P1261 :flat)
.annotate 'line', 1067
    .return ($P1262)
  control_1255:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1263, exception, "payload"
    .return ($P1263)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("52_1308013488.88323") :method :outer("11_1308013488.88323")
    .param pmc param_1267 :slurpy :named
.annotate 'line', 1075
    new $P1266, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1266, control_1265
    push_eh $P1266
    .lex "self", self
    .lex "%options", param_1267
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
  control_1265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1268, exception, "payload"
    .return ($P1268)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("53_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1272
    .param pmc param_1273 :slurpy :named
.annotate 'line', 1163
    new $P1271, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1271, control_1270
    push_eh $P1271
    .lex "self", self
    .lex "$node", param_1272
    .lex "%options", param_1273
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
  control_1270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1274, exception, "payload"
    .return ($P1274)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("54_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1278
    .param pmc param_1279 :slurpy :named
.annotate 'line', 1203
    new $P1277, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1277, control_1276
    push_eh $P1277
    .lex "self", self
    .lex "$node", param_1278
    .lex "%options", param_1279
.annotate 'line', 1204
    find_lex $P1280, "self"
    find_lex $P1281, "$node"
    find_lex $P1282, "%options"
    $P1283 = $P1280."while"($P1281, $P1282 :flat, "if" :named("testop"))
.annotate 'line', 1203
    .return ($P1283)
  control_1276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1284, exception, "payload"
    .return ($P1284)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("55_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1288
    .param pmc param_1289 :slurpy :named
.annotate 'line', 1207
    new $P1287, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1287, control_1286
    push_eh $P1287
    .lex "self", self
    .lex "$node", param_1288
    .lex "%options", param_1289
.annotate 'line', 1208
    find_lex $P1290, "self"
    find_lex $P1291, "$node"
    find_lex $P1292, "%options"
    $P1293 = $P1290."while"($P1291, $P1292 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1207
    .return ($P1293)
  control_1286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1294, exception, "payload"
    .return ($P1294)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("56_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1298
    .param pmc param_1299 :slurpy :named
.annotate 'line', 1211
    new $P1297, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1297, control_1296
    push_eh $P1297
    .lex "self", self
    .lex "$node", param_1298
    .lex "%options", param_1299
.annotate 'line', 1212
    find_lex $P1300, "self"
    find_lex $P1301, "$node"
    find_lex $P1302, "%options"
    $P1303 = $P1300."while"($P1301, $P1302 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1211
    .return ($P1303)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1304, exception, "payload"
    .return ($P1304)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("57_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1308
    .param pmc param_1309 :slurpy :named
.annotate 'line', 1220
    new $P1307, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1307, control_1306
    push_eh $P1307
    .lex "self", self
    .lex "$node", param_1308
    .lex "%options", param_1309
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
  control_1306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1310, exception, "payload"
    .return ($P1310)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("58_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1314
    .param pmc param_1315 :slurpy :named
.annotate 'line', 1300
    new $P1313, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1313, control_1312
    push_eh $P1313
    .lex "self", self
    .lex "$node", param_1314
    .lex "%options", param_1315
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
  control_1312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1316, exception, "payload"
    .return ($P1316)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("59_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1320
    .param pmc param_1321 :slurpy :named
.annotate 'line', 1336
    new $P1319, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1319, control_1318
    push_eh $P1319
    .lex "self", self
    .lex "$node", param_1320
    .lex "%options", param_1321
.annotate 'line', 1337
    find_lex $P1322, "self"
    find_lex $P1323, "$node"
    find_lex $P1324, "%options"
    $P1325 = $P1322."node_as_post"($P1323, $P1324)
.annotate 'line', 1336
    .return ($P1325)
  control_1318:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1326, exception, "payload"
    .return ($P1326)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("60_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1330
    .param pmc param_1331 :slurpy :named
.annotate 'line', 1347
    new $P1329, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1329, control_1328
    push_eh $P1329
    .lex "self", self
    .lex "$node", param_1330
    .lex "%options", param_1331
.annotate 'line', 1348
    get_hll_global $P1332, ["POST"], "Ops"
    find_lex $P1333, "$node"
    $P1334 = $P1332."new"($P1333 :named("node"))
.annotate 'line', 1347
    .return ($P1334)
  control_1328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1335, exception, "payload"
    .return ($P1335)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("61_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1339
    .param pmc param_1340 :slurpy :named
.annotate 'line', 1356
    new $P1338, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1338, control_1337
    push_eh $P1338
    .lex "self", self
    .lex "$node", param_1339
    .lex "%options", param_1340
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
  control_1337:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1341, exception, "payload"
    .return ($P1341)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("62_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1345
    .param pmc param_1346 :slurpy :named
.annotate 'line', 1396
    new $P1344, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1344, control_1343
    push_eh $P1344
    .lex "self", self
    .lex "$node", param_1345
    .lex "%options", param_1346
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
  control_1343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1347, exception, "payload"
    .return ($P1347)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("63_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1351
    .param pmc param_1352 :slurpy :named
.annotate 'line', 1453
    new $P1350, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1350, control_1349
    push_eh $P1350
    .lex "self", self
    .lex "$node", param_1351
    .lex "%options", param_1352
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
  control_1349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1353, exception, "payload"
    .return ($P1353)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("64_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1357
    .param pmc param_1358 :slurpy :named
.annotate 'line', 1516
    new $P1356, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1356, control_1355
    push_eh $P1356
    .lex "self", self
    .lex "$node", param_1357
    .lex "%options", param_1358
.annotate 'line', 1517
    new $P1359, "Undef"
    .lex "$ops", $P1359
.annotate 'line', 1519
    new $P1360, "Undef"
    .lex "$lpost", $P1360
.annotate 'line', 1523
    new $P1361, "Undef"
    .lex "$endlabel", $P1361
.annotate 'line', 1525
    new $P1362, "Undef"
    .lex "$reg", $P1362
.annotate 'line', 1528
    new $P1363, "Undef"
    .lex "$rpost", $P1363
.annotate 'line', 1517
    get_hll_global $P1364, ["POST"], "Ops"
    find_lex $P1365, "$node"
    find_lex $P1366, "self"
    $P1367 = $P1366."unique"("$P")
    $P1368 = $P1364."new"($P1365 :named("node"), $P1367 :named("result"))
    store_lex "$ops", $P1368
.annotate 'line', 1519
    find_lex $P1369, "self"
    find_lex $P1370, "$node"
    unless_null $P1370, vivify_254
    $P1370 = root_new ['parrot';'ResizablePMCArray']
  vivify_254:
    set $P1371, $P1370[0]
    unless_null $P1371, vivify_255
    new $P1371, "Undef"
  vivify_255:
    $P1372 = $P1369."as_post"($P1371, "P" :named("rtype"))
    store_lex "$lpost", $P1372
.annotate 'line', 1520
    find_lex $P1373, "$ops"
    find_lex $P1374, "$lpost"
    $P1373."push"($P1374)
.annotate 'line', 1521
    find_lex $P1375, "$ops"
    find_lex $P1376, "$ops"
    find_lex $P1377, "$lpost"
    $P1375."push_pirop"("set", $P1376, $P1377)
.annotate 'line', 1523
    get_hll_global $P1378, ["POST"], "Label"
    find_lex $P1379, "self"
    $P1380 = $P1379."unique"("default_")
    $P1381 = $P1378."new"($P1380 :named("result"))
    store_lex "$endlabel", $P1381
.annotate 'line', 1525
    find_lex $P1382, "self"
    $P1383 = $P1382."unique"("$I")
    store_lex "$reg", $P1383
.annotate 'line', 1526
    find_lex $P1384, "$ops"
    find_lex $P1385, "$reg"
    find_lex $P1386, "$ops"
    $P1384."push_pirop"("defined", $P1385, $P1386)
.annotate 'line', 1527
    find_lex $P1387, "$ops"
    find_lex $P1388, "$reg"
    find_lex $P1389, "$endlabel"
    $P1387."push_pirop"("if", $P1388, $P1389)
.annotate 'line', 1528
    find_lex $P1390, "self"
    find_lex $P1391, "$node"
    unless_null $P1391, vivify_256
    $P1391 = root_new ['parrot';'ResizablePMCArray']
  vivify_256:
    set $P1392, $P1391[1]
    unless_null $P1392, vivify_257
    new $P1392, "Undef"
  vivify_257:
    $P1393 = $P1390."as_post"($P1392, "P" :named("rtype"))
    store_lex "$rpost", $P1393
.annotate 'line', 1529
    find_lex $P1394, "$ops"
    find_lex $P1395, "$rpost"
    $P1394."push"($P1395)
.annotate 'line', 1530
    find_lex $P1396, "$ops"
    find_lex $P1397, "$ops"
    find_lex $P1398, "$rpost"
    $P1396."push_pirop"("set", $P1397, $P1398)
.annotate 'line', 1531
    find_lex $P1399, "$ops"
    find_lex $P1400, "$endlabel"
    $P1399."push"($P1400)
    find_lex $P1401, "$ops"
.annotate 'line', 1516
    .return ($P1401)
  control_1355:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1402, exception, "payload"
    .return ($P1402)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("65_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1406
    .param pmc param_1407 :slurpy :named
.annotate 'line', 1542
    new $P1405, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1405, control_1404
    push_eh $P1405
    .lex "self", self
    .lex "$node", param_1406
    .lex "%options", param_1407
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
  control_1404:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1408, exception, "payload"
    .return ($P1408)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("66_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1412
    .param pmc param_1413 :slurpy :named
.annotate 'line', 1602
    new $P1411, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1411, control_1410
    push_eh $P1411
    .lex "self", self
    .lex "$node", param_1412
    .lex "%options", param_1413
.annotate 'line', 1603
    new $P1414, "Undef"
    .lex "$lpast", $P1414
.annotate 'line', 1604
    new $P1415, "Undef"
    .lex "$rpast", $P1415
.annotate 'line', 1606
    new $P1416, "Undef"
    .lex "$ops", $P1416
.annotate 'line', 1607
    new $P1417, "Undef"
    .lex "$rpost", $P1417
.annotate 'line', 1612
    new $P1418, "Undef"
    .lex "$lpost", $P1418
.annotate 'line', 1603
    find_lex $P1419, "$node"
    unless_null $P1419, vivify_258
    $P1419 = root_new ['parrot';'ResizablePMCArray']
  vivify_258:
    set $P1420, $P1419[0]
    unless_null $P1420, vivify_259
    new $P1420, "Undef"
  vivify_259:
    store_lex "$lpast", $P1420
.annotate 'line', 1604
    find_lex $P1421, "$node"
    unless_null $P1421, vivify_260
    $P1421 = root_new ['parrot';'ResizablePMCArray']
  vivify_260:
    set $P1422, $P1421[1]
    unless_null $P1422, vivify_261
    new $P1422, "Undef"
  vivify_261:
    store_lex "$rpast", $P1422
.annotate 'line', 1606
    get_hll_global $P1423, ["POST"], "Ops"
    find_lex $P1424, "$node"
    $P1425 = $P1423."new"($P1424 :named("node"))
    store_lex "$ops", $P1425
.annotate 'line', 1607
    find_lex $P1426, "self"
    find_lex $P1427, "$rpast"
    $P1428 = $P1426."as_post"($P1427, "P" :named("rtype"))
    store_lex "$rpost", $P1428
.annotate 'line', 1608
    find_lex $P1429, "self"
    find_lex $P1430, "$rpost"
    $P1431 = $P1429."coerce"($P1430, "P")
    store_lex "$rpost", $P1431
.annotate 'line', 1609
    find_lex $P1432, "$ops"
    find_lex $P1433, "$rpost"
    $P1432."push"($P1433)
.annotate 'line', 1611
    find_lex $P1434, "$lpast"
    $P1434."lvalue"(1)
.annotate 'line', 1612
    find_lex $P1435, "self"
    find_lex $P1436, "$lpast"
    find_lex $P1437, "$rpost"
    $P1438 = $P1435."as_post"($P1436, $P1437 :named("bindpost"))
    store_lex "$lpost", $P1438
.annotate 'line', 1613
    find_lex $P1439, "$ops"
    find_lex $P1440, "$lpost"
    $P1439."push"($P1440)
.annotate 'line', 1614
    find_lex $P1441, "$ops"
    find_lex $P1442, "$lpost"
    $P1441."result"($P1442)
    find_lex $P1443, "$ops"
.annotate 'line', 1602
    .return ($P1443)
  control_1410:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1444, exception, "payload"
    .return ($P1444)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("67_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1448
    .param pmc param_1449 :slurpy :named
.annotate 'line', 1622
    new $P1447, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1447, control_1446
    push_eh $P1447
    .lex "self", self
    .lex "$node", param_1448
    .lex "%options", param_1449
.annotate 'line', 1623
    new $P1450, "Undef"
    .lex "$rpost", $P1450
.annotate 'line', 1624
    new $P1451, "Undef"
    .lex "$lpost", $P1451
.annotate 'line', 1625
    new $P1452, "Undef"
    .lex "$ops", $P1452
.annotate 'line', 1623
    find_lex $P1453, "self"
    find_lex $P1454, "$node"
    unless_null $P1454, vivify_262
    $P1454 = root_new ['parrot';'ResizablePMCArray']
  vivify_262:
    set $P1455, $P1454[1]
    unless_null $P1455, vivify_263
    new $P1455, "Undef"
  vivify_263:
    $P1456 = $P1453."as_post"($P1455, "P" :named("rtype"))
    store_lex "$rpost", $P1456
.annotate 'line', 1624
    find_lex $P1457, "self"
    find_lex $P1458, "$node"
    unless_null $P1458, vivify_264
    $P1458 = root_new ['parrot';'ResizablePMCArray']
  vivify_264:
    set $P1459, $P1458[0]
    unless_null $P1459, vivify_265
    new $P1459, "Undef"
  vivify_265:
    $P1460 = $P1457."as_post"($P1459, "P" :named("rtype"))
    store_lex "$lpost", $P1460
.annotate 'line', 1625
    get_hll_global $P1461, ["POST"], "Ops"
    find_lex $P1462, "$rpost"
    find_lex $P1463, "$lpost"
    find_lex $P1464, "$node"
    find_lex $P1465, "$lpost"
    $P1466 = $P1461."new"($P1462, $P1463, $P1464 :named("node"), $P1465 :named("result"))
    store_lex "$ops", $P1466
.annotate 'line', 1627
    find_lex $P1467, "$ops"
    find_lex $P1468, "$lpost"
    find_lex $P1469, "$rpost"
    $P1467."push_pirop"("copy", $P1468, $P1469)
    find_lex $P1470, "$ops"
.annotate 'line', 1622
    .return ($P1470)
  control_1446:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1471, exception, "payload"
    .return ($P1471)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("68_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Op"])
    .param pmc param_1475
    .param pmc param_1476 :slurpy :named
.annotate 'line', 1636
    new $P1474, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1474, control_1473
    push_eh $P1474
    .lex "self", self
    .lex "$node", param_1475
    .lex "%options", param_1476
.annotate 'line', 1641
    new $P1477, "Undef"
    .lex "$ops", $P1477
.annotate 'line', 1642
    new $P1478, "Undef"
    .lex "$inline", $P1478
.annotate 'line', 1645
    new $P1479, "Undef"
    .lex "$result", $P1479
.annotate 'line', 1646
    new $P1480, "Undef"
    .lex "$i", $P1480
.annotate 'line', 1659
    $P1481 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P1481
.annotate 'line', 1661
    new $P1482, "Undef"
    .lex "$s", $P1482
.annotate 'line', 1641
    find_lex $P1483, "self"
    find_lex $P1484, "$node"
    $P1485 = $P1483."post_children"($P1484, "vP" :named("signature"))
    store_lex "$ops", $P1485
.annotate 'line', 1642
    find_lex $P1486, "$node"
    $P1487 = $P1486."inline"()
    store_lex "$inline", $P1487
.annotate 'line', 1643
    find_lex $P1489, "$inline"
    does $I1490, $P1489, "array"
    unless $I1490, if_1488_end
    find_lex $P1491, "$inline"
    join $S1492, "\n", $P1491
    new $P1493, 'String'
    set $P1493, $S1492
    store_lex "$inline", $P1493
  if_1488_end:
.annotate 'line', 1645
    new $P1494, "String"
    assign $P1494, ""
    store_lex "$result", $P1494
.annotate 'line', 1646
    find_lex $P1495, "$inline"
    set $S1496, $P1495
    index $I1497, $S1496, "%t"
    new $P1498, 'Integer'
    set $P1498, $I1497
    store_lex "$i", $P1498
.annotate 'line', 1647
    find_lex $P1500, "$i"
    set $N1501, $P1500
    isge $I1502, $N1501, 0.0
    if $I1502, if_1499
.annotate 'line', 1653
    find_lex $P1509, "$inline"
    set $S1510, $P1509
    index $I1511, $S1510, "%r"
    new $P1512, 'Integer'
    set $P1512, $I1511
    store_lex "$i", $P1512
.annotate 'line', 1654
    find_lex $P1514, "$i"
    set $N1515, $P1514
    isge $I1516, $N1515, 0.0
    unless $I1516, if_1513_end
.annotate 'line', 1655
    find_lex $P1517, "self"
    $P1518 = $P1517."unique"("$P")
    store_lex "$result", $P1518
.annotate 'line', 1656
    find_lex $P1519, "$ops"
    find_lex $P1520, "$result"
    $P1519."result"($P1520)
  if_1513_end:
.annotate 'line', 1652
    goto if_1499_end
  if_1499:
.annotate 'line', 1648
    find_lex $P1503, "self"
    $P1504 = $P1503."unique"("$P")
    store_lex "$result", $P1504
.annotate 'line', 1649
    find_lex $P1505, "$ops"
    find_lex $P1506, "$result"
    $P1505."push_pirop"("new", $P1506, "'Undef'")
.annotate 'line', 1650
    find_lex $P1507, "$ops"
    find_lex $P1508, "$result"
    $P1507."result"($P1508)
  if_1499_end:
.annotate 'line', 1659
    find_lex $P1521, "$ops"
    $P1522 = $P1521."list"()
    store_lex "@arglist", $P1522
.annotate 'line', 1660
    find_lex $P1523, "$ops"
    find_lex $P1524, "@arglist"
    find_lex $P1525, "$inline"
    find_lex $P1526, "$result"
    $P1523."push_pirop"("inline", $P1524 :flat, $P1525 :named("inline"), $P1526 :named("result"))
.annotate 'line', 1661
    find_lex $P1527, "%options"
    unless_null $P1527, vivify_266
    $P1527 = root_new ['parrot';'Hash']
  vivify_266:
    set $P1528, $P1527["rtype"]
    unless_null $P1528, vivify_267
    new $P1528, "Undef"
  vivify_267:
    store_lex "$s", $P1528
    find_lex $P1529, "$ops"
.annotate 'line', 1636
    .return ($P1529)
  control_1473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1530, exception, "payload"
    .return ($P1530)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("69_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"])
    .param pmc param_1534
    .param pmc param_1535 :slurpy :named
.annotate 'line', 1673
    new $P1533, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1533, control_1532
    push_eh $P1533
    .lex "self", self
    .lex "$node", param_1534
    .lex "%options", param_1535
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
  control_1532:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1536, exception, "payload"
    .return ($P1536)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("70_1308013488.88323") :method :outer("11_1308013488.88323")
    .param pmc param_1540
    .param pmc param_1541
    .param pmc param_1542
    .param pmc param_1543
.annotate 'line', 1755
    .const 'Sub' $P1567 = "71_1308013488.88323" 
    capture_lex $P1567
    new $P1539, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1539, control_1538
    push_eh $P1539
    .lex "self", self
    .lex "$node", param_1540
    .lex "$ops", param_1541
    .lex "$fetchop", param_1542
    .lex "$storeop", param_1543
.annotate 'line', 1756
    new $P1544, "Undef"
    .lex "$viviself", $P1544
.annotate 'line', 1757
    new $P1545, "Undef"
    .lex "$vivipost", $P1545
.annotate 'line', 1758
    new $P1546, "Undef"
    .lex "$result", $P1546
.annotate 'line', 1756
    find_lex $P1547, "$node"
    $P1548 = $P1547."viviself"()
    store_lex "$viviself", $P1548
.annotate 'line', 1757
    find_lex $P1549, "self"
    find_lex $P1550, "$viviself"
    $P1551 = $P1549."as_vivipost"($P1550, "P" :named("rtype"))
    store_lex "$vivipost", $P1551
.annotate 'line', 1758
    find_lex $P1552, "$vivipost"
    $P1553 = $P1552."result"()
    store_lex "$result", $P1553
.annotate 'line', 1759
    find_lex $P1555, "$result"
    set $S1556, $P1555
    iseq $I1557, $S1556, ""
    unless $I1557, if_1554_end
    find_lex $P1558, "self"
    $P1559 = $P1558."uniquereg"("P")
    store_lex "$result", $P1559
  if_1554_end:
.annotate 'line', 1761
    find_lex $P1560, "$ops"
    find_lex $P1561, "$result"
    $P1560."result"($P1561)
.annotate 'line', 1762
    find_lex $P1562, "$ops"
    find_lex $P1563, "$fetchop"
    $P1562."push"($P1563)
.annotate 'line', 1763
    find_lex $P1565, "$viviself"
    unless $P1565, if_1564_end
    .const 'Sub' $P1567 = "71_1308013488.88323" 
    capture_lex $P1567
    $P1567()
  if_1564_end:
    find_lex $P1584, "$ops"
.annotate 'line', 1755
    .return ($P1584)
  control_1538:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1585, exception, "payload"
    .return ($P1585)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1566"  :anon :subid("71_1308013488.88323") :outer("70_1308013488.88323")
.annotate 'line', 1764
    new $P1568, "Undef"
    .lex "$vivilabel", $P1568
    get_hll_global $P1569, ["POST"], "Label"
    $P1570 = $P1569."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P1570
.annotate 'line', 1765
    find_lex $P1571, "$ops"
    find_lex $P1572, "$ops"
    find_lex $P1573, "$vivilabel"
    $P1571."push_pirop"("unless_null", $P1572, $P1573)
.annotate 'line', 1766
    find_lex $P1574, "$ops"
    find_lex $P1575, "$vivipost"
    $P1574."push"($P1575)
.annotate 'line', 1767
    find_lex $P1577, "$node"
    $P1578 = $P1577."lvalue"()
    unless $P1578, if_1576_end
    find_lex $P1579, "$ops"
    find_lex $P1580, "$storeop"
    $P1579."push"($P1580)
  if_1576_end:
.annotate 'line', 1768
    find_lex $P1581, "$ops"
    find_lex $P1582, "$vivilabel"
    $P1583 = $P1581."push"($P1582)
.annotate 'line', 1763
    .return ($P1583)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("72_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1589
    .param pmc param_1590
.annotate 'line', 1774
    new $P1588, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1588, control_1587
    push_eh $P1588
    .lex "self", self
    .lex "$node", param_1589
    .lex "$bindpost", param_1590
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
  control_1587:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1591, exception, "payload"
    .return ($P1591)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("73_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1595
    .param pmc param_1596
.annotate 'line', 1829
    new $P1594, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1594, control_1593
    push_eh $P1594
    .lex "self", self
    .lex "$node", param_1595
    .lex "$bindpost", param_1596
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
  control_1593:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1597, exception, "payload"
    .return ($P1597)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("74_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1601
    .param pmc param_1602
.annotate 'line', 1878
    .const 'Sub' $P1655 = "77_1308013488.88323" 
    capture_lex $P1655
    .const 'Sub' $P1636 = "76_1308013488.88323" 
    capture_lex $P1636
    .const 'Sub' $P1615 = "75_1308013488.88323" 
    capture_lex $P1615
    new $P1600, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1600, control_1599
    push_eh $P1600
    .lex "self", self
    .lex "$node", param_1601
    .lex "$bindpost", param_1602
.annotate 'line', 1879
    new $P1603, "Undef"
    .lex "$name", $P1603
.annotate 'line', 1880
    new $P1604, "Undef"
    .lex "$isdecl", $P1604
.annotate 'line', 1888
    new $P1605, "Undef"
    .lex "$ops", $P1605
.annotate 'line', 1879
    find_lex $P1606, "self"
    find_lex $P1607, "$node"
    $P1608 = $P1607."name"()
    $P1609 = $P1606."escape"($P1608)
    store_lex "$name", $P1609
.annotate 'line', 1880
    find_lex $P1610, "$node"
    $P1611 = $P1610."isdecl"()
    store_lex "$isdecl", $P1611
.annotate 'line', 1882
    find_lex $P1613, "$bindpost"
    unless $P1613, if_1612_end
    .const 'Sub' $P1615 = "75_1308013488.88323" 
    capture_lex $P1615
    $P1615()
  if_1612_end:
.annotate 'line', 1888
    get_hll_global $P1629, ["POST"], "Ops"
    find_lex $P1630, "$node"
    $P1631 = $P1629."new"($P1630 :named("node"))
    store_lex "$ops", $P1631
.annotate 'line', 1890
    find_lex $P1634, "$isdecl"
    if $P1634, if_1633
.annotate 'line', 1897
    .const 'Sub' $P1655 = "77_1308013488.88323" 
    capture_lex $P1655
    $P1673 = $P1655()
    set $P1632, $P1673
.annotate 'line', 1890
    goto if_1633_end
  if_1633:
    .const 'Sub' $P1636 = "76_1308013488.88323" 
    capture_lex $P1636
    $P1653 = $P1636()
    set $P1632, $P1653
  if_1633_end:
.annotate 'line', 1878
    .return ($P1632)
  control_1599:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1674, exception, "payload"
    .return ($P1674)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1614"  :anon :subid("75_1308013488.88323") :outer("74_1308013488.88323")
.annotate 'line', 1883
    new $P1616, "Undef"
    .lex "$pirop", $P1616
    find_lex $P1619, "$isdecl"
    if $P1619, if_1618
    new $P1621, "String"
    assign $P1621, "store_lex"
    set $P1617, $P1621
    goto if_1618_end
  if_1618:
    new $P1620, "String"
    assign $P1620, ".lex"
    set $P1617, $P1620
  if_1618_end:
    store_lex "$pirop", $P1617
.annotate 'line', 1884
    new $P1622, "Exception"
    set $P1622['type'], .CONTROL_RETURN
    get_hll_global $P1623, ["POST"], "Op"
    find_lex $P1624, "$name"
    find_lex $P1625, "$bindpost"
    find_lex $P1626, "$pirop"
    find_lex $P1627, "$bindpost"
    $P1628 = $P1623."new"($P1624, $P1625, $P1626 :named("pirop"), $P1627 :named("result"))
    setattribute $P1622, 'payload', $P1628
    throw $P1622
.annotate 'line', 1882
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1654"  :anon :subid("77_1308013488.88323") :outer("74_1308013488.88323")
.annotate 'line', 1898
    new $P1656, "Undef"
    .lex "$fetchop", $P1656
.annotate 'line', 1899
    new $P1657, "Undef"
    .lex "$storeop", $P1657
.annotate 'line', 1898
    get_hll_global $P1658, ["POST"], "Op"
    find_lex $P1659, "$ops"
    find_lex $P1660, "$name"
    $P1661 = $P1658."new"($P1659, $P1660, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P1661
.annotate 'line', 1899
    get_hll_global $P1662, ["POST"], "Op"
    find_lex $P1663, "$name"
    find_lex $P1664, "$ops"
    $P1665 = $P1662."new"($P1663, $P1664, "store_lex" :named("pirop"))
    store_lex "$storeop", $P1665
.annotate 'line', 1900
    new $P1666, "Exception"
    set $P1666['type'], .CONTROL_RETURN
    find_lex $P1667, "self"
    find_lex $P1668, "$node"
    find_lex $P1669, "$ops"
    find_lex $P1670, "$fetchop"
    find_lex $P1671, "$storeop"
    $P1672 = $P1667."vivify"($P1668, $P1669, $P1670, $P1671)
    setattribute $P1666, 'payload', $P1672
    throw $P1666
.annotate 'line', 1897
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1635"  :anon :subid("76_1308013488.88323") :outer("74_1308013488.88323")
.annotate 'line', 1891
    new $P1637, "Undef"
    .lex "$viviself", $P1637
.annotate 'line', 1892
    new $P1638, "Undef"
    .lex "$vivipost", $P1638
.annotate 'line', 1891
    find_lex $P1639, "$node"
    $P1640 = $P1639."viviself"()
    store_lex "$viviself", $P1640
.annotate 'line', 1892
    find_lex $P1641, "self"
    find_lex $P1642, "$viviself"
    $P1643 = $P1641."as_vivipost"($P1642, "P" :named("rtype"))
    store_lex "$vivipost", $P1643
.annotate 'line', 1893
    find_lex $P1644, "$ops"
    find_lex $P1645, "$vivipost"
    $P1644."push"($P1645)
.annotate 'line', 1894
    find_lex $P1646, "$ops"
    find_lex $P1647, "$name"
    find_lex $P1648, "$vivipost"
    $P1646."push_pirop"(".lex", $P1647, $P1648)
.annotate 'line', 1895
    find_lex $P1649, "$ops"
    find_lex $P1650, "$vivipost"
    $P1649."result"($P1650)
.annotate 'line', 1896
    new $P1651, "Exception"
    set $P1651['type'], .CONTROL_RETURN
    find_lex $P1652, "$ops"
    setattribute $P1651, 'payload', $P1652
    throw $P1651
.annotate 'line', 1890
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("78_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1678
    .param pmc param_1679
.annotate 'line', 1905
    .const 'Sub' $P1700 = "79_1308013488.88323" 
    capture_lex $P1700
    new $P1677, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1677, control_1676
    push_eh $P1677
    .lex "self", self
    .lex "$node", param_1678
    .lex "$bindpost", param_1679
.annotate 'line', 1910
    new $P1680, "Undef"
    .lex "$name", $P1680
.annotate 'line', 1912
    $P1681 = root_new ['parrot';'Hash']
    .lex "%symtable", $P1681
.annotate 'line', 1934
    new $P1682, "Undef"
    .lex "$ops", $P1682
.annotate 'line', 1935
    new $P1683, "Undef"
    .lex "$fetchop", $P1683
.annotate 'line', 1936
    new $P1684, "Undef"
    .lex "$storeop", $P1684
.annotate 'line', 1910
    find_lex $P1685, "$node"
    $P1686 = $P1685."name"()
    store_lex "$name", $P1686
.annotate 'line', 1912
    find_dynamic_lex $P1687, "@*BLOCKPAST"
    unless_null $P1687, vivify_268
    get_hll_global $P1687, "@BLOCKPAST"
    unless_null $P1687, vivify_269
    die "Contextual @*BLOCKPAST not found"
  vivify_269:
  vivify_268:
    set $P1688, $P1687[0]
    unless_null $P1688, vivify_270
    new $P1688, "Undef"
  vivify_270:
    $P1689 = $P1688."symtable"()
    store_lex "%symtable", $P1689
.annotate 'line', 1913
    find_lex $P1691, "%symtable"
    defined $I1692, $P1691
    unless $I1692, if_1690_end
.annotate 'line', 1914
    find_lex $P1693, "$name"
    find_lex $P1694, "%symtable"
    unless_null $P1694, vivify_271
    $P1694 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1695, $P1694[$P1693]
    unless_null $P1695, vivify_272
    new $P1695, "Undef"
  vivify_272:
    store_lex "%symtable", $P1695
.annotate 'line', 1915
    find_lex $P1697, "%symtable"
    defined $I1698, $P1697
    unless $I1698, if_1696_end
    .const 'Sub' $P1700 = "79_1308013488.88323" 
    capture_lex $P1700
    $P1700()
  if_1696_end:
  if_1690_end:
.annotate 'line', 1924
    find_lex $P1720, "$node"
    $P1721 = $P1720."isdecl"()
    unless $P1721, if_1719_end
    new $P1722, "Exception"
    set $P1722['type'], .CONTROL_RETURN
    find_lex $P1723, "self"
    find_lex $P1724, "$node"
    find_lex $P1725, "$bindpost"
    $P1726 = $P1723."lexical"($P1724, $P1725)
    setattribute $P1722, 'payload', $P1726
    throw $P1722
  if_1719_end:
.annotate 'line', 1926
    find_lex $P1727, "self"
    find_lex $P1728, "$name"
    $P1729 = $P1727."escape"($P1728)
    store_lex "$name", $P1729
.annotate 'line', 1928
    find_lex $P1731, "$bindpost"
    unless $P1731, if_1730_end
.annotate 'line', 1929
    new $P1732, "Exception"
    set $P1732['type'], .CONTROL_RETURN
    get_hll_global $P1733, ["POST"], "Op"
    find_lex $P1734, "$name"
    find_lex $P1735, "$bindpost"
    find_lex $P1736, "$bindpost"
    $P1737 = $P1733."new"($P1734, $P1735, "store_dynamic_lex" :named("pirop"), $P1736 :named("result"))
    setattribute $P1732, 'payload', $P1737
    throw $P1732
  if_1730_end:
.annotate 'line', 1934
    get_hll_global $P1738, ["POST"], "Ops"
    find_lex $P1739, "$node"
    $P1740 = $P1738."new"($P1739 :named("node"))
    store_lex "$ops", $P1740
.annotate 'line', 1935
    get_hll_global $P1741, ["POST"], "Op"
    find_lex $P1742, "$ops"
    find_lex $P1743, "$name"
    $P1744 = $P1741."new"($P1742, $P1743, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P1744
.annotate 'line', 1936
    get_hll_global $P1745, ["POST"], "Op"
    find_lex $P1746, "$ops"
    find_lex $P1747, "$name"
    $P1748 = $P1745."new"($P1746, $P1747, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P1748
.annotate 'line', 1937
    find_lex $P1749, "self"
    find_lex $P1750, "$node"
    find_lex $P1751, "$ops"
    find_lex $P1752, "$fetchop"
    find_lex $P1753, "$storeop"
    $P1754 = $P1749."vivify"($P1750, $P1751, $P1752, $P1753)
.annotate 'line', 1905
    .return ($P1754)
  control_1676:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1755, exception, "payload"
    .return ($P1755)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1699"  :anon :subid("79_1308013488.88323") :outer("78_1308013488.88323")
.annotate 'line', 1916
    new $P1701, "Undef"
    .lex "$scope", $P1701
    find_lex $P1702, "%symtable"
    unless_null $P1702, vivify_273
    $P1702 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1703, $P1702["scope"]
    unless_null $P1703, vivify_274
    new $P1703, "Undef"
  vivify_274:
    store_lex "$scope", $P1703
.annotate 'line', 1917
    find_lex $P1708, "$scope"
    if $P1708, if_1707
    set $P1706, $P1708
    goto if_1707_end
  if_1707:
    find_lex $P1709, "$scope"
    set $S1710, $P1709
    isne $I1711, $S1710, "contextual"
    new $P1706, 'Integer'
    set $P1706, $I1711
  if_1707_end:
    if $P1706, if_1705
    set $P1704, $P1706
    goto if_1705_end
  if_1705:
.annotate 'line', 1918
    new $P1712, "Exception"
    set $P1712['type'], .CONTROL_RETURN
    find_lex $P1713, "self"
    find_lex $P1714, "$node"
    find_lex $P1715, "$bindpost"
    find_lex $P1716, "$scope"
    set $S1717, $P1716
    $P1718 = $P1713.$S1717($P1714, $P1715)
    setattribute $P1712, 'payload', $P1718
    throw $P1712
  if_1705_end:
.annotate 'line', 1915
    .return ($P1704)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("80_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1759
    .param pmc param_1760
    .param pmc param_1761 :optional
    .param int has_param_1761 :opt_flag
.annotate 'line', 1941
    new $P1758, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1758, control_1757
    push_eh $P1758
    .lex "self", self
    .lex "$node", param_1759
    .lex "$bindpost", param_1760
    if has_param_1761, optparam_275
    new $P1762, "Undef"
    set param_1761, $P1762
  optparam_275:
    .lex "$keyrtype", param_1761
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
  control_1757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1763, exception, "payload"
    .return ($P1763)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("81_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1767
    .param pmc param_1768
.annotate 'line', 2010
    new $P1766, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1766, control_1765
    push_eh $P1766
    .lex "self", self
    .lex "$node", param_1767
    .lex "$bindpost", param_1768
.annotate 'line', 2011
    find_lex $P1769, "self"
    find_lex $P1770, "$node"
    find_lex $P1771, "$bindpost"
    $P1772 = $P1769."keyed"($P1770, $P1771, "i")
.annotate 'line', 2010
    .return ($P1772)
  control_1765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1773, exception, "payload"
    .return ($P1773)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("82_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1777
    .param pmc param_1778
.annotate 'line', 2015
    new $P1776, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1776, control_1775
    push_eh $P1776
    .lex "self", self
    .lex "$node", param_1777
    .lex "$bindpost", param_1778
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
  control_1775:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1779, exception, "payload"
    .return ($P1779)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("83_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Var"],_)
    .param pmc param_1783
    .param pmc param_1784
.annotate 'line', 2083
    .const 'Sub' $P1810 = "84_1308013488.88323" 
    capture_lex $P1810
    new $P1782, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1782, control_1781
    push_eh $P1782
    .lex "self", self
    .lex "$node", param_1783
    .lex "$bindpost", param_1784
.annotate 'line', 2084
    new $P1785, "Undef"
    .lex "$name", $P1785
.annotate 'line', 2091
    new $P1786, "Undef"
    .lex "$ops", $P1786
.annotate 'line', 2084
    find_lex $P1787, "$node"
    $P1788 = $P1787."name"()
    store_lex "$name", $P1788
.annotate 'line', 2086
    find_lex $P1790, "$name"
    if $P1790, unless_1789_end
.annotate 'line', 2087
    find_lex $P1791, "self"
    $P1792 = $P1791."uniquereg"("P")
    store_lex "$name", $P1792
.annotate 'line', 2088
    find_lex $P1793, "$node"
    find_lex $P1794, "$name"
    $P1793."name"($P1794)
  unless_1789_end:
.annotate 'line', 2091
    get_hll_global $P1795, ["POST"], "Ops"
    find_lex $P1796, "$name"
    find_lex $P1797, "$node"
    $P1798 = $P1795."new"($P1796 :named("result"), $P1797 :named("node"))
    store_lex "$ops", $P1798
.annotate 'line', 2093
    find_lex $P1800, "$node"
    $P1801 = $P1800."isdecl"()
    unless $P1801, if_1799_end
    find_lex $P1802, "$ops"
    find_lex $P1803, "$ops"
    $P1802."push_pirop"(".local pmc", $P1803)
  if_1799_end:
.annotate 'line', 2095
    find_lex $P1805, "$bindpost"
    if $P1805, if_1804
.annotate 'line', 2097
    .const 'Sub' $P1810 = "84_1308013488.88323" 
    capture_lex $P1810
    $P1810()
    goto if_1804_end
  if_1804:
.annotate 'line', 2096
    find_lex $P1806, "$ops"
    find_lex $P1807, "$ops"
    find_lex $P1808, "$bindpost"
    $P1806."push_pirop"("set", $P1807, $P1808)
  if_1804_end:
.annotate 'line', 2095
    find_lex $P1830, "$ops"
.annotate 'line', 2083
    .return ($P1830)
  control_1781:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1831, exception, "payload"
    .return ($P1831)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1809"  :anon :subid("84_1308013488.88323") :outer("83_1308013488.88323")
.annotate 'line', 2097
    .const 'Sub' $P1818 = "85_1308013488.88323" 
    capture_lex $P1818
.annotate 'line', 2098
    new $P1811, "Undef"
    .lex "$viviself", $P1811
    find_lex $P1812, "$node"
    $P1813 = $P1812."viviself"()
    store_lex "$viviself", $P1813
.annotate 'line', 2099
    find_lex $P1816, "$viviself"
    if $P1816, if_1815
    set $P1814, $P1816
    goto if_1815_end
  if_1815:
    .const 'Sub' $P1818 = "85_1308013488.88323" 
    capture_lex $P1818
    $P1829 = $P1818()
    set $P1814, $P1829
  if_1815_end:
.annotate 'line', 2097
    .return ($P1814)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1817"  :anon :subid("85_1308013488.88323") :outer("84_1308013488.88323")
.annotate 'line', 2100
    new $P1819, "Undef"
    .lex "$vivipost", $P1819
    find_lex $P1820, "self"
    find_lex $P1821, "$viviself"
    $P1822 = $P1820."as_vivipost"($P1821, "P" :named("rtype"))
    store_lex "$vivipost", $P1822
.annotate 'line', 2101
    find_lex $P1823, "$ops"
    find_lex $P1824, "$vivipost"
    $P1823."push"($P1824)
.annotate 'line', 2102
    find_lex $P1825, "$ops"
    find_lex $P1826, "$ops"
    find_lex $P1827, "$vivipost"
    $P1828 = $P1825."push_pirop"("set", $P1826, $P1827)
.annotate 'line', 2099
    .return ($P1828)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("86_1308013488.88323") :method :outer("11_1308013488.88323") :multi(_,["PAST";"Val"])
    .param pmc param_1835
    .param pmc param_1836 :slurpy :named
.annotate 'line', 2118
    new $P1834, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1834, control_1833
    push_eh $P1834
    .lex "self", self
    .lex "$node", param_1835
    .lex "%options", param_1836
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
  control_1833:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1837, exception, "payload"
    .return ($P1837)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1839" :load :anon :subid("87_1308013488.88323")
.annotate 'line', 41
    .const 'Sub' $P1841 = "11_1308013488.88323" 
    $P1842 = $P1841()
    .return ($P1842)
.end


.namespace []
.sub "_block2030" :load :anon :subid("88_1308013488.88323")
.annotate 'line', 1
    .const 'Sub' $P2032 = "10_1308013488.88323" 
    $P2033 = $P2032()
    .return ($P2033)
.end

