
.namespace []
.sub "_block1000"  :anon :subid("10_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695743.39515" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1312695743.39515" 
    capture_lex $P1003
    $P107 = $P1003()
.annotate 'line', 1
    .return ($P107)
    .const 'Sub' $P2019 = "108_1312695743.39515" 
    .return ($P2019)
.end


.namespace []
.sub "" :load :init :subid("post109") :outer("10_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695743.39515" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2021 = get_root_global ["parrot"], "P6metaclass"
    new $P102, "ResizablePMCArray"
    push $P102, "%!symtable"
    $P2021."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P102 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1312695743.39515") :outer("10_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1894 = "105_1312695743.39515" 
    capture_lex $P1894
    .const 'Sub' $P1877 = "102_1312695743.39515" 
    capture_lex $P1877
    .const 'Sub' $P1856 = "100_1312695743.39515" 
    capture_lex $P1856
    .const 'Sub' $P1851 = "99_1312695743.39515" 
    capture_lex $P1851
    .const 'Sub' $P1845 = "98_1312695743.39515" 
    capture_lex $P1845
    .const 'Sub' $P1823 = "96_1312695743.39515" 
    capture_lex $P1823
    .const 'Sub' $P1801 = "93_1312695743.39515" 
    capture_lex $P1801
    .const 'Sub' $P1786 = "92_1312695743.39515" 
    capture_lex $P1786
    .const 'Sub' $P1770 = "90_1312695743.39515" 
    capture_lex $P1770
    .const 'Sub' $P1754 = "88_1312695743.39515" 
    capture_lex $P1754
    .const 'Sub' $P1695 = "82_1312695743.39515" 
    capture_lex $P1695
    .const 'Sub' $P1679 = "81_1312695743.39515" 
    capture_lex $P1679
    .const 'Sub' $P1669 = "80_1312695743.39515" 
    capture_lex $P1669
    .const 'Sub' $P1657 = "79_1312695743.39515" 
    capture_lex $P1657
    .const 'Sub' $P1638 = "77_1312695743.39515" 
    capture_lex $P1638
    .const 'Sub' $P1626 = "76_1312695743.39515" 
    capture_lex $P1626
    .const 'Sub' $P1601 = "73_1312695743.39515" 
    capture_lex $P1601
    .const 'Sub' $P1582 = "72_1312695743.39515" 
    capture_lex $P1582
    .const 'Sub' $P1568 = "70_1312695743.39515" 
    capture_lex $P1568
    .const 'Sub' $P1563 = "69_1312695743.39515" 
    capture_lex $P1563
    .const 'Sub' $P1558 = "68_1312695743.39515" 
    capture_lex $P1558
    .const 'Sub' $P1543 = "66_1312695743.39515" 
    capture_lex $P1543
    .const 'Sub' $P1516 = "64_1312695743.39515" 
    capture_lex $P1516
    .const 'Sub' $P1511 = "63_1312695743.39515" 
    capture_lex $P1511
    .const 'Sub' $P1506 = "62_1312695743.39515" 
    capture_lex $P1506
    .const 'Sub' $P1501 = "61_1312695743.39515" 
    capture_lex $P1501
    .const 'Sub' $P1478 = "60_1312695743.39515" 
    capture_lex $P1478
    .const 'Sub' $P1447 = "59_1312695743.39515" 
    capture_lex $P1447
    .const 'Sub' $P1442 = "58_1312695743.39515" 
    capture_lex $P1442
    .const 'Sub' $P1393 = "54_1312695743.39515" 
    capture_lex $P1393
    .const 'Sub' $P1388 = "53_1312695743.39515" 
    capture_lex $P1388
    .const 'Sub' $P1363 = "51_1312695743.39515" 
    capture_lex $P1363
    .const 'Sub' $P1341 = "50_1312695743.39515" 
    capture_lex $P1341
    .const 'Sub' $P1324 = "49_1312695743.39515" 
    capture_lex $P1324
    .const 'Sub' $P1222 = "39_1312695743.39515" 
    capture_lex $P1222
    .const 'Sub' $P1186 = "35_1312695743.39515" 
    capture_lex $P1186
    .const 'Sub' $P1172 = "34_1312695743.39515" 
    capture_lex $P1172
    .const 'Sub' $P1153 = "32_1312695743.39515" 
    capture_lex $P1153
    .const 'Sub' $P1141 = "31_1312695743.39515" 
    capture_lex $P1141
    .const 'Sub' $P1136 = "30_1312695743.39515" 
    capture_lex $P1136
    .const 'Sub' $P1131 = "29_1312695743.39515" 
    capture_lex $P1131
    .const 'Sub' $P1124 = "28_1312695743.39515" 
    capture_lex $P1124
    .const 'Sub' $P1117 = "27_1312695743.39515" 
    capture_lex $P1117
    .const 'Sub' $P1111 = "26_1312695743.39515" 
    capture_lex $P1111
    .const 'Sub' $P1105 = "25_1312695743.39515" 
    capture_lex $P1105
    .const 'Sub' $P1100 = "24_1312695743.39515" 
    capture_lex $P1100
    .const 'Sub' $P1093 = "23_1312695743.39515" 
    capture_lex $P1093
    .const 'Sub' $P1088 = "22_1312695743.39515" 
    capture_lex $P1088
    .const 'Sub' $P1083 = "21_1312695743.39515" 
    capture_lex $P1083
    .const 'Sub' $P1069 = "20_1312695743.39515" 
    capture_lex $P1069
    .const 'Sub' $P1060 = "19_1312695743.39515" 
    capture_lex $P1060
    .const 'Sub' $P1052 = "18_1312695743.39515" 
    capture_lex $P1052
    .const 'Sub' $P1046 = "17_1312695743.39515" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "16_1312695743.39515" 
    capture_lex $P1039
    .const 'Sub' $P1022 = "14_1312695743.39515" 
    capture_lex $P1022
    .const 'Sub' $P1009 = "12_1312695743.39515" 
    capture_lex $P1009
.annotate 'line', 43
    get_global $P1004, "%piropsig"
    unless_null $P1004, vivify_202
    $P1004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1004
  vivify_202:
.annotate 'line', 44
    get_global $P1005, "%valflags"
    unless_null $P1005, vivify_203
    $P1005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1005
  vivify_203:
.annotate 'line', 45
    get_global $P1006, "%controltypes"
    unless_null $P1006, vivify_204
    $P1006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1006
  vivify_204:
.annotate 'line', 46
    get_global $P101, "$serno"
    unless_null $P101, vivify_205
    new $P101, "Undef"
    set_global "$serno", $P101
  vivify_205:
.annotate 'line', 49
    get_global $P102, "$TEMPREG_BASE"
    unless_null $P102, vivify_206
    new $P102, "Undef"
    set_global "$TEMPREG_BASE", $P102
  vivify_206:
.annotate 'line', 50
    get_global $P103, "$UNIQUE_BASE"
    unless_null $P103, vivify_207
    new $P103, "Undef"
    set_global "$UNIQUE_BASE", $P103
  vivify_207:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_208
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_208:
.annotate 'line', 991
    .const 'Sub' $P1009 = "12_1312695743.39515" 
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
.annotate 'line', 2022
    .const 'Sub' $P1894 = "105_1312695743.39515" 
    newclosure $P1923, $P1894
.annotate 'line', 41
    .return ($P1923)
    .const 'Sub' $P1925 = "107_1312695743.39515" 
    .return ($P1925)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post110") :outer("11_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1312695743.39515" 
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
    get_global $P1927, "%piropsig"
    unless_null $P1927, vivify_111
    $P1927 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1927
  vivify_111:
    set $P1927["add"], $P107
.annotate 'line', 59
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1928, "%piropsig"
    unless_null $P1928, vivify_112
    $P1928 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1928
  vivify_112:
    set $P1928["band"], $P107
.annotate 'line', 60
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1929, "%piropsig"
    unless_null $P1929, vivify_113
    $P1929 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1929
  vivify_113:
    set $P1929["bxor"], $P107
.annotate 'line', 61
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1930, "%piropsig"
    unless_null $P1930, vivify_114
    $P1930 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1930
  vivify_114:
    set $P1930["bnot"], $P107
.annotate 'line', 62
    new $P107, "String"
    assign $P107, "PPP"
    get_global $P1931, "%piropsig"
    unless_null $P1931, vivify_115
    $P1931 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1931
  vivify_115:
    set $P1931["bor"], $P107
.annotate 'line', 63
    new $P107, "String"
    assign $P107, "IPs"
    get_global $P1932, "%piropsig"
    unless_null $P1932, vivify_116
    $P1932 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1932
  vivify_116:
    set $P1932["can"], $P107
.annotate 'line', 64
    new $P107, "String"
    assign $P107, "Si"
    get_global $P1933, "%piropsig"
    unless_null $P1933, vivify_117
    $P1933 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1933
  vivify_117:
    set $P1933["chr"], $P107
.annotate 'line', 65
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1934, "%piropsig"
    unless_null $P1934, vivify_118
    $P1934 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1934
  vivify_118:
    set $P1934["clone"], $P107
.annotate 'line', 66
    new $P107, "String"
    assign $P107, "PP~"
    get_global $P1935, "%piropsig"
    unless_null $P1935, vivify_119
    $P1935 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1935
  vivify_119:
    set $P1935["concat"], $P107
.annotate 'line', 67
    new $P107, "String"
    assign $P107, "0PP"
    get_global $P1936, "%piropsig"
    unless_null $P1936, vivify_120
    $P1936 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1936
  vivify_120:
    set $P1936["copy"], $P107
.annotate 'line', 68
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1937, "%piropsig"
    unless_null $P1937, vivify_121
    $P1937 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1937
  vivify_121:
    set $P1937["defined"], $P107
.annotate 'line', 69
    new $P107, "String"
    assign $P107, "vQ*"
    get_global $P1938, "%piropsig"
    unless_null $P1938, vivify_122
    $P1938 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1938
  vivify_122:
    set $P1938["delete"], $P107
.annotate 'line', 70
    new $P107, "String"
    assign $P107, "v~"
    get_global $P1939, "%piropsig"
    unless_null $P1939, vivify_123
    $P1939 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1939
  vivify_123:
    set $P1939["die"], $P107
.annotate 'line', 71
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1940, "%piropsig"
    unless_null $P1940, vivify_124
    $P1940 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1940
  vivify_124:
    set $P1940["div"], $P107
.annotate 'line', 72
    new $P107, "String"
    assign $P107, "IPs"
    get_global $P1941, "%piropsig"
    unless_null $P1941, vivify_125
    $P1941 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1941
  vivify_125:
    set $P1941["does"], $P107
.annotate 'line', 73
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P1942, "%piropsig"
    unless_null $P1942, vivify_126
    $P1942 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1942
  vivify_126:
    set $P1942["downcase"], $P107
.annotate 'line', 74
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1943, "%piropsig"
    unless_null $P1943, vivify_127
    $P1943 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1943
  vivify_127:
    set $P1943["elements"], $P107
.annotate 'line', 75
    new $P107, "String"
    assign $P107, "IQ*"
    get_global $P1944, "%piropsig"
    unless_null $P1944, vivify_128
    $P1944 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1944
  vivify_128:
    set $P1944["exists"], $P107
.annotate 'line', 76
    new $P107, "String"
    assign $P107, "vi"
    get_global $P1945, "%piropsig"
    unless_null $P1945, vivify_129
    $P1945 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1945
  vivify_129:
    set $P1945["exit"], $P107
.annotate 'line', 77
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1946, "%piropsig"
    unless_null $P1946, vivify_130
    $P1946 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1946
  vivify_130:
    set $P1946["fdiv"], $P107
.annotate 'line', 78
    new $P107, "String"
    assign $P107, "Is"
    get_global $P1947, "%piropsig"
    unless_null $P1947, vivify_131
    $P1947 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1947
  vivify_131:
    set $P1947["find_codepoint"], $P107
.annotate 'line', 79
    new $P107, "String"
    assign $P107, "Ps"
    get_global $P1948, "%piropsig"
    unless_null $P1948, vivify_132
    $P1948 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1948
  vivify_132:
    set $P1948["find_dynamic_lex"], $P107
.annotate 'line', 80
    new $P107, "String"
    assign $P107, "Ps"
    get_global $P1949, "%piropsig"
    unless_null $P1949, vivify_133
    $P1949 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1949
  vivify_133:
    set $P1949["find_name"], $P107
.annotate 'line', 81
    new $P107, "String"
    assign $P107, "P"
    get_global $P1950, "%piropsig"
    unless_null $P1950, vivify_134
    $P1950 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1950
  vivify_134:
    set $P1950["getinterp"], $P107
.annotate 'line', 82
    new $P107, "String"
    assign $P107, "P~P"
    get_global $P1951, "%piropsig"
    unless_null $P1951, vivify_135
    $P1951 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1951
  vivify_135:
    set $P1951["getprop"], $P107
.annotate 'line', 83
    new $P107, "String"
    assign $P107, "P"
    get_global $P1952, "%piropsig"
    unless_null $P1952, vivify_136
    $P1952 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1952
  vivify_136:
    set $P1952["getstderr"], $P107
.annotate 'line', 84
    new $P107, "String"
    assign $P107, "P"
    get_global $P1953, "%piropsig"
    unless_null $P1953, vivify_137
    $P1953 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1953
  vivify_137:
    set $P1953["getstdin"], $P107
.annotate 'line', 85
    new $P107, "String"
    assign $P107, "P"
    get_global $P1954, "%piropsig"
    unless_null $P1954, vivify_138
    $P1954 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1954
  vivify_138:
    set $P1954["getstdout"], $P107
.annotate 'line', 86
    new $P107, "String"
    assign $P107, "Issi"
    get_global $P1955, "%piropsig"
    unless_null $P1955, vivify_139
    $P1955 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1955
  vivify_139:
    set $P1955["index"], $P107
.annotate 'line', 87
    new $P107, "String"
    assign $P107, "IP~"
    get_global $P1956, "%piropsig"
    unless_null $P1956, vivify_140
    $P1956 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1956
  vivify_140:
    set $P1956["isa"], $P107
.annotate 'line', 88
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1957, "%piropsig"
    unless_null $P1957, vivify_141
    $P1957 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1957
  vivify_141:
    set $P1957["isfalse"], $P107
.annotate 'line', 89
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1958, "%piropsig"
    unless_null $P1958, vivify_142
    $P1958 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1958
  vivify_142:
    set $P1958["isnull"], $P107
.annotate 'line', 90
    new $P107, "String"
    assign $P107, "IPP"
    get_global $P1959, "%piropsig"
    unless_null $P1959, vivify_143
    $P1959 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1959
  vivify_143:
    set $P1959["issame"], $P107
.annotate 'line', 91
    new $P107, "String"
    assign $P107, "IP"
    get_global $P1960, "%piropsig"
    unless_null $P1960, vivify_144
    $P1960 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1960
  vivify_144:
    set $P1960["istrue"], $P107
.annotate 'line', 92
    new $P107, "String"
    assign $P107, "SsP"
    get_global $P1961, "%piropsig"
    unless_null $P1961, vivify_145
    $P1961 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1961
  vivify_145:
    set $P1961["join"], $P107
.annotate 'line', 93
    new $P107, "String"
    assign $P107, "Is"
    get_global $P1962, "%piropsig"
    unless_null $P1962, vivify_146
    $P1962 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1962
  vivify_146:
    set $P1962["length"], $P107
.annotate 'line', 94
    new $P107, "String"
    assign $P107, "vs"
    get_global $P1963, "%piropsig"
    unless_null $P1963, vivify_147
    $P1963 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1963
  vivify_147:
    set $P1963["load_bytecode"], $P107
.annotate 'line', 95
    new $P107, "String"
    assign $P107, "vs"
    get_global $P1964, "%piropsig"
    unless_null $P1964, vivify_148
    $P1964 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1964
  vivify_148:
    set $P1964["load_language"], $P107
.annotate 'line', 96
    new $P107, "String"
    assign $P107, "P~"
    get_global $P1965, "%piropsig"
    unless_null $P1965, vivify_149
    $P1965 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1965
  vivify_149:
    set $P1965["loadlib"], $P107
.annotate 'line', 97
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1966, "%piropsig"
    unless_null $P1966, vivify_150
    $P1966 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1966
  vivify_150:
    set $P1966["mod"], $P107
.annotate 'line', 98
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1967, "%piropsig"
    unless_null $P1967, vivify_151
    $P1967 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1967
  vivify_151:
    set $P1967["mul"], $P107
.annotate 'line', 99
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1968, "%piropsig"
    unless_null $P1968, vivify_152
    $P1968 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1968
  vivify_152:
    set $P1968["neg"], $P107
.annotate 'line', 100
    new $P107, "String"
    assign $P107, "P~"
    get_global $P1969, "%piropsig"
    unless_null $P1969, vivify_153
    $P1969 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1969
  vivify_153:
    set $P1969["new"], $P107
.annotate 'line', 101
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1970, "%piropsig"
    unless_null $P1970, vivify_154
    $P1970 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1970
  vivify_154:
    set $P1970["newclosure"], $P107
.annotate 'line', 102
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1971, "%piropsig"
    unless_null $P1971, vivify_155
    $P1971 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1971
  vivify_155:
    set $P1971["not"], $P107
.annotate 'line', 103
    new $P107, "String"
    assign $P107, "Isi"
    get_global $P1972, "%piropsig"
    unless_null $P1972, vivify_156
    $P1972 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1972
  vivify_156:
    set $P1972["ord"], $P107
.annotate 'line', 104
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1973, "%piropsig"
    unless_null $P1973, vivify_157
    $P1973 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1973
  vivify_157:
    set $P1973["pop"], $P107
.annotate 'line', 105
    new $P107, "String"
    assign $P107, "NN+"
    get_global $P1974, "%piropsig"
    unless_null $P1974, vivify_158
    $P1974 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1974
  vivify_158:
    set $P1974["pow"], $P107
.annotate 'line', 106
    new $P107, "String"
    assign $P107, "v*"
    get_global $P1975, "%piropsig"
    unless_null $P1975, vivify_159
    $P1975 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1975
  vivify_159:
    set $P1975["print"], $P107
.annotate 'line', 107
    new $P107, "String"
    assign $P107, "v*"
    get_global $P1976, "%piropsig"
    unless_null $P1976, vivify_160
    $P1976 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1976
  vivify_160:
    set $P1976["printerr"], $P107
.annotate 'line', 108
    new $P107, "String"
    assign $P107, "0P*"
    get_global $P1977, "%piropsig"
    unless_null $P1977, vivify_161
    $P1977 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1977
  vivify_161:
    set $P1977["push"], $P107
.annotate 'line', 109
    new $P107, "String"
    assign $P107, "Ssi"
    get_global $P1978, "%piropsig"
    unless_null $P1978, vivify_162
    $P1978 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1978
  vivify_162:
    set $P1978["repeat"], $P107
.annotate 'line', 110
    new $P107, "String"
    assign $P107, "Ssiis"
    get_global $P1979, "%piropsig"
    unless_null $P1979, vivify_163
    $P1979 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1979
  vivify_163:
    set $P1979["replace"], $P107
.annotate 'line', 111
    new $P107, "String"
    assign $P107, "v*"
    get_global $P1980, "%piropsig"
    unless_null $P1980, vivify_164
    $P1980 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1980
  vivify_164:
    set $P1980["say"], $P107
.annotate 'line', 112
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1981, "%piropsig"
    unless_null $P1981, vivify_165
    $P1981 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1981
  vivify_165:
    set $P1981["set"], $P107
.annotate 'line', 113
    new $P107, "String"
    assign $P107, "0P~P"
    get_global $P1982, "%piropsig"
    unless_null $P1982, vivify_166
    $P1982 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1982
  vivify_166:
    set $P1982["setprop"], $P107
.annotate 'line', 114
    new $P107, "String"
    assign $P107, "0P~P"
    get_global $P1983, "%piropsig"
    unless_null $P1983, vivify_167
    $P1983 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1983
  vivify_167:
    set $P1983["setattribute"], $P107
.annotate 'line', 115
    new $P107, "String"
    assign $P107, "PP"
    get_global $P1984, "%piropsig"
    unless_null $P1984, vivify_168
    $P1984 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1984
  vivify_168:
    set $P1984["shift"], $P107
.annotate 'line', 116
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1985, "%piropsig"
    unless_null $P1985, vivify_169
    $P1985 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1985
  vivify_169:
    set $P1985["shl"], $P107
.annotate 'line', 117
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1986, "%piropsig"
    unless_null $P1986, vivify_170
    $P1986 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1986
  vivify_170:
    set $P1986["shr"], $P107
.annotate 'line', 118
    new $P107, "String"
    assign $P107, "v+"
    get_global $P1987, "%piropsig"
    unless_null $P1987, vivify_171
    $P1987 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1987
  vivify_171:
    set $P1987["sleep"], $P107
.annotate 'line', 119
    new $P107, "String"
    assign $P107, "0PPii"
    get_global $P1988, "%piropsig"
    unless_null $P1988, vivify_172
    $P1988 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1988
  vivify_172:
    set $P1988["splice"], $P107
.annotate 'line', 120
    new $P107, "String"
    assign $P107, "Pss"
    get_global $P1989, "%piropsig"
    unless_null $P1989, vivify_173
    $P1989 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1989
  vivify_173:
    set $P1989["split"], $P107
.annotate 'line', 121
    new $P107, "String"
    assign $P107, "PP+"
    get_global $P1990, "%piropsig"
    unless_null $P1990, vivify_174
    $P1990 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1990
  vivify_174:
    set $P1990["sub"], $P107
.annotate 'line', 122
    new $P107, "String"
    assign $P107, "Ssii"
    get_global $P1991, "%piropsig"
    unless_null $P1991, vivify_175
    $P1991 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1991
  vivify_175:
    set $P1991["substr"], $P107
.annotate 'line', 123
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P1992, "%piropsig"
    unless_null $P1992, vivify_176
    $P1992 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1992
  vivify_176:
    set $P1992["titlecase"], $P107
.annotate 'line', 124
    new $P107, "String"
    assign $P107, "vi"
    get_global $P1993, "%piropsig"
    unless_null $P1993, vivify_177
    $P1993 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1993
  vivify_177:
    set $P1993["trace"], $P107
.annotate 'line', 125
    new $P107, "String"
    assign $P107, "SP"
    get_global $P1994, "%piropsig"
    unless_null $P1994, vivify_178
    $P1994 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1994
  vivify_178:
    set $P1994["typeof"], $P107
.annotate 'line', 126
    new $P107, "String"
    assign $P107, "0P*"
    get_global $P1995, "%piropsig"
    unless_null $P1995, vivify_179
    $P1995 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1995
  vivify_179:
    set $P1995["unshift"], $P107
.annotate 'line', 127
    new $P107, "String"
    assign $P107, "Ss"
    get_global $P1996, "%piropsig"
    unless_null $P1996, vivify_180
    $P1996 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1996
  vivify_180:
    set $P1996["upcase"], $P107
.annotate 'line', 132
    new $P107, "String"
    assign $P107, "s~*:e"
    get_global $P1997, "%valflags"
    unless_null $P1997, vivify_181
    $P1997 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1997
  vivify_181:
    set $P1997["String"], $P107
.annotate 'line', 133
    new $P107, "String"
    assign $P107, "i+*:"
    get_global $P1998, "%valflags"
    unless_null $P1998, vivify_182
    $P1998 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1998
  vivify_182:
    set $P1998["Integer"], $P107
.annotate 'line', 134
    new $P107, "String"
    assign $P107, "n+*:"
    get_global $P1999, "%valflags"
    unless_null $P1999, vivify_183
    $P1999 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1999
  vivify_183:
    set $P1999["Float"], $P107
.annotate 'line', 135
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2000, "%valflags"
    unless_null $P2000, vivify_184
    $P2000 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2000
  vivify_184:
    set $P2000["!macro_const"], $P107
.annotate 'line', 136
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2001, "%valflags"
    unless_null $P2001, vivify_185
    $P2001 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2001
  vivify_185:
    set $P2001["!cclass"], $P107
.annotate 'line', 137
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2002, "%valflags"
    unless_null $P2002, vivify_186
    $P2002 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2002
  vivify_186:
    set $P2002["!except_severity"], $P107
.annotate 'line', 138
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2003, "%valflags"
    unless_null $P2003, vivify_187
    $P2003 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2003
  vivify_187:
    set $P2003["!except_types"], $P107
.annotate 'line', 139
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2004, "%valflags"
    unless_null $P2004, vivify_188
    $P2004 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2004
  vivify_188:
    set $P2004["!iterator"], $P107
.annotate 'line', 140
    new $P107, "String"
    assign $P107, "i+*:c"
    get_global $P2005, "%valflags"
    unless_null $P2005, vivify_189
    $P2005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2005
  vivify_189:
    set $P2005["!socket"], $P107
.annotate 'line', 144
    new $P107, "String"
    assign $P107, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2006, "%controltypes"
    unless_null $P2006, vivify_190
    $P2006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2006
  vivify_190:
    set $P2006["CONTROL"], $P107
.annotate 'line', 145
    new $P107, "String"
    assign $P107, ".CONTROL_RETURN"
    get_global $P2007, "%controltypes"
    unless_null $P2007, vivify_191
    $P2007 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2007
  vivify_191:
    set $P2007["RETURN"], $P107
.annotate 'line', 146
    new $P107, "String"
    assign $P107, ".CONTROL_OK"
    get_global $P2008, "%controltypes"
    unless_null $P2008, vivify_192
    $P2008 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2008
  vivify_192:
    set $P2008["OK"], $P107
.annotate 'line', 147
    new $P107, "String"
    assign $P107, ".CONTROL_BREAK"
    get_global $P2009, "%controltypes"
    unless_null $P2009, vivify_193
    $P2009 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2009
  vivify_193:
    set $P2009["BREAK"], $P107
.annotate 'line', 148
    new $P107, "String"
    assign $P107, ".CONTROL_CONTINUE"
    get_global $P2010, "%controltypes"
    unless_null $P2010, vivify_194
    $P2010 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2010
  vivify_194:
    set $P2010["CONTINUE"], $P107
.annotate 'line', 149
    new $P107, "String"
    assign $P107, ".CONTROL_ERROR"
    get_global $P2011, "%controltypes"
    unless_null $P2011, vivify_195
    $P2011 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2011
  vivify_195:
    set $P2011["ERROR"], $P107
.annotate 'line', 150
    new $P107, "String"
    assign $P107, ".CONTROL_TAKE"
    get_global $P2012, "%controltypes"
    unless_null $P2012, vivify_196
    $P2012 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2012
  vivify_196:
    set $P2012["GATHER"], $P107
.annotate 'line', 151
    new $P107, "String"
    assign $P107, ".CONTROL_LEAVE"
    get_global $P2013, "%controltypes"
    unless_null $P2013, vivify_197
    $P2013 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2013
  vivify_197:
    set $P2013["LEAVE"], $P107
.annotate 'line', 152
    new $P107, "String"
    assign $P107, ".CONTROL_EXIT"
    get_global $P2014, "%controltypes"
    unless_null $P2014, vivify_198
    $P2014 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2014
  vivify_198:
    set $P2014["EXIT"], $P107
.annotate 'line', 153
    new $P107, "String"
    assign $P107, ".CONTROL_NEXT"
    get_global $P2015, "%controltypes"
    unless_null $P2015, vivify_199
    $P2015 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2015
  vivify_199:
    set $P2015["NEXT"], $P107
.annotate 'line', 154
    new $P107, "String"
    assign $P107, ".CONTROL_LAST"
    get_global $P2016, "%controltypes"
    unless_null $P2016, vivify_200
    $P2016 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2016
  vivify_200:
    set $P2016["LAST"], $P107
.annotate 'line', 155
    new $P107, "String"
    assign $P107, ".CONTROL_REDO"
    get_global $P2017, "%controltypes"
    unless_null $P2017, vivify_201
    $P2017 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2017
  vivify_201:
    set $P2017["REDO"], $P107
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
.sub "shallow_clone_hash"  :subid("12_1312695743.39515") :outer("11_1312695743.39515")
    .param pmc param_1012
.annotate 'file', ''
.annotate 'line', 991
    .const 'Sub' $P1016 = "13_1312695743.39515" 
    capture_lex $P1016
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "%to_clone", param_1012
.annotate 'line', 992
    $P1014 = root_new ['parrot';'Hash']
    set $P1013, $P1014
    .lex "%ret", $P1013
.annotate 'line', 991
    find_lex $P104, "%ret"
.annotate 'line', 993
    find_lex $P105, "%to_clone"
    defined $I101, $P105
    unless $I101, for_undef_209
    iter $P104, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1020_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1020_test:
    unless $P104, loop1020_done
    shift $P106, $P104
  loop1020_redo:
    .const 'Sub' $P1016 = "13_1312695743.39515" 
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
  for_undef_209:
.annotate 'line', 991
    find_lex $P104, "%ret"
    .return ($P104)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1015"  :anon :subid("13_1312695743.39515") :outer("12_1312695743.39515")
    .param pmc param_1017
.annotate 'file', ''
.annotate 'line', 993
    .lex "$_", param_1017
.annotate 'line', 994
    find_lex $P107, "$_"
    find_lex $P1018, "%to_clone"
    unless_null $P1018, vivify_210
    $P1018 = root_new ['parrot';'Hash']
  vivify_210:
    set $P108, $P1018[$P107]
    unless_null $P108, vivify_211
    new $P108, "Undef"
  vivify_211:
    find_lex $P109, "$_"
    find_lex $P1019, "%ret"
    unless_null $P1019, vivify_212
    $P1019 = root_new ['parrot';'Hash']
    store_lex "%ret", $P1019
  vivify_212:
    set $P1019[$P109], $P108
.annotate 'line', 993
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("14_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', ''
.annotate 'line', 174
    .const 'Sub' $P1035 = "15_1312695743.39515" 
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
    unless_null $P107, vivify_213
    get_hll_global $P107, "$SUB"
    unless_null $P107, vivify_214
    die "Contextual $*SUB not found"
  vivify_214:
  vivify_213:
.annotate 'line', 183
    find_dynamic_lex $P107, "%*TEMPREGS"
    store_lex "%tempregs", $P107
.annotate 'line', 185
    .const 'Sub' $P1035 = "15_1312695743.39515" 
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
.sub "_block1034"  :anon :subid("15_1312695743.39515") :outer("14_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 186
    $P1037 = root_new ['parrot';'Hash']
    set $P1036, $P1037
    .lex "%*TEMPREGS", $P1036
.annotate 'line', 185
    find_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_215
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_216
    die "Contextual %*TEMPREGS not found"
  vivify_216:
  vivify_215:
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
.sub "escape"  :subid("16_1312695743.39515") :method :outer("11_1312695743.39515")
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
.sub "unique"  :subid("17_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1049 :optional
    .param int has_param_1049 :opt_flag
.annotate 'file', ''
.annotate 'line', 217
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
    if has_param_1049, optparam_217
    new $P106, "Undef"
    set param_1049, $P106
  optparam_217:
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
.sub "uniquereg"  :subid("18_1312695743.39515") :method :outer("11_1312695743.39515")
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
.sub "tempreg_frame"  :subid("19_1312695743.39515") :method :outer("11_1312695743.39515")
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
.annotate 'line', 245
    get_global $P106, "$TEMPREG_BASE"
    find_lex $P1065, "%tempregs"
    unless_null $P1065, vivify_218
    $P1065 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1065
  vivify_218:
    set $P1065["I"], $P106
.annotate 'line', 246
    get_global $P106, "$TEMPREG_BASE"
    find_lex $P1066, "%tempregs"
    unless_null $P1066, vivify_219
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1066
  vivify_219:
    set $P1066["N"], $P106
.annotate 'line', 247
    get_global $P106, "$TEMPREG_BASE"
    find_lex $P1067, "%tempregs"
    unless_null $P1067, vivify_220
    $P1067 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1067
  vivify_220:
    set $P1067["S"], $P106
.annotate 'line', 248
    get_global $P106, "$TEMPREG_BASE"
    find_lex $P1068, "%tempregs"
    unless_null $P1068, vivify_221
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1068
  vivify_221:
    set $P1068["P"], $P106
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
.sub "tempreg"  :subid("20_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1072
.annotate 'file', ''
.annotate 'line', 267
    new $P1071, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1071, control_1070
    push_eh $P1071
    .lex "self", self
    .lex "$rtype", param_1072
.annotate 'line', 272
    new $P106, "Undef"
    set $P1073, $P106
    .lex "$I0", $P1073
.annotate 'line', 279
    new $P107, "Undef"
    set $P1074, $P107
    .lex "$reg", $P1074
.annotate 'line', 280
    new $P108, "Undef"
    set $P1075, $P108
    .lex "$rnum", $P1075
.annotate 'line', 268
    find_lex $P109, "$rtype"
    if $P109, unless_1076_end
    find_lex $P110, "self"
    $P110."panic"("rtype not set")
  unless_1076_end:
.annotate 'line', 270
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
.annotate 'line', 272
    find_lex $P109, "$rtype"
    set $S101, $P109
    index $I101, "Ss~Nn+Ii", $S101
    new $P110, 'Integer'
    set $P110, $I101
    store_lex "$I0", $P110
.annotate 'line', 273
    new $P109, "String"
    assign $P109, "P"
    store_lex "$rtype", $P109
.annotate 'line', 274
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
.annotate 'line', 277
    find_dynamic_lex $P109, "%*TEMPREGS"
    unless_null $P109, vivify_222
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_223
    die "Contextual %*TEMPREGS not found"
  vivify_223:
  vivify_222:
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
.annotate 'line', 267
    find_lex $P109, "$reg"
.annotate 'line', 280
    find_lex $P109, "$rtype"
    find_dynamic_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_224
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_225
    die "Contextual %*TEMPREGS not found"
  vivify_225:
  vivify_224:
    set $P111, $P110[$P109]
    unless_null $P111, vivify_226
    new $P111, "Undef"
  vivify_226:
    store_lex "$rnum", $P111
.annotate 'line', 281
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1082_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
    goto loop1082_redo
  loop1082_test:
    find_lex $P109, "$reg"
    find_dynamic_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_227
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_228
    die "Contextual %*TEMPREGS not found"
  vivify_228:
  vivify_227:
    set $P111, $P110[$P109]
    unless_null $P111, vivify_229
    new $P111, "Undef"
  vivify_229:
    unless $P111, loop1082_done
  loop1082_redo:
.annotate 'line', 283
    find_lex $P112, "$rnum"
    set $N101, $P112
    get_global $P113, "$UNIQUE_BASE"
    set $N102, $P113
    isge $I101, $N101, $N102
    unless $I101, if_1080_end
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
  if_1080_end:
.annotate 'line', 281
    find_lex $P112, "$rnum"
    clone $P1081, $P112
    inc $P112
.annotate 'line', 286
    find_lex $P112, "$rnum"
    find_lex $P113, "$rtype"
    find_dynamic_lex $P114, "%*TEMPREGS"
    unless_null $P114, vivify_230
    get_hll_global $P114, "%TEMPREGS"
    unless_null $P114, vivify_231
    die "Contextual %*TEMPREGS not found"
  vivify_231:
    store_dynamic_lex "%*TEMPREGS", $P114
  vivify_230:
    set $P114[$P113], $P112
.annotate 'line', 287
    new $P112, "String"
    assign $P112, "$"
    find_lex $P113, "$rtype"
    concat $P114, $P112, $P113
    find_lex $P115, "$rnum"
    concat $P116, $P114, $P115
    store_lex "$reg", $P116
  loop1082_next:
.annotate 'line', 281
    goto loop1082_test
  loop1082_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1082_next
    eq $P113, .CONTROL_LOOP_REDO, loop1082_redo
  loop1082_done:
    pop_eh 
.annotate 'line', 267
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
.sub "coerce"  :subid("21_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1086
    .param pmc param_1087
.annotate 'file', ''
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
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("22_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1091
    .param pmc param_1092 :slurpy :named
.annotate 'file', ''
.annotate 'line', 439
    new $P1090, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1090, control_1089
    push_eh $P1090
    .lex "self", self
    .lex "$node", param_1091
    .lex "%options", param_1092
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
  control_1089:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("23_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,_)
    .param pmc param_1096
    .param pmc param_1097 :slurpy :named
.annotate 'file', ''
.annotate 'line', 576
    new $P1095, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1095, control_1094
    push_eh $P1095
    .lex "self", self
    .lex "$node", param_1096
    .lex "%options", param_1097
.annotate 'line', 577
    new $P106, "Undef"
    set $P1098, $P106
    .lex "$what", $P1098
.annotate 'line', 576
    find_lex $P107, "$what"
.annotate 'line', 579
    find_lex $P107, "$node"
    isnull $I101, $P107
    if $I101, if_1099
.annotate 'line', 583
    new $P108, "String"
    assign $P108, "node of type "
    find_lex $P109, "$node"
    typeof $S101, $P109
    concat $P110, $P108, $S101
    store_lex "$what", $P110
.annotate 'line', 582
    goto if_1099_end
  if_1099:
.annotate 'line', 580
    new $P108, "String"
    assign $P108, "a null node"
    store_lex "$what", $P108
  if_1099_end:
.annotate 'line', 586
    find_lex $P107, "self"
    new $P108, "String"
    assign $P108, "PAST::Compiler can't compile "
    find_lex $P109, "$what"
    concat $P110, $P108, $P109
    $P111 = $P107."panic"($P110)
.annotate 'line', 576
    .return ($P111)
  control_1094:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("24_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["Undef"])
    .param pmc param_1103
    .param pmc param_1104 :slurpy :named
.annotate 'file', ''
.annotate 'line', 592
    new $P1102, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1102, control_1101
    push_eh $P1102
    .lex "self", self
    .lex "$node", param_1103
    .lex "%options", param_1104
.annotate 'line', 593
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "self"
    $P108 = $P107."tempreg"("P")
    $P109 = $P106."new"($P108 :named("result"))
.annotate 'line', 592
    .return ($P109)
  control_1101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["Integer"])
    .param pmc param_1108
    .param pmc param_1109 :slurpy :named
.annotate 'file', ''
.annotate 'line', 603
    new $P1107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1107, control_1106
    push_eh $P1107
    .lex "self", self
    .lex "$node", param_1108
    .lex "%options", param_1109
.annotate 'line', 604
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$node"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1110, "%options"
    unless_null $P1110, vivify_232
    $P1110 = root_new ['parrot';'Hash']
  vivify_232:
    set $P110, $P1110["rtype"]
    unless_null $P110, vivify_233
    new $P110, "Undef"
  vivify_233:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 603
    .return ($P111)
  control_1106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("26_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["Float"])
    .param pmc param_1114
    .param pmc param_1115 :slurpy :named
.annotate 'file', ''
.annotate 'line', 607
    new $P1113, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1113, control_1112
    push_eh $P1113
    .lex "self", self
    .lex "$node", param_1114
    .lex "%options", param_1115
.annotate 'line', 608
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$node"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1116, "%options"
    unless_null $P1116, vivify_234
    $P1116 = root_new ['parrot';'Hash']
  vivify_234:
    set $P110, $P1116["rtype"]
    unless_null $P110, vivify_235
    new $P110, "Undef"
  vivify_235:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 607
    .return ($P111)
  control_1112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("27_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["String"])
    .param pmc param_1120
    .param pmc param_1121 :slurpy :named
.annotate 'file', ''
.annotate 'line', 611
    new $P1119, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1119, control_1118
    push_eh $P1119
    .lex "self", self
    .lex "$node", param_1120
    .lex "%options", param_1121
.annotate 'line', 612
    new $P106, "Undef"
    set $P1122, $P106
    .lex "$value", $P1122
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P107."escape"($P108)
    store_lex "$value", $P109
.annotate 'line', 613
    find_lex $P107, "self"
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$value"
    $P110 = $P108."new"($P109 :named("result"))
    find_lex $P1123, "%options"
    unless_null $P1123, vivify_236
    $P1123 = root_new ['parrot';'Hash']
  vivify_236:
    set $P111, $P1123["rtype"]
    unless_null $P111, vivify_237
    new $P111, "Undef"
  vivify_237:
    $P112 = $P107."coerce"($P110, $P111)
.annotate 'line', 611
    .return ($P112)
  control_1118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("28_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["String"])
    .param pmc param_1127
    .param pmc param_1128 :slurpy :named
.annotate 'file', ''
.annotate 'line', 622
    new $P1126, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1126, control_1125
    push_eh $P1126
    .lex "self", self
    .lex "$node", param_1127
    .lex "%options", param_1128
.annotate 'line', 623
    new $P106, "Undef"
    set $P1129, $P106
    .lex "$result", $P1129
.annotate 'line', 624
    new $P107, "Undef"
    set $P1130, $P107
    .lex "$s", $P1130
.annotate 'line', 623
    find_lex $P108, "self"
    $P109 = $P108."tempreg"("P")
    store_lex "$result", $P109
.annotate 'line', 624
    find_lex $P108, "self"
    find_lex $P109, "$node"
    $P110 = $P108."escape"($P109)
    store_lex "$s", $P110
.annotate 'line', 625
    get_hll_global $P108, ["POST"], "Op"
    find_lex $P109, "$result"
    find_lex $P110, "$s"
    find_lex $P111, "$result"
    $P112 = $P108."new"($P109, $P110, "new" :named("pirop"), $P111 :named("result"))
.annotate 'line', 622
    .return ($P112)
  control_1125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("29_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,_)
    .param pmc param_1134
    .param pmc param_1135 :slurpy :named
.annotate 'file', ''
.annotate 'line', 630
    new $P1133, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1133, control_1132
    push_eh $P1133
    .lex "self", self
    .lex "$node", param_1134
    .lex "%options", param_1135
.annotate 'line', 631
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."as_post"($P107, $P108 :flat)
.annotate 'line', 630
    .return ($P109)
  control_1132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Node"])
    .param pmc param_1139
    .param pmc param_1140 :slurpy :named
.annotate 'file', ''
.annotate 'line', 646
    new $P1138, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1138, control_1137
    push_eh $P1138
    .lex "self", self
    .lex "$node", param_1139
    .lex "%options", param_1140
.annotate 'line', 647
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."node_as_post"($P107, $P108)
.annotate 'line', 646
    .return ($P109)
  control_1137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("31_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1144
    .param pmc param_1145
.annotate 'file', ''
.annotate 'line', 651
    new $P1143, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1143, control_1142
    push_eh $P1143
    .lex "self", self
    .lex "$node", param_1144
    .lex "%options", param_1145
.annotate 'line', 652
    new $P106, "Undef"
    set $P1146, $P106
    .lex "$rtype", $P1146
.annotate 'line', 654
    new $P107, "Undef"
    set $P1147, $P107
    .lex "$signature", $P1147
.annotate 'line', 657
    new $P108, "Undef"
    set $P1148, $P108
    .lex "$ops", $P1148
.annotate 'line', 660
    new $P109, "Undef"
    set $P1149, $P109
    .lex "$eh", $P1149
.annotate 'line', 652
    find_lex $P1150, "%options"
    unless_null $P1150, vivify_238
    $P1150 = root_new ['parrot';'Hash']
  vivify_238:
    set $P110, $P1150["rtype"]
    unless_null $P110, vivify_239
    new $P110, "Undef"
  vivify_239:
    store_lex "$rtype", $P110
.annotate 'line', 654
    find_lex $P110, "$node"
    $P111 = $P110."list"()
    set $N101, $P111
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P112, 'String'
    set $P112, $S101
    store_lex "$signature", $P112
.annotate 'line', 655
    find_lex $P110, "$signature"
    find_lex $P111, "$rtype"
    concat $P112, $P110, $P111
    store_lex "$signature", $P112
.annotate 'line', 657
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$signature"
    $P113 = $P110."post_children"($P111, $P112 :named("signature"))
    store_lex "$ops", $P113
.annotate 'line', 658
    find_lex $P110, "$ops"
    find_lex $P1151, "$ops"
    unless_null $P1151, vivify_240
    $P1151 = root_new ['parrot';'ResizablePMCArray']
  vivify_240:
    set $P111, $P1151[-1]
    unless_null $P111, vivify_241
    new $P111, "Undef"
  vivify_241:
    $P110."result"($P111)
.annotate 'line', 660
    find_lex $P110, "$node"
    $P111 = $P110."handlers"()
    store_lex "$eh", $P111
.annotate 'line', 661
    find_lex $P110, "$eh"
    unless $P110, if_1152_end
    find_lex $P111, "self"
    find_lex $P112, "$ops"
    find_lex $P113, "$eh"
    find_lex $P114, "$rtype"
    $P115 = $P111."wrap_handlers"($P112, $P113, $P114 :named("rtype"))
    store_lex "$ops", $P115
  if_1152_end:
.annotate 'line', 651
    find_lex $P110, "$ops"
    .return ($P110)
  control_1142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Stmt"])
    .param pmc param_1156
    .param pmc param_1157 :slurpy :named
.annotate 'file', ''
.annotate 'line', 673
    .const 'Sub' $P1163 = "33_1312695743.39515" 
    capture_lex $P1163
    new $P1155, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1155, control_1154
    push_eh $P1155
    .lex "self", self
    .lex "$node", param_1156
    .lex "%options", param_1157
.annotate 'line', 674
    $P1159 = root_new ['parrot';'Hash']
    set $P1158, $P1159
    .lex "%outerregs", $P1158
.annotate 'line', 675
    new $P106, "Undef"
    set $P1160, $P106
    .lex "$post", $P1160
.annotate 'line', 683
    new $P107, "Undef"
    set $P1161, $P107
    .lex "$result", $P1161
.annotate 'line', 674
    find_dynamic_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_242
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_243
    die "Contextual %*TEMPREGS not found"
  vivify_243:
  vivify_242:
    store_lex "%outerregs", $P108
.annotate 'line', 673
    find_lex $P108, "$post"
.annotate 'line', 677
    .const 'Sub' $P1163 = "33_1312695743.39515" 
    capture_lex $P1163
    $P1163()
.annotate 'line', 683
    find_lex $P108, "$post"
    $P109 = $P108."result"()
    store_lex "$result", $P109
.annotate 'line', 685
    find_lex $P110, "%outerregs"
    if $P110, if_1169
    set $P109, $P110
    goto if_1169_end
  if_1169:
    find_lex $P1170, "%options"
    unless_null $P1170, vivify_246
    $P1170 = root_new ['parrot';'Hash']
  vivify_246:
    set $P111, $P1170["rtype"]
    unless_null $P111, vivify_247
    new $P111, "Undef"
  vivify_247:
    set $S101, $P111
    isne $I101, $S101, "v"
    new $P109, 'Integer'
    set $P109, $I101
  if_1169_end:
    if $P109, if_1168
    set $P108, $P109
    goto if_1168_end
  if_1168:
.annotate 'line', 686
    find_lex $P112, "$result"
    set $S102, $P112
    substr $S103, $S102, 0, 1
    iseq $I102, $S103, "$"
    new $P108, 'Integer'
    set $P108, $I102
  if_1168_end:
    unless $P108, if_1167_end
.annotate 'line', 688
    new $P113, "Integer"
    assign $P113, 1
    find_lex $P114, "$result"
    find_lex $P1171, "%outerregs"
    unless_null $P1171, vivify_248
    $P1171 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1171
  vivify_248:
    set $P1171[$P114], $P113
  if_1167_end:
.annotate 'line', 673
    find_lex $P108, "$post"
    .return ($P108)
  control_1154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1162"  :anon :subid("33_1312695743.39515") :outer("32_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 678
    $P1165 = root_new ['parrot';'Hash']
    set $P1164, $P1165
    .lex "%*TEMPREGS", $P1164
.annotate 'line', 677
    find_lex $P108, "%*TEMPREGS"
    unless_null $P108, vivify_244
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_245
    die "Contextual %*TEMPREGS not found"
  vivify_245:
  vivify_244:
.annotate 'line', 679
    find_lex $P108, "%outerregs"
    unless $P108, if_1166_end
    find_lex $P109, "%outerregs"
    clone $P110, $P109
    store_lex "%*TEMPREGS", $P110
  if_1166_end:
.annotate 'line', 680
    find_lex $P108, "self"
    find_lex $P109, "$node"
    find_lex $P110, "%options"
    $P111 = $P108."node_as_post"($P109, $P110)
    store_lex "$post", $P111
.annotate 'line', 677
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("34_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Control"])
    .param pmc param_1175
    .param pmc param_1176 :slurpy :named
.annotate 'file', ''
.annotate 'line', 700
    new $P1174, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1174, control_1173
    push_eh $P1174
    .lex "self", self
    .lex "$node", param_1175
    .lex "%options", param_1176
.annotate 'line', 702
    $P1178 = root_new ['parrot';'Hash']
    set $P1177, $P1178
    .lex "%*TEMPREGS", $P1177
.annotate 'line', 704
    new $P106, "Undef"
    set $P1179, $P106
    .lex "$ishandled", $P1179
.annotate 'line', 705
    new $P107, "Undef"
    set $P1180, $P107
    .lex "$nothandled", $P1180
.annotate 'line', 707
    new $P108, "Undef"
    set $P1181, $P108
    .lex "$ops", $P1181
.annotate 'line', 709
    new $P109, "Undef"
    set $P1182, $P109
    .lex "$signature", $P1182
.annotate 'line', 714
    new $P110, "Undef"
    set $P1183, $P110
    .lex "$children", $P1183
.annotate 'line', 716
    new $P111, "Undef"
    set $P1184, $P111
    .lex "$handled", $P1184
.annotate 'line', 700
    find_lex $P112, "%*TEMPREGS"
    unless_null $P112, vivify_249
    get_hll_global $P112, "%TEMPREGS"
    unless_null $P112, vivify_250
    die "Contextual %*TEMPREGS not found"
  vivify_250:
  vivify_249:
.annotate 'line', 704
    get_hll_global $P112, ["POST"], "Label"
    find_lex $P113, "self"
    $P114 = $P113."unique"("handled_")
    $P115 = $P112."new"($P114 :named("result"))
    store_lex "$ishandled", $P115
.annotate 'line', 705
    get_hll_global $P112, ["POST"], "Label"
    find_lex $P113, "self"
    $P114 = $P113."unique"("nothandled_")
    $P115 = $P112."new"($P114 :named("result"))
    store_lex "$nothandled", $P115
.annotate 'line', 707
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 709
    find_lex $P112, "$node"
    $P113 = $P112."list"()
    set $N101, $P113
    set $I101, $N101
    repeat $S101, "v", $I101
    new $P114, 'String'
    set $P114, $S101
    store_lex "$signature", $P114
.annotate 'line', 710
    find_lex $P112, "$signature"
    find_lex $P1185, "%options"
    unless_null $P1185, vivify_251
    $P1185 = root_new ['parrot';'Hash']
  vivify_251:
    set $P113, $P1185["rtype"]
    unless_null $P113, vivify_252
    new $P113, "Undef"
  vivify_252:
    concat $P114, $P112, $P113
    store_lex "$signature", $P114
.annotate 'line', 712
    find_lex $P112, "$ops"
    $P112."push_pirop"(".local pmc exception")
.annotate 'line', 713
    find_lex $P112, "$ops"
    $P112."push_pirop"(".get_results (exception)")
.annotate 'line', 714
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$signature"
    $P115 = $P112."post_children"($P113, $P114 :named("signature"))
    store_lex "$children", $P115
.annotate 'line', 715
    find_lex $P112, "$ops"
    find_lex $P113, "$children"
    $P112."push"($P113)
.annotate 'line', 716
    find_lex $P112, "self"
    $P113 = $P112."uniquereg"("I")
    store_lex "$handled", $P113
.annotate 'line', 718
    find_lex $P112, "$ops"
    find_lex $P113, "$handled"
    $P112."push_pirop"("set", $P113, "exception[\"handled\"]")
.annotate 'line', 719
    find_lex $P112, "$ops"
    find_lex $P113, "$handled"
    find_lex $P114, "$nothandled"
    $P112."push_pirop"("ne", $P113, 1, $P114)
.annotate 'line', 720
    find_lex $P112, "$ops"
    find_lex $P113, "$ishandled"
    $P112."push"($P113)
.annotate 'line', 721
    find_lex $P112, "$ops"
    $P112."push_pirop"("return", "exception")
.annotate 'line', 722
    find_lex $P112, "$ops"
    find_lex $P113, "$nothandled"
    $P112."push"($P113)
.annotate 'line', 723
    find_lex $P112, "$ops"
    $P112."push_pirop"("rethrow", "exception")
.annotate 'line', 700
    find_lex $P112, "$ops"
    .return ($P112)
  control_1173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("35_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1189
    .param pmc param_1190
    .param pmc param_1191 :slurpy :named
.annotate 'file', ''
.annotate 'line', 727
    .const 'Sub' $P1201 = "36_1312695743.39515" 
    capture_lex $P1201
    new $P1188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1188, control_1187
    push_eh $P1188
    .lex "self", self
    .lex "$child", param_1189
    .lex "$ehs", param_1190
    .lex "%options", param_1191
.annotate 'line', 728
    new $P106, "Undef"
    set $P1192, $P106
    .lex "$rtype", $P1192
.annotate 'line', 731
    $P1194 = root_new ['parrot';'Hash']
    set $P1193, $P1194
    .lex "%*TEMPREGS", $P1193
.annotate 'line', 733
    new $P107, "Undef"
    set $P1195, $P107
    .lex "$ops", $P1195
.annotate 'line', 734
    new $P108, "Undef"
    set $P1196, $P108
    .lex "$pops", $P1196
.annotate 'line', 735
    new $P109, "Undef"
    set $P1197, $P109
    .lex "$tail", $P1197
.annotate 'line', 736
    new $P110, "Undef"
    set $P1198, $P110
    .lex "$skip", $P1198
.annotate 'line', 728
    find_lex $P1199, "%options"
    unless_null $P1199, vivify_253
    $P1199 = root_new ['parrot';'Hash']
  vivify_253:
    set $P111, $P1199["rtype"]
    unless_null $P111, vivify_254
    new $P111, "Undef"
  vivify_254:
    store_lex "$rtype", $P111
.annotate 'line', 727
    find_lex $P111, "%*TEMPREGS"
    unless_null $P111, vivify_255
    get_hll_global $P111, "%TEMPREGS"
    unless_null $P111, vivify_256
    die "Contextual %*TEMPREGS not found"
  vivify_256:
  vivify_255:
.annotate 'line', 733
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$ops", $P112
.annotate 'line', 734
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$pops", $P112
.annotate 'line', 735
    get_hll_global $P111, ["POST"], "Ops"
    $P112 = $P111."new"()
    store_lex "$tail", $P112
.annotate 'line', 736
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("skip_handler_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$skip", $P114
.annotate 'line', 738
    find_lex $P112, "$ehs"
    defined $I101, $P112
    unless $I101, for_undef_257
    iter $P111, $P112
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1221_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1221_test:
    unless $P111, loop1221_done
    shift $P113, $P111
  loop1221_redo:
    .const 'Sub' $P1201 = "36_1312695743.39515" 
    capture_lex $P1201
    $P1201($P113)
  loop1221_next:
    goto loop1221_test
  loop1221_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1221_next
    eq $P119, .CONTROL_LOOP_REDO, loop1221_redo
  loop1221_done:
    pop_eh 
  for_undef_257:
.annotate 'line', 771
    find_lex $P111, "$ops"
    find_lex $P112, "$child"
    $P111."push"($P112)
.annotate 'line', 773
    find_lex $P111, "$ops"
    find_lex $P112, "$pops"
    $P111."push"($P112)
.annotate 'line', 774
    find_lex $P111, "$ops"
    find_lex $P112, "$skip"
    $P111."push_pirop"("goto", $P112)
.annotate 'line', 775
    find_lex $P111, "$ops"
    find_lex $P112, "$tail"
    $P111."push"($P112)
.annotate 'line', 776
    find_lex $P111, "$ops"
    find_lex $P112, "$skip"
    $P111."push"($P112)
.annotate 'line', 727
    find_lex $P111, "$ops"
    .return ($P111)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1200"  :anon :subid("36_1312695743.39515") :outer("35_1312695743.39515")
    .param pmc param_1206
.annotate 'file', ''
.annotate 'line', 738
    .const 'Sub' $P1218 = "38_1312695743.39515" 
    capture_lex $P1218
    .const 'Sub' $P1211 = "37_1312695743.39515" 
    capture_lex $P1211
.annotate 'line', 739
    new $P114, "Undef"
    set $P1202, $P114
    .lex "$node", $P1202
.annotate 'line', 740
    new $P115, "Undef"
    set $P1203, $P115
    .lex "$label", $P1203
.annotate 'line', 741
    new $P116, "Undef"
    set $P1204, $P116
    .lex "$ehreg", $P1204
.annotate 'line', 746
    new $P117, "Undef"
    set $P1205, $P117
    .lex "$type", $P1205
    .lex "$_", param_1206
.annotate 'line', 739
    find_lex $P118, "$_"
    store_lex "$node", $P118
.annotate 'line', 740
    get_hll_global $P118, ["POST"], "Label"
    find_lex $P119, "self"
    $P120 = $P119."unique"("control_")
    $P121 = $P118."new"($P120 :named("result"))
    store_lex "$label", $P121
.annotate 'line', 741
    find_lex $P118, "self"
    $P119 = $P118."uniquereg"("P")
    store_lex "$ehreg", $P119
.annotate 'line', 743
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    $P118."push_pirop"("new", $P119, "'ExceptionHandler'")
.annotate 'line', 744
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    find_lex $P120, "$label"
    $P118."push_pirop"("set_label", $P119, $P120)
.annotate 'line', 746
    find_lex $P118, "$node"
    $P119 = $P118."handle_types"()
    store_lex "$type", $P119
.annotate 'line', 747
    find_lex $P119, "$type"
    if $P119, if_1208
    set $P118, $P119
    goto if_1208_end
  if_1208:
    find_lex $P120, "$type"
    get_global $P1209, "%controltypes"
    unless_null $P1209, vivify_258
    $P1209 = root_new ['parrot';'Hash']
  vivify_258:
    set $P121, $P1209[$P120]
    unless_null $P121, vivify_259
    new $P121, "Undef"
  vivify_259:
    store_lex "$type", $P121
    set $P118, $P121
  if_1208_end:
    unless $P118, if_1207_end
    .const 'Sub' $P1211 = "37_1312695743.39515" 
    capture_lex $P1211
    $P1211()
  if_1207_end:
.annotate 'line', 753
    find_lex $P118, "$node"
    $P119 = $P118."handle_types_except"()
    store_lex "$type", $P119
.annotate 'line', 754
    find_lex $P119, "$type"
    if $P119, if_1215
    set $P118, $P119
    goto if_1215_end
  if_1215:
    find_lex $P120, "$type"
    get_global $P1216, "%controltypes"
    unless_null $P1216, vivify_262
    $P1216 = root_new ['parrot';'Hash']
  vivify_262:
    set $P121, $P1216[$P120]
    unless_null $P121, vivify_263
    new $P121, "Undef"
  vivify_263:
    store_lex "$type", $P121
    set $P118, $P121
  if_1215_end:
    unless $P118, if_1214_end
    .const 'Sub' $P1218 = "38_1312695743.39515" 
    capture_lex $P1218
    $P1218()
  if_1214_end:
.annotate 'line', 761
    find_lex $P118, "$ops"
    find_lex $P119, "$ehreg"
    $P118."push_pirop"("push_eh", $P119)
.annotate 'line', 764
    find_lex $P118, "$pops"
    $P118."push_pirop"("pop_eh")
.annotate 'line', 767
    find_lex $P118, "$tail"
    find_lex $P119, "$label"
    $P118."push"($P119)
.annotate 'line', 768
    find_lex $P118, "$tail"
    find_lex $P119, "self"
    find_lex $P120, "$node"
    find_lex $P121, "$rtype"
    $P122 = $P119."as_post"($P120, $P121 :named("rtype"))
    $P123 = $P118."push"($P122)
.annotate 'line', 738
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1210"  :anon :subid("37_1312695743.39515") :outer("36_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 748
    $P1213 = root_new ['parrot';'ResizablePMCArray']
    set $P1212, $P1213
    .lex "@types", $P1212
    find_lex $P122, "$type"
    set $S101, $P122
    split $P123, ",", $S101
    store_lex "@types", $P123
.annotate 'line', 749
    find_lex $P122, "$ops"
    find_lex $P123, "$ehreg"
    find_lex $P124, "@types"
    $P122."push_pirop"("callmethod", "\"handle_types\"", $P123, $P124 :flat)
.annotate 'line', 750
    find_dynamic_lex $P122, "$*SUB"
    unless_null $P122, vivify_260
    get_hll_global $P122, "$SUB"
    unless_null $P122, vivify_261
    die "Contextual $*SUB not found"
  vivify_261:
  vivify_260:
    $P123 = $P122."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 747
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1217"  :anon :subid("38_1312695743.39515") :outer("36_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 755
    $P1220 = root_new ['parrot';'ResizablePMCArray']
    set $P1219, $P1220
    .lex "@types", $P1219
    find_lex $P122, "$type"
    set $S101, $P122
    split $P123, ",", $S101
    store_lex "@types", $P123
.annotate 'line', 756
    find_lex $P122, "$ops"
    find_lex $P123, "$ehreg"
    find_lex $P124, "@types"
    $P122."push_pirop"("callmethod", "\"handle_types_except\"", $P123, $P124 :flat)
.annotate 'line', 758
    find_dynamic_lex $P122, "$*SUB"
    unless_null $P122, vivify_264
    get_hll_global $P122, "$SUB"
    unless_null $P122, vivify_265
    die "Contextual $*SUB not found"
  vivify_265:
  vivify_264:
    $P123 = $P122."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 754
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("39_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Block"])
    .param pmc param_1225
    .param pmc param_1226 :slurpy :named
.annotate 'file', ''
.annotate 'line', 786
    .const 'Sub' $P1250 = "40_1312695743.39515" 
    capture_lex $P1250
    new $P1224, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1224, control_1223
    push_eh $P1224
    .lex "self", self
    .lex "$node", param_1225
    .lex "%options", param_1226
.annotate 'line', 790
    new $P106, "Undef"
    set $P1227, $P106
    .lex "$name", $P1227
.annotate 'line', 791
    new $P107, "Undef"
    set $P1228, $P107
    .lex "$pirflags", $P1228
.annotate 'line', 792
    new $P108, "Undef"
    set $P1229, $P108
    .lex "$blocktype", $P1229
.annotate 'line', 793
    new $P109, "Undef"
    set $P1230, $P109
    .lex "$nsentry", $P1230
.annotate 'line', 794
    new $P110, "Undef"
    set $P1231, $P110
    .lex "$subid", $P1231
.annotate 'line', 795
    new $P111, "Undef"
    set $P1232, $P111
    .lex "$ns", $P1232
.annotate 'line', 796
    new $P112, "Undef"
    set $P1233, $P112
    .lex "$hll", $P1233
.annotate 'line', 797
    new $P113, "Undef"
    set $P1234, $P113
    .lex "$multi", $P1234
.annotate 'line', 798
    new $P114, "Undef"
    set $P1235, $P114
    .lex "$loadlibs", $P1235
.annotate 'line', 823
    new $P115, "Undef"
    set $P1236, $P115
    .lex "$bpost", $P1236
.annotate 'line', 831
    new $P116, "Undef"
    set $P1237, $P116
    .lex "$blockreg", $P1237
.annotate 'line', 832
    new $P117, "Undef"
    set $P1238, $P117
    .lex "$blockref", $P1238
.annotate 'line', 837
    new $P118, "Undef"
    set $P1239, $P118
    .lex "$outerpost", $P1239
.annotate 'line', 788
    find_dynamic_lex $P119, "@*BLOCKPAST"
    unless_null $P119, vivify_266
    get_hll_global $P119, "@BLOCKPAST"
    unless_null $P119, vivify_267
    die "Contextual @*BLOCKPAST not found"
  vivify_267:
  vivify_266:
    find_lex $P120, "$node"
    unshift $P119, $P120
.annotate 'line', 790
    find_lex $P119, "$node"
    $P120 = $P119."name"()
    store_lex "$name", $P120
.annotate 'line', 791
    find_lex $P119, "$node"
    $P120 = $P119."pirflags"()
    store_lex "$pirflags", $P120
.annotate 'line', 792
    find_lex $P119, "$node"
    $P120 = $P119."blocktype"()
    store_lex "$blocktype", $P120
.annotate 'line', 793
    find_lex $P119, "$node"
    $P120 = $P119."nsentry"()
    store_lex "$nsentry", $P120
.annotate 'line', 794
    find_lex $P119, "$node"
    $P120 = $P119."subid"()
    store_lex "$subid", $P120
.annotate 'line', 795
    find_lex $P119, "$node"
    $P120 = $P119."namespace"()
    store_lex "$ns", $P120
.annotate 'line', 796
    find_lex $P119, "$node"
    $P120 = $P119."hll"()
    store_lex "$hll", $P120
.annotate 'line', 797
    find_lex $P119, "$node"
    $P120 = $P119."multi"()
    store_lex "$multi", $P120
.annotate 'line', 798
    find_lex $P119, "$node"
    $P120 = $P119."loadlibs"()
    store_lex "$loadlibs", $P120
.annotate 'line', 801
    find_lex $P119, "$name"
    defined $I101, $P119
    if $I101, unless_1240_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$name", $P120
  unless_1240_end:
.annotate 'line', 802
    find_lex $P119, "$pirflags"
    defined $I101, $P119
    if $I101, unless_1241_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$pirflags", $P120
  unless_1241_end:
.annotate 'line', 803
    find_lex $P119, "$blocktype"
    defined $I101, $P119
    if $I101, unless_1242_end
    new $P120, "String"
    assign $P120, ""
    store_lex "$blocktype", $P120
  unless_1242_end:
.annotate 'line', 806
    find_lex $P119, "$nsentry"
    defined $I101, $P119
    unless $I101, if_1243_end
.annotate 'line', 807
    find_lex $P120, "$nsentry"
    if $P120, if_1244
.annotate 'line', 812
    find_lex $P121, "$pirflags"
    concat $P122, $P121, " :anon"
    store_lex "$pirflags", $P122
.annotate 'line', 811
    goto if_1244_end
  if_1244:
.annotate 'line', 809
    find_lex $P121, "$pirflags"
    concat $P122, $P121, " :nsentry("
    find_lex $P123, "self"
    find_lex $P124, "$nsentry"
    $S101 = $P123."escape"($P124)
    concat $P125, $P122, $S101
    concat $P126, $P125, ")"
    store_lex "$pirflags", $P126
  if_1244_end:
  if_1243_end:
.annotate 'line', 817
    find_lex $P119, "$name"
    if $P119, unless_1245_end
.annotate 'line', 818
    find_lex $P120, "self"
    $P121 = $P120."unique"("_block")
    store_lex "$name", $P121
.annotate 'line', 819
    find_lex $P121, "$ns"
    unless $P121, unless_1247
    set $P120, $P121
    goto unless_1247_end
  unless_1247:
    find_lex $P122, "$nsentry"
    set $P120, $P122
  unless_1247_end:
    if $P120, unless_1246_end
    find_lex $P123, "$pirflags"
    concat $P124, $P123, " :anon"
    store_lex "$pirflags", $P124
  unless_1246_end:
  unless_1245_end:
.annotate 'line', 823
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
.annotate 'line', 828
    find_lex $P119, "$pirflags"
    unless $P119, if_1248_end
    find_lex $P120, "$bpost"
    find_lex $P121, "$pirflags"
    $P120."pirflags"($P121)
  if_1248_end:
.annotate 'line', 831
    find_lex $P119, "self"
    $P120 = $P119."uniquereg"("P")
    store_lex "$blockreg", $P120
.annotate 'line', 832
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
.annotate 'line', 837
    find_dynamic_lex $P119, "$*SUB"
    unless_null $P119, vivify_268
    get_hll_global $P119, "$SUB"
    unless_null $P119, vivify_269
    die "Contextual $*SUB not found"
  vivify_269:
  vivify_268:
    store_lex "$outerpost", $P119
.annotate 'line', 838
    .const 'Sub' $P1250 = "40_1312695743.39515" 
    capture_lex $P1250
    $P1250()
.annotate 'line', 987
    find_dynamic_lex $P119, "@*BLOCKPAST"
    unless_null $P119, vivify_292
    get_hll_global $P119, "@BLOCKPAST"
    unless_null $P119, vivify_293
    die "Contextual @*BLOCKPAST not found"
  vivify_293:
  vivify_292:
    shift $P120, $P119
.annotate 'line', 786
    find_lex $P119, "$bpost"
    .return ($P119)
  control_1223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1249"  :anon :subid("40_1312695743.39515") :outer("39_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 838
    .const 'Sub' $P1322 = "48_1312695743.39515" 
    capture_lex $P1322
    .const 'Sub' $P1311 = "47_1312695743.39515" 
    capture_lex $P1311
    .const 'Sub' $P1305 = "46_1312695743.39515" 
    capture_lex $P1305
    .const 'Sub' $P1280 = "43_1312695743.39515" 
    capture_lex $P1280
    .const 'Sub' $P1271 = "42_1312695743.39515" 
    capture_lex $P1271
    .const 'Sub' $P1264 = "41_1312695743.39515" 
    capture_lex $P1264
.annotate 'line', 839
    new $P119, "Undef"
    set $P1251, $P119
    .lex "$*SUB", $P1251
.annotate 'line', 841
    new $P120, "Undef"
    set $P1252, $P120
    .lex "$islexical", $P1252
.annotate 'line', 855
    $P1254 = root_new ['parrot';'Hash']
    set $P1253, $P1254
    .lex "%outersym", $P1253
.annotate 'line', 856
    $P1256 = root_new ['parrot';'Hash']
    set $P1255, $P1256
    .lex "%symtable", $P1255
.annotate 'line', 874
    $P1258 = root_new ['parrot';'Hash']
    set $P1257, $P1258
    .lex "%outerregs", $P1257
.annotate 'line', 876
    new $P121, "Undef"
    set $P1259, $P121
    .lex "$compiler", $P1259
.annotate 'line', 957
    new $P122, "Undef"
    set $P1260, $P122
    .lex "$rtype", $P1260
.annotate 'line', 839
    find_lex $P123, "$bpost"
    store_lex "$*SUB", $P123
.annotate 'line', 841
    find_lex $P123, "$node"
    $P124 = $P123."lexical"()
    store_lex "$islexical", $P124
.annotate 'line', 842
    find_lex $P123, "$islexical"
    unless $P123, if_1261_end
.annotate 'line', 843
    find_lex $P124, "$bpost"
    find_lex $P125, "$outerpost"
    $P124."outer"($P125)
.annotate 'line', 846
    find_lex $P124, "$outerpost"
    defined $I101, $P124
    unless $I101, if_1262_end
    .const 'Sub' $P1264 = "41_1312695743.39515" 
    capture_lex $P1264
    $P1264()
  if_1262_end:
  if_1261_end:
.annotate 'line', 855
    find_lex $P123, "self"
    getattribute $P1266, $P123, "%!symtable"
    unless_null $P1266, vivify_270
    $P1266 = root_new ['parrot';'Hash']
  vivify_270:
    store_lex "%outersym", $P1266
.annotate 'line', 856
    find_lex $P123, "%outersym"
    store_lex "%symtable", $P123
.annotate 'line', 858
    find_lex $P123, "$node"
    $P124 = $P123."symtable"()
    unless $P124, if_1267_end
.annotate 'line', 861
    find_lex $P125, "$node"
    $P126 = $P125."symtable"()
    store_lex "%symtable", $P126
.annotate 'line', 862
    find_lex $P1269, "%symtable"
    unless_null $P1269, vivify_271
    $P1269 = root_new ['parrot';'Hash']
  vivify_271:
    set $P125, $P1269[""]
    unless_null $P125, vivify_272
    new $P125, "Undef"
  vivify_272:
    defined $I101, $P125
    if $I101, unless_1268_end
.annotate 'line', 864
    find_lex $P126, "%symtable"
    $P127 = "shallow_clone_hash"($P126)
    store_lex "%symtable", $P127
.annotate 'line', 865
    find_lex $P127, "%outersym"
    defined $I102, $P127
    unless $I102, for_undef_273
    iter $P126, $P127
    new $P129, 'ExceptionHandler'
    set_label $P129, loop1276_handler
    $P129."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P129
  loop1276_test:
    unless $P126, loop1276_done
    shift $P128, $P126
  loop1276_redo:
    .const 'Sub' $P1271 = "42_1312695743.39515" 
    capture_lex $P1271
    $P1271($P128)
  loop1276_next:
    goto loop1276_test
  loop1276_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P131, exception, 'type'
    eq $P131, .CONTROL_LOOP_NEXT, loop1276_next
    eq $P131, .CONTROL_LOOP_REDO, loop1276_redo
  loop1276_done:
    pop_eh 
  for_undef_273:
  unless_1268_end:
  if_1267_end:
.annotate 'line', 871
    find_lex $P123, "%symtable"
    find_lex $P124, "self"
    setattribute $P124, "%!symtable", $P123
.annotate 'line', 874
    find_dynamic_lex $P123, "%*TEMPREGS"
    unless_null $P123, vivify_277
    get_hll_global $P123, "%TEMPREGS"
    unless_null $P123, vivify_278
    die "Contextual %*TEMPREGS not found"
  vivify_278:
  vivify_277:
    store_lex "%outerregs", $P123
.annotate 'line', 876
    find_lex $P123, "$node"
    $P124 = $P123."compiler"()
    store_lex "$compiler", $P124
.annotate 'line', 877
    find_lex $P123, "$compiler"
    if $P123, if_1277
.annotate 'line', 884
    .const 'Sub' $P1280 = "43_1312695743.39515" 
    capture_lex $P1280
    $P1280()
    goto if_1277_end
  if_1277:
.annotate 'line', 880
    find_lex $P124, "$bpost"
    find_lex $P125, "$compiler"
    $P124."compiler"($P125)
.annotate 'line', 881
    find_lex $P124, "$bpost"
    find_lex $P125, "$node"
    $P126 = $P125."compiler_args"()
    $P124."compiler_args"($P126)
.annotate 'line', 882
    find_lex $P124, "$bpost"
    find_lex $P1278, "$node"
    unless_null $P1278, vivify_285
    $P1278 = root_new ['parrot';'ResizablePMCArray']
  vivify_285:
    set $P125, $P1278[0]
    unless_null $P125, vivify_286
    new $P125, "Undef"
  vivify_286:
    $P124."push"($P125)
  if_1277_end:
.annotate 'line', 944
    find_lex $P123, "$node"
    exists $I101, $P123["loadinit"]
    unless $I101, if_1303_end
    .const 'Sub' $P1305 = "46_1312695743.39515" 
    capture_lex $P1305
    $P1305()
  if_1303_end:
.annotate 'line', 954
    find_lex $P123, "%outersym"
    find_lex $P124, "self"
    setattribute $P124, "%!symtable", $P123
.annotate 'line', 957
    find_lex $P1308, "%options"
    unless_null $P1308, vivify_288
    $P1308 = root_new ['parrot';'Hash']
  vivify_288:
    set $P123, $P1308["rtype"]
    unless_null $P123, vivify_289
    new $P123, "Undef"
  vivify_289:
    store_lex "$rtype", $P123
.annotate 'line', 959
    find_lex $P124, "$blocktype"
    set $S101, $P124
    iseq $I101, $S101, "immediate"
    if $I101, if_1309
.annotate 'line', 968
    find_lex $P128, "$rtype"
    set $S102, $P128
    isne $I102, $S102, "v"
    if $I102, if_1318
    new $P127, 'Integer'
    set $P127, $I102
    goto if_1318_end
  if_1318:
.annotate 'line', 969
    get_hll_global $P129, ["POST"], "Ops"
    find_lex $P131, "$bpost"
    find_lex $P132, "$node"
    find_lex $P133, "$blockreg"
    $P134 = $P129."new"($P131, $P132 :named("node"), $P133 :named("result"))
    store_lex "$bpost", $P134
.annotate 'line', 970
    find_lex $P129, "$bpost"
    find_lex $P131, "$blockref"
    find_lex $P132, "$blockreg"
    $P129."push_pirop"($P131, $P132 :named("result"))
.annotate 'line', 971
    find_lex $P131, "$islexical"
    if $P131, if_1319
    set $P129, $P131
    goto if_1319_end
  if_1319:
.annotate 'line', 972
    find_lex $P133, "$node"
    $P134 = $P133."closure"()
    if $P134, if_1320
.annotate 'line', 980
    find_lex $P137, "$bpost"
    find_lex $P139, "$blockreg"
    $P140 = $P137."push_pirop"("capture_lex", $P139)
.annotate 'line', 979
    set $P132, $P140
.annotate 'line', 972
    goto if_1320_end
  if_1320:
    .const 'Sub' $P1322 = "48_1312695743.39515" 
    capture_lex $P1322
    $P136 = $P1322()
    set $P132, $P136
  if_1320_end:
.annotate 'line', 971
    set $P129, $P132
  if_1319_end:
.annotate 'line', 968
    set $P127, $P129
  if_1318_end:
    set $P123, $P127
.annotate 'line', 959
    goto if_1309_end
  if_1309:
    .const 'Sub' $P1311 = "47_1312695743.39515" 
    capture_lex $P1311
    $P126 = $P1311()
    set $P123, $P126
  if_1309_end:
.annotate 'line', 838
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1263"  :anon :subid("41_1312695743.39515") :outer("40_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 847
    new $P125, "Undef"
    set $P1265, $P125
    .lex "$cpost", $P1265
    get_hll_global $P126, ["POST"], "Ops"
    find_lex $P127, "$blockreg"
    $P128 = $P126."new"($P127 :named("result"))
    store_lex "$cpost", $P128
.annotate 'line', 848
    find_lex $P126, "$cpost"
    find_lex $P127, "$blockref"
    $P126."push_pirop"($P127)
.annotate 'line', 849
    find_lex $P126, "$cpost"
    find_lex $P127, "$blockreg"
    $P126."push_pirop"("capture_lex", $P127)
.annotate 'line', 850
    find_lex $P126, "$outerpost"
    find_lex $P127, "$cpost"
    $P128 = $P126."unshift"($P127)
.annotate 'line', 846
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1270"  :anon :subid("42_1312695743.39515") :outer("40_1312695743.39515")
    .param pmc param_1272
.annotate 'file', ''
.annotate 'line', 865
    .lex "$_", param_1272
.annotate 'line', 866
    find_lex $P130, "$_"
    find_lex $P129, "%symtable"
    exists $I103, $P129[$P130]
    unless $I103, if_1273_end
    die 0, .CONTROL_LOOP_NEXT
  if_1273_end:
.annotate 'line', 867
    find_lex $P129, "$_"
    find_lex $P1274, "%outersym"
    unless_null $P1274, vivify_274
    $P1274 = root_new ['parrot';'Hash']
  vivify_274:
    set $P130, $P1274[$P129]
    unless_null $P130, vivify_275
    new $P130, "Undef"
  vivify_275:
    find_lex $P131, "$_"
    find_lex $P1275, "%symtable"
    unless_null $P1275, vivify_276
    $P1275 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1275
  vivify_276:
    set $P1275[$P131], $P130
.annotate 'line', 865
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1279"  :anon :subid("43_1312695743.39515") :outer("40_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 884
    .const 'Sub' $P1300 = "45_1312695743.39515" 
    capture_lex $P1300
    .const 'Sub' $P1292 = "44_1312695743.39515" 
    capture_lex $P1292
.annotate 'line', 887
    $P1282 = root_new ['parrot';'Hash']
    set $P1281, $P1282
    .lex "%*TEMPREGS", $P1281
.annotate 'line', 896
    new $P124, "Undef"
    set $P1283, $P124
    .lex "$ctrlpast", $P1283
.annotate 'line', 897
    new $P125, "Undef"
    set $P1284, $P125
    .lex "$ctrllabel", $P1284
.annotate 'line', 910
    new $P126, "Undef"
    set $P1285, $P126
    .lex "$sig", $P1285
.annotate 'line', 912
    new $P127, "Undef"
    set $P1286, $P127
    .lex "$ops", $P1286
.annotate 'line', 914
    new $P128, "Undef"
    set $P1287, $P128
    .lex "$retval", $P1287
.annotate 'line', 916
    new $P129, "Undef"
    set $P1288, $P129
    .lex "$eh", $P1288
.annotate 'line', 884
    find_lex $P130, "%*TEMPREGS"
    unless_null $P130, vivify_279
    get_hll_global $P130, "%TEMPREGS"
    unless_null $P130, vivify_280
    die "Contextual %*TEMPREGS not found"
  vivify_280:
  vivify_279:
.annotate 'line', 888
    find_lex $P130, "$node"
    $P131 = $P130."tempregs"()
    if $P131, if_1289
.annotate 'line', 892
    find_lex $P132, "%outerregs"
    store_lex "%*TEMPREGS", $P132
.annotate 'line', 891
    goto if_1289_end
  if_1289:
.annotate 'line', 889
    find_lex $P132, "self"
    $P133 = $P132."tempreg_frame"()
    store_lex "%*TEMPREGS", $P133
  if_1289_end:
.annotate 'line', 896
    find_lex $P130, "$node"
    $P131 = $P130."control"()
    store_lex "$ctrlpast", $P131
.annotate 'line', 884
    find_lex $P130, "$ctrllabel"
.annotate 'line', 899
    find_lex $P130, "$ctrlpast"
    unless $P130, if_1290_end
    .const 'Sub' $P1292 = "44_1312695743.39515" 
    capture_lex $P1292
    $P1292()
  if_1290_end:
.annotate 'line', 910
    find_lex $P130, "$node"
    $P131 = $P130."list"()
    elements $I101, $P131
    repeat $S101, "v", $I101
    new $P132, 'String'
    set $P132, $S101
    concat $P133, $P132, "*"
    store_lex "$sig", $P133
.annotate 'line', 912
    find_lex $P130, "self"
    find_lex $P131, "$node"
    find_lex $P132, "$sig"
    $P133 = $P130."post_children"($P131, $P132 :named("signature"))
    store_lex "$ops", $P133
.annotate 'line', 914
    find_lex $P1294, "$ops"
    unless_null $P1294, vivify_281
    $P1294 = root_new ['parrot';'ResizablePMCArray']
  vivify_281:
    set $P130, $P1294[-1]
    unless_null $P130, vivify_282
    new $P130, "Undef"
  vivify_282:
    store_lex "$retval", $P130
.annotate 'line', 916
    find_lex $P130, "$node"
    $P131 = $P130."handlers"()
    store_lex "$eh", $P131
.annotate 'line', 917
    find_lex $P130, "$eh"
    unless $P130, if_1295_end
.annotate 'line', 918
    find_lex $P131, "self"
    find_lex $P132, "$ops"
    find_lex $P133, "$eh"
    find_lex $P1296, "%options"
    unless_null $P1296, vivify_283
    $P1296 = root_new ['parrot';'Hash']
  vivify_283:
    set $P134, $P1296["rtype"]
    unless_null $P134, vivify_284
    new $P134, "Undef"
  vivify_284:
    $P135 = $P131."wrap_handlers"($P132, $P133, $P134 :named("rtype"))
    store_lex "$ops", $P135
  if_1295_end:
.annotate 'line', 920
    find_lex $P130, "$bpost"
    find_lex $P131, "$ops"
    $P130."push"($P131)
.annotate 'line', 921
    find_lex $P130, "$bpost"
    find_lex $P131, "$retval"
    $P130."push_pirop"("return", $P131)
.annotate 'line', 923
    find_lex $P131, "$ctrlpast"
    if $P131, if_1297
    set $P130, $P131
    goto if_1297_end
  if_1297:
.annotate 'line', 924
    find_lex $P132, "$bpost"
    find_lex $P133, "$ctrllabel"
    $P132."push"($P133)
.annotate 'line', 925
    find_lex $P132, "$bpost"
    $P132."push_pirop"(".local pmc exception")
.annotate 'line', 926
    find_lex $P132, "$bpost"
    $P132."push_pirop"(".get_results (exception)")
.annotate 'line', 927
    find_lex $P133, "$ctrlpast"
    set $S101, $P133
    iseq $I101, $S101, "return_pir"
    if $I101, if_1298
.annotate 'line', 934
    find_lex $P138, "$ctrlpast"
    get_hll_global $P139, ["PAST"], "Node"
    $P140 = $P138."isa"($P139)
    if $P140, if_1302
.annotate 'line', 938
    find_lex $P141, "self"
    new $P142, 'String'
    set $P142, "Unrecognized control handler '"
    find_lex $P143, "$ctrlpast"
    concat $P144, $P142, $P143
    concat $P146, $P144, "'"
    $P147 = $P141."panic"($P146)
.annotate 'line', 937
    set $P136, $P147
.annotate 'line', 934
    goto if_1302_end
  if_1302:
.annotate 'line', 935
    find_lex $P141, "$bpost"
    find_lex $P142, "self"
    find_lex $P143, "$ctrlpast"
    $P144 = $P142."as_post"($P143, "*" :named("rtype"))
    $P145 = $P141."push"($P144)
.annotate 'line', 934
    set $P136, $P145
  if_1302_end:
    set $P132, $P136
.annotate 'line', 927
    goto if_1298_end
  if_1298:
    .const 'Sub' $P1300 = "45_1312695743.39515" 
    capture_lex $P1300
    $P135 = $P1300()
    set $P132, $P135
  if_1298_end:
.annotate 'line', 923
    set $P130, $P132
  if_1297_end:
.annotate 'line', 884
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1291"  :anon :subid("44_1312695743.39515") :outer("43_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 901
    new $P131, "Undef"
    set $P1293, $P131
    .lex "$reg", $P1293
.annotate 'line', 900
    get_hll_global $P132, ["POST"], "Label"
    find_lex $P133, "self"
    $P134 = $P133."unique"("control_")
    $P135 = $P132."new"($P134 :named("result"))
    store_lex "$ctrllabel", $P135
.annotate 'line', 901
    find_lex $P132, "self"
    $P133 = $P132."uniquereg"("P")
    store_lex "$reg", $P133
.annotate 'line', 902
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    $P132."push_pirop"("new", $P133, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 904
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    find_lex $P134, "$ctrllabel"
    $P132."push_pirop"("set_label", $P133, $P134)
.annotate 'line', 905
    find_lex $P132, "$bpost"
    find_lex $P133, "$reg"
    $P132."push_pirop"("push_eh", $P133)
.annotate 'line', 906
    find_lex $P132, "$bpost"
    $P133 = $P132."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 899
    .return ($P133)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1299"  :anon :subid("45_1312695743.39515") :outer("43_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 929
    new $P134, "Undef"
    set $P1301, $P134
    .lex "$reg", $P1301
    find_lex $P135, "self"
    $P136 = $P135."tempreg"("P")
    store_lex "$reg", $P136
.annotate 'line', 930
    find_lex $P135, "$bpost"
    find_lex $P136, "$reg"
    $P135."push_pirop"("getattribute", $P136, "exception", "\"payload\"")
.annotate 'line', 932
    find_lex $P135, "$bpost"
    find_lex $P136, "$reg"
    $P137 = $P135."push_pirop"("return", $P136)
.annotate 'line', 927
    .return ($P137)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1304"  :anon :subid("46_1312695743.39515") :outer("40_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 945
    new $P124, "Undef"
    set $P1306, $P124
    .lex "$lisub", $P1306
    get_hll_global $P125, ["POST"], "Sub"
    find_lex $P126, "$bpost"
    $P127 = $P125."new"($P126 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P127
.annotate 'line', 946
    find_lex $P125, "$lisub"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 947
    find_lex $P125, "$lisub"
    $P125."push_pirop"(".local pmc", "block")
.annotate 'line', 948
    find_lex $P125, "$lisub"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("set", "block", $P126)
.annotate 'line', 949
    find_lex $P125, "$lisub"
    find_lex $P126, "self"
    find_lex $P127, "$node"
    $P128 = $P127."loadinit"()
    $P129 = $P126."as_post"($P128, "v" :named("rtype"))
    $P125."push"($P129)
.annotate 'line', 950
    find_lex $P125, "$lisub"
    find_lex $P1307, "$bpost"
    unless_null $P1307, vivify_287
    $P1307 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1307
  vivify_287:
    set $P1307["loadinit"], $P125
.annotate 'line', 944
    .return ($P125)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1321"  :anon :subid("48_1312695743.39515") :outer("40_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 975
    new $P135, "Undef"
    set $P1323, $P135
    .lex "$result", $P1323
    find_lex $P136, "self"
    $P137 = $P136."uniquereg"("P")
    store_lex "$result", $P137
.annotate 'line', 976
    find_lex $P136, "$bpost"
    find_lex $P137, "$result"
    find_lex $P138, "$blockreg"
    $P136."push_pirop"("newclosure", $P137, $P138)
.annotate 'line', 977
    find_lex $P136, "$bpost"
    find_lex $P137, "$result"
    $P138 = $P136."result"($P137)
.annotate 'line', 972
    .return ($P138)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1310"  :anon :subid("47_1312695743.39515") :outer("40_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 960
    $P1313 = root_new ['parrot';'ResizablePMCArray']
    set $P1312, $P1313
    .lex "@arglist", $P1312
.annotate 'line', 962
    new $P125, "Undef"
    set $P1314, $P125
    .lex "$result", $P1314
.annotate 'line', 960
    find_lex $P1315, "%options"
    unless_null $P1315, vivify_290
    $P1315 = root_new ['parrot';'Hash']
  vivify_290:
    set $P126, $P1315["arglist"]
    unless_null $P126, vivify_291
    new $P126, "Undef"
  vivify_291:
    store_lex "@arglist", $P126
.annotate 'line', 961
    find_lex $P126, "@arglist"
    defined $I102, $P126
    if $I102, unless_1316_end
    new $P127, "ResizablePMCArray"
    store_lex "@arglist", $P127
  unless_1316_end:
.annotate 'line', 962
    find_lex $P126, "self"
    find_lex $P127, "$rtype"
    $P128 = $P126."tempreg"($P127)
    store_lex "$result", $P128
.annotate 'line', 963
    get_hll_global $P126, ["POST"], "Ops"
    find_lex $P127, "$bpost"
    find_lex $P128, "$node"
    find_lex $P129, "$result"
    $P130 = $P126."new"($P127, $P128 :named("node"), $P129 :named("result"))
    store_lex "$bpost", $P130
.annotate 'line', 964
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockref"
    $P126."push_pirop"($P127)
.annotate 'line', 965
    find_lex $P126, "$islexical"
    unless $P126, if_1317_end
    find_lex $P127, "$bpost"
    find_lex $P128, "$blockreg"
    $P127."push_pirop"("capture_lex", $P128)
  if_1317_end:
.annotate 'line', 966
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockreg"
    find_lex $P128, "@arglist"
    find_lex $P129, "$result"
    $P130 = $P126."push_pirop"("call", $P127, $P128 :flat, $P129 :named("result"))
.annotate 'line', 959
    .return ($P130)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("49_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1327
    .param pmc param_1328 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1008
    new $P1326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1326, control_1325
    push_eh $P1326
    .lex "self", self
    .lex "$node", param_1327
    .lex "%options", param_1328
.annotate 'line', 1010
    new $P106, "Undef"
    set $P1329, $P106
    .lex "$lvalue", $P1329
.annotate 'line', 1011
    new $P107, "Undef"
    set $P1330, $P107
    .lex "$child", $P1330
.annotate 'line', 1016
    new $P108, "Undef"
    set $P1331, $P108
    .lex "$pasttype", $P1331
.annotate 'line', 1021
    new $P109, "Undef"
    set $P1332, $P109
    .lex "$pirop", $P1332
.annotate 'line', 1026
    new $P110, "Undef"
    set $P1333, $P110
    .lex "$inline", $P1333
.annotate 'line', 1010
    find_lex $P111, "$node"
    $P112 = $P111."lvalue"()
    store_lex "$lvalue", $P112
.annotate 'line', 1011
    find_lex $P1334, "$node"
    unless_null $P1334, vivify_294
    $P1334 = root_new ['parrot';'ResizablePMCArray']
  vivify_294:
    set $P111, $P1334[0]
    unless_null $P111, vivify_295
    new $P111, "Undef"
  vivify_295:
    store_lex "$child", $P111
.annotate 'line', 1012
    find_lex $P113, "$lvalue"
    if $P113, if_1337
    set $P112, $P113
    goto if_1337_end
  if_1337:
    find_lex $P114, "$child"
    defined $I101, $P114
    new $P112, 'Integer'
    set $P112, $I101
  if_1337_end:
    if $P112, if_1336
    set $P111, $P112
    goto if_1336_end
  if_1336:
    find_lex $P115, "$child"
    exists $I102, $P115["lvalue"]
    new $P116, 'Integer'
    set $P116, $I102
    isfalse $I103, $P116
    new $P111, 'Integer'
    set $P111, $I103
  if_1336_end:
    unless $P111, if_1335_end
.annotate 'line', 1013
    find_lex $P117, "$child"
    find_lex $P118, "$lvalue"
    $P117."lvalue"($P118)
  if_1335_end:
.annotate 'line', 1016
    find_lex $P111, "$node"
    $P112 = $P111."pasttype"()
    store_lex "$pasttype", $P112
.annotate 'line', 1017
    find_lex $P111, "$pasttype"
    unless $P111, if_1338_end
.annotate 'line', 1018
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
  if_1338_end:
.annotate 'line', 1021
    find_lex $P111, "$node"
    $P112 = $P111."pirop"()
    store_lex "$pirop", $P112
.annotate 'line', 1022
    find_lex $P111, "$pirop"
    unless $P111, if_1339_end
.annotate 'line', 1023
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "%options"
    $P116 = $P113."pirop"($P114, $P115 :flat)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1339_end:
.annotate 'line', 1026
    find_lex $P111, "$node"
    $P112 = $P111."inline"()
    store_lex "$inline", $P112
.annotate 'line', 1027
    find_lex $P111, "$inline"
    unless $P111, if_1340_end
.annotate 'line', 1028
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "%options"
    $P116 = $P113."inline"($P114, $P115 :flat)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1340_end:
.annotate 'line', 1031
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "%options"
    $P114 = $P111."call"($P112, $P113 :flat)
.annotate 'line', 1008
    .return ($P114)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("50_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1344
    .param pmc param_1345 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1039
    new $P1343, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1343, control_1342
    push_eh $P1343
    .lex "self", self
    .lex "$node", param_1344
    .lex "%options", param_1345
.annotate 'line', 1040
    new $P106, "Undef"
    set $P1346, $P106
    .lex "$pirop", $P1346
.annotate 'line', 1041
    new $P107, "Undef"
    set $P1347, $P107
    .lex "$signature", $P1347
.annotate 'line', 1042
    new $P108, "Undef"
    set $P1348, $P108
    .lex "$I0", $P1348
.annotate 'line', 1058
    new $P109, "Undef"
    set $P1349, $P109
    .lex "$ops", $P1349
.annotate 'line', 1059
    $P1351 = root_new ['parrot';'ResizablePMCArray']
    set $P1350, $P1351
    .lex "@posargs", $P1350
.annotate 'line', 1069
    $P1353 = root_new ['parrot';'ResizablePMCArray']
    set $P1352, $P1353
    .lex "@arglist", $P1352
.annotate 'line', 1071
    new $P110, "Undef"
    set $P1354, $P110
    .lex "$S0", $P1354
.annotate 'line', 1082
    new $P111, "Undef"
    set $P1355, $P111
    .lex "$result", $P1355
.annotate 'line', 1040
    find_lex $P112, "$node"
    $P113 = $P112."pirop"()
    store_lex "$pirop", $P113
.annotate 'line', 1039
    find_lex $P112, "$signature"
    find_lex $P112, "$I0"
.annotate 'line', 1043
    find_lex $P112, "$pirop"
    set $S101, $P112
    index $I101, $S101, " "
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$I0", $P113
    set $N101, $P113
    isge $I102, $N101, 0.0
    if $I102, if_1356
.annotate 'line', 1048
    find_lex $P114, "$pirop"
    set $S102, $P114
    index $I103, $S102, "__"
    new $P115, 'Integer'
    set $P115, $I103
    store_lex "$I0", $P115
    set $N102, $P115
    isge $I104, $N102, 0.0
    if $I104, if_1357
.annotate 'line', 1054
    find_lex $P116, "$pirop"
    get_global $P1358, "%piropsig"
    unless_null $P1358, vivify_296
    $P1358 = root_new ['parrot';'Hash']
  vivify_296:
    set $P117, $P1358[$P116]
    unless_null $P117, vivify_297
    new $P117, "Undef"
  vivify_297:
    store_lex "$signature", $P117
.annotate 'line', 1055
    find_lex $P116, "$signature"
    if $P116, unless_1359_end
    new $P117, "String"
    assign $P117, "vP"
    store_lex "$signature", $P117
  unless_1359_end:
.annotate 'line', 1053
    goto if_1357_end
  if_1357:
.annotate 'line', 1050
    find_lex $P116, "$pirop"
    set $S103, $P116
    find_lex $P117, "$I0"
    add $P118, $P117, 2
    set $I105, $P118
    substr $S104, $S103, $I105
    new $P119, 'String'
    set $P119, $S104
    store_lex "$signature", $P119
.annotate 'line', 1051
    find_lex $P116, "$pirop"
    set $S103, $P116
    find_lex $P117, "$I0"
    set $I105, $P117
    substr $S104, $S103, 0, $I105
    new $P118, 'String'
    set $P118, $S104
    store_lex "$pirop", $P118
  if_1357_end:
.annotate 'line', 1048
    goto if_1356_end
  if_1356:
.annotate 'line', 1045
    find_lex $P114, "$pirop"
    set $S102, $P114
    find_lex $P115, "$I0"
    add $P116, $P115, 1
    set $I103, $P116
    substr $S103, $S102, $I103
    new $P117, 'String'
    set $P117, $S103
    store_lex "$signature", $P117
.annotate 'line', 1046
    find_lex $P114, "$pirop"
    set $S102, $P114
    find_lex $P115, "$I0"
    set $I103, $P115
    substr $S103, $S102, 0, $I103
    new $P116, 'String'
    set $P116, $S103
    store_lex "$pirop", $P116
  if_1356_end:
.annotate 'line', 1039
    find_lex $P112, "$ops"
    find_lex $P112, "@posargs"
.annotate 'line', 1061

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1069
    find_lex $P112, "$ops"
    $P113 = $P112."list"()
    store_lex "@arglist", $P113
.annotate 'line', 1071
    find_lex $P112, "$signature"
    set $S101, $P112
    substr $S102, $S101, 0, 1
    new $P113, 'String'
    set $P113, $S102
    store_lex "$S0", $P113
.annotate 'line', 1072
    find_lex $P112, "$S0"
    set $S101, $P112
    iseq $I101, $S101, "v"
    unless $I101, if_1360_end
.annotate 'line', 1073
    find_lex $P113, "$ops"
    find_lex $P114, "$pirop"
    find_lex $P115, "@posargs"
    $P113."push_pirop"($P114, $P115 :flat)
.annotate 'line', 1074
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1360_end:
.annotate 'line', 1076
    find_lex $P112, "$S0"
    set $S101, $P112
    index $I101, "0123456789", $S101
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$I0", $P113
.annotate 'line', 1077
    find_lex $P112, "$I0"
    set $N101, $P112
    isge $I101, $N101, 0.0
    unless $I101, if_1361_end
.annotate 'line', 1078
    find_lex $P113, "$ops"
    find_lex $P114, "$I0"
    set $I102, $P114
    find_lex $P1362, "@arglist"
    unless_null $P1362, vivify_298
    $P1362 = root_new ['parrot';'ResizablePMCArray']
  vivify_298:
    set $P115, $P1362[$I102]
    unless_null $P115, vivify_299
    new $P115, "Undef"
  vivify_299:
    $P113."result"($P115)
.annotate 'line', 1079
    find_lex $P113, "$ops"
    find_lex $P114, "$pirop"
    find_lex $P115, "@posargs"
    $P113."push_pirop"($P114, $P115 :flat)
.annotate 'line', 1080
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1361_end:
.annotate 'line', 1082
    find_lex $P112, "self"
    find_lex $P113, "$S0"
    $P114 = $P112."tempreg"($P113)
    store_lex "$result", $P114
.annotate 'line', 1083
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 1084
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "$result"
    find_lex $P115, "@posargs"
    $P112."push_pirop"($P113, $P114, $P115 :flat)
.annotate 'line', 1085
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 1039
    .return ()
  control_1342:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("51_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1366
    .param pmc param_1367 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1093
    .const 'Sub' $P1385 = "52_1312695743.39515" 
    capture_lex $P1385
    new $P1365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1365, control_1364
    push_eh $P1365
    .lex "self", self
    .lex "$node", param_1366
    .lex "%options", param_1367
.annotate 'line', 1094
    new $P106, "Undef"
    set $P1368, $P106
    .lex "$pasttype", $P1368
.annotate 'line', 1097
    new $P107, "Undef"
    set $P1369, $P107
    .lex "$signature", $P1369
.annotate 'line', 1101
    new $P108, "Undef"
    set $P1370, $P108
    .lex "$name", $P1370
.annotate 'line', 1102
    new $P109, "Undef"
    set $P1371, $P109
    .lex "$ops", $P1371
.annotate 'line', 1103
    $P1373 = root_new ['parrot';'ResizablePMCArray']
    set $P1372, $P1373
    .lex "@posargs", $P1372
.annotate 'line', 1104
    $P1375 = root_new ['parrot';'Hash']
    set $P1374, $P1375
    .lex "%namedargs", $P1374
.annotate 'line', 1129
    new $P110, "Undef"
    set $P1376, $P110
    .lex "$rtype", $P1376
.annotate 'line', 1130
    new $P111, "Undef"
    set $P1377, $P111
    .lex "$result", $P1377
.annotate 'line', 1094
    find_lex $P112, "$node"
    $P113 = $P112."pasttype"()
    store_lex "$pasttype", $P113
.annotate 'line', 1095
    find_lex $P112, "$pasttype"
    if $P112, unless_1378_end
    new $P113, "String"
    assign $P113, "call"
    store_lex "$pasttype", $P113
  unless_1378_end:
.annotate 'line', 1097
    new $P112, "String"
    assign $P112, "v:"
    store_lex "$signature", $P112
.annotate 'line', 1099
    find_lex $P112, "$pasttype"
    set $S101, $P112
    iseq $I101, $S101, "callmethod"
    unless $I101, if_1379_end
    new $P113, "String"
    assign $P113, "vP:"
    store_lex "$signature", $P113
  if_1379_end:
.annotate 'line', 1101
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    store_lex "$name", $P113
.annotate 'line', 1093
    find_lex $P112, "$ops"
    find_lex $P112, "@posargs"
    find_lex $P112, "%namedargs"
.annotate 'line', 1106
    find_lex $P112, "$name"
    if $P112, unless_1380_end
    find_lex $P113, "$signature"
    set $S101, $P113
    replace $S102, $S101, 1, 0, "P"
    new $P114, 'String'
    set $P114, $S102
    store_lex "$signature", $P114
  unless_1380_end:
.annotate 'line', 1108

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1116
    find_lex $P112, "$name"
    unless $P112, if_1381_end
.annotate 'line', 1117
    find_lex $P114, "$name"
    isa $I101, $P114, "P6object"
    if $I101, if_1383
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1383_end
  if_1383:
    find_lex $P115, "$name"
    get_hll_global $P116, ["PAST"], "Node"
    $P117 = $P115."isa"($P116)
    set $P113, $P117
  if_1383_end:
    if $P113, if_1382
.annotate 'line', 1124
    find_lex $P120, "@posargs"
    find_lex $P121, "self"
    find_lex $P122, "$name"
    $P123 = $P121."escape"($P122)
    unshift $P120, $P123
.annotate 'line', 1123
    goto if_1382_end
  if_1382:
.annotate 'line', 1117
    .const 'Sub' $P1385 = "52_1312695743.39515" 
    capture_lex $P1385
    $P1385()
  if_1382_end:
  if_1381_end:
.annotate 'line', 1129
    find_lex $P1387, "%options"
    unless_null $P1387, vivify_300
    $P1387 = root_new ['parrot';'Hash']
  vivify_300:
    set $P112, $P1387["rtype"]
    unless_null $P112, vivify_301
    new $P112, "Undef"
  vivify_301:
    store_lex "$rtype", $P112
.annotate 'line', 1130
    find_lex $P112, "self"
    find_lex $P113, "$rtype"
    $P114 = $P112."tempreg"($P113)
    store_lex "$result", $P114
.annotate 'line', 1131
    find_lex $P112, "$ops"
    find_lex $P113, "$pasttype"
    find_lex $P114, "@posargs"
    find_lex $P115, "%namedargs"
    find_lex $P116, "$result"
    $P112."push_pirop"($P113, $P114 :flat, $P115 :flat, $P116 :named("result"))
.annotate 'line', 1132
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 1093
    find_lex $P112, "$ops"
    .return ($P112)
  control_1364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1384"  :anon :subid("52_1312695743.39515") :outer("51_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1118
    new $P118, "Undef"
    set $P1386, $P118
    .lex "$name_post", $P1386
    find_lex $P119, "self"
    find_lex $P120, "$name"
    $P121 = $P119."as_post"($P120, "s" :named("rtype"))
    store_lex "$name_post", $P121
.annotate 'line', 1119
    find_lex $P119, "self"
    find_lex $P120, "$name_post"
    $P121 = $P119."coerce"($P120, "s")
    store_lex "$name_post", $P121
.annotate 'line', 1120
    find_lex $P119, "$ops"
    find_lex $P120, "$name_post"
    $P119."push"($P120)
.annotate 'line', 1121
    find_lex $P119, "@posargs"
    find_lex $P120, "$name_post"
    unshift $P119, $P120
.annotate 'line', 1117
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("53_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1391
    .param pmc param_1392 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1141
    new $P1390, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1390, control_1389
    push_eh $P1390
    .lex "self", self
    .lex "$node", param_1391
    .lex "%options", param_1392
.annotate 'line', 1142
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."call"($P107, $P108 :flat)
.annotate 'line', 1141
    .return ($P109)
  control_1389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("54_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1396
    .param pmc param_1397 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1151
    .const 'Sub' $P1438 = "57_1312695743.39515" 
    capture_lex $P1438
    .const 'Sub' $P1414 = "55_1312695743.39515" 
    capture_lex $P1414
    new $P1395, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1395, control_1394
    push_eh $P1395
    .lex "self", self
    .lex "$node", param_1396
    .lex "%options", param_1397
.annotate 'line', 1152
    new $P106, "Undef"
    set $P1398, $P106
    .lex "$ops", $P1398
.annotate 'line', 1154
    new $P107, "Undef"
    set $P1399, $P107
    .lex "$rtype", $P1399
.annotate 'line', 1155
    new $P108, "Undef"
    set $P1400, $P108
    .lex "$result", $P1400
.annotate 'line', 1158
    new $P109, "Undef"
    set $P1401, $P109
    .lex "$pasttype", $P1401
.annotate 'line', 1160
    new $P110, "Undef"
    set $P1402, $P110
    .lex "$exprpast", $P1402
.annotate 'line', 1161
    new $P111, "Undef"
    set $P1403, $P111
    .lex "$thenpast", $P1403
.annotate 'line', 1162
    new $P112, "Undef"
    set $P1404, $P112
    .lex "$elsepast", $P1404
.annotate 'line', 1164
    new $P113, "Undef"
    set $P1405, $P113
    .lex "$S0", $P1405
.annotate 'line', 1165
    new $P114, "Undef"
    set $P1406, $P114
    .lex "$thenlabel", $P1406
.annotate 'line', 1166
    new $P115, "Undef"
    set $P1407, $P115
    .lex "$endlabel", $P1407
.annotate 'line', 1168
    new $P116, "Undef"
    set $P1408, $P116
    .lex "$exprrtype", $P1408
.annotate 'line', 1170
    new $P117, "Undef"
    set $P1409, $P117
    .lex "$childrtype", $P1409
.annotate 'line', 1173
    new $P118, "Undef"
    set $P1410, $P118
    .lex "$exprpost", $P1410
.annotate 'line', 1175
    new $P119, "Undef"
    set $P1411, $P119
    .lex "$thenpost", $P1411
.annotate 'line', 1176
    new $P120, "Undef"
    set $P1412, $P120
    .lex "$elsepost", $P1412
.annotate 'line', 1198
    .const 'Sub' $P1414 = "55_1312695743.39515" 
    newclosure $P1427, $P1414
    set $P1413, $P1427
    .lex "make_childpost", $P1413
.annotate 'line', 1152
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$node"
    $P127 = $P125."new"($P126 :named("node"))
    store_lex "$ops", $P127
.annotate 'line', 1154
    find_lex $P1428, "%options"
    unless_null $P1428, vivify_303
    $P1428 = root_new ['parrot';'Hash']
  vivify_303:
    set $P125, $P1428["rtype"]
    unless_null $P125, vivify_304
    new $P125, "Undef"
  vivify_304:
    store_lex "$rtype", $P125
.annotate 'line', 1155
    find_lex $P125, "self"
    find_lex $P126, "$rtype"
    $P127 = $P125."tempreg"($P126)
    store_lex "$result", $P127
.annotate 'line', 1156
    find_lex $P125, "$ops"
    find_lex $P126, "$result"
    $P125."result"($P126)
.annotate 'line', 1158
    find_lex $P125, "$node"
    $P126 = $P125."pasttype"()
    store_lex "$pasttype", $P126
.annotate 'line', 1160
    find_lex $P1429, "$node"
    unless_null $P1429, vivify_305
    $P1429 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P125, $P1429[0]
    unless_null $P125, vivify_306
    new $P125, "Undef"
  vivify_306:
    store_lex "$exprpast", $P125
.annotate 'line', 1161
    find_lex $P1430, "$node"
    unless_null $P1430, vivify_307
    $P1430 = root_new ['parrot';'ResizablePMCArray']
  vivify_307:
    set $P125, $P1430[1]
    unless_null $P125, vivify_308
    new $P125, "Undef"
  vivify_308:
    store_lex "$thenpast", $P125
.annotate 'line', 1162
    find_lex $P1431, "$node"
    unless_null $P1431, vivify_309
    $P1431 = root_new ['parrot';'ResizablePMCArray']
  vivify_309:
    set $P125, $P1431[2]
    unless_null $P125, vivify_310
    new $P125, "Undef"
  vivify_310:
    store_lex "$elsepast", $P125
.annotate 'line', 1164
    find_lex $P125, "self"
    find_lex $P126, "$pasttype"
    concat $P127, $P126, "_"
    $P128 = $P125."unique"($P127)
    store_lex "$S0", $P128
.annotate 'line', 1165
    get_hll_global $P125, ["POST"], "Label"
    find_lex $P126, "$S0"
    $P127 = $P125."new"($P126 :named("result"))
    store_lex "$thenlabel", $P127
.annotate 'line', 1166
    get_hll_global $P125, ["POST"], "Label"
    find_lex $P126, "$S0"
    concat $P127, $P126, "_end"
    $P128 = $P125."new"($P127 :named("result"))
    store_lex "$endlabel", $P128
.annotate 'line', 1168
    new $P125, "String"
    assign $P125, "r"
    store_lex "$exprrtype", $P125
.annotate 'line', 1169
    find_lex $P125, "$rtype"
    set $S101, $P125
    iseq $I101, $S101, "v"
    unless $I101, if_1432_end
    new $P126, "String"
    assign $P126, "*"
    store_lex "$exprrtype", $P126
  if_1432_end:
.annotate 'line', 1170
    find_lex $P125, "$rtype"
    store_lex "$childrtype", $P125
.annotate 'line', 1171
    find_lex $P125, "$rtype"
    set $S101, $P125
    index $I101, "*:", $S101
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1433_end
    new $P126, "String"
    assign $P126, "P"
    store_lex "$childrtype", $P126
  if_1433_end:
.annotate 'line', 1173
    find_lex $P125, "self"
    find_lex $P126, "$exprpast"
    find_lex $P127, "$exprrtype"
    $P128 = $P125."as_post"($P126, $P127 :named("rtype"))
    store_lex "$exprpost", $P128
.annotate 'line', 1175
    find_lex $P125, "$thenpast"
    $P126 = "make_childpost"($P125)
    store_lex "$thenpost", $P126
.annotate 'line', 1176
    find_lex $P125, "$elsepast"
    $P126 = "make_childpost"($P125)
    store_lex "$elsepost", $P126
.annotate 'line', 1178
    find_lex $P125, "$elsepost"
    defined $I101, $P125
    if $I101, if_1434
.annotate 'line', 1188
    .const 'Sub' $P1438 = "57_1312695743.39515" 
    capture_lex $P1438
    $P1438()
    goto if_1434_end
  if_1434:
.annotate 'line', 1179
    find_lex $P126, "$ops"
    find_lex $P127, "$exprpost"
    $P126."push"($P127)
.annotate 'line', 1180
    find_lex $P126, "$ops"
    find_lex $P127, "$pasttype"
    find_lex $P128, "$exprpost"
    find_lex $P129, "$thenlabel"
    $P126."push_pirop"($P127, $P128, $P129)
.annotate 'line', 1181
    find_lex $P126, "$elsepost"
    defined $I102, $P126
    unless $I102, if_1435_end
    find_lex $P127, "$ops"
    find_lex $P128, "$elsepost"
    $P127."push"($P128)
  if_1435_end:
.annotate 'line', 1182
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push_pirop"("goto", $P127)
.annotate 'line', 1183
    find_lex $P126, "$ops"
    find_lex $P127, "$thenlabel"
    $P126."push"($P127)
.annotate 'line', 1184
    find_lex $P126, "$thenpost"
    defined $I102, $P126
    unless $I102, if_1436_end
    find_lex $P127, "$ops"
    find_lex $P128, "$thenpost"
    $P127."push"($P128)
  if_1436_end:
.annotate 'line', 1185
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push"($P127)
.annotate 'line', 1186
    new $P126, "Exception"
    set $P126['type'], .CONTROL_RETURN
    find_lex $P127, "$ops"
    setattribute $P126, 'payload', $P127
    throw $P126
  if_1434_end:
.annotate 'line', 1151
    find_lex $P125, "make_childpost"
    .return ($P125)
  control_1394:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P126, exception, "payload"
    .return ($P126)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("55_1312695743.39515") :outer("54_1312695743.39515")
    .param pmc param_1417 :optional
    .param int has_param_1417 :opt_flag
.annotate 'file', ''
.annotate 'line', 1198
    .const 'Sub' $P1421 = "56_1312695743.39515" 
    capture_lex $P1421
    new $P1416, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1416, control_1415
    push_eh $P1416
    if has_param_1417, optparam_302
    new $P121, "Undef"
    set param_1417, $P121
  optparam_302:
    .lex "$childpast", param_1417
.annotate 'line', 1199
    new $P122, "Undef"
    set $P1418, $P122
    .lex "$childpost", $P1418
.annotate 'line', 1198
    find_lex $P123, "$childpost"
.annotate 'line', 1200
    find_lex $P123, "$childpast"
    defined $I101, $P123
    if $I101, if_1419
.annotate 'line', 1207
    find_lex $P124, "$rtype"
    set $S101, $P124
    iseq $I102, $S101, "v"
    unless $I102, if_1425_end
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$childpost"
    setattribute $P125, 'payload', $P126
    throw $P125
  if_1425_end:
.annotate 'line', 1208
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$exprpost"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$childpost", $P126
.annotate 'line', 1206
    goto if_1419_end
  if_1419:
.annotate 'line', 1200
    .const 'Sub' $P1421 = "56_1312695743.39515" 
    capture_lex $P1421
    $P1421()
  if_1419_end:
.annotate 'line', 1210
    find_lex $P123, "$result"
    unless $P123, if_1426_end
    find_lex $P124, "self"
    find_lex $P125, "$childpost"
    find_lex $P126, "$result"
    $P127 = $P124."coerce"($P125, $P126)
    store_lex "$childpost", $P127
  if_1426_end:
.annotate 'line', 1198
    find_lex $P123, "$childpost"
    .return ($P123)
  control_1415:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1420"  :anon :subid("56_1312695743.39515") :outer("55_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1201
    $P1423 = root_new ['parrot';'ResizablePMCArray']
    set $P1422, $P1423
    .lex "@arglist", $P1422
    new $P124, "ResizablePMCArray"
    store_lex "@arglist", $P124
.annotate 'line', 1202
    find_lex $P124, "$childpast"
    $N101 = $P124."arity"()
    isgt $I102, $N101, 0.0
    unless $I102, if_1424_end
    find_lex $P125, "@arglist"
    find_lex $P126, "$exprpost"
    push $P125, $P126
  if_1424_end:
.annotate 'line', 1203
    find_lex $P124, "self"
    find_lex $P125, "$childpast"
    find_lex $P126, "$childrtype"
    find_lex $P127, "@arglist"
    $P128 = $P124."as_post"($P125, $P126 :named("rtype"), $P127 :named("arglist"))
    store_lex "$childpost", $P128
.annotate 'line', 1200
    .return ($P128)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1437"  :anon :subid("57_1312695743.39515") :outer("54_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1189
    new $P126, "Undef"
    set $P1439, $P126
    .lex "$S0", $P1439
    new $P127, "String"
    assign $P127, "if"
    store_lex "$S0", $P127
.annotate 'line', 1190
    find_lex $P127, "$pasttype"
    set $S101, $P127
    find_lex $P128, "$S0"
    set $S102, $P128
    iseq $I102, $S101, $S102
    unless $I102, if_1440_end
    new $P129, "String"
    assign $P129, "unless"
    store_lex "$S0", $P129
  if_1440_end:
.annotate 'line', 1191
    find_lex $P127, "$ops"
    find_lex $P128, "$exprpost"
    $P127."push"($P128)
.annotate 'line', 1192
    find_lex $P127, "$ops"
    find_lex $P128, "$S0"
    find_lex $P129, "$exprpost"
    find_lex $P130, "$endlabel"
    $P127."push_pirop"($P128, $P129, $P130)
.annotate 'line', 1193
    find_lex $P127, "$thenpost"
    defined $I102, $P127
    unless $I102, if_1441_end
    find_lex $P128, "$ops"
    find_lex $P129, "$thenpost"
    $P128."push"($P129)
  if_1441_end:
.annotate 'line', 1194
    find_lex $P127, "$ops"
    find_lex $P128, "$endlabel"
    $P127."push"($P128)
.annotate 'line', 1195
    new $P127, "Exception"
    set $P127['type'], .CONTROL_RETURN
    find_lex $P128, "$ops"
    setattribute $P127, 'payload', $P128
    throw $P127
.annotate 'line', 1188
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("58_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1445
    .param pmc param_1446 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1215
    new $P1444, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1444, control_1443
    push_eh $P1444
    .lex "self", self
    .lex "$node", param_1445
    .lex "%options", param_1446
.annotate 'line', 1216
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."if"($P107, $P108 :flat)
.annotate 'line', 1215
    .return ($P109)
  control_1443:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("59_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1450 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1223
    new $P1449, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1449, control_1448
    push_eh $P1449
    .lex "self", self
    .lex "%options", param_1450
.annotate 'line', 1224
    new $P106, "Undef"
    set $P1451, $P106
    .lex "$loopname", $P1451
.annotate 'line', 1225
    new $P107, "Undef"
    set $P1452, $P107
    .lex "$testlabel", $P1452
.annotate 'line', 1226
    new $P108, "Undef"
    set $P1453, $P108
    .lex "$redolabel", $P1453
.annotate 'line', 1227
    new $P109, "Undef"
    set $P1454, $P109
    .lex "$nextlabel", $P1454
.annotate 'line', 1228
    new $P110, "Undef"
    set $P1455, $P110
    .lex "$donelabel", $P1455
.annotate 'line', 1229
    new $P111, "Undef"
    set $P1456, $P111
    .lex "$handlabel", $P1456
.annotate 'line', 1231
    new $P112, "Undef"
    set $P1457, $P112
    .lex "$testop", $P1457
.annotate 'line', 1232
    new $P113, "Undef"
    set $P1458, $P113
    .lex "$testpost", $P1458
.annotate 'line', 1233
    new $P114, "Undef"
    set $P1459, $P114
    .lex "$prepost", $P1459
.annotate 'line', 1234
    new $P115, "Undef"
    set $P1460, $P115
    .lex "$bodypost", $P1460
.annotate 'line', 1235
    new $P116, "Undef"
    set $P1461, $P116
    .lex "$nextpost", $P1461
.annotate 'line', 1236
    new $P117, "Undef"
    set $P1462, $P117
    .lex "$bodyfirst", $P1462
.annotate 'line', 1240
    new $P118, "Undef"
    set $P1463, $P118
    .lex "$ops", $P1463
.annotate 'line', 1244
    new $P119, "Undef"
    set $P1464, $P119
    .lex "$handreg", $P1464
.annotate 'line', 1266
    new $P120, "Undef"
    set $P1465, $P120
    .lex "$S0", $P1465
.annotate 'line', 1224
    find_lex $P121, "self"
    $P122 = $P121."unique"("loop")
    store_lex "$loopname", $P122
.annotate 'line', 1225
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_test"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$testlabel", $P124
.annotate 'line', 1226
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_redo"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$redolabel", $P124
.annotate 'line', 1227
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_next"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$nextlabel", $P124
.annotate 'line', 1228
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_done"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$donelabel", $P124
.annotate 'line', 1229
    get_hll_global $P121, ["POST"], "Label"
    find_lex $P122, "$loopname"
    concat $P123, $P122, "_handler"
    $P124 = $P121."new"($P123 :named("result"))
    store_lex "$handlabel", $P124
.annotate 'line', 1231
    find_lex $P1466, "%options"
    unless_null $P1466, vivify_311
    $P1466 = root_new ['parrot';'Hash']
  vivify_311:
    set $P121, $P1466["testop"]
    unless_null $P121, vivify_312
    new $P121, "Undef"
  vivify_312:
    store_lex "$testop", $P121
.annotate 'line', 1232
    find_lex $P1467, "%options"
    unless_null $P1467, vivify_313
    $P1467 = root_new ['parrot';'Hash']
  vivify_313:
    set $P121, $P1467["test"]
    unless_null $P121, vivify_314
    new $P121, "Undef"
  vivify_314:
    store_lex "$testpost", $P121
.annotate 'line', 1233
    find_lex $P1468, "%options"
    unless_null $P1468, vivify_315
    $P1468 = root_new ['parrot';'Hash']
  vivify_315:
    set $P121, $P1468["pre"]
    unless_null $P121, vivify_316
    new $P121, "Undef"
  vivify_316:
    store_lex "$prepost", $P121
.annotate 'line', 1234
    find_lex $P1469, "%options"
    unless_null $P1469, vivify_317
    $P1469 = root_new ['parrot';'Hash']
  vivify_317:
    set $P121, $P1469["body"]
    unless_null $P121, vivify_318
    new $P121, "Undef"
  vivify_318:
    store_lex "$bodypost", $P121
.annotate 'line', 1235
    find_lex $P1470, "%options"
    unless_null $P1470, vivify_319
    $P1470 = root_new ['parrot';'Hash']
  vivify_319:
    set $P121, $P1470["next"]
    unless_null $P121, vivify_320
    new $P121, "Undef"
  vivify_320:
    store_lex "$nextpost", $P121
.annotate 'line', 1236
    find_lex $P1471, "%options"
    unless_null $P1471, vivify_321
    $P1471 = root_new ['parrot';'Hash']
  vivify_321:
    set $P121, $P1471["bodyfirst"]
    unless_null $P121, vivify_322
    new $P121, "Undef"
  vivify_322:
    store_lex "$bodyfirst", $P121
.annotate 'line', 1238
    find_lex $P121, "$testop"
    if $P121, unless_1472_end
    new $P122, "String"
    assign $P122, "unless"
    store_lex "$testop", $P122
  unless_1472_end:
.annotate 'line', 1240
    get_hll_global $P121, ["POST"], "Ops"
    $P122 = $P121."new"()
    store_lex "$ops", $P122
.annotate 'line', 1242
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_323
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_324
    die "Contextual $*SUB not found"
  vivify_324:
  vivify_323:
    $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1244
    find_lex $P121, "self"
    $P122 = $P121."tempreg"("P")
    store_lex "$handreg", $P122
.annotate 'line', 1245
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("new", $P122, "'ExceptionHandler'")
.annotate 'line', 1246
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    find_lex $P123, "$handlabel"
    $P121."push_pirop"("set_label", $P122, $P123)
.annotate 'line', 1247
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("callmethod", "\"handle_types\"", $P122, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1249
    find_lex $P121, "$ops"
    find_lex $P122, "$handreg"
    $P121."push_pirop"("push_eh", $P122)
.annotate 'line', 1251
    find_lex $P121, "$bodyfirst"
    unless $P121, if_1473_end
    find_lex $P122, "$ops"
    find_lex $P123, "$redolabel"
    $P122."push_pirop"("goto", $P123)
  if_1473_end:
.annotate 'line', 1252
    find_lex $P121, "$ops"
    find_lex $P122, "$testlabel"
    $P121."push"($P122)
.annotate 'line', 1253
    find_lex $P121, "$testpost"
    unless $P121, if_1474_end
.annotate 'line', 1254
    find_lex $P122, "$ops"
    find_lex $P123, "$testpost"
    $P122."push"($P123)
.annotate 'line', 1255
    find_lex $P122, "$ops"
    find_lex $P123, "$testop"
    find_lex $P124, "$testpost"
    find_lex $P125, "$donelabel"
    $P122."push_pirop"($P123, $P124, $P125)
  if_1474_end:
.annotate 'line', 1257
    find_lex $P121, "$prepost"
    unless $P121, if_1475_end
    find_lex $P122, "$ops"
    find_lex $P123, "$prepost"
    $P122."push"($P123)
  if_1475_end:
.annotate 'line', 1258
    find_lex $P121, "$ops"
    find_lex $P122, "$redolabel"
    $P121."push"($P122)
.annotate 'line', 1259
    find_lex $P121, "$bodypost"
    unless $P121, if_1476_end
    find_lex $P122, "$ops"
    find_lex $P123, "$bodypost"
    $P122."push"($P123)
  if_1476_end:
.annotate 'line', 1260
    find_lex $P121, "$ops"
    find_lex $P122, "$nextlabel"
    $P121."push"($P122)
.annotate 'line', 1261
    find_lex $P121, "$nextpost"
    unless $P121, if_1477_end
    find_lex $P122, "$ops"
    find_lex $P123, "$nextpost"
    $P122."push"($P123)
  if_1477_end:
.annotate 'line', 1262
    find_lex $P121, "$ops"
    find_lex $P122, "$testlabel"
    $P121."push_pirop"("goto", $P122)
.annotate 'line', 1263
    find_lex $P121, "$ops"
    find_lex $P122, "$handlabel"
    $P121."push"($P122)
.annotate 'line', 1264
    find_lex $P121, "$ops"
    $P121."push_pirop"(".local pmc exception")
.annotate 'line', 1265
    find_lex $P121, "$ops"
    $P121."push_pirop"(".get_results (exception)")
.annotate 'line', 1266
    find_lex $P121, "self"
    $P122 = $P121."tempreg"("P")
    store_lex "$S0", $P122
.annotate 'line', 1267
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    $P121."push_pirop"("getattribute", $P122, "exception", "'type'")
.annotate 'line', 1268
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    find_lex $P123, "$nextlabel"
    $P121."push_pirop"("eq", $P122, ".CONTROL_LOOP_NEXT", $P123)
.annotate 'line', 1269
    find_lex $P121, "$ops"
    find_lex $P122, "$S0"
    find_lex $P123, "$redolabel"
    $P121."push_pirop"("eq", $P122, ".CONTROL_LOOP_REDO", $P123)
.annotate 'line', 1270
    find_lex $P121, "$ops"
    find_lex $P122, "$donelabel"
    $P121."push"($P122)
.annotate 'line', 1271
    find_lex $P121, "$ops"
    $P121."push_pirop"("pop_eh")
.annotate 'line', 1223
    find_lex $P121, "$ops"
    .return ($P121)
  control_1448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("60_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1481
    .param pmc param_1482 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1282
    new $P1480, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1480, control_1479
    push_eh $P1480
    .lex "self", self
    .lex "$node", param_1481
    .lex "%options", param_1482
.annotate 'line', 1283
    new $P106, "Undef"
    set $P1483, $P106
    .lex "$exprpast", $P1483
.annotate 'line', 1284
    new $P107, "Undef"
    set $P1484, $P107
    .lex "$bodypast", $P1484
.annotate 'line', 1285
    new $P108, "Undef"
    set $P1485, $P108
    .lex "$nextpast", $P1485
.annotate 'line', 1287
    new $P109, "Undef"
    set $P1486, $P109
    .lex "$exprpost", $P1486
.annotate 'line', 1289
    $P1488 = root_new ['parrot';'ResizablePMCArray']
    set $P1487, $P1488
    .lex "@arglist", $P1487
.annotate 'line', 1291
    new $P110, "Undef"
    set $P1489, $P110
    .lex "$bodypost", $P1489
.annotate 'line', 1293
    new $P111, "Undef"
    set $P1490, $P111
    .lex "$nextpost", $P1490
.annotate 'line', 1296
    new $P112, "Undef"
    set $P1491, $P112
    .lex "$testop", $P1491
.annotate 'line', 1297
    new $P113, "Undef"
    set $P1492, $P113
    .lex "$bodyfirst", $P1492
.annotate 'line', 1299
    new $P114, "Undef"
    set $P1493, $P114
    .lex "$ops", $P1493
.annotate 'line', 1283
    find_lex $P1494, "$node"
    unless_null $P1494, vivify_325
    $P1494 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P115, $P1494[0]
    unless_null $P115, vivify_326
    new $P115, "Undef"
  vivify_326:
    store_lex "$exprpast", $P115
.annotate 'line', 1284
    find_lex $P1495, "$node"
    unless_null $P1495, vivify_327
    $P1495 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P115, $P1495[1]
    unless_null $P115, vivify_328
    new $P115, "Undef"
  vivify_328:
    store_lex "$bodypast", $P115
.annotate 'line', 1285
    find_lex $P1496, "$node"
    unless_null $P1496, vivify_329
    $P1496 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P115, $P1496[2]
    unless_null $P115, vivify_330
    new $P115, "Undef"
  vivify_330:
    store_lex "$nextpast", $P115
.annotate 'line', 1287
    find_lex $P115, "self"
    find_lex $P116, "$exprpast"
    $P117 = $P115."as_post"($P116, "r" :named("rtype"))
    store_lex "$exprpost", $P117
.annotate 'line', 1289
    new $P115, "ResizablePMCArray"
    store_lex "@arglist", $P115
.annotate 'line', 1290
    find_lex $P115, "$bodypast"
    $N101 = $P115."arity"()
    islt $I101, $N101, 1.0
    if $I101, unless_1497_end
    find_lex $P116, "@arglist"
    find_lex $P117, "$exprpost"
    push $P116, $P117
  unless_1497_end:
.annotate 'line', 1291
    find_lex $P115, "self"
    find_lex $P116, "$bodypast"
    find_lex $P117, "@arglist"
    $P118 = $P115."as_post"($P116, "v" :named("rtype"), $P117 :named("arglist"))
    store_lex "$bodypost", $P118
.annotate 'line', 1293
    get_hll_global $P115, "null__P"
    store_lex "$nextpost", $P115
.annotate 'line', 1294
    find_lex $P115, "$nextpast"
    unless $P115, if_1498_end
    find_lex $P116, "self"
    find_lex $P117, "$nextpast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    store_lex "$nextpost", $P118
  if_1498_end:
.annotate 'line', 1296
    find_lex $P1499, "%options"
    unless_null $P1499, vivify_331
    $P1499 = root_new ['parrot';'Hash']
  vivify_331:
    set $P115, $P1499["testop"]
    unless_null $P115, vivify_332
    new $P115, "Undef"
  vivify_332:
    store_lex "$testop", $P115
.annotate 'line', 1297
    find_lex $P1500, "%options"
    unless_null $P1500, vivify_333
    $P1500 = root_new ['parrot';'Hash']
  vivify_333:
    set $P115, $P1500["bodyfirst"]
    unless_null $P115, vivify_334
    new $P115, "Undef"
  vivify_334:
    store_lex "$bodyfirst", $P115
.annotate 'line', 1299
    find_lex $P115, "self"
    find_lex $P116, "$testop"
    find_lex $P117, "$exprpost"
    find_lex $P118, "$bodypost"
    find_lex $P119, "$bodyfirst"
    find_lex $P120, "$nextpost"
    $P121 = $P115."loop_gen"($P116 :named("testop"), $P117 :named("test"), $P118 :named("body"), $P119 :named("bodyfirst"), $P120 :named("next"))
    store_lex "$ops", $P121
.annotate 'line', 1301
    find_lex $P115, "$ops"
    find_lex $P116, "$exprpost"
    $P115."result"($P116)
.annotate 'line', 1302
    find_lex $P115, "$ops"
    find_lex $P116, "$node"
    $P115."node"($P116)
.annotate 'line', 1282
    find_lex $P115, "$ops"
    .return ($P115)
  control_1479:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("61_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1504
    .param pmc param_1505 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1306
    new $P1503, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1503, control_1502
    push_eh $P1503
    .lex "self", self
    .lex "$node", param_1504
    .lex "%options", param_1505
.annotate 'line', 1307
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, "if" :named("testop"))
.annotate 'line', 1306
    .return ($P109)
  control_1502:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("62_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1509
    .param pmc param_1510 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1310
    new $P1508, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1508, control_1507
    push_eh $P1508
    .lex "self", self
    .lex "$node", param_1509
    .lex "%options", param_1510
.annotate 'line', 1311
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1310
    .return ($P109)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("63_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1514
    .param pmc param_1515 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1314
    new $P1513, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1513, control_1512
    push_eh $P1513
    .lex "self", self
    .lex "$node", param_1514
    .lex "%options", param_1515
.annotate 'line', 1315
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."while"($P107, $P108 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1314
    .return ($P109)
  control_1512:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("64_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1519
    .param pmc param_1520 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1323
    .const 'Sub' $P1538 = "65_1312695743.39515" 
    capture_lex $P1538
    new $P1518, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1518, control_1517
    push_eh $P1518
    .lex "self", self
    .lex "$node", param_1519
    .lex "%options", param_1520
.annotate 'line', 1324
    new $P106, "Undef"
    set $P1521, $P106
    .lex "$ops", $P1521
.annotate 'line', 1325
    new $P107, "Undef"
    set $P1522, $P107
    .lex "$prepost", $P1522
.annotate 'line', 1326
    new $P108, "Undef"
    set $P1523, $P108
    .lex "$testpost", $P1523
.annotate 'line', 1328
    new $P109, "Undef"
    set $P1524, $P109
    .lex "$collpast", $P1524
.annotate 'line', 1329
    new $P110, "Undef"
    set $P1525, $P110
    .lex "$bodypast", $P1525
.annotate 'line', 1331
    new $P111, "Undef"
    set $P1526, $P111
    .lex "$collpost", $P1526
.annotate 'line', 1335
    new $P112, "Undef"
    set $P1527, $P112
    .lex "$undeflabel", $P1527
.annotate 'line', 1336
    new $P113, "Undef"
    set $P1528, $P113
    .lex "$S0", $P1528
.annotate 'line', 1344
    new $P114, "Undef"
    set $P1529, $P114
    .lex "$arity", $P1529
.annotate 'line', 1353
    $P1531 = root_new ['parrot';'ResizablePMCArray']
    set $P1530, $P1531
    .lex "@arglist", $P1530
.annotate 'line', 1363
    new $P115, "Undef"
    set $P1532, $P115
    .lex "$bodypost", $P1532
.annotate 'line', 1324
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "$node"
    $P118 = $P116."new"($P117 :named("node"))
    store_lex "$ops", $P118
.annotate 'line', 1325
    get_hll_global $P116, ["POST"], "Ops"
    $P117 = $P116."new"()
    store_lex "$prepost", $P117
.annotate 'line', 1326
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "self"
    $P118 = $P117."tempreg"("P")
    $P119 = $P116."new"($P118 :named("result"))
    store_lex "$testpost", $P119
.annotate 'line', 1328
    find_lex $P1533, "$node"
    unless_null $P1533, vivify_335
    $P1533 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P116, $P1533[0]
    unless_null $P116, vivify_336
    new $P116, "Undef"
  vivify_336:
    store_lex "$collpast", $P116
.annotate 'line', 1329
    find_lex $P1534, "$node"
    unless_null $P1534, vivify_337
    $P1534 = root_new ['parrot';'ResizablePMCArray']
  vivify_337:
    set $P116, $P1534[1]
    unless_null $P116, vivify_338
    new $P116, "Undef"
  vivify_338:
    store_lex "$bodypast", $P116
.annotate 'line', 1331
    find_lex $P116, "self"
    find_lex $P117, "$collpast"
    $P118 = $P116."as_post"($P117, "P" :named("rtype"))
    store_lex "$collpost", $P118
.annotate 'line', 1332
    find_lex $P116, "$ops"
    find_lex $P117, "$collpost"
    $P116."push"($P117)
.annotate 'line', 1335
    get_hll_global $P116, ["POST"], "Label"
    $P117 = $P116."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P117
.annotate 'line', 1336
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("I")
    store_lex "$S0", $P117
.annotate 'line', 1337
    find_lex $P116, "$ops"
    find_lex $P117, "$S0"
    find_lex $P118, "$collpost"
    $P116."push_pirop"("defined", $P117, $P118)
.annotate 'line', 1338
    find_lex $P116, "$ops"
    find_lex $P117, "$S0"
    find_lex $P118, "$undeflabel"
    $P116."push_pirop"("unless", $P117, $P118)
.annotate 'line', 1340
    find_lex $P116, "$ops"
    find_lex $P117, "$testpost"
    find_lex $P118, "$collpost"
    $P116."push_pirop"("iter", $P117, $P118)
.annotate 'line', 1344
    new $P116, "Integer"
    assign $P116, 1
    store_lex "$arity", $P116
.annotate 'line', 1345
    find_lex $P116, "$node"
    $P117 = $P116."arity"()
    defined $I101, $P117
    if $I101, if_1535
.annotate 'line', 1348
    find_lex $P118, "$bodypast"
    $P119 = $P118."arity"()
    defined $I102, $P119
    unless $I102, if_1536_end
.annotate 'line', 1349
    find_lex $P120, "$bodypast"
    $P121 = $P120."arity"()
    store_lex "$arity", $P121
  if_1536_end:
.annotate 'line', 1348
    goto if_1535_end
  if_1535:
.annotate 'line', 1346
    find_lex $P118, "$node"
    $P119 = $P118."arity"()
    store_lex "$arity", $P119
  if_1535_end:
.annotate 'line', 1353
    new $P116, "ResizablePMCArray"
    store_lex "@arglist", $P116
.annotate 'line', 1354
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1542_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
    goto loop1542_redo
  loop1542_test:
    find_lex $P116, "$arity"
    set $N101, $P116
    isgt $I101, $N101, 0.0
    unless $I101, loop1542_done
  loop1542_redo:
    .const 'Sub' $P1538 = "65_1312695743.39515" 
    capture_lex $P1538
    $P1538()
  loop1542_next:
    goto loop1542_test
  loop1542_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1542_next
    eq $P119, .CONTROL_LOOP_REDO, loop1542_redo
  loop1542_done:
    pop_eh 
.annotate 'line', 1363
    find_lex $P116, "self"
    find_lex $P117, "$bodypast"
    find_lex $P118, "@arglist"
    $P119 = $P116."as_post"($P117, "v" :named("rtype"), $P118 :named("arglist"))
    store_lex "$bodypost", $P119
.annotate 'line', 1366
    find_lex $P116, "$ops"
    find_lex $P117, "self"
    find_lex $P118, "$testpost"
    find_lex $P119, "$prepost"
    find_lex $P120, "$bodypost"
    $P121 = $P117."loop_gen"($P118 :named("test"), $P119 :named("pre"), $P120 :named("body"))
    $P116."push"($P121)
.annotate 'line', 1368
    find_lex $P116, "$ops"
    find_lex $P117, "$undeflabel"
    $P116."push"($P117)
.annotate 'line', 1369
    find_lex $P116, "$ops"
    find_lex $P117, "$testpost"
    $P116."result"($P117)
.annotate 'line', 1323
    find_lex $P116, "$ops"
    .return ($P116)
  control_1517:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1537"  :anon :subid("65_1312695743.39515") :outer("64_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1355
    new $P117, "Undef"
    set $P1539, $P117
    .lex "$nextarg", $P1539
    find_lex $P118, "self"
    $P119 = $P118."tempreg"("P")
    store_lex "$nextarg", $P119
.annotate 'line', 1356
    find_lex $P118, "$prepost"
    find_lex $P119, "$nextarg"
    find_lex $P120, "$testpost"
    $P118."push_pirop"("shift", $P119, $P120)
.annotate 'line', 1357
    find_lex $P118, "$arity"
    set $N102, $P118
    islt $I102, $N102, 1.0
    unless $I102, if_1540_end
    die 0, .CONTROL_LOOP_LAST
  if_1540_end:
.annotate 'line', 1358
    find_lex $P118, "@arglist"
    find_lex $P119, "$nextarg"
    push $P118, $P119
.annotate 'line', 1354
    find_lex $P118, "$arity"
    clone $P1541, $P118
    dec $P118
    .return ($P1541)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("66_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1546
    .param pmc param_1547 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1379
    .const 'Sub' $P1555 = "67_1312695743.39515" 
    capture_lex $P1555
    new $P1545, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1545, control_1544
    push_eh $P1545
    .lex "self", self
    .lex "$node", param_1546
    .lex "%options", param_1547
.annotate 'line', 1381
    new $P106, "Undef"
    set $P1548, $P106
    .lex "$ops", $P1548
.annotate 'line', 1382
    $P1550 = root_new ['parrot';'ResizablePMCArray']
    set $P1549, $P1550
    .lex "@posargs", $P1549
.annotate 'line', 1390
    new $P107, "Undef"
    set $P1551, $P107
    .lex "$returns", $P1551
.annotate 'line', 1393
    new $P108, "Undef"
    set $P1552, $P108
    .lex "$listpost", $P1552
.annotate 'line', 1379
    find_lex $P109, "$ops"
    find_lex $P109, "@posargs"
.annotate 'line', 1383

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1390
    find_lex $P109, "$node"
    $P110 = $P109."returns"()
    store_lex "$returns", $P110
.annotate 'line', 1391
    find_lex $P109, "$returns"
    if $P109, unless_1553_end
    new $P110, "String"
    assign $P110, "ResizablePMCArray"
    store_lex "$returns", $P110
  unless_1553_end:
.annotate 'line', 1393
    find_lex $P109, "self"
    find_lex $P110, "$returns"
    $P111 = $P109."as_vivipost"($P110, "P" :named("rtype"))
    store_lex "$listpost", $P111
.annotate 'line', 1394
    find_lex $P109, "$ops"
    find_lex $P110, "$listpost"
    $P109."result"($P110)
.annotate 'line', 1395
    find_lex $P109, "$ops"
    find_lex $P110, "$listpost"
    $P109."push"($P110)
.annotate 'line', 1396
    find_lex $P110, "@posargs"
    defined $I101, $P110
    unless $I101, for_undef_339
    iter $P109, $P110
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1557_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1557_test:
    unless $P109, loop1557_done
    shift $P111, $P109
  loop1557_redo:
    .const 'Sub' $P1555 = "67_1312695743.39515" 
    capture_lex $P1555
    $P1555($P111)
  loop1557_next:
    goto loop1557_test
  loop1557_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1557_next
    eq $P117, .CONTROL_LOOP_REDO, loop1557_redo
  loop1557_done:
    pop_eh 
  for_undef_339:
.annotate 'line', 1379
    find_lex $P109, "$ops"
    .return ($P109)
  control_1544:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1554"  :anon :subid("67_1312695743.39515") :outer("66_1312695743.39515")
    .param pmc param_1556
.annotate 'file', ''
.annotate 'line', 1396
    .lex "$_", param_1556
    find_lex $P112, "$ops"
    find_lex $P113, "$listpost"
    find_lex $P114, "$_"
    $P115 = $P112."push_pirop"("push", $P113, $P114)
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("68_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1561
    .param pmc param_1562 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1405
    new $P1560, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1560, control_1559
    push_eh $P1560
    .lex "self", self
    .lex "$node", param_1561
    .lex "%options", param_1562
.annotate 'line', 1406
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."node_as_post"($P107, $P108)
.annotate 'line', 1405
    .return ($P109)
  control_1559:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("69_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1566
    .param pmc param_1567 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1416
    new $P1565, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1565, control_1564
    push_eh $P1565
    .lex "self", self
    .lex "$node", param_1566
    .lex "%options", param_1567
.annotate 'line', 1417
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("node"))
.annotate 'line', 1416
    .return ($P108)
  control_1564:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("70_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1571
    .param pmc param_1572 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1425
    .const 'Sub' $P1580 = "71_1312695743.39515" 
    capture_lex $P1580
    new $P1570, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1570, control_1569
    push_eh $P1570
    .lex "self", self
    .lex "$node", param_1571
    .lex "%options", param_1572
.annotate 'line', 1426
    new $P106, "Undef"
    set $P1573, $P106
    .lex "$ops", $P1573
.annotate 'line', 1428
    new $P107, "Undef"
    set $P1574, $P107
    .lex "$exreg", $P1574
.annotate 'line', 1429
    new $P108, "Undef"
    set $P1575, $P108
    .lex "$extype", $P1575
.annotate 'line', 1434
    new $P109, "Undef"
    set $P1576, $P109
    .lex "$cpast", $P1576
.annotate 'line', 1426
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1428
    find_lex $P110, "self"
    $P111 = $P110."tempreg"("P")
    store_lex "$exreg", $P111
.annotate 'line', 1429
    find_lex $P110, "$exreg"
    concat $P111, $P110, "['type']"
    store_lex "$extype", $P111
.annotate 'line', 1430
    find_lex $P110, "$ops"
    find_lex $P111, "$exreg"
    $P110."push_pirop"("new", $P111, "\"Exception\"")
.annotate 'line', 1431
    find_lex $P110, "$ops"
    find_lex $P111, "$extype"
    $P110."push_pirop"("set", $P111, ".CONTROL_RETURN")
.annotate 'line', 1432
    find_dynamic_lex $P110, "$*SUB"
    unless_null $P110, vivify_340
    get_hll_global $P110, "$SUB"
    unless_null $P110, vivify_341
    die "Contextual $*SUB not found"
  vivify_341:
  vivify_340:
    $P110."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1434
    find_lex $P1577, "$node"
    unless_null $P1577, vivify_342
    $P1577 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P110, $P1577[0]
    unless_null $P110, vivify_343
    new $P110, "Undef"
  vivify_343:
    store_lex "$cpast", $P110
.annotate 'line', 1435
    find_lex $P110, "$cpast"
    unless $P110, if_1578_end
    .const 'Sub' $P1580 = "71_1312695743.39515" 
    capture_lex $P1580
    $P1580()
  if_1578_end:
.annotate 'line', 1441
    find_lex $P110, "$ops"
    find_lex $P111, "$exreg"
    $P110."push_pirop"("throw", $P111)
.annotate 'line', 1425
    find_lex $P110, "$ops"
    .return ($P110)
  control_1569:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1579"  :anon :subid("71_1312695743.39515") :outer("70_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1436
    new $P111, "Undef"
    set $P1581, $P111
    .lex "$cpost", $P1581
    find_lex $P112, "self"
    find_lex $P113, "$cpast"
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$cpost", $P114
.annotate 'line', 1437
    find_lex $P112, "self"
    find_lex $P113, "$cpost"
    $P114 = $P112."coerce"($P113, "P")
    store_lex "$cpost", $P114
.annotate 'line', 1438
    find_lex $P112, "$ops"
    find_lex $P113, "$cpost"
    $P112."push"($P113)
.annotate 'line', 1439
    find_lex $P112, "$ops"
    find_lex $P113, "$exreg"
    find_lex $P114, "$cpost"
    $P115 = $P112."push_pirop"("setattribute", $P113, "'payload'", $P114)
.annotate 'line', 1435
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("72_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1585
    .param pmc param_1586 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1453
    new $P1584, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1584, control_1583
    push_eh $P1584
    .lex "self", self
    .lex "$node", param_1585
    .lex "%options", param_1586
.annotate 'line', 1454
    new $P106, "Undef"
    set $P1587, $P106
    .lex "$ops", $P1587
.annotate 'line', 1456
    new $P107, "Undef"
    set $P1588, $P107
    .lex "$S0", $P1588
.annotate 'line', 1457
    new $P108, "Undef"
    set $P1589, $P108
    .lex "$catchlabel", $P1589
.annotate 'line', 1458
    new $P109, "Undef"
    set $P1590, $P109
    .lex "$endlabel", $P1590
.annotate 'line', 1460
    new $P110, "Undef"
    set $P1591, $P110
    .lex "$rtype", $P1591
.annotate 'line', 1462
    new $P111, "Undef"
    set $P1592, $P111
    .lex "$trypost", $P1592
.annotate 'line', 1466
    new $P112, "Undef"
    set $P1593, $P112
    .lex "$elsepast", $P1593
.annotate 'line', 1472
    new $P113, "Undef"
    set $P1594, $P113
    .lex "$catchpast", $P1594
.annotate 'line', 1454
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1456
    find_lex $P114, "self"
    $P115 = $P114."unique"("catch_")
    store_lex "$S0", $P115
.annotate 'line', 1457
    get_hll_global $P114, ["POST"], "Label"
    find_lex $P115, "$S0"
    $P116 = $P114."new"($P115 :named("result"))
    store_lex "$catchlabel", $P116
.annotate 'line', 1458
    get_hll_global $P114, ["POST"], "Lable"
    find_lex $P115, "$S0"
    concat $P116, $P115, "_end"
    $P117 = $P114."new"($P116 :named("result"))
    store_lex "$endlabel", $P117
.annotate 'line', 1460
    find_lex $P1595, "%options"
    unless_null $P1595, vivify_344
    $P1595 = root_new ['parrot';'Hash']
  vivify_344:
    set $P114, $P1595["rtype"]
    unless_null $P114, vivify_345
    new $P114, "Undef"
  vivify_345:
    store_lex "$rtype", $P114
.annotate 'line', 1462
    find_lex $P114, "self"
    find_lex $P1596, "$node"
    unless_null $P1596, vivify_346
    $P1596 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P115, $P1596[0]
    unless_null $P115, vivify_347
    new $P115, "Undef"
  vivify_347:
    find_lex $P116, "$rtype"
    $P117 = $P114."as_post"($P115, $P116 :named("rtype"))
    store_lex "$trypost", $P117
.annotate 'line', 1463
    find_lex $P114, "$ops"
    find_lex $P115, "$catchlabel"
    $P114."push_pirop"("push_eh", $P115)
.annotate 'line', 1464
    find_lex $P114, "$ops"
    find_lex $P115, "$trypost"
    $P114."push"($P115)
.annotate 'line', 1465
    find_lex $P114, "$ops"
    $P114."push_pirop"("pop_eh")
.annotate 'line', 1466
    find_lex $P1597, "$node"
    unless_null $P1597, vivify_348
    $P1597 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P114, $P1597[2]
    unless_null $P114, vivify_349
    new $P114, "Undef"
  vivify_349:
    store_lex "$elsepast", $P114
.annotate 'line', 1467
    find_lex $P114, "$elsepast"
    unless $P114, if_1598_end
.annotate 'line', 1468
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$elsepast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    $P115."push"($P118)
  if_1598_end:
.annotate 'line', 1470
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push_pirop"("goto", $P115)
.annotate 'line', 1471
    find_lex $P114, "$ops"
    find_lex $P115, "$catchlabel"
    $P114."push"($P115)
.annotate 'line', 1472
    find_lex $P1599, "$node"
    unless_null $P1599, vivify_350
    $P1599 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P114, $P1599[1]
    unless_null $P114, vivify_351
    new $P114, "Undef"
  vivify_351:
    store_lex "$catchpast", $P114
.annotate 'line', 1473
    find_lex $P114, "$catchpast"
    unless $P114, if_1600_end
.annotate 'line', 1474
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$catchpast"
    $P118 = $P116."as_post"($P117, "v" :named("rtype"))
    $P115."push"($P118)
.annotate 'line', 1475
    find_lex $P115, "$ops"
    $P115."push_pirop"("pop_eh")
  if_1600_end:
.annotate 'line', 1477
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push"($P115)
.annotate 'line', 1478
    find_lex $P114, "$ops"
    find_lex $P115, "$trypost"
    $P114."result"($P115)
.annotate 'line', 1453
    find_lex $P114, "$ops"
    .return ($P114)
  control_1583:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("73_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1604
    .param pmc param_1605 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1491
    .const 'Sub' $P1620 = "75_1312695743.39515" 
    capture_lex $P1620
    .const 'Sub' $P1613 = "74_1312695743.39515" 
    capture_lex $P1613
    new $P1603, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1603, control_1602
    push_eh $P1603
    .lex "self", self
    .lex "$node", param_1604
    .lex "%options", param_1605
.annotate 'line', 1493
    $P1607 = root_new ['parrot';'ResizablePMCArray']
    set $P1606, $P1607
    .lex "@clist", $P1606
.annotate 'line', 1494
    new $P106, "Undef"
    set $P1608, $P106
    .lex "$cpast", $P1608
.annotate 'line', 1502
    new $P107, "Undef"
    set $P1609, $P107
    .lex "$ops", $P1609
.annotate 'line', 1504
    new $P108, "Undef"
    set $P1610, $P108
    .lex "$endlabel", $P1610
.annotate 'line', 1507
    new $P109, "Undef"
    set $P1611, $P109
    .lex "$apost", $P1611
.annotate 'line', 1493
    new $P110, "ResizablePMCArray"
    store_lex "@clist", $P110
.annotate 'line', 1494
    find_lex $P110, "$node"
    store_lex "$cpast", $P110
.annotate 'line', 1495
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1617_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1617_test:
    find_lex $P110, "$cpast"
    get_hll_global $P111, ["PAST"], "Op"
    $P112 = $P110."isa"($P111)
    unless $P112, loop1617_done
  loop1617_redo:
    .const 'Sub' $P1613 = "74_1312695743.39515" 
    capture_lex $P1613
    $P1613()
  loop1617_next:
    goto loop1617_test
  loop1617_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1617_next
    eq $P116, .CONTROL_LOOP_REDO, loop1617_redo
  loop1617_done:
    pop_eh 
.annotate 'line', 1502
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1503
    find_lex $P110, "$ops"
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    $P110."result"($P112)
.annotate 'line', 1504
    get_hll_global $P110, ["POST"], "Label"
    $P111 = $P110("chain_end_" :named("name"))
    store_lex "$endlabel", $P111
.annotate 'line', 1506
    find_lex $P110, "@clist"
    pop $P111, $P110
    store_lex "$cpast", $P111
.annotate 'line', 1507
    find_lex $P110, "self"
    find_lex $P1618, "$cpast"
    unless_null $P1618, vivify_354
    $P1618 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P111, $P1618[0]
    unless_null $P111, vivify_355
    new $P111, "Undef"
  vivify_355:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$apost", $P112
.annotate 'line', 1508
    find_lex $P110, "$ops"
    find_lex $P111, "$apost"
    $P110."push"($P111)
.annotate 'line', 1510
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1625_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1625_test:
    new $P110, "Integer"
    assign $P110, 1
    unless $P110, loop1625_done
  loop1625_redo:
    .const 'Sub' $P1620 = "75_1312695743.39515" 
    capture_lex $P1620
    $P1620()
  loop1625_next:
    goto loop1625_test
  loop1625_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1625_next
    eq $P115, .CONTROL_LOOP_REDO, loop1625_redo
  loop1625_done:
    pop_eh 
.annotate 'line', 1520
    find_lex $P110, "$ops"
    find_lex $P111, "$endlabel"
    $P110."push"($P111)
.annotate 'line', 1491
    find_lex $P110, "$ops"
    .return ($P110)
  control_1602:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1612"  :anon :subid("74_1312695743.39515") :outer("73_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1496
    new $P113, "Undef"
    set $P1614, $P113
    .lex "$pasttype", $P1614
    find_lex $P114, "$cpast"
    $P115 = $P114."pasttype"()
    store_lex "$pasttype", $P115
.annotate 'line', 1497
    find_lex $P114, "$pasttype"
    set $S101, $P114
    isne $I101, $S101, "chain"
    unless $I101, if_1615_end
    die 0, .CONTROL_LOOP_LAST
  if_1615_end:
.annotate 'line', 1498
    find_lex $P114, "@clist"
    find_lex $P115, "$cpast"
    push $P114, $P115
.annotate 'line', 1499
    find_lex $P1616, "$cpast"
    unless_null $P1616, vivify_352
    $P1616 = root_new ['parrot';'ResizablePMCArray']
  vivify_352:
    set $P114, $P1616[0]
    unless_null $P114, vivify_353
    new $P114, "Undef"
  vivify_353:
    store_lex "$cpast", $P114
.annotate 'line', 1495
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1619"  :anon :subid("75_1312695743.39515") :outer("73_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1511
    new $P111, "Undef"
    set $P1621, $P111
    .lex "$bpost", $P1621
.annotate 'line', 1513
    new $P112, "Undef"
    set $P1622, $P112
    .lex "$name", $P1622
.annotate 'line', 1511
    find_lex $P113, "self"
    find_lex $P1623, "$cpast"
    unless_null $P1623, vivify_356
    $P1623 = root_new ['parrot';'ResizablePMCArray']
  vivify_356:
    set $P114, $P1623[1]
    unless_null $P114, vivify_357
    new $P114, "Undef"
  vivify_357:
    $P115 = $P113."as_post"($P114, "P" :named("rtype"))
    store_lex "$bpost", $P115
.annotate 'line', 1512
    find_lex $P113, "$ops"
    find_lex $P114, "$bpost"
    $P113."push"($P114)
.annotate 'line', 1513
    find_lex $P113, "self"
    find_lex $P114, "$cpast"
    $P115 = $P114."name"()
    $P116 = $P113."escape"($P115)
    store_lex "$name", $P116
.annotate 'line', 1514
    find_lex $P113, "$ops"
    find_lex $P114, "$name"
    find_lex $P115, "$apost"
    find_lex $P116, "$bpost"
    find_lex $P117, "$ops"
    $P113."push_pirop"("call", $P114, $P115, $P116, $P117 :named("result"))
.annotate 'line', 1515
    find_lex $P113, "@clist"
    if $P113, unless_1624_end
    die 0, .CONTROL_LOOP_LAST
  unless_1624_end:
.annotate 'line', 1516
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P113."push_pirop"("unless", $P114, $P115)
.annotate 'line', 1517
    find_lex $P113, "@clist"
    pop $P114, $P113
    store_lex "$cpast", $P114
.annotate 'line', 1518
    find_lex $P113, "$bpost"
    store_lex "$apost", $P113
.annotate 'line', 1510
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("76_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1629
    .param pmc param_1630 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1531
    new $P1628, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1628, control_1627
    push_eh $P1628
    .lex "self", self
    .lex "$node", param_1629
    .lex "%options", param_1630
.annotate 'line', 1532
    new $P106, "Undef"
    set $P1631, $P106
    .lex "$ops", $P1631
.annotate 'line', 1534
    new $P107, "Undef"
    set $P1632, $P107
    .lex "$lpost", $P1632
.annotate 'line', 1538
    new $P108, "Undef"
    set $P1633, $P108
    .lex "$endlabel", $P1633
.annotate 'line', 1540
    new $P109, "Undef"
    set $P1634, $P109
    .lex "$reg", $P1634
.annotate 'line', 1543
    new $P110, "Undef"
    set $P1635, $P110
    .lex "$rpost", $P1635
.annotate 'line', 1532
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    find_lex $P113, "self"
    $P114 = $P113."unique"("$P")
    $P115 = $P111."new"($P112 :named("node"), $P114 :named("result"))
    store_lex "$ops", $P115
.annotate 'line', 1534
    find_lex $P111, "self"
    find_lex $P1636, "$node"
    unless_null $P1636, vivify_358
    $P1636 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P112, $P1636[0]
    unless_null $P112, vivify_359
    new $P112, "Undef"
  vivify_359:
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$lpost", $P113
.annotate 'line', 1535
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."push"($P112)
.annotate 'line', 1536
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$lpost"
    $P111."push_pirop"("set", $P112, $P113)
.annotate 'line', 1538
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("default_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$endlabel", $P114
.annotate 'line', 1540
    find_lex $P111, "self"
    $P112 = $P111."unique"("$I")
    store_lex "$reg", $P112
.annotate 'line', 1541
    find_lex $P111, "$ops"
    find_lex $P112, "$reg"
    find_lex $P113, "$ops"
    $P111."push_pirop"("defined", $P112, $P113)
.annotate 'line', 1542
    find_lex $P111, "$ops"
    find_lex $P112, "$reg"
    find_lex $P113, "$endlabel"
    $P111."push_pirop"("if", $P112, $P113)
.annotate 'line', 1543
    find_lex $P111, "self"
    find_lex $P1637, "$node"
    unless_null $P1637, vivify_360
    $P1637 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P112, $P1637[1]
    unless_null $P112, vivify_361
    new $P112, "Undef"
  vivify_361:
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$rpost", $P113
.annotate 'line', 1544
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P111."push"($P112)
.annotate 'line', 1545
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$rpost"
    $P111."push_pirop"("set", $P112, $P113)
.annotate 'line', 1546
    find_lex $P111, "$ops"
    find_lex $P112, "$endlabel"
    $P111."push"($P112)
.annotate 'line', 1531
    find_lex $P111, "$ops"
    .return ($P111)
  control_1627:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("77_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1641
    .param pmc param_1642 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1557
    .const 'Sub' $P1653 = "78_1312695743.39515" 
    capture_lex $P1653
    new $P1640, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1640, control_1639
    push_eh $P1640
    .lex "self", self
    .lex "$node", param_1641
    .lex "%options", param_1642
.annotate 'line', 1558
    new $P106, "Undef"
    set $P1643, $P106
    .lex "$ops", $P1643
.annotate 'line', 1561
    new $P107, "Undef"
    set $P1644, $P107
    .lex "$falselabel", $P1644
.annotate 'line', 1562
    new $P108, "Undef"
    set $P1645, $P108
    .lex "$endlabel", $P1645
.annotate 'line', 1564
    new $P109, "Undef"
    set $P1646, $P109
    .lex "$i", $P1646
.annotate 'line', 1565
    new $P110, "Undef"
    set $P1647, $P110
    .lex "$t", $P1647
.annotate 'line', 1566
    new $P111, "Undef"
    set $P1648, $P111
    .lex "$u", $P1648
.annotate 'line', 1567
    new $P112, "Undef"
    set $P1649, $P112
    .lex "$iter", $P1649
.annotate 'line', 1568
    new $P113, "Undef"
    set $P1650, $P113
    .lex "$apost", $P1650
.annotate 'line', 1569
    new $P114, "Undef"
    set $P1651, $P114
    .lex "$bpost", $P1651
.annotate 'line', 1558
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1559
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    $P117 = $P116."unique"("$P")
    $P115."result"($P117)
.annotate 'line', 1561
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P116
.annotate 'line', 1562
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P116
.annotate 'line', 1564
    find_lex $P115, "self"
    $P116 = $P115."unique"("$I")
    store_lex "$i", $P116
.annotate 'line', 1565
    find_lex $P115, "self"
    $P116 = $P115."unique"("$i")
    store_lex "$t", $P116
.annotate 'line', 1566
    find_lex $P115, "self"
    $P116 = $P115."unique"("$i")
    store_lex "$u", $P116
.annotate 'line', 1567
    get_hll_global $P115, "node"
    $P116 = $P115."iterator"()
    store_lex "$iter", $P116
.annotate 'line', 1568
    find_lex $P115, "self"
    find_lex $P116, "$iter"
    shift $P117, $P116
    $P118 = $P115."as_post"($P117, "P" :named("rtype"))
    store_lex "$apost", $P118
.annotate 'line', 1557
    find_lex $P115, "$bpost"
.annotate 'line', 1570
    find_lex $P115, "$ops"
    find_lex $P116, "$apost"
    $P115."push"($P116)
.annotate 'line', 1571
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    find_lex $P117, "$apost"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1572
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$apost"
    $P115."push_pirop"("istrue", $P116, $P117)
.annotate 'line', 1573
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1656_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1656_test:
    new $P115, "Integer"
    assign $P115, 1
    unless $P115, loop1656_done
  loop1656_redo:
    .const 'Sub' $P1653 = "78_1312695743.39515" 
    capture_lex $P1653
    $P1653()
  loop1656_next:
    goto loop1656_test
  loop1656_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1656_next
    eq $P118, .CONTROL_LOOP_REDO, loop1656_redo
  loop1656_done:
    pop_eh 
.annotate 'line', 1586
    find_lex $P115, "$ops"
    find_lex $P116, "$t"
    find_lex $P117, "$endlabel"
    $P115."push_pirop"("if", $P116, $P117)
.annotate 'line', 1587
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P115."push_pirop"("set", $P116, $P117)
.annotate 'line', 1588
    find_lex $P115, "$ops"
    find_lex $P116, "$endlabel"
    $P115."push_pirop"("goto", $P116)
.annotate 'line', 1589
    find_lex $P115, "$ops"
    find_lex $P116, "$falselabel"
    $P115."push"($P116)
.annotate 'line', 1590
    find_lex $P115, "$ops"
    find_lex $P116, "$ops"
    $P115."push_pirop"("new", $P116, "\"Undef\"")
.annotate 'line', 1591
    find_lex $P115, "$ops"
    find_lex $P116, "$endlabel"
    $P115."push"($P116)
.annotate 'line', 1557
    find_lex $P115, "$ops"
    .return ($P115)
  control_1639:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1652"  :anon :subid("78_1312695743.39515") :outer("77_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1580
    new $P116, "Undef"
    set $P1654, $P116
    .lex "$truelabel", $P1654
.annotate 'line', 1574
    find_lex $P117, "self"
    find_lex $P118, "$iter"
    shift $P119, $P118
    $P120 = $P117."as_post"($P119, "P" :named("rtype"))
    store_lex "$bpost", $P120
.annotate 'line', 1575
    find_lex $P117, "$ops"
    find_lex $P118, "$bpost"
    $P117."push"($P118)
.annotate 'line', 1576
    find_lex $P117, "$ops"
    find_lex $P118, "$u"
    find_lex $P119, "$bpost"
    $P117."push_pirop"("istrue", $P118, $P119)
.annotate 'line', 1577
    find_lex $P117, "$ops"
    find_lex $P118, "$i"
    find_lex $P119, "$t"
    find_lex $P120, "$u"
    $P117."push_pirop"("and", $P118, $P119, $P120)
.annotate 'line', 1578
    find_lex $P117, "$ops"
    find_lex $P118, "$i"
    find_lex $P119, "$falselabel"
    $P117."push_pirop"("if", $P118, $P119)
.annotate 'line', 1579
    find_lex $P117, "$iter"
    if $P117, unless_1655_end
    die 0, .CONTROL_LOOP_LAST
  unless_1655_end:
.annotate 'line', 1580
    get_hll_global $P117, ["POST"], "Label"
    $P118 = $P117."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P118
.annotate 'line', 1581
    find_lex $P117, "$ops"
    find_lex $P118, "$t"
    find_lex $P119, "$truelabel"
    $P117."push_pirop"("if", $P118, $P119)
.annotate 'line', 1582
    find_lex $P117, "$ops"
    find_lex $P118, "$ops"
    find_lex $P119, "$bpost"
    $P117."push_pirop"("set", $P118, $P119)
.annotate 'line', 1583
    find_lex $P117, "$ops"
    find_lex $P118, "$t"
    find_lex $P119, "$u"
    $P117."push_pirop"("set", $P118, $P119)
.annotate 'line', 1584
    find_lex $P117, "$ops"
    find_lex $P118, "$truelabel"
    $P119 = $P117."push"($P118)
.annotate 'line', 1573
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("79_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1660
    .param pmc param_1661 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1600
    new $P1659, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1659, control_1658
    push_eh $P1659
    .lex "self", self
    .lex "$node", param_1660
    .lex "%options", param_1661
.annotate 'line', 1601
    new $P106, "Undef"
    set $P1662, $P106
    .lex "$lpast", $P1662
.annotate 'line', 1602
    new $P107, "Undef"
    set $P1663, $P107
    .lex "$rpast", $P1663
.annotate 'line', 1604
    new $P108, "Undef"
    set $P1664, $P108
    .lex "$ops", $P1664
.annotate 'line', 1605
    new $P109, "Undef"
    set $P1665, $P109
    .lex "$rpost", $P1665
.annotate 'line', 1610
    new $P110, "Undef"
    set $P1666, $P110
    .lex "$lpost", $P1666
.annotate 'line', 1601
    find_lex $P1667, "$node"
    unless_null $P1667, vivify_362
    $P1667 = root_new ['parrot';'ResizablePMCArray']
  vivify_362:
    set $P111, $P1667[0]
    unless_null $P111, vivify_363
    new $P111, "Undef"
  vivify_363:
    store_lex "$lpast", $P111
.annotate 'line', 1602
    find_lex $P1668, "$node"
    unless_null $P1668, vivify_364
    $P1668 = root_new ['parrot';'ResizablePMCArray']
  vivify_364:
    set $P111, $P1668[1]
    unless_null $P111, vivify_365
    new $P111, "Undef"
  vivify_365:
    store_lex "$rpast", $P111
.annotate 'line', 1604
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1605
    find_lex $P111, "self"
    find_lex $P112, "$rpast"
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$rpost", $P113
.annotate 'line', 1606
    find_lex $P111, "self"
    find_lex $P112, "$rpost"
    $P113 = $P111."coerce"($P112, "P")
    store_lex "$rpost", $P113
.annotate 'line', 1607
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P111."push"($P112)
.annotate 'line', 1609
    find_lex $P111, "$lpast"
    $P111."lvalue"(1)
.annotate 'line', 1610
    find_lex $P111, "self"
    find_lex $P112, "$lpast"
    find_lex $P113, "$rpost"
    $P114 = $P111."as_post"($P112, $P113 :named("bindpost"))
    store_lex "$lpost", $P114
.annotate 'line', 1611
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."push"($P112)
.annotate 'line', 1612
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P111."result"($P112)
.annotate 'line', 1600
    find_lex $P111, "$ops"
    .return ($P111)
  control_1658:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("80_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1672
    .param pmc param_1673 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1620
    new $P1671, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1671, control_1670
    push_eh $P1671
    .lex "self", self
    .lex "$node", param_1672
    .lex "%options", param_1673
.annotate 'line', 1621
    new $P106, "Undef"
    set $P1674, $P106
    .lex "$rpost", $P1674
.annotate 'line', 1622
    new $P107, "Undef"
    set $P1675, $P107
    .lex "$lpost", $P1675
.annotate 'line', 1623
    new $P108, "Undef"
    set $P1676, $P108
    .lex "$ops", $P1676
.annotate 'line', 1621
    find_lex $P109, "self"
    find_lex $P1677, "$node"
    unless_null $P1677, vivify_366
    $P1677 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P110, $P1677[1]
    unless_null $P110, vivify_367
    new $P110, "Undef"
  vivify_367:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$rpost", $P111
.annotate 'line', 1622
    find_lex $P109, "self"
    find_lex $P1678, "$node"
    unless_null $P1678, vivify_368
    $P1678 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P110, $P1678[0]
    unless_null $P110, vivify_369
    new $P110, "Undef"
  vivify_369:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$lpost", $P111
.annotate 'line', 1623
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$rpost"
    find_lex $P111, "$lpost"
    find_lex $P112, "$node"
    find_lex $P113, "$lpost"
    $P114 = $P109."new"($P110, $P111, $P112 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1625
    find_lex $P109, "$ops"
    find_lex $P110, "$lpost"
    find_lex $P111, "$rpost"
    $P109."push_pirop"("copy", $P110, $P111)
.annotate 'line', 1620
    find_lex $P109, "$ops"
    .return ($P109)
  control_1670:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("81_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Op"])
    .param pmc param_1682
    .param pmc param_1683 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1634
    new $P1681, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1681, control_1680
    push_eh $P1681
    .lex "self", self
    .lex "$node", param_1682
    .lex "%options", param_1683
.annotate 'line', 1639
    new $P106, "Undef"
    set $P1684, $P106
    .lex "$ops", $P1684
.annotate 'line', 1640
    new $P107, "Undef"
    set $P1685, $P107
    .lex "$inline", $P1685
.annotate 'line', 1643
    new $P108, "Undef"
    set $P1686, $P108
    .lex "$result", $P1686
.annotate 'line', 1644
    new $P109, "Undef"
    set $P1687, $P109
    .lex "$i", $P1687
.annotate 'line', 1657
    $P1689 = root_new ['parrot';'ResizablePMCArray']
    set $P1688, $P1689
    .lex "@arglist", $P1688
.annotate 'line', 1659
    new $P110, "Undef"
    set $P1690, $P110
    .lex "$s", $P1690
.annotate 'line', 1639
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P111."post_children"($P112, "vP" :named("signature"))
    store_lex "$ops", $P113
.annotate 'line', 1640
    find_lex $P111, "$node"
    $P112 = $P111."inline"()
    store_lex "$inline", $P112
.annotate 'line', 1641
    find_lex $P111, "$inline"
    does $I101, $P111, "array"
    unless $I101, if_1691_end
    find_lex $P112, "$inline"
    join $S101, "\n", $P112
    new $P113, 'String'
    set $P113, $S101
    store_lex "$inline", $P113
  if_1691_end:
.annotate 'line', 1643
    new $P111, "String"
    assign $P111, ""
    store_lex "$result", $P111
.annotate 'line', 1644
    find_lex $P111, "$inline"
    set $S101, $P111
    index $I101, $S101, "%t"
    new $P112, 'Integer'
    set $P112, $I101
    store_lex "$i", $P112
.annotate 'line', 1645
    find_lex $P111, "$i"
    set $N101, $P111
    isge $I101, $N101, 0.0
    if $I101, if_1692
.annotate 'line', 1651
    find_lex $P112, "$inline"
    set $S101, $P112
    index $I102, $S101, "%r"
    new $P113, 'Integer'
    set $P113, $I102
    store_lex "$i", $P113
.annotate 'line', 1652
    find_lex $P112, "$i"
    set $N102, $P112
    isge $I102, $N102, 0.0
    unless $I102, if_1693_end
.annotate 'line', 1653
    find_lex $P113, "self"
    $P114 = $P113."unique"("$P")
    store_lex "$result", $P114
.annotate 'line', 1654
    find_lex $P113, "$ops"
    find_lex $P114, "$result"
    $P113."result"($P114)
  if_1693_end:
.annotate 'line', 1650
    goto if_1692_end
  if_1692:
.annotate 'line', 1646
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    store_lex "$result", $P113
.annotate 'line', 1647
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."push_pirop"("new", $P113, "'Undef'")
.annotate 'line', 1648
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
  if_1692_end:
.annotate 'line', 1657
    find_lex $P111, "$ops"
    $P112 = $P111."list"()
    store_lex "@arglist", $P112
.annotate 'line', 1658
    find_lex $P111, "$ops"
    find_lex $P112, "@arglist"
    find_lex $P113, "$inline"
    find_lex $P114, "$result"
    $P111."push_pirop"("inline", $P112 :flat, $P113 :named("inline"), $P114 :named("result"))
.annotate 'line', 1659
    find_lex $P1694, "%options"
    unless_null $P1694, vivify_370
    $P1694 = root_new ['parrot';'Hash']
  vivify_370:
    set $P111, $P1694["rtype"]
    unless_null $P111, vivify_371
    new $P111, "Undef"
  vivify_371:
    store_lex "$s", $P111
.annotate 'line', 1634
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
.sub "as_post"  :subid("82_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"])
    .param pmc param_1698
    .param pmc param_1699 :slurpy :named
.annotate 'file', ''
.annotate 'line', 1671
    .const 'Sub' $P1739 = "86_1312695743.39515" 
    capture_lex $P1739
    .const 'Sub' $P1728 = "85_1312695743.39515" 
    capture_lex $P1728
    .const 'Sub' $P1704 = "83_1312695743.39515" 
    capture_lex $P1704
    new $P1697, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1697, control_1696
    push_eh $P1697
    .lex "self", self
    .lex "$node", param_1698
    .lex "%options", param_1699
.annotate 'line', 1673
    new $P106, "Undef"
    set $P1700, $P106
    .lex "$bindpost", $P1700
.annotate 'line', 1677
    new $P107, "Undef"
    set $P1701, $P107
    .lex "$scope", $P1701
.annotate 'line', 1678
    new $P108, "Undef"
    set $P1702, $P108
    .lex "$name", $P1702
.annotate 'line', 1697
    .const 'Sub' $P1704 = "83_1312695743.39515" 
    newclosure $P1723, $P1704
    set $P1703, $P1723
    .lex "scope_error", $P1703
.annotate 'line', 1673
    find_lex $P1724, "%options"
    unless_null $P1724, vivify_379
    $P1724 = root_new ['parrot';'Hash']
  vivify_379:
    set $P115, $P1724["bindpost"]
    unless_null $P115, vivify_380
    new $P115, "Undef"
  vivify_380:
    store_lex "$bindpost", $P115
.annotate 'line', 1674
    find_lex $P115, "$bindpost"
    if $P115, unless_1725_end
    new $P116, "Undef"
    store_lex "$bindpost", $P116
  unless_1725_end:
.annotate 'line', 1677
    find_lex $P115, "$node"
    $P116 = $P115."scope"()
    store_lex "$scope", $P116
.annotate 'line', 1678
    find_lex $P115, "$node"
    $P116 = $P115."name"()
    store_lex "$name", $P116
.annotate 'line', 1679
    find_lex $P115, "$scope"
    if $P115, unless_1726_end
    .const 'Sub' $P1728 = "85_1312695743.39515" 
    capture_lex $P1728
    $P1728()
  unless_1726_end:
.annotate 'line', 1692
    .const 'Sub' $P1739 = "86_1312695743.39515" 
    capture_lex $P1739
    $P1739()
.annotate 'line', 1671
    find_lex $P115, "scope_error"
    .return ($P115)
  control_1696:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("83_1312695743.39515") :outer("82_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1697
    .const 'Sub' $P1714 = "84_1312695743.39515" 
    capture_lex $P1714
    new $P1706, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1706, control_1705
    push_eh $P1706
.annotate 'line', 1699
    new $P109, "Undef"
    set $P1707, $P109
    .lex "$blockname", $P1707
.annotate 'line', 1706
    new $P110, "Undef"
    set $P1708, $P110
    .lex "$sourceline", $P1708
.annotate 'line', 1707
    new $P111, "Undef"
    set $P1709, $P111
    .lex "$source", $P1709
.annotate 'line', 1708
    new $P112, "Undef"
    set $P1710, $P112
    .lex "$pos", $P1710
.annotate 'line', 1709
    new $P113, "Undef"
    set $P1711, $P113
    .lex "$files", $P1711
.annotate 'line', 1698
    find_lex $P114, "$scope"
    unless $P114, if_1712_end
    new $P115, 'String'
    set $P115, " in '"
    find_lex $P116, "$scope"
    concat $P117, $P115, $P116
    concat $P118, $P117, "' scope"
    store_lex "$scope", $P118
  if_1712_end:
.annotate 'line', 1699
    new $P114, "String"
    assign $P114, ""
    store_lex "$blockname", $P114
.annotate 'line', 1700
    find_dynamic_lex $P115, "@*BLOCKPAST"
    unless_null $P115, vivify_372
    get_hll_global $P115, "@BLOCKPAST"
    unless_null $P115, vivify_373
    die "Contextual @*BLOCKPAST not found"
  vivify_373:
  vivify_372:
    defined $I101, $P115
    unless $I101, for_undef_374
    iter $P114, $P115
    new $P118, 'ExceptionHandler'
    set_label $P118, loop1717_handler
    $P118."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P118
  loop1717_test:
    unless $P114, loop1717_done
    shift $P116, $P114
  loop1717_redo:
    .const 'Sub' $P1714 = "84_1312695743.39515" 
    capture_lex $P1714
    $P1714($P116)
  loop1717_next:
    goto loop1717_test
  loop1717_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, 'type'
    eq $P119, .CONTROL_LOOP_NEXT, loop1717_next
    eq $P119, .CONTROL_LOOP_REDO, loop1717_redo
  loop1717_done:
    pop_eh 
  for_undef_374:
.annotate 'line', 1704
    find_lex $P114, "$blockname"
    if $P114, unless_1718_end
    new $P115, "String"
    assign $P115, "<anonymous>"
    store_lex "$blockname", $P115
  unless_1718_end:
.annotate 'line', 1706
    new $P114, "String"
    assign $P114, ""
    store_lex "$sourceline", $P114
.annotate 'line', 1707
    find_lex $P1719, "$node"
    unless_null $P1719, vivify_375
    $P1719 = root_new ['parrot';'Hash']
  vivify_375:
    set $P114, $P1719["source"]
    unless_null $P114, vivify_376
    new $P114, "Undef"
  vivify_376:
    store_lex "$source", $P114
.annotate 'line', 1708
    find_lex $P1720, "$node"
    unless_null $P1720, vivify_377
    $P1720 = root_new ['parrot';'Hash']
  vivify_377:
    set $P114, $P1720["pos"]
    unless_null $P114, vivify_378
    new $P114, "Undef"
  vivify_378:
    store_lex "$pos", $P114
.annotate 'line', 1709
    find_caller_lex $P114, "$?FILES"
    store_lex "$files", $P114
.annotate 'line', 1710
    find_lex $P115, "$source"
    if $P115, if_1722
    set $P114, $P115
    goto if_1722_end
  if_1722:
    find_lex $P116, "$files"
    set $P114, $P116
  if_1722_end:
    if $P114, unless_1721_end
.annotate 'line', 1711
    new $P117, "String"
    assign $P117, " ("
    find_lex $P118, "$files"
    concat $P119, $P117, $P118
    concat $P120, $P119, ":"
.annotate 'line', 1712
    find_lex $P121, "self"
    find_lex $P122, "$source"
    find_lex $P123, "$pos"
    $P124 = $P121."lineof"($P122, $P123)
    add $P125, $P124, 1
    concat $P126, $P120, $P125
.annotate 'line', 1711
    concat $P127, $P126, ")"
.annotate 'line', 1712
    store_lex "$sourceline", $P127
  unless_1721_end:
.annotate 'line', 1714
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
.annotate 'line', 1697
    .return ($P122)
  control_1705:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1713"  :anon :subid("84_1312695743.39515") :outer("83_1312695743.39515")
    .param pmc param_1715
.annotate 'file', ''
.annotate 'line', 1700
    .lex "$_", param_1715
.annotate 'line', 1701
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    store_lex "$blockname", $P118
.annotate 'line', 1702
    find_lex $P118, "$blockname"
    if $P118, if_1716
    set $P117, $P118
    goto if_1716_end
  if_1716:
    die 0, .CONTROL_LOOP_LAST
  if_1716_end:
.annotate 'line', 1700
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1727"  :anon :subid("85_1312695743.39515") :outer("82_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1681
    new $P116, "Undef"
    set $P1729, $P116
    .lex "$P0", $P1729
    find_lex $P117, "$name"
    find_lex $P118, "self"
    getattribute $P1730, $P118, "%!symtable"
    unless_null $P1730, vivify_381
    $P1730 = root_new ['parrot';'Hash']
  vivify_381:
    set $P119, $P1730[$P117]
    unless_null $P119, vivify_382
    new $P119, "Undef"
  vivify_382:
    store_lex "$P0", $P119
.annotate 'line', 1682
    find_lex $P117, "$P0"
    unless $P117, if_1731_end
    find_lex $P1732, "$P0"
    unless_null $P1732, vivify_383
    $P1732 = root_new ['parrot';'Hash']
  vivify_383:
    set $P118, $P1732["scope"]
    unless_null $P118, vivify_384
    new $P118, "Undef"
  vivify_384:
    store_lex "$scope", $P118
  if_1731_end:
.annotate 'line', 1683
    find_lex $P118, "$scope"
    unless $P118, unless_1733
    set $P117, $P118
    goto unless_1733_end
  unless_1733:
.annotate 'line', 1685
    find_lex $P119, "self"
    getattribute $P1734, $P119, "%!symtable"
    unless_null $P1734, vivify_385
    $P1734 = root_new ['parrot';'Hash']
  vivify_385:
    set $P120, $P1734[""]
    unless_null $P120, vivify_386
    new $P120, "Undef"
  vivify_386:
    store_lex "$P0", $P120
.annotate 'line', 1686
    find_lex $P119, "$P0"
    if $P119, unless_1735_end
    "scope_error"()
  unless_1735_end:
.annotate 'line', 1687
    find_lex $P1736, "$P0"
    unless_null $P1736, vivify_387
    $P1736 = root_new ['parrot';'Hash']
  vivify_387:
    set $P119, $P1736["scope"]
    unless_null $P119, vivify_388
    new $P119, "Undef"
  vivify_388:
    store_lex "$scope", $P119
.annotate 'line', 1688
    find_lex $P120, "$scope"
    unless $P120, unless_1737
    set $P119, $P120
    goto unless_1737_end
  unless_1737:
    $P121 = "scope_error"()
    set $P119, $P121
  unless_1737_end:
.annotate 'line', 1683
    set $P117, $P119
  unless_1733_end:
.annotate 'line', 1679
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1738"  :anon :subid("86_1312695743.39515") :outer("82_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1692
    .const 'Sub' $P1746 = "87_1312695743.39515" 
    capture_lex $P1746
    new $P1742, 'ExceptionHandler'
    set_label $P1742, control_1741
    $P1742."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1742
.annotate 'line', 1693
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
.annotate 'line', 1692
    pop_eh 
    goto skip_handler_1740
  control_1741:
.annotate 'line', 1694
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1746 = "87_1312695743.39515" 
    newclosure $P1751, $P1746
    $P1751(exception)
    new $P1752, 'Integer'
    set $P1752, 1
    set exception["handled"], $P1752
    set $I1753, exception["handled"]
    ne $I1753, 1, nothandled_1744
  handled_1743:
    .return (exception)
  nothandled_1744:
    rethrow exception
  skip_handler_1740:
.annotate 'line', 1692
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1745"  :anon :subid("87_1312695743.39515") :outer("86_1312695743.39515")
    .param pmc param_1747
.annotate 'file', ''
.annotate 'line', 1694
    .lex "$_", param_1747
    find_lex $P1748, "$_"
    set $P1749, $P1748
    .lex "$!", $P1749
    $P1750 = "scope_error"()
    .return ($P1750)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("88_1312695743.39515") :method :outer("11_1312695743.39515")
    .param pmc param_1757
    .param pmc param_1758
    .param pmc param_1759
    .param pmc param_1760
.annotate 'file', ''
.annotate 'line', 1720
    .const 'Sub' $P1767 = "89_1312695743.39515" 
    capture_lex $P1767
    new $P1756, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1756, control_1755
    push_eh $P1756
    .lex "self", self
    .lex "$node", param_1757
    .lex "$ops", param_1758
    .lex "$fetchop", param_1759
    .lex "$storeop", param_1760
.annotate 'line', 1721
    new $P106, "Undef"
    set $P1761, $P106
    .lex "$viviself", $P1761
.annotate 'line', 1722
    new $P107, "Undef"
    set $P1762, $P107
    .lex "$vivipost", $P1762
.annotate 'line', 1723
    new $P108, "Undef"
    set $P1763, $P108
    .lex "$result", $P1763
.annotate 'line', 1721
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 1722
    find_lex $P109, "self"
    find_lex $P110, "$viviself"
    $P111 = $P109."as_vivipost"($P110, "P" :named("rtype"))
    store_lex "$vivipost", $P111
.annotate 'line', 1723
    find_lex $P109, "$vivipost"
    $P110 = $P109."result"()
    store_lex "$result", $P110
.annotate 'line', 1724
    find_lex $P109, "$result"
    set $S101, $P109
    iseq $I101, $S101, ""
    unless $I101, if_1764_end
    find_lex $P110, "self"
    $P111 = $P110."tempreg"("P")
    store_lex "$result", $P111
  if_1764_end:
.annotate 'line', 1726
    find_lex $P109, "$ops"
    find_lex $P110, "$result"
    $P109."result"($P110)
.annotate 'line', 1727
    find_lex $P109, "$ops"
    find_lex $P110, "$fetchop"
    $P109."push"($P110)
.annotate 'line', 1728
    find_lex $P109, "$viviself"
    unless $P109, if_1765_end
    .const 'Sub' $P1767 = "89_1312695743.39515" 
    capture_lex $P1767
    $P1767()
  if_1765_end:
.annotate 'line', 1720
    find_lex $P109, "$ops"
    .return ($P109)
  control_1755:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1766"  :anon :subid("89_1312695743.39515") :outer("88_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1729
    new $P110, "Undef"
    set $P1768, $P110
    .lex "$vivilabel", $P1768
    get_hll_global $P111, ["POST"], "Label"
    $P112 = $P111."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P112
.annotate 'line', 1730
    find_lex $P111, "$ops"
    find_lex $P112, "$ops"
    find_lex $P113, "$vivilabel"
    $P111."push_pirop"("unless_null", $P112, $P113)
.annotate 'line', 1731
    find_lex $P111, "$ops"
    find_lex $P112, "$vivipost"
    $P111."push"($P112)
.annotate 'line', 1732
    find_lex $P111, "$node"
    $P112 = $P111."lvalue"()
    unless $P112, if_1769_end
    find_lex $P113, "$ops"
    find_lex $P114, "$storeop"
    $P113."push"($P114)
  if_1769_end:
.annotate 'line', 1733
    find_lex $P111, "$ops"
    find_lex $P112, "$vivilabel"
    $P113 = $P111."push"($P112)
.annotate 'line', 1728
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("90_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1773
    .param pmc param_1774
.annotate 'file', ''
.annotate 'line', 1739
    .const 'Sub' $P1782 = "91_1312695743.39515" 
    capture_lex $P1782
    new $P1772, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1772, control_1771
    push_eh $P1772
    .lex "self", self
    .lex "$node", param_1773
    .lex "$bindpost", param_1774
.annotate 'line', 1741
    new $P106, "Undef"
    set $P1775, $P106
    .lex "$name", $P1775
.annotate 'line', 1742
    new $P107, "Undef"
    set $P1776, $P107
    .lex "$named", $P1776
.annotate 'line', 1743
    new $P108, "Undef"
    set $P1777, $P108
    .lex "$pname", $P1777
.annotate 'line', 1746
    new $P109, "Undef"
    set $P1778, $P109
    .lex "$ops", $P1778
.annotate 'line', 1748
    new $P110, "Undef"
    set $P1779, $P110
    .lex "$viviself", $P1779
.annotate 'line', 1741
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    store_lex "$name", $P112
.annotate 'line', 1742
    find_lex $P111, "$node"
    $P112 = $P111."named"()
    store_lex "$named", $P112
.annotate 'line', 1743
    find_lex $P111, "self"
    $P112 = $P111."unique"("param_")
    store_lex "$pname", $P112
.annotate 'line', 1746
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    find_lex $P113, "$pname"
    $P114 = $P111."new"($P112 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1748
    find_lex $P111, "$node"
    $P112 = $P111."viviself"()
    store_lex "$viviself", $P112
.annotate 'line', 1749
    find_lex $P111, "$viviself"
    if $P111, if_1780
.annotate 'line', 1760
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_389
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_390
    die "Contextual $*SUB not found"
  vivify_390:
  vivify_389:
    find_lex $P115, "$pname"
    find_lex $P117, "$named"
.annotate 'line', 1761
    find_lex $P118, "$node"
    $P119 = $P118."slurpy"()
    find_lex $P120, "$node"
    $P121 = $P120."call_sig"()
.annotate 'line', 1760
    $P114."add_param"($P115, $P117 :named("named"), $P119 :named("slurpy"), $P121 :named("call_sig"))
.annotate 'line', 1759
    goto if_1780_end
  if_1780:
.annotate 'line', 1749
    .const 'Sub' $P1782 = "91_1312695743.39515" 
    capture_lex $P1782
    $P1782()
  if_1780_end:
.annotate 'line', 1764
    find_lex $P111, "$name"
    defined $I101, $P111
    unless $I101, if_1785_end
.annotate 'line', 1765
    find_lex $P112, "$ops"
    find_lex $P113, "self"
    find_lex $P114, "$name"
    $P115 = $P113."escape"($P114)
    find_lex $P116, "$ops"
    $P112."push_pirop"(".lex", $P115, $P116)
  if_1785_end:
.annotate 'line', 1739
    find_lex $P111, "$ops"
    .return ($P111)
  control_1771:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1781"  :anon :subid("91_1312695743.39515") :outer("90_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1751
    new $P112, "Undef"
    set $P1783, $P112
    .lex "$vivipost", $P1783
.annotate 'line', 1752
    new $P113, "Undef"
    set $P1784, $P113
    .lex "$vivilabel", $P1784
.annotate 'line', 1751
    find_lex $P114, "self"
    find_lex $P115, "$viviself"
    $P116 = $P114."as_vivipost"($P115, "P" :named("rtype"))
    store_lex "$vivipost", $P116
.annotate 'line', 1752
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P115
.annotate 'line', 1753
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_391
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_392
    die "Contextual $*SUB not found"
  vivify_392:
  vivify_391:
    find_lex $P115, "$pname"
    find_lex $P116, "$named"
    $P114."add_param"($P115, $P116 :named("named"), 1 :named("optional"))
.annotate 'line', 1754
    find_lex $P114, "$ops"
    new $P115, 'String'
    set $P115, "has_"
    find_lex $P116, "$pname"
    concat $P117, $P115, $P116
    find_lex $P118, "$vivilabel"
    $P114."push_pirop"("if", $P117, $P118)
.annotate 'line', 1755
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P114."push"($P115)
.annotate 'line', 1756
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$vivipost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1757
    find_lex $P114, "$ops"
    find_lex $P115, "$vivilabel"
    $P116 = $P114."push"($P115)
.annotate 'line', 1749
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("92_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1789
    .param pmc param_1790
.annotate 'file', ''
.annotate 'line', 1772
    new $P1788, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1788, control_1787
    push_eh $P1788
    .lex "self", self
    .lex "$node", param_1789
    .lex "$bindpost", param_1790
.annotate 'line', 1773
    new $P106, "Undef"
    set $P1791, $P106
    .lex "$ops", $P1791
.annotate 'line', 1774
    new $P107, "Undef"
    set $P1792, $P107
    .lex "$name", $P1792
.annotate 'line', 1775
    new $P108, "Undef"
    set $P1793, $P108
    .lex "$ns", $P1793
.annotate 'line', 1777
    new $P109, "Undef"
    set $P1794, $P109
    .lex "$fetchop", $P1794
.annotate 'line', 1778
    new $P110, "Undef"
    set $P1795, $P110
    .lex "$storeop", $P1795
.annotate 'line', 1779
    $P1797 = root_new ['parrot';'ResizablePMCArray']
    set $P1796, $P1797
    .lex "@name", $P1796
.annotate 'line', 1773
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1774
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1775
    find_lex $P111, "$node"
    $P112 = $P111."namespace"()
    store_lex "$ns", $P112
.annotate 'line', 1777
    new $P111, "String"
    assign $P111, "get_global"
    store_lex "$fetchop", $P111
.annotate 'line', 1778
    new $P111, "String"
    assign $P111, "set_global"
    store_lex "$storeop", $P111
.annotate 'line', 1779
    find_lex $P111, "$name"
    new $P112, "ResizablePMCArray"
    push $P112, $P111
    store_lex "@name", $P112
.annotate 'line', 1781
    find_lex $P111, "$ns"
    defined $I101, $P111
    unless $I101, if_1798_end
.annotate 'line', 1782
    new $P112, "String"
    assign $P112, "get_hll_global"
    store_lex "$fetchop", $P112
.annotate 'line', 1783
    new $P112, "String"
    assign $P112, "set_hll_global"
    store_lex "$storeop", $P112
.annotate 'line', 1785
    find_lex $P112, "$ns"
    unless $P112, if_1799_end
.annotate 'line', 1786
    get_hll_global $P113, ["POST"], "Compiler"
    find_lex $P114, "$ns"
    $P115 = $P113."key_pir"($P114)
    store_lex "$ns", $P115
.annotate 'line', 1787
    find_lex $P113, "@name"
    find_lex $P114, "$ns"
    $P113."unshift"($P114)
  if_1799_end:
  if_1798_end:
.annotate 'line', 1791
    find_lex $P111, "$bindpost"
    unless $P111, if_1800_end
.annotate 'line', 1792
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
  if_1800_end:
.annotate 'line', 1796
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$ops"
    find_lex $P113, "@name"
    find_lex $P114, "$fetchop"
    $P115 = $P111."new"($P112, $P113 :flat, $P114 :named("pirop"))
    store_lex "$fetchop", $P115
.annotate 'line', 1797
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@name"
    find_lex $P113, "$ops"
    find_lex $P114, "$storeop"
    $P115 = $P111."new"($P112 :flat, $P113, $P114 :named("pirop"))
    store_lex "$storeop", $P115
.annotate 'line', 1798
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
.annotate 'line', 1772
    .return ()
  control_1787:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("93_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1804
    .param pmc param_1805
.annotate 'file', ''
.annotate 'line', 1802
    .const 'Sub' $P1818 = "95_1312695743.39515" 
    capture_lex $P1818
    .const 'Sub' $P1810 = "94_1312695743.39515" 
    capture_lex $P1810
    new $P1803, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1803, control_1802
    push_eh $P1803
    .lex "self", self
    .lex "$node", param_1804
    .lex "$bindpost", param_1805
.annotate 'line', 1803
    new $P106, "Undef"
    set $P1806, $P106
    .lex "$name", $P1806
.annotate 'line', 1804
    new $P107, "Undef"
    set $P1807, $P107
    .lex "$isdecl", $P1807
.annotate 'line', 1803
    find_lex $P108, "self"
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    $P111 = $P108."escape"($P110)
    store_lex "$name", $P111
.annotate 'line', 1804
    find_lex $P108, "$node"
    $P109 = $P108."isdecl"()
    store_lex "$isdecl", $P109
.annotate 'line', 1806
    find_lex $P109, "$isdecl"
    if $P109, if_1808
.annotate 'line', 1823
    .const 'Sub' $P1818 = "95_1312695743.39515" 
    capture_lex $P1818
    $P117 = $P1818()
    set $P108, $P117
.annotate 'line', 1806
    goto if_1808_end
  if_1808:
    .const 'Sub' $P1810 = "94_1312695743.39515" 
    capture_lex $P1810
    $P113 = $P1810()
    set $P108, $P113
  if_1808_end:
.annotate 'line', 1802
    .return ($P108)
  control_1802:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1817"  :anon :subid("95_1312695743.39515") :outer("93_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1829
    new $P114, "Undef"
    set $P1819, $P114
    .lex "$ops", $P1819
.annotate 'line', 1830
    new $P115, "Undef"
    set $P1820, $P115
    .lex "$fetchop", $P1820
.annotate 'line', 1831
    new $P116, "Undef"
    set $P1821, $P116
    .lex "$storeop", $P1821
.annotate 'line', 1824
    find_lex $P117, "$bindpost"
    unless $P117, if_1822_end
.annotate 'line', 1825
    new $P118, "Exception"
    set $P118['type'], .CONTROL_RETURN
    get_hll_global $P119, ["POST"], "Op"
    find_lex $P120, "$name"
    find_lex $P121, "$bindpost"
    find_lex $P122, "$bindpost"
    $P123 = $P119."new"($P120, $P121, "store_lex" :named("pirop"), $P122 :named("result"))
    setattribute $P118, 'payload', $P123
    throw $P118
  if_1822_end:
.annotate 'line', 1829
    get_hll_global $P117, ["POST"], "Ops"
    find_lex $P118, "$node"
    $P119 = $P117."new"($P118 :named("node"))
    store_lex "$ops", $P119
.annotate 'line', 1830
    get_hll_global $P117, ["POST"], "Op"
    find_lex $P118, "$ops"
    find_lex $P119, "$name"
    $P120 = $P117."new"($P118, $P119, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P120
.annotate 'line', 1831
    get_hll_global $P117, ["POST"], "Op"
    find_lex $P118, "$name"
    find_lex $P119, "$ops"
    $P120 = $P117."new"($P118, $P119, "store_lex" :named("pirop"))
    store_lex "$storeop", $P120
.annotate 'line', 1832
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
.annotate 'line', 1823
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1809"  :anon :subid("94_1312695743.39515") :outer("93_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1808
    new $P110, "Undef"
    set $P1811, $P110
    .lex "$lexreg", $P1811
.annotate 'line', 1809
    new $P111, "Undef"
    set $P1812, $P111
    .lex "$ops", $P1812
.annotate 'line', 1810
    new $P112, "Undef"
    set $P1813, $P112
    .lex "$viviself", $P1813
.annotate 'line', 1808
    find_lex $P113, "self"
    $P114 = $P113."uniquereg"("P")
    store_lex "$lexreg", $P114
.annotate 'line', 1809
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1810
    find_lex $P113, "$node"
    $P114 = $P113."viviself"()
    store_lex "$viviself", $P114
.annotate 'line', 1812
    find_lex $P114, "$bindpost"
    isfalse $I101, $P114
    if $I101, if_1815
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1815_end
  if_1815:
    find_lex $P115, "$viviself"
    set $P113, $P115
  if_1815_end:
    unless $P113, if_1814_end
.annotate 'line', 1813
    find_lex $P116, "self"
    find_lex $P117, "$viviself"
    $P118 = $P116."as_vivipost"($P117, "P" :named("rtype"))
    store_lex "$bindpost", $P118
.annotate 'line', 1814
    find_lex $P116, "$ops"
    find_lex $P117, "$bindpost"
    $P116."push"($P117)
  if_1814_end:
.annotate 'line', 1817
    find_lex $P113, "$bindpost"
    unless $P113, if_1816_end
    find_lex $P114, "$ops"
    find_lex $P115, "$lexreg"
    find_lex $P116, "$bindpost"
    $P114."push_pirop"("set", $P115, $P116)
  if_1816_end:
.annotate 'line', 1819
    find_lex $P113, "$ops"
    find_lex $P114, "$name"
    find_lex $P115, "$lexreg"
    $P113."push_pirop"(".lex", $P114, $P115)
.annotate 'line', 1820
    find_lex $P113, "$ops"
    find_lex $P114, "$lexreg"
    $P113."result"($P114)
.annotate 'line', 1821
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
.annotate 'line', 1806
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("96_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1826
    .param pmc param_1827
.annotate 'file', ''
.annotate 'line', 1837
    .const 'Sub' $P1838 = "97_1312695743.39515" 
    capture_lex $P1838
    new $P1825, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1825, control_1824
    push_eh $P1825
    .lex "self", self
    .lex "$node", param_1826
    .lex "$bindpost", param_1827
.annotate 'line', 1842
    new $P106, "Undef"
    set $P1828, $P106
    .lex "$name", $P1828
.annotate 'line', 1844
    $P1830 = root_new ['parrot';'Hash']
    set $P1829, $P1830
    .lex "%symtable", $P1829
.annotate 'line', 1866
    new $P107, "Undef"
    set $P1831, $P107
    .lex "$ops", $P1831
.annotate 'line', 1867
    new $P108, "Undef"
    set $P1832, $P108
    .lex "$fetchop", $P1832
.annotate 'line', 1868
    new $P109, "Undef"
    set $P1833, $P109
    .lex "$storeop", $P1833
.annotate 'line', 1842
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1844
    find_dynamic_lex $P110, "@*BLOCKPAST"
    unless_null $P110, vivify_393
    get_hll_global $P110, "@BLOCKPAST"
    unless_null $P110, vivify_394
    die "Contextual @*BLOCKPAST not found"
  vivify_394:
  vivify_393:
    set $P111, $P110[0]
    unless_null $P111, vivify_395
    new $P111, "Undef"
  vivify_395:
    $P112 = $P111."symtable"()
    store_lex "%symtable", $P112
.annotate 'line', 1845
    find_lex $P110, "%symtable"
    defined $I101, $P110
    unless $I101, if_1834_end
.annotate 'line', 1846
    find_lex $P111, "$name"
    find_lex $P1835, "%symtable"
    unless_null $P1835, vivify_396
    $P1835 = root_new ['parrot';'Hash']
  vivify_396:
    set $P112, $P1835[$P111]
    unless_null $P112, vivify_397
    new $P112, "Undef"
  vivify_397:
    store_lex "%symtable", $P112
.annotate 'line', 1847
    find_lex $P111, "%symtable"
    defined $I102, $P111
    unless $I102, if_1836_end
    .const 'Sub' $P1838 = "97_1312695743.39515" 
    capture_lex $P1838
    $P1838()
  if_1836_end:
  if_1834_end:
.annotate 'line', 1856
    find_lex $P110, "$node"
    $P111 = $P110."isdecl"()
    unless $P111, if_1843_end
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "self"
    find_lex $P114, "$node"
    find_lex $P115, "$bindpost"
    $P116 = $P113."lexical"($P114, $P115)
    setattribute $P112, 'payload', $P116
    throw $P112
  if_1843_end:
.annotate 'line', 1858
    find_lex $P110, "self"
    find_lex $P111, "$name"
    $P112 = $P110."escape"($P111)
    store_lex "$name", $P112
.annotate 'line', 1860
    find_lex $P110, "$bindpost"
    unless $P110, if_1844_end
.annotate 'line', 1861
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "$name"
    find_lex $P114, "$bindpost"
    find_lex $P115, "$bindpost"
    $P116 = $P112."new"($P113, $P114, "store_dynamic_lex" :named("pirop"), $P115 :named("result"))
    setattribute $P111, 'payload', $P116
    throw $P111
  if_1844_end:
.annotate 'line', 1866
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1867
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$ops"
    find_lex $P112, "$name"
    $P113 = $P110."new"($P111, $P112, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P113
.annotate 'line', 1868
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$name"
    find_lex $P112, "$ops"
    $P113 = $P110."new"($P111, $P112, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P113
.annotate 'line', 1869
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "$ops"
    find_lex $P113, "$fetchop"
    find_lex $P114, "$storeop"
    $P115 = $P110."vivify"($P111, $P112, $P113, $P114)
.annotate 'line', 1837
    .return ($P115)
  control_1824:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1837"  :anon :subid("97_1312695743.39515") :outer("96_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1848
    new $P112, "Undef"
    set $P1839, $P112
    .lex "$scope", $P1839
    find_lex $P1840, "%symtable"
    unless_null $P1840, vivify_398
    $P1840 = root_new ['parrot';'Hash']
  vivify_398:
    set $P113, $P1840["scope"]
    unless_null $P113, vivify_399
    new $P113, "Undef"
  vivify_399:
    store_lex "$scope", $P113
.annotate 'line', 1849
    find_lex $P115, "$scope"
    if $P115, if_1842
    set $P114, $P115
    goto if_1842_end
  if_1842:
    find_lex $P116, "$scope"
    set $S101, $P116
    isne $I103, $S101, "contextual"
    new $P114, 'Integer'
    set $P114, $I103
  if_1842_end:
    if $P114, if_1841
    set $P113, $P114
    goto if_1841_end
  if_1841:
.annotate 'line', 1850
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
  if_1841_end:
.annotate 'line', 1847
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("98_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1848
    .param pmc param_1849
    .param pmc param_1850 :optional
    .param int has_param_1850 :opt_flag
.annotate 'file', ''
.annotate 'line', 1873
    new $P1847, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1847, control_1846
    push_eh $P1847
    .lex "self", self
    .lex "$node", param_1848
    .lex "$bindpost", param_1849
    if has_param_1850, optparam_400
    new $P106, "Undef"
    set param_1850, $P106
  optparam_400:
    .lex "$keyrtype", param_1850
.annotate 'line', 1874

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
    
.annotate 'line', 1873
    .return ()
  control_1846:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("99_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1854
    .param pmc param_1855
.annotate 'file', ''
.annotate 'line', 1942
    new $P1853, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1853, control_1852
    push_eh $P1853
    .lex "self", self
    .lex "$node", param_1854
    .lex "$bindpost", param_1855
.annotate 'line', 1943
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "$bindpost"
    $P109 = $P106."keyed"($P107, $P108, "i")
.annotate 'line', 1942
    .return ($P109)
  control_1852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("100_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1859
    .param pmc param_1860
.annotate 'file', ''
.annotate 'line', 1947
    .const 'Sub' $P1873 = "101_1312695743.39515" 
    capture_lex $P1873
    new $P1858, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1858, control_1857
    push_eh $P1858
    .lex "self", self
    .lex "$node", param_1859
    .lex "$bindpost", param_1860
.annotate 'line', 1948
    new $P106, "Undef"
    set $P1861, $P106
    .lex "$ops", $P1861
.annotate 'line', 1949
    new $P107, "Undef"
    set $P1862, $P107
    .lex "$name", $P1862
.annotate 'line', 1957
    new $P108, "Undef"
    set $P1863, $P108
    .lex "$call_on", $P1863
.annotate 'line', 1958
    $P1865 = root_new ['parrot';'ResizablePMCArray']
    set $P1864, $P1865
    .lex "@attribute", $P1864
.annotate 'line', 1959
    new $P109, "Undef"
    set $P1866, $P109
    .lex "$elements", $P1866
.annotate 'line', 1980
    new $P110, "Undef"
    set $P1867, $P110
    .lex "$fetchop", $P1867
.annotate 'line', 1981
    new $P111, "Undef"
    set $P1868, $P111
    .lex "$storeop", $P1868
.annotate 'line', 1948
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1949
    find_lex $P112, "self"
    find_lex $P113, "$node"
    $P114 = $P113."name"()
    $P115 = $P112."escape"($P114)
    store_lex "$name", $P115
.annotate 'line', 1947
    find_lex $P112, "$call_on"
.annotate 'line', 1958
    find_lex $P112, "$name"
    new $P113, "ResizablePMCArray"
    push $P113, $P112
    store_lex "@attribute", $P113
.annotate 'line', 1959
    find_lex $P112, "$node"
    elements $I101, $P112
    new $P113, 'Integer'
    set $P113, $I101
    store_lex "$elements", $P113
.annotate 'line', 1960
    find_lex $P112, "$elements"
    set $N101, $P112
    iseq $I101, $N101, 0.0
    if $I101, if_1869
.annotate 'line', 1964
    find_lex $P113, "self"
    find_lex $P1870, "$node"
    unless_null $P1870, vivify_401
    $P1870 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P114, $P1870[0]
    unless_null $P114, vivify_402
    new $P114, "Undef"
  vivify_402:
    $P115 = $P113."as_post"($P114, "P" :named("rtype"))
    store_lex "$call_on", $P115
.annotate 'line', 1965
    find_lex $P113, "$ops"
    find_lex $P114, "$call_on"
    $P113."push"($P114)
.annotate 'line', 1966
    find_lex $P113, "$elements"
    set $N102, $P113
    iseq $I102, $N102, 2.0
    unless $I102, if_1871_end
    .const 'Sub' $P1873 = "101_1312695743.39515" 
    capture_lex $P1873
    $P1873()
  if_1871_end:
.annotate 'line', 1963
    goto if_1869_end
  if_1869:
.annotate 'line', 1961
    new $P113, "String"
    assign $P113, "self"
    store_lex "$call_on", $P113
  if_1869_end:
.annotate 'line', 1972
    find_lex $P112, "@attribute"
    find_lex $P113, "$call_on"
    $P112."unshift"($P113)
.annotate 'line', 1974
    find_lex $P112, "$bindpost"
    unless $P112, if_1876_end
.annotate 'line', 1975
    find_lex $P113, "$ops"
    find_lex $P114, "@attribute"
    find_lex $P115, "$bindpost"
    $P113."push_pirop"("setattribute", $P114 :flat, $P115)
.annotate 'line', 1976
    find_lex $P113, "$ops"
    find_lex $P114, "$bindpost"
    $P113."result"($P114)
.annotate 'line', 1977
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1876_end:
.annotate 'line', 1980
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "$ops"
    find_lex $P114, "@attribute"
    $P115 = $P112."new"($P113, $P114 :flat, "getattribute" :named("pirop"))
    store_lex "$fetchop", $P115
.annotate 'line', 1981
    get_hll_global $P112, ["POST"], "Op"
    find_lex $P113, "@attribute"
    find_lex $P114, "$ops"
    $P115 = $P112."new"($P113 :flat, $P114, "setattribute" :named("pirop"))
    store_lex "$storeop", $P115
.annotate 'line', 1982
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$ops"
    find_lex $P115, "$fetchop"
    find_lex $P116, "$storeop"
    $P117 = $P112."vivify"($P113, $P114, $P115, $P116)
.annotate 'line', 1947
    .return ($P117)
  control_1857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1872"  :anon :subid("101_1312695743.39515") :outer("100_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1967
    new $P114, "Undef"
    set $P1874, $P114
    .lex "$handle", $P1874
    find_lex $P115, "self"
    find_lex $P1875, "$node"
    unless_null $P1875, vivify_403
    $P1875 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P116, $P1875[1]
    unless_null $P116, vivify_404
    new $P116, "Undef"
  vivify_404:
    $P117 = $P115."as_post"($P116, "P" :named("rtype"))
    store_lex "$handle", $P117
.annotate 'line', 1968
    find_lex $P115, "$ops"
    find_lex $P116, "$handle"
    $P115."push"($P116)
.annotate 'line', 1969
    find_lex $P115, "@attribute"
    find_lex $P116, "$handle"
    $P117 = $P115."unshift"($P116)
.annotate 'line', 1966
    .return ($P117)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("102_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Var"],_)
    .param pmc param_1880
    .param pmc param_1881
.annotate 'file', ''
.annotate 'line', 1986
    .const 'Sub' $P1888 = "103_1312695743.39515" 
    capture_lex $P1888
    new $P1879, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1879, control_1878
    push_eh $P1879
    .lex "self", self
    .lex "$node", param_1880
    .lex "$bindpost", param_1881
.annotate 'line', 1987
    new $P106, "Undef"
    set $P1882, $P106
    .lex "$name", $P1882
.annotate 'line', 1994
    new $P107, "Undef"
    set $P1883, $P107
    .lex "$ops", $P1883
.annotate 'line', 1987
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    store_lex "$name", $P109
.annotate 'line', 1989
    find_lex $P108, "$name"
    if $P108, unless_1884_end
.annotate 'line', 1990
    find_lex $P109, "self"
    $P110 = $P109."uniquereg"("P")
    store_lex "$name", $P110
.annotate 'line', 1991
    find_lex $P109, "$node"
    find_lex $P110, "$name"
    $P109."name"($P110)
  unless_1884_end:
.annotate 'line', 1994
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$name"
    find_lex $P110, "$node"
    $P111 = $P108."new"($P109 :named("result"), $P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1996
    find_lex $P108, "$node"
    $P109 = $P108."isdecl"()
    unless $P109, if_1885_end
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    $P110."push_pirop"(".local pmc", $P111)
  if_1885_end:
.annotate 'line', 1998
    find_lex $P108, "$bindpost"
    if $P108, if_1886
.annotate 'line', 2001
    .const 'Sub' $P1888 = "103_1312695743.39515" 
    capture_lex $P1888
    $P1888()
    goto if_1886_end
  if_1886:
.annotate 'line', 1999
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    find_lex $P111, "$bindpost"
    $P109."push_pirop"("set", $P110, $P111)
  if_1886_end:
.annotate 'line', 1986
    find_lex $P108, "$ops"
    .return ($P108)
  control_1878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1887"  :anon :subid("103_1312695743.39515") :outer("102_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 2001
    .const 'Sub' $P1892 = "104_1312695743.39515" 
    capture_lex $P1892
.annotate 'line', 2002
    new $P109, "Undef"
    set $P1889, $P109
    .lex "$viviself", $P1889
    find_lex $P110, "$node"
    $P111 = $P110."viviself"()
    store_lex "$viviself", $P111
.annotate 'line', 2003
    find_lex $P111, "$viviself"
    if $P111, if_1890
    set $P110, $P111
    goto if_1890_end
  if_1890:
    .const 'Sub' $P1892 = "104_1312695743.39515" 
    capture_lex $P1892
    $P113 = $P1892()
    set $P110, $P113
  if_1890_end:
.annotate 'line', 2001
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1891"  :anon :subid("104_1312695743.39515") :outer("103_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 2004
    new $P112, "Undef"
    set $P1893, $P112
    .lex "$vivipost", $P1893
    find_lex $P113, "self"
    find_lex $P114, "$viviself"
    $P115 = $P113."as_vivipost"($P114, "P" :named("rtype"))
    store_lex "$vivipost", $P115
.annotate 'line', 2005
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P113."push"($P114)
.annotate 'line', 2006
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P116 = $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 2003
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("105_1312695743.39515") :method :outer("11_1312695743.39515") :multi(_,["PAST";"Val"])
    .param pmc param_1897
    .param pmc param_1898 :slurpy :named
.annotate 'file', ''
.annotate 'line', 2022
    .const 'Sub' $P1909 = "106_1312695743.39515" 
    capture_lex $P1909
    new $P1896, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1896, control_1895
    push_eh $P1896
    .lex "self", self
    .lex "$node", param_1897
    .lex "%options", param_1898
.annotate 'line', 2023
    new $P106, "Undef"
    set $P1899, $P106
    .lex "$ops", $P1899
.annotate 'line', 2025
    new $P107, "Undef"
    set $P1900, $P107
    .lex "$value", $P1900
.annotate 'line', 2038
    new $P108, "Undef"
    set $P1901, $P108
    .lex "$returns", $P1901
.annotate 'line', 2041
    new $P109, "Undef"
    set $P1902, $P109
    .lex "$valflags", $P1902
.annotate 'line', 2056
    new $P110, "Undef"
    set $P1903, $P110
    .lex "$rtype", $P1903
.annotate 'line', 2069
    new $P111, "Undef"
    set $P1904, $P111
    .lex "$result", $P1904
.annotate 'line', 2023
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 2025
    find_lex $P1905, "$node"
    unless_null $P1905, vivify_405
    $P1905 = root_new ['parrot';'Hash']
  vivify_405:
    set $P112, $P1905["value"]
    unless_null $P112, vivify_406
    new $P112, "Undef"
  vivify_406:
    store_lex "$value", $P112
.annotate 'line', 2026
    find_lex $P112, "$value"
    defined $I101, $P112
    if $I101, unless_1906_end
.annotate 'line', 2027
    find_lex $P113, "self"
    $P113."panic"("PAST::Val node missing :value attribute")
  unless_1906_end:
.annotate 'line', 2029
    get_hll_global $P112, ["PAST"], "Block"
    find_lex $P113, "$value"
    $P114 = $P112."ACCEPTS"($P113)
    unless $P114, if_1907_end
    .const 'Sub' $P1909 = "106_1312695743.39515" 
    capture_lex $P1909
    $P1909()
  if_1907_end:
.annotate 'line', 2038
    find_lex $P1912, "$node"
    unless_null $P1912, vivify_407
    $P1912 = root_new ['parrot';'Hash']
  vivify_407:
    set $P112, $P1912["returns"]
    unless_null $P112, vivify_408
    new $P112, "Undef"
  vivify_408:
    store_lex "$returns", $P112
.annotate 'line', 2039
    find_lex $P112, "$returns"
    if $P112, unless_1913_end
    find_lex $P113, "$value"
    typeof $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$returns", $P114
  unless_1913_end:
.annotate 'line', 2041
    find_lex $P112, "$returns"
    get_global $P1914, "%valflags"
    unless_null $P1914, vivify_409
    $P1914 = root_new ['parrot';'Hash']
  vivify_409:
    set $P113, $P1914[$P112]
    unless_null $P113, vivify_410
    new $P113, "Undef"
  vivify_410:
    store_lex "$valflags", $P113
.annotate 'line', 2042
    find_lex $P112, "$valflags"
    set $S101, $P112
    index $I101, $S101, "e"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1915_end
    find_lex $P113, "self"
    find_lex $P114, "$value"
    $P115 = $P113."escape"($P114)
    store_lex "$value", $P115
  if_1915_end:
.annotate 'line', 2045
    find_lex $P112, "$valflags"
    set $S101, $P112
    index $I101, $S101, "c"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1916_end
.annotate 'line', 2047
    find_lex $P113, "$returns"
    set $S102, $P113
    isne $I103, $S102, "!macro_const"
    unless $I103, if_1917_end
.annotate 'line', 2048
    find_dynamic_lex $P114, "$*SUB"
    unless_null $P114, vivify_411
    get_hll_global $P114, "$SUB"
    unless_null $P114, vivify_412
    die "Contextual $*SUB not found"
  vivify_412:
  vivify_411:
.annotate 'line', 2049
    find_lex $P115, "$returns"
    set $S103, $P115
    replace $S104, $S103, 0, 1, ".include \""
    new $P116, 'String'
    set $P116, $S104
    concat $P117, $P116, ".pasm\""
    $P114."add_directive"($P117)
  if_1917_end:
.annotate 'line', 2053
    find_lex $P113, "$value"
    set $S102, $P113
    substr $S103, $S102, 0, 1
    iseq $I103, $S103, "."
    if $I103, unless_1918_end
    new $P114, "String"
    assign $P114, "."
    find_lex $P115, "$value"
    concat $P116, $P114, $P115
    store_lex "$value", $P116
  unless_1918_end:
  if_1916_end:
.annotate 'line', 2056
    find_lex $P1919, "%options"
    unless_null $P1919, vivify_413
    $P1919 = root_new ['parrot';'Hash']
  vivify_413:
    set $P112, $P1919["rtype"]
    unless_null $P112, vivify_414
    new $P112, "Undef"
  vivify_414:
    store_lex "$rtype", $P112
.annotate 'line', 2057
    find_lex $P112, "$valflags"
    set $S101, $P112
    find_lex $P113, "$rtype"
    set $S102, $P113
    index $I101, $S101, $S102
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1920_end
.annotate 'line', 2058
    find_lex $P114, "$ops"
    find_lex $P115, "$value"
    $P114."result"($P115)
.annotate 'line', 2059
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "$ops"
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1920_end:
.annotate 'line', 2063
    find_lex $P113, "$rtype"
    set $S101, $P113
    iseq $I101, $S101, "n"
    if $I101, if_1922
    new $P112, 'Integer'
    set $P112, $I101
    goto if_1922_end
  if_1922:
    find_lex $P114, "$valflags"
    set $S102, $P114
    index $I102, $S102, "i"
    set $N101, $I102
    isge $I103, $N101, 0.0
    new $P112, 'Integer'
    set $P112, $I103
  if_1922_end:
    unless $P112, if_1921_end
.annotate 'line', 2064
    find_lex $P115, "$value"
    concat $P116, $P115, ".0"
    store_lex "$value", $P116
.annotate 'line', 2065
    find_lex $P115, "$ops"
    find_lex $P116, "$value"
    $P115."result"($P116)
.annotate 'line', 2066
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "$ops"
    setattribute $P115, 'payload', $P116
    throw $P115
  if_1921_end:
.annotate 'line', 2069
    find_lex $P112, "self"
    $P113 = $P112."tempreg"("P")
    store_lex "$result", $P113
.annotate 'line', 2070
    find_lex $P112, "self"
    find_lex $P113, "$returns"
    $P114 = $P112."escape"($P113)
    store_lex "$returns", $P114
.annotate 'line', 2071
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    find_lex $P114, "$returns"
    $P112."push_pirop"("new", $P113, $P114)
.annotate 'line', 2072
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    find_lex $P114, "$value"
    $P112."push_pirop"("assign", $P113, $P114)
.annotate 'line', 2073
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
.annotate 'line', 2022
    find_lex $P112, "$ops"
    .return ($P112)
  control_1895:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1908"  :anon :subid("106_1312695743.39515") :outer("105_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 2030
    new $P115, "Undef"
    set $P1910, $P115
    .lex "$blockreg", $P1910
.annotate 'line', 2031
    new $P116, "Undef"
    set $P1911, $P116
    .lex "$blockref", $P1911
.annotate 'line', 2030
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$blockreg", $P118
.annotate 'line', 2031
    new $P117, 'String'
    set $P117, ".const 'Sub' "
    find_lex $P118, "$blockreg"
    concat $P119, $P117, $P118
    concat $P120, $P119, " = "
    store_lex "$blockref", $P120
.annotate 'line', 2032
    find_lex $P117, "$blockref"
    find_lex $P118, "self"
    find_lex $P119, "$value"
    $P120 = $P119."subid"()
    set $S101, $P120
    $S102 = $P118."escape"($S101)
    concat $P121, $P117, $S102
    store_lex "$blockref", $P121
.annotate 'line', 2033
    find_lex $P117, "$ops"
    find_lex $P118, "$blockref"
    $P117."push_pirop"($P118)
.annotate 'line', 2034
    find_lex $P117, "$ops"
    find_lex $P118, "$blockreg"
    $P117."result"($P118)
.annotate 'line', 2035
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    find_lex $P118, "$ops"
    setattribute $P117, 'payload', $P118
    throw $P117
.annotate 'line', 2029
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1924" :load :anon :subid("107_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 41
    .const 'Sub' $P1926 = "11_1312695743.39515" 
    $P106 = $P1926()
    .return ($P106)
.end


.namespace []
.sub "_block2018" :load :anon :subid("108_1312695743.39515")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P2020 = "10_1312695743.39515" 
    $P101 = $P2020()
    .return ($P101)
.end

