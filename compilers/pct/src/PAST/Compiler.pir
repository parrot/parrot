
.namespace []
.sub "_block1000"  :anon :subid("10_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312756204.79645" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1312756204.79645" 
    capture_lex $P1003
    $P106 = $P1003()
.annotate 'line', 1
    .return ($P106)
    .const 'Sub' $P2020 = "108_1312756204.79645" 
    .return ($P2020)
.end


.namespace []
.sub "" :load :init :subid("post109") :outer("10_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312756204.79645" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P2022 = get_root_global ["parrot"], "P6metaclass"
    new $P101, "ResizablePMCArray"
    push $P101, "%!symtable"
    $P2022."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P101 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1312756204.79645") :outer("10_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1895 = "105_1312756204.79645" 
    capture_lex $P1895
    .const 'Sub' $P1878 = "102_1312756204.79645" 
    capture_lex $P1878
    .const 'Sub' $P1857 = "100_1312756204.79645" 
    capture_lex $P1857
    .const 'Sub' $P1852 = "99_1312756204.79645" 
    capture_lex $P1852
    .const 'Sub' $P1846 = "98_1312756204.79645" 
    capture_lex $P1846
    .const 'Sub' $P1824 = "96_1312756204.79645" 
    capture_lex $P1824
    .const 'Sub' $P1802 = "93_1312756204.79645" 
    capture_lex $P1802
    .const 'Sub' $P1787 = "92_1312756204.79645" 
    capture_lex $P1787
    .const 'Sub' $P1771 = "90_1312756204.79645" 
    capture_lex $P1771
    .const 'Sub' $P1755 = "88_1312756204.79645" 
    capture_lex $P1755
    .const 'Sub' $P1696 = "82_1312756204.79645" 
    capture_lex $P1696
    .const 'Sub' $P1680 = "81_1312756204.79645" 
    capture_lex $P1680
    .const 'Sub' $P1670 = "80_1312756204.79645" 
    capture_lex $P1670
    .const 'Sub' $P1658 = "79_1312756204.79645" 
    capture_lex $P1658
    .const 'Sub' $P1639 = "77_1312756204.79645" 
    capture_lex $P1639
    .const 'Sub' $P1627 = "76_1312756204.79645" 
    capture_lex $P1627
    .const 'Sub' $P1602 = "73_1312756204.79645" 
    capture_lex $P1602
    .const 'Sub' $P1583 = "72_1312756204.79645" 
    capture_lex $P1583
    .const 'Sub' $P1569 = "70_1312756204.79645" 
    capture_lex $P1569
    .const 'Sub' $P1564 = "69_1312756204.79645" 
    capture_lex $P1564
    .const 'Sub' $P1559 = "68_1312756204.79645" 
    capture_lex $P1559
    .const 'Sub' $P1544 = "66_1312756204.79645" 
    capture_lex $P1544
    .const 'Sub' $P1517 = "64_1312756204.79645" 
    capture_lex $P1517
    .const 'Sub' $P1512 = "63_1312756204.79645" 
    capture_lex $P1512
    .const 'Sub' $P1507 = "62_1312756204.79645" 
    capture_lex $P1507
    .const 'Sub' $P1502 = "61_1312756204.79645" 
    capture_lex $P1502
    .const 'Sub' $P1479 = "60_1312756204.79645" 
    capture_lex $P1479
    .const 'Sub' $P1448 = "59_1312756204.79645" 
    capture_lex $P1448
    .const 'Sub' $P1443 = "58_1312756204.79645" 
    capture_lex $P1443
    .const 'Sub' $P1394 = "54_1312756204.79645" 
    capture_lex $P1394
    .const 'Sub' $P1389 = "53_1312756204.79645" 
    capture_lex $P1389
    .const 'Sub' $P1364 = "51_1312756204.79645" 
    capture_lex $P1364
    .const 'Sub' $P1342 = "50_1312756204.79645" 
    capture_lex $P1342
    .const 'Sub' $P1325 = "49_1312756204.79645" 
    capture_lex $P1325
    .const 'Sub' $P1222 = "39_1312756204.79645" 
    capture_lex $P1222
    .const 'Sub' $P1186 = "35_1312756204.79645" 
    capture_lex $P1186
    .const 'Sub' $P1172 = "34_1312756204.79645" 
    capture_lex $P1172
    .const 'Sub' $P1153 = "32_1312756204.79645" 
    capture_lex $P1153
    .const 'Sub' $P1141 = "31_1312756204.79645" 
    capture_lex $P1141
    .const 'Sub' $P1136 = "30_1312756204.79645" 
    capture_lex $P1136
    .const 'Sub' $P1131 = "29_1312756204.79645" 
    capture_lex $P1131
    .const 'Sub' $P1124 = "28_1312756204.79645" 
    capture_lex $P1124
    .const 'Sub' $P1117 = "27_1312756204.79645" 
    capture_lex $P1117
    .const 'Sub' $P1111 = "26_1312756204.79645" 
    capture_lex $P1111
    .const 'Sub' $P1105 = "25_1312756204.79645" 
    capture_lex $P1105
    .const 'Sub' $P1100 = "24_1312756204.79645" 
    capture_lex $P1100
    .const 'Sub' $P1093 = "23_1312756204.79645" 
    capture_lex $P1093
    .const 'Sub' $P1088 = "22_1312756204.79645" 
    capture_lex $P1088
    .const 'Sub' $P1083 = "21_1312756204.79645" 
    capture_lex $P1083
    .const 'Sub' $P1069 = "20_1312756204.79645" 
    capture_lex $P1069
    .const 'Sub' $P1060 = "19_1312756204.79645" 
    capture_lex $P1060
    .const 'Sub' $P1052 = "18_1312756204.79645" 
    capture_lex $P1052
    .const 'Sub' $P1046 = "17_1312756204.79645" 
    capture_lex $P1046
    .const 'Sub' $P1039 = "16_1312756204.79645" 
    capture_lex $P1039
    .const 'Sub' $P1022 = "14_1312756204.79645" 
    capture_lex $P1022
    .const 'Sub' $P1009 = "12_1312756204.79645" 
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
    get_global $P100, "$serno"
    unless_null $P100, vivify_205
    new $P100, "Undef"
    set_global "$serno", $P100
  vivify_205:
.annotate 'line', 49
    get_global $P101, "$TEMPREG_BASE"
    unless_null $P101, vivify_206
    new $P101, "Undef"
    set_global "$TEMPREG_BASE", $P101
  vivify_206:
.annotate 'line', 50
    get_global $P102, "$UNIQUE_BASE"
    unless_null $P102, vivify_207
    new $P102, "Undef"
    set_global "$UNIQUE_BASE", $P102
  vivify_207:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_208
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_208:
.annotate 'line', 994
    .const 'Sub' $P1009 = "12_1312756204.79645" 
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
.annotate 'line', 2025
    .const 'Sub' $P1895 = "105_1312756204.79645" 
    newclosure $P1924, $P1895
.annotate 'line', 41
    .return ($P1924)
    .const 'Sub' $P1926 = "107_1312756204.79645" 
    .return ($P1926)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post110") :outer("11_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1312756204.79645" 
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
    get_global $P1928, "%piropsig"
    unless_null $P1928, vivify_111
    $P1928 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1928
  vivify_111:
    set $P1928["add"], $P106
.annotate 'line', 59
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1929, "%piropsig"
    unless_null $P1929, vivify_112
    $P1929 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1929
  vivify_112:
    set $P1929["band"], $P106
.annotate 'line', 60
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1930, "%piropsig"
    unless_null $P1930, vivify_113
    $P1930 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1930
  vivify_113:
    set $P1930["bxor"], $P106
.annotate 'line', 61
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1931, "%piropsig"
    unless_null $P1931, vivify_114
    $P1931 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1931
  vivify_114:
    set $P1931["bnot"], $P106
.annotate 'line', 62
    new $P106, "String"
    assign $P106, "PPP"
    get_global $P1932, "%piropsig"
    unless_null $P1932, vivify_115
    $P1932 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1932
  vivify_115:
    set $P1932["bor"], $P106
.annotate 'line', 63
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P1933, "%piropsig"
    unless_null $P1933, vivify_116
    $P1933 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1933
  vivify_116:
    set $P1933["can"], $P106
.annotate 'line', 64
    new $P106, "String"
    assign $P106, "Si"
    get_global $P1934, "%piropsig"
    unless_null $P1934, vivify_117
    $P1934 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1934
  vivify_117:
    set $P1934["chr"], $P106
.annotate 'line', 65
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1935, "%piropsig"
    unless_null $P1935, vivify_118
    $P1935 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1935
  vivify_118:
    set $P1935["clone"], $P106
.annotate 'line', 66
    new $P106, "String"
    assign $P106, "PP~"
    get_global $P1936, "%piropsig"
    unless_null $P1936, vivify_119
    $P1936 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1936
  vivify_119:
    set $P1936["concat"], $P106
.annotate 'line', 67
    new $P106, "String"
    assign $P106, "0PP"
    get_global $P1937, "%piropsig"
    unless_null $P1937, vivify_120
    $P1937 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1937
  vivify_120:
    set $P1937["copy"], $P106
.annotate 'line', 68
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1938, "%piropsig"
    unless_null $P1938, vivify_121
    $P1938 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1938
  vivify_121:
    set $P1938["defined"], $P106
.annotate 'line', 69
    new $P106, "String"
    assign $P106, "vQ*"
    get_global $P1939, "%piropsig"
    unless_null $P1939, vivify_122
    $P1939 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1939
  vivify_122:
    set $P1939["delete"], $P106
.annotate 'line', 70
    new $P106, "String"
    assign $P106, "v~"
    get_global $P1940, "%piropsig"
    unless_null $P1940, vivify_123
    $P1940 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1940
  vivify_123:
    set $P1940["die"], $P106
.annotate 'line', 71
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1941, "%piropsig"
    unless_null $P1941, vivify_124
    $P1941 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1941
  vivify_124:
    set $P1941["div"], $P106
.annotate 'line', 72
    new $P106, "String"
    assign $P106, "IPs"
    get_global $P1942, "%piropsig"
    unless_null $P1942, vivify_125
    $P1942 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1942
  vivify_125:
    set $P1942["does"], $P106
.annotate 'line', 73
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P1943, "%piropsig"
    unless_null $P1943, vivify_126
    $P1943 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1943
  vivify_126:
    set $P1943["downcase"], $P106
.annotate 'line', 74
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1944, "%piropsig"
    unless_null $P1944, vivify_127
    $P1944 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1944
  vivify_127:
    set $P1944["elements"], $P106
.annotate 'line', 75
    new $P106, "String"
    assign $P106, "IQ*"
    get_global $P1945, "%piropsig"
    unless_null $P1945, vivify_128
    $P1945 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1945
  vivify_128:
    set $P1945["exists"], $P106
.annotate 'line', 76
    new $P106, "String"
    assign $P106, "vi"
    get_global $P1946, "%piropsig"
    unless_null $P1946, vivify_129
    $P1946 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1946
  vivify_129:
    set $P1946["exit"], $P106
.annotate 'line', 77
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1947, "%piropsig"
    unless_null $P1947, vivify_130
    $P1947 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1947
  vivify_130:
    set $P1947["fdiv"], $P106
.annotate 'line', 78
    new $P106, "String"
    assign $P106, "Is"
    get_global $P1948, "%piropsig"
    unless_null $P1948, vivify_131
    $P1948 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1948
  vivify_131:
    set $P1948["find_codepoint"], $P106
.annotate 'line', 79
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P1949, "%piropsig"
    unless_null $P1949, vivify_132
    $P1949 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1949
  vivify_132:
    set $P1949["find_dynamic_lex"], $P106
.annotate 'line', 80
    new $P106, "String"
    assign $P106, "Ps"
    get_global $P1950, "%piropsig"
    unless_null $P1950, vivify_133
    $P1950 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1950
  vivify_133:
    set $P1950["find_name"], $P106
.annotate 'line', 81
    new $P106, "String"
    assign $P106, "P"
    get_global $P1951, "%piropsig"
    unless_null $P1951, vivify_134
    $P1951 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1951
  vivify_134:
    set $P1951["getinterp"], $P106
.annotate 'line', 82
    new $P106, "String"
    assign $P106, "P~P"
    get_global $P1952, "%piropsig"
    unless_null $P1952, vivify_135
    $P1952 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1952
  vivify_135:
    set $P1952["getprop"], $P106
.annotate 'line', 83
    new $P106, "String"
    assign $P106, "P"
    get_global $P1953, "%piropsig"
    unless_null $P1953, vivify_136
    $P1953 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1953
  vivify_136:
    set $P1953["getstderr"], $P106
.annotate 'line', 84
    new $P106, "String"
    assign $P106, "P"
    get_global $P1954, "%piropsig"
    unless_null $P1954, vivify_137
    $P1954 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1954
  vivify_137:
    set $P1954["getstdin"], $P106
.annotate 'line', 85
    new $P106, "String"
    assign $P106, "P"
    get_global $P1955, "%piropsig"
    unless_null $P1955, vivify_138
    $P1955 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1955
  vivify_138:
    set $P1955["getstdout"], $P106
.annotate 'line', 86
    new $P106, "String"
    assign $P106, "Issi"
    get_global $P1956, "%piropsig"
    unless_null $P1956, vivify_139
    $P1956 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1956
  vivify_139:
    set $P1956["index"], $P106
.annotate 'line', 87
    new $P106, "String"
    assign $P106, "IP~"
    get_global $P1957, "%piropsig"
    unless_null $P1957, vivify_140
    $P1957 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1957
  vivify_140:
    set $P1957["isa"], $P106
.annotate 'line', 88
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1958, "%piropsig"
    unless_null $P1958, vivify_141
    $P1958 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1958
  vivify_141:
    set $P1958["isfalse"], $P106
.annotate 'line', 89
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1959, "%piropsig"
    unless_null $P1959, vivify_142
    $P1959 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1959
  vivify_142:
    set $P1959["isnull"], $P106
.annotate 'line', 90
    new $P106, "String"
    assign $P106, "IPP"
    get_global $P1960, "%piropsig"
    unless_null $P1960, vivify_143
    $P1960 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1960
  vivify_143:
    set $P1960["issame"], $P106
.annotate 'line', 91
    new $P106, "String"
    assign $P106, "IP"
    get_global $P1961, "%piropsig"
    unless_null $P1961, vivify_144
    $P1961 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1961
  vivify_144:
    set $P1961["istrue"], $P106
.annotate 'line', 92
    new $P106, "String"
    assign $P106, "SsP"
    get_global $P1962, "%piropsig"
    unless_null $P1962, vivify_145
    $P1962 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1962
  vivify_145:
    set $P1962["join"], $P106
.annotate 'line', 93
    new $P106, "String"
    assign $P106, "Is"
    get_global $P1963, "%piropsig"
    unless_null $P1963, vivify_146
    $P1963 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1963
  vivify_146:
    set $P1963["length"], $P106
.annotate 'line', 94
    new $P106, "String"
    assign $P106, "vs"
    get_global $P1964, "%piropsig"
    unless_null $P1964, vivify_147
    $P1964 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1964
  vivify_147:
    set $P1964["load_bytecode"], $P106
.annotate 'line', 95
    new $P106, "String"
    assign $P106, "vs"
    get_global $P1965, "%piropsig"
    unless_null $P1965, vivify_148
    $P1965 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1965
  vivify_148:
    set $P1965["load_language"], $P106
.annotate 'line', 96
    new $P106, "String"
    assign $P106, "P~"
    get_global $P1966, "%piropsig"
    unless_null $P1966, vivify_149
    $P1966 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1966
  vivify_149:
    set $P1966["loadlib"], $P106
.annotate 'line', 97
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1967, "%piropsig"
    unless_null $P1967, vivify_150
    $P1967 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1967
  vivify_150:
    set $P1967["mod"], $P106
.annotate 'line', 98
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1968, "%piropsig"
    unless_null $P1968, vivify_151
    $P1968 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1968
  vivify_151:
    set $P1968["mul"], $P106
.annotate 'line', 99
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1969, "%piropsig"
    unless_null $P1969, vivify_152
    $P1969 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1969
  vivify_152:
    set $P1969["neg"], $P106
.annotate 'line', 100
    new $P106, "String"
    assign $P106, "P~"
    get_global $P1970, "%piropsig"
    unless_null $P1970, vivify_153
    $P1970 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1970
  vivify_153:
    set $P1970["new"], $P106
.annotate 'line', 101
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1971, "%piropsig"
    unless_null $P1971, vivify_154
    $P1971 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1971
  vivify_154:
    set $P1971["newclosure"], $P106
.annotate 'line', 102
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1972, "%piropsig"
    unless_null $P1972, vivify_155
    $P1972 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1972
  vivify_155:
    set $P1972["not"], $P106
.annotate 'line', 103
    new $P106, "String"
    assign $P106, "Isi"
    get_global $P1973, "%piropsig"
    unless_null $P1973, vivify_156
    $P1973 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1973
  vivify_156:
    set $P1973["ord"], $P106
.annotate 'line', 104
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1974, "%piropsig"
    unless_null $P1974, vivify_157
    $P1974 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1974
  vivify_157:
    set $P1974["pop"], $P106
.annotate 'line', 105
    new $P106, "String"
    assign $P106, "NN+"
    get_global $P1975, "%piropsig"
    unless_null $P1975, vivify_158
    $P1975 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1975
  vivify_158:
    set $P1975["pow"], $P106
.annotate 'line', 106
    new $P106, "String"
    assign $P106, "v*"
    get_global $P1976, "%piropsig"
    unless_null $P1976, vivify_159
    $P1976 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1976
  vivify_159:
    set $P1976["print"], $P106
.annotate 'line', 107
    new $P106, "String"
    assign $P106, "v*"
    get_global $P1977, "%piropsig"
    unless_null $P1977, vivify_160
    $P1977 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1977
  vivify_160:
    set $P1977["printerr"], $P106
.annotate 'line', 108
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P1978, "%piropsig"
    unless_null $P1978, vivify_161
    $P1978 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1978
  vivify_161:
    set $P1978["push"], $P106
.annotate 'line', 109
    new $P106, "String"
    assign $P106, "Ssi"
    get_global $P1979, "%piropsig"
    unless_null $P1979, vivify_162
    $P1979 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1979
  vivify_162:
    set $P1979["repeat"], $P106
.annotate 'line', 110
    new $P106, "String"
    assign $P106, "Ssiis"
    get_global $P1980, "%piropsig"
    unless_null $P1980, vivify_163
    $P1980 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1980
  vivify_163:
    set $P1980["replace"], $P106
.annotate 'line', 111
    new $P106, "String"
    assign $P106, "v*"
    get_global $P1981, "%piropsig"
    unless_null $P1981, vivify_164
    $P1981 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1981
  vivify_164:
    set $P1981["say"], $P106
.annotate 'line', 112
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1982, "%piropsig"
    unless_null $P1982, vivify_165
    $P1982 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1982
  vivify_165:
    set $P1982["set"], $P106
.annotate 'line', 113
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P1983, "%piropsig"
    unless_null $P1983, vivify_166
    $P1983 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1983
  vivify_166:
    set $P1983["setprop"], $P106
.annotate 'line', 114
    new $P106, "String"
    assign $P106, "0P~P"
    get_global $P1984, "%piropsig"
    unless_null $P1984, vivify_167
    $P1984 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1984
  vivify_167:
    set $P1984["setattribute"], $P106
.annotate 'line', 115
    new $P106, "String"
    assign $P106, "PP"
    get_global $P1985, "%piropsig"
    unless_null $P1985, vivify_168
    $P1985 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1985
  vivify_168:
    set $P1985["shift"], $P106
.annotate 'line', 116
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1986, "%piropsig"
    unless_null $P1986, vivify_169
    $P1986 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1986
  vivify_169:
    set $P1986["shl"], $P106
.annotate 'line', 117
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1987, "%piropsig"
    unless_null $P1987, vivify_170
    $P1987 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1987
  vivify_170:
    set $P1987["shr"], $P106
.annotate 'line', 118
    new $P106, "String"
    assign $P106, "v+"
    get_global $P1988, "%piropsig"
    unless_null $P1988, vivify_171
    $P1988 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1988
  vivify_171:
    set $P1988["sleep"], $P106
.annotate 'line', 119
    new $P106, "String"
    assign $P106, "0PPii"
    get_global $P1989, "%piropsig"
    unless_null $P1989, vivify_172
    $P1989 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1989
  vivify_172:
    set $P1989["splice"], $P106
.annotate 'line', 120
    new $P106, "String"
    assign $P106, "Pss"
    get_global $P1990, "%piropsig"
    unless_null $P1990, vivify_173
    $P1990 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1990
  vivify_173:
    set $P1990["split"], $P106
.annotate 'line', 121
    new $P106, "String"
    assign $P106, "PP+"
    get_global $P1991, "%piropsig"
    unless_null $P1991, vivify_174
    $P1991 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1991
  vivify_174:
    set $P1991["sub"], $P106
.annotate 'line', 122
    new $P106, "String"
    assign $P106, "Ssii"
    get_global $P1992, "%piropsig"
    unless_null $P1992, vivify_175
    $P1992 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1992
  vivify_175:
    set $P1992["substr"], $P106
.annotate 'line', 123
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P1993, "%piropsig"
    unless_null $P1993, vivify_176
    $P1993 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1993
  vivify_176:
    set $P1993["titlecase"], $P106
.annotate 'line', 124
    new $P106, "String"
    assign $P106, "vi"
    get_global $P1994, "%piropsig"
    unless_null $P1994, vivify_177
    $P1994 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1994
  vivify_177:
    set $P1994["trace"], $P106
.annotate 'line', 125
    new $P106, "String"
    assign $P106, "SP"
    get_global $P1995, "%piropsig"
    unless_null $P1995, vivify_178
    $P1995 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1995
  vivify_178:
    set $P1995["typeof"], $P106
.annotate 'line', 126
    new $P106, "String"
    assign $P106, "0P*"
    get_global $P1996, "%piropsig"
    unless_null $P1996, vivify_179
    $P1996 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1996
  vivify_179:
    set $P1996["unshift"], $P106
.annotate 'line', 127
    new $P106, "String"
    assign $P106, "Ss"
    get_global $P1997, "%piropsig"
    unless_null $P1997, vivify_180
    $P1997 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1997
  vivify_180:
    set $P1997["upcase"], $P106
.annotate 'line', 132
    new $P106, "String"
    assign $P106, "s~*:e"
    get_global $P1998, "%valflags"
    unless_null $P1998, vivify_181
    $P1998 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1998
  vivify_181:
    set $P1998["String"], $P106
.annotate 'line', 133
    new $P106, "String"
    assign $P106, "i+*:"
    get_global $P1999, "%valflags"
    unless_null $P1999, vivify_182
    $P1999 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1999
  vivify_182:
    set $P1999["Integer"], $P106
.annotate 'line', 134
    new $P106, "String"
    assign $P106, "n+*:"
    get_global $P2000, "%valflags"
    unless_null $P2000, vivify_183
    $P2000 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2000
  vivify_183:
    set $P2000["Float"], $P106
.annotate 'line', 135
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2001, "%valflags"
    unless_null $P2001, vivify_184
    $P2001 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2001
  vivify_184:
    set $P2001["!macro_const"], $P106
.annotate 'line', 136
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2002, "%valflags"
    unless_null $P2002, vivify_185
    $P2002 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2002
  vivify_185:
    set $P2002["!cclass"], $P106
.annotate 'line', 137
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2003, "%valflags"
    unless_null $P2003, vivify_186
    $P2003 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2003
  vivify_186:
    set $P2003["!except_severity"], $P106
.annotate 'line', 138
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2004, "%valflags"
    unless_null $P2004, vivify_187
    $P2004 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2004
  vivify_187:
    set $P2004["!except_types"], $P106
.annotate 'line', 139
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2005, "%valflags"
    unless_null $P2005, vivify_188
    $P2005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2005
  vivify_188:
    set $P2005["!iterator"], $P106
.annotate 'line', 140
    new $P106, "String"
    assign $P106, "i+*:c"
    get_global $P2006, "%valflags"
    unless_null $P2006, vivify_189
    $P2006 = root_new ['parrot';'Hash']
    set_global "%valflags", $P2006
  vivify_189:
    set $P2006["!socket"], $P106
.annotate 'line', 144
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P2007, "%controltypes"
    unless_null $P2007, vivify_190
    $P2007 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2007
  vivify_190:
    set $P2007["CONTROL"], $P106
.annotate 'line', 145
    new $P106, "String"
    assign $P106, ".CONTROL_RETURN"
    get_global $P2008, "%controltypes"
    unless_null $P2008, vivify_191
    $P2008 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2008
  vivify_191:
    set $P2008["RETURN"], $P106
.annotate 'line', 146
    new $P106, "String"
    assign $P106, ".CONTROL_OK"
    get_global $P2009, "%controltypes"
    unless_null $P2009, vivify_192
    $P2009 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2009
  vivify_192:
    set $P2009["OK"], $P106
.annotate 'line', 147
    new $P106, "String"
    assign $P106, ".CONTROL_BREAK"
    get_global $P2010, "%controltypes"
    unless_null $P2010, vivify_193
    $P2010 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2010
  vivify_193:
    set $P2010["BREAK"], $P106
.annotate 'line', 148
    new $P106, "String"
    assign $P106, ".CONTROL_CONTINUE"
    get_global $P2011, "%controltypes"
    unless_null $P2011, vivify_194
    $P2011 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2011
  vivify_194:
    set $P2011["CONTINUE"], $P106
.annotate 'line', 149
    new $P106, "String"
    assign $P106, ".CONTROL_ERROR"
    get_global $P2012, "%controltypes"
    unless_null $P2012, vivify_195
    $P2012 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2012
  vivify_195:
    set $P2012["ERROR"], $P106
.annotate 'line', 150
    new $P106, "String"
    assign $P106, ".CONTROL_TAKE"
    get_global $P2013, "%controltypes"
    unless_null $P2013, vivify_196
    $P2013 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2013
  vivify_196:
    set $P2013["GATHER"], $P106
.annotate 'line', 151
    new $P106, "String"
    assign $P106, ".CONTROL_LEAVE"
    get_global $P2014, "%controltypes"
    unless_null $P2014, vivify_197
    $P2014 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2014
  vivify_197:
    set $P2014["LEAVE"], $P106
.annotate 'line', 152
    new $P106, "String"
    assign $P106, ".CONTROL_EXIT"
    get_global $P2015, "%controltypes"
    unless_null $P2015, vivify_198
    $P2015 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2015
  vivify_198:
    set $P2015["EXIT"], $P106
.annotate 'line', 153
    new $P106, "String"
    assign $P106, ".CONTROL_NEXT"
    get_global $P2016, "%controltypes"
    unless_null $P2016, vivify_199
    $P2016 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2016
  vivify_199:
    set $P2016["NEXT"], $P106
.annotate 'line', 154
    new $P106, "String"
    assign $P106, ".CONTROL_LAST"
    get_global $P2017, "%controltypes"
    unless_null $P2017, vivify_200
    $P2017 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2017
  vivify_200:
    set $P2017["LAST"], $P106
.annotate 'line', 155
    new $P106, "String"
    assign $P106, ".CONTROL_REDO"
    get_global $P2018, "%controltypes"
    unless_null $P2018, vivify_201
    $P2018 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P2018
  vivify_201:
    set $P2018["REDO"], $P106
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
.sub "shallow_clone_hash"  :subid("12_1312756204.79645") :outer("11_1312756204.79645")
    .param pmc param_1012
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 994
    .const 'Sub' $P1016 = "13_1312756204.79645" 
    capture_lex $P1016
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "%to_clone", param_1012
.annotate 'line', 995
    $P1014 = root_new ['parrot';'Hash']
    set $P1013, $P1014
    .lex "%ret", $P1013
.annotate 'line', 994
    find_lex $P103, "%ret"
.annotate 'line', 996
    find_lex $P104, "%to_clone"
    defined $I100, $P104
    unless $I100, for_undef_209
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1020_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1020_test:
    unless $P103, loop1020_done
    shift $P105, $P103
  loop1020_redo:
    .const 'Sub' $P1016 = "13_1312756204.79645" 
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
  for_undef_209:
.annotate 'line', 994
    find_lex $P103, "%ret"
    .return ($P103)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1015"  :anon :subid("13_1312756204.79645") :outer("12_1312756204.79645")
    .param pmc param_1017
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 996
    .lex "$_", param_1017
.annotate 'line', 997
    find_lex $P106, "$_"
    find_lex $P1018, "%to_clone"
    unless_null $P1018, vivify_210
    $P1018 = root_new ['parrot';'Hash']
  vivify_210:
    set $P107, $P1018[$P106]
    unless_null $P107, vivify_211
    new $P107, "Undef"
  vivify_211:
    find_lex $P108, "$_"
    find_lex $P1019, "%ret"
    unless_null $P1019, vivify_212
    $P1019 = root_new ['parrot';'Hash']
    store_lex "%ret", $P1019
  vivify_212:
    set $P1019[$P108], $P107
.annotate 'line', 996
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("14_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 174
    .const 'Sub' $P1035 = "15_1312756204.79645" 
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
    unless_null $P106, vivify_213
    get_hll_global $P106, "$SUB"
    unless_null $P106, vivify_214
    die "Contextual $*SUB not found"
  vivify_214:
  vivify_213:
.annotate 'line', 183
    find_dynamic_lex $P106, "%*TEMPREGS"
    store_lex "%tempregs", $P106
.annotate 'line', 185
    .const 'Sub' $P1035 = "15_1312756204.79645" 
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
.sub "_block1034"  :anon :subid("15_1312756204.79645") :outer("14_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 186
    $P1037 = root_new ['parrot';'Hash']
    set $P1036, $P1037
    .lex "%*TEMPREGS", $P1036
.annotate 'line', 185
    find_lex $P106, "%*TEMPREGS"
    unless_null $P106, vivify_215
    get_hll_global $P106, "%TEMPREGS"
    unless_null $P106, vivify_216
    die "Contextual %*TEMPREGS not found"
  vivify_216:
  vivify_215:
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
.sub "escape"  :subid("16_1312756204.79645") :method :outer("11_1312756204.79645")
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
.sub "unique"  :subid("17_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1049 :optional
    .param int has_param_1049 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 217
    new $P1048, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1048, control_1047
    push_eh $P1048
    .lex "self", self
    if has_param_1049, optparam_217
    new $P105, "Undef"
    set param_1049, $P105
  optparam_217:
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
.sub "uniquereg"  :subid("18_1312756204.79645") :method :outer("11_1312756204.79645")
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
.sub "tempreg_frame"  :subid("19_1312756204.79645") :method :outer("11_1312756204.79645")
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
.annotate 'line', 245
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1065, "%tempregs"
    unless_null $P1065, vivify_218
    $P1065 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1065
  vivify_218:
    set $P1065["I"], $P105
.annotate 'line', 246
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1066, "%tempregs"
    unless_null $P1066, vivify_219
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1066
  vivify_219:
    set $P1066["N"], $P105
.annotate 'line', 247
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1067, "%tempregs"
    unless_null $P1067, vivify_220
    $P1067 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1067
  vivify_220:
    set $P1067["S"], $P105
.annotate 'line', 248
    get_global $P105, "$TEMPREG_BASE"
    find_lex $P1068, "%tempregs"
    unless_null $P1068, vivify_221
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1068
  vivify_221:
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
.sub "tempreg"  :subid("20_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1072
.annotate 'file', "PAST/Compiler.pm"
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
    unless_null $P108, vivify_222
    get_hll_global $P108, "%TEMPREGS"
    unless_null $P108, vivify_223
    die "Contextual %*TEMPREGS not found"
  vivify_223:
  vivify_222:
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
    unless_null $P109, vivify_224
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_225
    die "Contextual %*TEMPREGS not found"
  vivify_225:
  vivify_224:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_226
    new $P110, "Undef"
  vivify_226:
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
    unless_null $P109, vivify_227
    get_hll_global $P109, "%TEMPREGS"
    unless_null $P109, vivify_228
    die "Contextual %*TEMPREGS not found"
  vivify_228:
  vivify_227:
    set $P110, $P109[$P108]
    unless_null $P110, vivify_229
    new $P110, "Undef"
  vivify_229:
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
    unless_null $P113, vivify_230
    get_hll_global $P113, "%TEMPREGS"
    unless_null $P113, vivify_231
    die "Contextual %*TEMPREGS not found"
  vivify_231:
    store_dynamic_lex "%*TEMPREGS", $P113
  vivify_230:
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
.sub "coerce"  :subid("21_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1086
    .param pmc param_1087
.annotate 'file', "PAST/Compiler.pm"
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
.sub "post_children"  :subid("22_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1091
    .param pmc param_1092 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
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
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("23_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,_)
    .param pmc param_1096
    .param pmc param_1097 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 576
    new $P1095, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1095, control_1094
    push_eh $P1095
    .lex "self", self
    .lex "$node", param_1096
    .lex "%options", param_1097
.annotate 'line', 577
    new $P105, "Undef"
    set $P1098, $P105
    .lex "$what", $P1098
.annotate 'line', 576
    find_lex $P106, "$what"
.annotate 'line', 579
    find_lex $P106, "$node"
    isnull $I100, $P106
    if $I100, if_1099
.annotate 'line', 583
    new $P107, "String"
    assign $P107, "node of type "
    find_lex $P108, "$node"
    typeof $S100, $P108
    concat $P109, $P107, $S100
    store_lex "$what", $P109
.annotate 'line', 582
    goto if_1099_end
  if_1099:
.annotate 'line', 580
    new $P107, "String"
    assign $P107, "a null node"
    store_lex "$what", $P107
  if_1099_end:
.annotate 'line', 586
    find_lex $P106, "self"
    new $P107, "String"
    assign $P107, "PAST::Compiler can't compile "
    find_lex $P108, "$what"
    concat $P109, $P107, $P108
    $P110 = $P106."panic"($P109)
.annotate 'line', 576
    .return ($P110)
  control_1094:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("24_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["Undef"])
    .param pmc param_1103
    .param pmc param_1104 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 592
    new $P1102, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1102, control_1101
    push_eh $P1102
    .lex "self", self
    .lex "$node", param_1103
    .lex "%options", param_1104
.annotate 'line', 593
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "self"
    $P107 = $P106."tempreg"("P")
    $P108 = $P105."new"($P107 :named("result"))
.annotate 'line', 592
    .return ($P108)
  control_1101:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["Integer"])
    .param pmc param_1108
    .param pmc param_1109 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 603
    new $P1107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1107, control_1106
    push_eh $P1107
    .lex "self", self
    .lex "$node", param_1108
    .lex "%options", param_1109
.annotate 'line', 604
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1110, "%options"
    unless_null $P1110, vivify_232
    $P1110 = root_new ['parrot';'Hash']
  vivify_232:
    set $P109, $P1110["rtype"]
    unless_null $P109, vivify_233
    new $P109, "Undef"
  vivify_233:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 603
    .return ($P110)
  control_1106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("26_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["Float"])
    .param pmc param_1114
    .param pmc param_1115 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 607
    new $P1113, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1113, control_1112
    push_eh $P1113
    .lex "self", self
    .lex "$node", param_1114
    .lex "%options", param_1115
.annotate 'line', 608
    find_lex $P105, "self"
    get_hll_global $P106, ["POST"], "Ops"
    find_lex $P107, "$node"
    $P108 = $P106."new"($P107 :named("result"))
    find_lex $P1116, "%options"
    unless_null $P1116, vivify_234
    $P1116 = root_new ['parrot';'Hash']
  vivify_234:
    set $P109, $P1116["rtype"]
    unless_null $P109, vivify_235
    new $P109, "Undef"
  vivify_235:
    $P110 = $P105."coerce"($P108, $P109)
.annotate 'line', 607
    .return ($P110)
  control_1112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("27_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["String"])
    .param pmc param_1120
    .param pmc param_1121 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 611
    new $P1119, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1119, control_1118
    push_eh $P1119
    .lex "self", self
    .lex "$node", param_1120
    .lex "%options", param_1121
.annotate 'line', 612
    new $P105, "Undef"
    set $P1122, $P105
    .lex "$value", $P1122
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P106."escape"($P107)
    store_lex "$value", $P108
.annotate 'line', 613
    find_lex $P106, "self"
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$value"
    $P109 = $P107."new"($P108 :named("result"))
    find_lex $P1123, "%options"
    unless_null $P1123, vivify_236
    $P1123 = root_new ['parrot';'Hash']
  vivify_236:
    set $P110, $P1123["rtype"]
    unless_null $P110, vivify_237
    new $P110, "Undef"
  vivify_237:
    $P111 = $P106."coerce"($P109, $P110)
.annotate 'line', 611
    .return ($P111)
  control_1118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("28_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["String"])
    .param pmc param_1127
    .param pmc param_1128 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 622
    new $P1126, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1126, control_1125
    push_eh $P1126
    .lex "self", self
    .lex "$node", param_1127
    .lex "%options", param_1128
.annotate 'line', 623
    new $P105, "Undef"
    set $P1129, $P105
    .lex "$result", $P1129
.annotate 'line', 624
    new $P106, "Undef"
    set $P1130, $P106
    .lex "$s", $P1130
.annotate 'line', 623
    find_lex $P107, "self"
    $P108 = $P107."tempreg"("P")
    store_lex "$result", $P108
.annotate 'line', 624
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P107."escape"($P108)
    store_lex "$s", $P109
.annotate 'line', 625
    get_hll_global $P107, ["POST"], "Op"
    find_lex $P108, "$result"
    find_lex $P109, "$s"
    find_lex $P110, "$result"
    $P111 = $P107."new"($P108, $P109, "new" :named("pirop"), $P110 :named("result"))
.annotate 'line', 622
    .return ($P111)
  control_1125:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("29_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,_)
    .param pmc param_1134
    .param pmc param_1135 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 630
    new $P1133, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1133, control_1132
    push_eh $P1133
    .lex "self", self
    .lex "$node", param_1134
    .lex "%options", param_1135
.annotate 'line', 631
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."as_post"($P106, $P107 :flat)
.annotate 'line', 630
    .return ($P108)
  control_1132:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Node"])
    .param pmc param_1139
    .param pmc param_1140 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 646
    new $P1138, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1138, control_1137
    push_eh $P1138
    .lex "self", self
    .lex "$node", param_1139
    .lex "%options", param_1140
.annotate 'line', 647
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 646
    .return ($P108)
  control_1137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("31_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1144
    .param pmc param_1145
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 651
    new $P1143, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1143, control_1142
    push_eh $P1143
    .lex "self", self
    .lex "$node", param_1144
    .lex "%options", param_1145
.annotate 'line', 652
    new $P105, "Undef"
    set $P1146, $P105
    .lex "$rtype", $P1146
.annotate 'line', 654
    new $P106, "Undef"
    set $P1147, $P106
    .lex "$signature", $P1147
.annotate 'line', 657
    new $P107, "Undef"
    set $P1148, $P107
    .lex "$ops", $P1148
.annotate 'line', 660
    new $P108, "Undef"
    set $P1149, $P108
    .lex "$eh", $P1149
.annotate 'line', 652
    find_lex $P1150, "%options"
    unless_null $P1150, vivify_238
    $P1150 = root_new ['parrot';'Hash']
  vivify_238:
    set $P109, $P1150["rtype"]
    unless_null $P109, vivify_239
    new $P109, "Undef"
  vivify_239:
    store_lex "$rtype", $P109
.annotate 'line', 654
    find_lex $P109, "$node"
    $P110 = $P109."list"()
    set $N100, $P110
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P111, 'String'
    set $P111, $S100
    store_lex "$signature", $P111
.annotate 'line', 655
    find_lex $P109, "$signature"
    find_lex $P110, "$rtype"
    concat $P111, $P109, $P110
    store_lex "$signature", $P111
.annotate 'line', 657
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "$signature"
    $P112 = $P109."post_children"($P110, $P111 :named("signature"))
    store_lex "$ops", $P112
.annotate 'line', 658
    find_lex $P109, "$ops"
    find_lex $P1151, "$ops"
    unless_null $P1151, vivify_240
    $P1151 = root_new ['parrot';'ResizablePMCArray']
  vivify_240:
    set $P110, $P1151[-1]
    unless_null $P110, vivify_241
    new $P110, "Undef"
  vivify_241:
    $P109."result"($P110)
.annotate 'line', 660
    find_lex $P109, "$node"
    $P110 = $P109."handlers"()
    store_lex "$eh", $P110
.annotate 'line', 661
    find_lex $P109, "$eh"
    unless $P109, if_1152_end
    find_lex $P110, "self"
    find_lex $P111, "$ops"
    find_lex $P112, "$eh"
    find_lex $P113, "$rtype"
    $P114 = $P110."wrap_handlers"($P111, $P112, $P113 :named("rtype"))
    store_lex "$ops", $P114
  if_1152_end:
.annotate 'line', 651
    find_lex $P109, "$ops"
    .return ($P109)
  control_1142:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Stmt"])
    .param pmc param_1156
    .param pmc param_1157 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 673
    .const 'Sub' $P1163 = "33_1312756204.79645" 
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
    new $P105, "Undef"
    set $P1160, $P105
    .lex "$post", $P1160
.annotate 'line', 683
    new $P106, "Undef"
    set $P1161, $P106
    .lex "$result", $P1161
.annotate 'line', 674
    find_dynamic_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_242
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_243
    die "Contextual %*TEMPREGS not found"
  vivify_243:
  vivify_242:
    store_lex "%outerregs", $P107
.annotate 'line', 673
    find_lex $P107, "$post"
.annotate 'line', 677
    .const 'Sub' $P1163 = "33_1312756204.79645" 
    capture_lex $P1163
    $P1163()
.annotate 'line', 683
    find_lex $P107, "$post"
    $P108 = $P107."result"()
    store_lex "$result", $P108
.annotate 'line', 685
    find_lex $P109, "%outerregs"
    if $P109, if_1169
    set $P108, $P109
    goto if_1169_end
  if_1169:
    find_lex $P1170, "%options"
    unless_null $P1170, vivify_246
    $P1170 = root_new ['parrot';'Hash']
  vivify_246:
    set $P110, $P1170["rtype"]
    unless_null $P110, vivify_247
    new $P110, "Undef"
  vivify_247:
    set $S100, $P110
    isne $I100, $S100, "v"
    new $P108, 'Integer'
    set $P108, $I100
  if_1169_end:
    if $P108, if_1168
    set $P107, $P108
    goto if_1168_end
  if_1168:
.annotate 'line', 686
    find_lex $P111, "$result"
    set $S101, $P111
    substr $S102, $S101, 0, 1
    iseq $I101, $S102, "$"
    new $P107, 'Integer'
    set $P107, $I101
  if_1168_end:
    unless $P107, if_1167_end
.annotate 'line', 688
    new $P112, "Integer"
    assign $P112, 1
    find_lex $P113, "$result"
    find_lex $P1171, "%outerregs"
    unless_null $P1171, vivify_248
    $P1171 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1171
  vivify_248:
    set $P1171[$P113], $P112
  if_1167_end:
.annotate 'line', 673
    find_lex $P107, "$post"
    .return ($P107)
  control_1154:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1162"  :anon :subid("33_1312756204.79645") :outer("32_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 678
    $P1165 = root_new ['parrot';'Hash']
    set $P1164, $P1165
    .lex "%*TEMPREGS", $P1164
.annotate 'line', 677
    find_lex $P107, "%*TEMPREGS"
    unless_null $P107, vivify_244
    get_hll_global $P107, "%TEMPREGS"
    unless_null $P107, vivify_245
    die "Contextual %*TEMPREGS not found"
  vivify_245:
  vivify_244:
.annotate 'line', 679
    find_lex $P107, "%outerregs"
    unless $P107, if_1166_end
    find_lex $P108, "%outerregs"
    clone $P109, $P108
    store_lex "%*TEMPREGS", $P109
  if_1166_end:
.annotate 'line', 680
    find_lex $P107, "self"
    find_lex $P108, "$node"
    find_lex $P109, "%options"
    $P110 = $P107."node_as_post"($P108, $P109)
    store_lex "$post", $P110
.annotate 'line', 677
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("34_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Control"])
    .param pmc param_1175
    .param pmc param_1176 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
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
    new $P105, "Undef"
    set $P1179, $P105
    .lex "$ishandled", $P1179
.annotate 'line', 705
    new $P106, "Undef"
    set $P1180, $P106
    .lex "$nothandled", $P1180
.annotate 'line', 707
    new $P107, "Undef"
    set $P1181, $P107
    .lex "$ops", $P1181
.annotate 'line', 709
    new $P108, "Undef"
    set $P1182, $P108
    .lex "$signature", $P1182
.annotate 'line', 714
    new $P109, "Undef"
    set $P1183, $P109
    .lex "$children", $P1183
.annotate 'line', 716
    new $P110, "Undef"
    set $P1184, $P110
    .lex "$handled", $P1184
.annotate 'line', 700
    find_lex $P111, "%*TEMPREGS"
    unless_null $P111, vivify_249
    get_hll_global $P111, "%TEMPREGS"
    unless_null $P111, vivify_250
    die "Contextual %*TEMPREGS not found"
  vivify_250:
  vivify_249:
.annotate 'line', 704
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("handled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$ishandled", $P114
.annotate 'line', 705
    get_hll_global $P111, ["POST"], "Label"
    find_lex $P112, "self"
    $P113 = $P112."unique"("nothandled_")
    $P114 = $P111."new"($P113 :named("result"))
    store_lex "$nothandled", $P114
.annotate 'line', 707
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 709
    find_lex $P111, "$node"
    $P112 = $P111."list"()
    set $N100, $P112
    set $I100, $N100
    repeat $S100, "v", $I100
    new $P113, 'String'
    set $P113, $S100
    store_lex "$signature", $P113
.annotate 'line', 710
    find_lex $P111, "$signature"
    find_lex $P1185, "%options"
    unless_null $P1185, vivify_251
    $P1185 = root_new ['parrot';'Hash']
  vivify_251:
    set $P112, $P1185["rtype"]
    unless_null $P112, vivify_252
    new $P112, "Undef"
  vivify_252:
    concat $P113, $P111, $P112
    store_lex "$signature", $P113
.annotate 'line', 712
    find_lex $P111, "$ops"
    $P111."push_pirop"(".local pmc exception")
.annotate 'line', 713
    find_lex $P111, "$ops"
    $P111."push_pirop"(".get_results (exception)")
.annotate 'line', 714
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$signature"
    $P114 = $P111."post_children"($P112, $P113 :named("signature"))
    store_lex "$children", $P114
.annotate 'line', 715
    find_lex $P111, "$ops"
    find_lex $P112, "$children"
    $P111."push"($P112)
.annotate 'line', 716
    find_lex $P111, "self"
    $P112 = $P111."uniquereg"("I")
    store_lex "$handled", $P112
.annotate 'line', 718
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    $P111."push_pirop"("set", $P112, "exception[\"handled\"]")
.annotate 'line', 719
    find_lex $P111, "$ops"
    find_lex $P112, "$handled"
    find_lex $P113, "$nothandled"
    $P111."push_pirop"("ne", $P112, 1, $P113)
.annotate 'line', 720
    find_lex $P111, "$ops"
    find_lex $P112, "$ishandled"
    $P111."push"($P112)
.annotate 'line', 721
    find_lex $P111, "$ops"
    $P111."push_pirop"("return", "exception")
.annotate 'line', 722
    find_lex $P111, "$ops"
    find_lex $P112, "$nothandled"
    $P111."push"($P112)
.annotate 'line', 723
    find_lex $P111, "$ops"
    $P111."push_pirop"("rethrow", "exception")
.annotate 'line', 700
    find_lex $P111, "$ops"
    .return ($P111)
  control_1173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("35_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1189
    .param pmc param_1190
    .param pmc param_1191 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 727
    .const 'Sub' $P1201 = "36_1312756204.79645" 
    capture_lex $P1201
    new $P1188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1188, control_1187
    push_eh $P1188
    .lex "self", self
    .lex "$child", param_1189
    .lex "$ehs", param_1190
    .lex "%options", param_1191
.annotate 'line', 728
    new $P105, "Undef"
    set $P1192, $P105
    .lex "$rtype", $P1192
.annotate 'line', 731
    $P1194 = root_new ['parrot';'Hash']
    set $P1193, $P1194
    .lex "%*TEMPREGS", $P1193
.annotate 'line', 733
    new $P106, "Undef"
    set $P1195, $P106
    .lex "$ops", $P1195
.annotate 'line', 734
    new $P107, "Undef"
    set $P1196, $P107
    .lex "$pops", $P1196
.annotate 'line', 735
    new $P108, "Undef"
    set $P1197, $P108
    .lex "$tail", $P1197
.annotate 'line', 736
    new $P109, "Undef"
    set $P1198, $P109
    .lex "$skip", $P1198
.annotate 'line', 728
    find_lex $P1199, "%options"
    unless_null $P1199, vivify_253
    $P1199 = root_new ['parrot';'Hash']
  vivify_253:
    set $P110, $P1199["rtype"]
    unless_null $P110, vivify_254
    new $P110, "Undef"
  vivify_254:
    store_lex "$rtype", $P110
.annotate 'line', 727
    find_lex $P110, "%*TEMPREGS"
    unless_null $P110, vivify_255
    get_hll_global $P110, "%TEMPREGS"
    unless_null $P110, vivify_256
    die "Contextual %*TEMPREGS not found"
  vivify_256:
  vivify_255:
.annotate 'line', 733
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$ops", $P111
.annotate 'line', 734
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$pops", $P111
.annotate 'line', 735
    get_hll_global $P110, ["POST"], "Ops"
    $P111 = $P110."new"()
    store_lex "$tail", $P111
.annotate 'line', 736
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("skip_handler_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$skip", $P113
.annotate 'line', 738
    find_lex $P111, "$ehs"
    defined $I100, $P111
    unless $I100, for_undef_257
    iter $P110, $P111
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1221_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1221_test:
    unless $P110, loop1221_done
    shift $P112, $P110
  loop1221_redo:
    .const 'Sub' $P1201 = "36_1312756204.79645" 
    capture_lex $P1201
    $P1201($P112)
  loop1221_next:
    goto loop1221_test
  loop1221_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1221_next
    eq $P118, .CONTROL_LOOP_REDO, loop1221_redo
  loop1221_done:
    pop_eh 
  for_undef_257:
.annotate 'line', 771
    find_lex $P110, "$ops"
    find_lex $P111, "$child"
    $P110."push"($P111)
.annotate 'line', 773
    find_lex $P110, "$ops"
    find_lex $P111, "$pops"
    $P110."push"($P111)
.annotate 'line', 774
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push_pirop"("goto", $P111)
.annotate 'line', 775
    find_lex $P110, "$ops"
    find_lex $P111, "$tail"
    $P110."push"($P111)
.annotate 'line', 776
    find_lex $P110, "$ops"
    find_lex $P111, "$skip"
    $P110."push"($P111)
.annotate 'line', 727
    find_lex $P110, "$ops"
    .return ($P110)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1200"  :anon :subid("36_1312756204.79645") :outer("35_1312756204.79645")
    .param pmc param_1206
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 738
    .const 'Sub' $P1218 = "38_1312756204.79645" 
    capture_lex $P1218
    .const 'Sub' $P1211 = "37_1312756204.79645" 
    capture_lex $P1211
.annotate 'line', 739
    new $P113, "Undef"
    set $P1202, $P113
    .lex "$node", $P1202
.annotate 'line', 740
    new $P114, "Undef"
    set $P1203, $P114
    .lex "$label", $P1203
.annotate 'line', 741
    new $P115, "Undef"
    set $P1204, $P115
    .lex "$ehreg", $P1204
.annotate 'line', 746
    new $P116, "Undef"
    set $P1205, $P116
    .lex "$type", $P1205
    .lex "$_", param_1206
.annotate 'line', 739
    find_lex $P117, "$_"
    store_lex "$node", $P117
.annotate 'line', 740
    get_hll_global $P117, ["POST"], "Label"
    find_lex $P118, "self"
    $P119 = $P118."unique"("control_")
    $P120 = $P117."new"($P119 :named("result"))
    store_lex "$label", $P120
.annotate 'line', 741
    find_lex $P117, "self"
    $P118 = $P117."uniquereg"("P")
    store_lex "$ehreg", $P118
.annotate 'line', 743
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("new", $P118, "'ExceptionHandler'")
.annotate 'line', 744
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    find_lex $P119, "$label"
    $P117."push_pirop"("set_label", $P118, $P119)
.annotate 'line', 746
    find_lex $P117, "$node"
    $P118 = $P117."handle_types"()
    store_lex "$type", $P118
.annotate 'line', 747
    find_lex $P118, "$type"
    if $P118, if_1208
    set $P117, $P118
    goto if_1208_end
  if_1208:
    find_lex $P119, "$type"
    get_global $P1209, "%controltypes"
    unless_null $P1209, vivify_258
    $P1209 = root_new ['parrot';'Hash']
  vivify_258:
    set $P120, $P1209[$P119]
    unless_null $P120, vivify_259
    new $P120, "Undef"
  vivify_259:
    store_lex "$type", $P120
    set $P117, $P120
  if_1208_end:
    unless $P117, if_1207_end
    .const 'Sub' $P1211 = "37_1312756204.79645" 
    capture_lex $P1211
    $P1211()
  if_1207_end:
.annotate 'line', 753
    find_lex $P117, "$node"
    $P118 = $P117."handle_types_except"()
    store_lex "$type", $P118
.annotate 'line', 754
    find_lex $P118, "$type"
    if $P118, if_1215
    set $P117, $P118
    goto if_1215_end
  if_1215:
    find_lex $P119, "$type"
    get_global $P1216, "%controltypes"
    unless_null $P1216, vivify_262
    $P1216 = root_new ['parrot';'Hash']
  vivify_262:
    set $P120, $P1216[$P119]
    unless_null $P120, vivify_263
    new $P120, "Undef"
  vivify_263:
    store_lex "$type", $P120
    set $P117, $P120
  if_1215_end:
    unless $P117, if_1214_end
    .const 'Sub' $P1218 = "38_1312756204.79645" 
    capture_lex $P1218
    $P1218()
  if_1214_end:
.annotate 'line', 761
    find_lex $P117, "$ops"
    find_lex $P118, "$ehreg"
    $P117."push_pirop"("push_eh", $P118)
.annotate 'line', 764
    find_lex $P117, "$pops"
    $P117."push_pirop"("pop_eh")
.annotate 'line', 767
    find_lex $P117, "$tail"
    find_lex $P118, "$label"
    $P117."push"($P118)
.annotate 'line', 768
    find_lex $P117, "$tail"
    find_lex $P118, "self"
    find_lex $P119, "$node"
    find_lex $P120, "$rtype"
    $P121 = $P118."as_post"($P119, $P120 :named("rtype"))
    $P122 = $P117."push"($P121)
.annotate 'line', 738
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1210"  :anon :subid("37_1312756204.79645") :outer("36_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 748
    $P1213 = root_new ['parrot';'ResizablePMCArray']
    set $P1212, $P1213
    .lex "@types", $P1212
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 749
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types\"", $P122, $P123 :flat)
.annotate 'line', 750
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_260
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_261
    die "Contextual $*SUB not found"
  vivify_261:
  vivify_260:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 747
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1217"  :anon :subid("38_1312756204.79645") :outer("36_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 755
    $P1220 = root_new ['parrot';'ResizablePMCArray']
    set $P1219, $P1220
    .lex "@types", $P1219
    find_lex $P121, "$type"
    set $S100, $P121
    split $P122, ",", $S100
    store_lex "@types", $P122
.annotate 'line', 756
    find_lex $P121, "$ops"
    find_lex $P122, "$ehreg"
    find_lex $P123, "@types"
    $P121."push_pirop"("callmethod", "\"handle_types_except\"", $P122, $P123 :flat)
.annotate 'line', 758
    find_dynamic_lex $P121, "$*SUB"
    unless_null $P121, vivify_264
    get_hll_global $P121, "$SUB"
    unless_null $P121, vivify_265
    die "Contextual $*SUB not found"
  vivify_265:
  vivify_264:
    $P122 = $P121."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 754
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("39_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Block"])
    .param pmc param_1225
    .param pmc param_1226 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 786
    .const 'Sub' $P1250 = "40_1312756204.79645" 
    capture_lex $P1250
    new $P1224, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1224, control_1223
    push_eh $P1224
    .lex "self", self
    .lex "$node", param_1225
    .lex "%options", param_1226
.annotate 'line', 790
    new $P105, "Undef"
    set $P1227, $P105
    .lex "$name", $P1227
.annotate 'line', 791
    new $P106, "Undef"
    set $P1228, $P106
    .lex "$pirflags", $P1228
.annotate 'line', 792
    new $P107, "Undef"
    set $P1229, $P107
    .lex "$blocktype", $P1229
.annotate 'line', 793
    new $P108, "Undef"
    set $P1230, $P108
    .lex "$nsentry", $P1230
.annotate 'line', 794
    new $P109, "Undef"
    set $P1231, $P109
    .lex "$subid", $P1231
.annotate 'line', 795
    new $P110, "Undef"
    set $P1232, $P110
    .lex "$ns", $P1232
.annotate 'line', 796
    new $P111, "Undef"
    set $P1233, $P111
    .lex "$hll", $P1233
.annotate 'line', 797
    new $P112, "Undef"
    set $P1234, $P112
    .lex "$multi", $P1234
.annotate 'line', 798
    new $P113, "Undef"
    set $P1235, $P113
    .lex "$loadlibs", $P1235
.annotate 'line', 823
    new $P114, "Undef"
    set $P1236, $P114
    .lex "$bpost", $P1236
.annotate 'line', 831
    new $P115, "Undef"
    set $P1237, $P115
    .lex "$blockreg", $P1237
.annotate 'line', 832
    new $P116, "Undef"
    set $P1238, $P116
    .lex "$blockref", $P1238
.annotate 'line', 837
    new $P117, "Undef"
    set $P1239, $P117
    .lex "$outerpost", $P1239
.annotate 'line', 788
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_266
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_267
    die "Contextual @*BLOCKPAST not found"
  vivify_267:
  vivify_266:
    find_lex $P119, "$node"
    unshift $P118, $P119
.annotate 'line', 790
    find_lex $P118, "$node"
    $P119 = $P118."name"()
    store_lex "$name", $P119
.annotate 'line', 791
    find_lex $P118, "$node"
    $P119 = $P118."pirflags"()
    store_lex "$pirflags", $P119
.annotate 'line', 792
    find_lex $P118, "$node"
    $P119 = $P118."blocktype"()
    store_lex "$blocktype", $P119
.annotate 'line', 793
    find_lex $P118, "$node"
    $P119 = $P118."nsentry"()
    store_lex "$nsentry", $P119
.annotate 'line', 794
    find_lex $P118, "$node"
    $P119 = $P118."subid"()
    store_lex "$subid", $P119
.annotate 'line', 795
    find_lex $P118, "$node"
    $P119 = $P118."namespace"()
    store_lex "$ns", $P119
.annotate 'line', 796
    find_lex $P118, "$node"
    $P119 = $P118."hll"()
    store_lex "$hll", $P119
.annotate 'line', 797
    find_lex $P118, "$node"
    $P119 = $P118."multi"()
    store_lex "$multi", $P119
.annotate 'line', 798
    find_lex $P118, "$node"
    $P119 = $P118."loadlibs"()
    store_lex "$loadlibs", $P119
.annotate 'line', 801
    find_lex $P118, "$name"
    defined $I100, $P118
    if $I100, unless_1240_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$name", $P119
  unless_1240_end:
.annotate 'line', 802
    find_lex $P118, "$pirflags"
    defined $I100, $P118
    if $I100, unless_1241_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$pirflags", $P119
  unless_1241_end:
.annotate 'line', 803
    find_lex $P118, "$blocktype"
    defined $I100, $P118
    if $I100, unless_1242_end
    new $P119, "String"
    assign $P119, ""
    store_lex "$blocktype", $P119
  unless_1242_end:
.annotate 'line', 806
    find_lex $P118, "$nsentry"
    defined $I100, $P118
    unless $I100, if_1243_end
.annotate 'line', 807
    find_lex $P119, "$nsentry"
    if $P119, if_1244
.annotate 'line', 812
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :anon"
    store_lex "$pirflags", $P121
.annotate 'line', 811
    goto if_1244_end
  if_1244:
.annotate 'line', 809
    find_lex $P120, "$pirflags"
    concat $P121, $P120, " :nsentry("
    find_lex $P122, "self"
    find_lex $P123, "$nsentry"
    $S100 = $P122."escape"($P123)
    concat $P124, $P121, $S100
    concat $P125, $P124, ")"
    store_lex "$pirflags", $P125
  if_1244_end:
  if_1243_end:
.annotate 'line', 817
    find_lex $P118, "$name"
    if $P118, unless_1245_end
.annotate 'line', 818
    find_lex $P119, "self"
    $P120 = $P119."unique"("_block")
    store_lex "$name", $P120
.annotate 'line', 819
    find_lex $P120, "$ns"
    unless $P120, unless_1247
    set $P119, $P120
    goto unless_1247_end
  unless_1247:
    find_lex $P121, "$nsentry"
    set $P119, $P121
  unless_1247_end:
    if $P119, unless_1246_end
    find_lex $P122, "$pirflags"
    concat $P123, $P122, " :anon"
    store_lex "$pirflags", $P123
  unless_1246_end:
  unless_1245_end:
.annotate 'line', 823
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
.annotate 'line', 828
    find_lex $P118, "$pirflags"
    unless $P118, if_1248_end
    find_lex $P119, "$bpost"
    find_lex $P120, "$pirflags"
    $P119."pirflags"($P120)
  if_1248_end:
.annotate 'line', 831
    find_lex $P118, "self"
    $P119 = $P118."uniquereg"("P")
    store_lex "$blockreg", $P119
.annotate 'line', 832
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
.annotate 'line', 837
    find_dynamic_lex $P118, "$*SUB"
    unless_null $P118, vivify_268
    get_hll_global $P118, "$SUB"
    unless_null $P118, vivify_269
    die "Contextual $*SUB not found"
  vivify_269:
  vivify_268:
    store_lex "$outerpost", $P118
.annotate 'line', 838
    .const 'Sub' $P1250 = "40_1312756204.79645" 
    capture_lex $P1250
    $P1250()
.annotate 'line', 990
    find_dynamic_lex $P118, "@*BLOCKPAST"
    unless_null $P118, vivify_292
    get_hll_global $P118, "@BLOCKPAST"
    unless_null $P118, vivify_293
    die "Contextual @*BLOCKPAST not found"
  vivify_293:
  vivify_292:
    shift $P119, $P118
.annotate 'line', 786
    find_lex $P118, "$bpost"
    .return ($P118)
  control_1223:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P119, exception, "payload"
    .return ($P119)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1249"  :anon :subid("40_1312756204.79645") :outer("39_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 838
    .const 'Sub' $P1323 = "48_1312756204.79645" 
    capture_lex $P1323
    .const 'Sub' $P1312 = "47_1312756204.79645" 
    capture_lex $P1312
    .const 'Sub' $P1306 = "46_1312756204.79645" 
    capture_lex $P1306
    .const 'Sub' $P1280 = "43_1312756204.79645" 
    capture_lex $P1280
    .const 'Sub' $P1271 = "42_1312756204.79645" 
    capture_lex $P1271
    .const 'Sub' $P1264 = "41_1312756204.79645" 
    capture_lex $P1264
.annotate 'line', 839
    new $P118, "Undef"
    set $P1251, $P118
    .lex "$*SUB", $P1251
.annotate 'line', 841
    new $P119, "Undef"
    set $P1252, $P119
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
    new $P120, "Undef"
    set $P1259, $P120
    .lex "$compiler", $P1259
.annotate 'line', 960
    new $P121, "Undef"
    set $P1260, $P121
    .lex "$rtype", $P1260
.annotate 'line', 839
    find_lex $P122, "$bpost"
    store_lex "$*SUB", $P122
.annotate 'line', 841
    find_lex $P122, "$node"
    $P123 = $P122."lexical"()
    store_lex "$islexical", $P123
.annotate 'line', 842
    find_lex $P122, "$islexical"
    unless $P122, if_1261_end
.annotate 'line', 843
    find_lex $P123, "$bpost"
    find_lex $P124, "$outerpost"
    $P123."outer"($P124)
.annotate 'line', 846
    find_lex $P123, "$outerpost"
    defined $I100, $P123
    unless $I100, if_1262_end
    .const 'Sub' $P1264 = "41_1312756204.79645" 
    capture_lex $P1264
    $P1264()
  if_1262_end:
  if_1261_end:
.annotate 'line', 855
    find_lex $P122, "self"
    getattribute $P1266, $P122, "%!symtable"
    unless_null $P1266, vivify_270
    $P1266 = root_new ['parrot';'Hash']
  vivify_270:
    store_lex "%outersym", $P1266
.annotate 'line', 856
    find_lex $P122, "%outersym"
    store_lex "%symtable", $P122
.annotate 'line', 858
    find_lex $P122, "$node"
    $P123 = $P122."symtable"()
    unless $P123, if_1267_end
.annotate 'line', 861
    find_lex $P124, "$node"
    $P125 = $P124."symtable"()
    store_lex "%symtable", $P125
.annotate 'line', 862
    find_lex $P1269, "%symtable"
    unless_null $P1269, vivify_271
    $P1269 = root_new ['parrot';'Hash']
  vivify_271:
    set $P124, $P1269[""]
    unless_null $P124, vivify_272
    new $P124, "Undef"
  vivify_272:
    defined $I100, $P124
    if $I100, unless_1268_end
.annotate 'line', 864
    find_lex $P125, "%symtable"
    $P126 = "shallow_clone_hash"($P125)
    store_lex "%symtable", $P126
.annotate 'line', 865
    find_lex $P126, "%outersym"
    defined $I101, $P126
    unless $I101, for_undef_273
    iter $P125, $P126
    new $P128, 'ExceptionHandler'
    set_label $P128, loop1276_handler
    $P128."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P128
  loop1276_test:
    unless $P125, loop1276_done
    shift $P127, $P125
  loop1276_redo:
    .const 'Sub' $P1271 = "42_1312756204.79645" 
    capture_lex $P1271
    $P1271($P127)
  loop1276_next:
    goto loop1276_test
  loop1276_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, 'type'
    eq $P130, .CONTROL_LOOP_NEXT, loop1276_next
    eq $P130, .CONTROL_LOOP_REDO, loop1276_redo
  loop1276_done:
    pop_eh 
  for_undef_273:
  unless_1268_end:
  if_1267_end:
.annotate 'line', 871
    find_lex $P122, "%symtable"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 874
    find_dynamic_lex $P122, "%*TEMPREGS"
    unless_null $P122, vivify_277
    get_hll_global $P122, "%TEMPREGS"
    unless_null $P122, vivify_278
    die "Contextual %*TEMPREGS not found"
  vivify_278:
  vivify_277:
    store_lex "%outerregs", $P122
.annotate 'line', 876
    find_lex $P122, "$node"
    $P123 = $P122."compiler"()
    store_lex "$compiler", $P123
.annotate 'line', 877
    find_lex $P122, "$compiler"
    if $P122, if_1277
.annotate 'line', 884
    .const 'Sub' $P1280 = "43_1312756204.79645" 
    capture_lex $P1280
    $P1280()
    goto if_1277_end
  if_1277:
.annotate 'line', 880
    find_lex $P123, "$bpost"
    find_lex $P124, "$compiler"
    $P123."compiler"($P124)
.annotate 'line', 881
    find_lex $P123, "$bpost"
    find_lex $P124, "$node"
    $P125 = $P124."compiler_args"()
    $P123."compiler_args"($P125)
.annotate 'line', 882
    find_lex $P123, "$bpost"
    find_lex $P1278, "$node"
    unless_null $P1278, vivify_285
    $P1278 = root_new ['parrot';'ResizablePMCArray']
  vivify_285:
    set $P124, $P1278[0]
    unless_null $P124, vivify_286
    new $P124, "Undef"
  vivify_286:
    $P123."push"($P124)
  if_1277_end:
.annotate 'line', 947
    find_lex $P122, "$node"
    exists $I100, $P122["loadinit"]
    unless $I100, if_1304_end
    .const 'Sub' $P1306 = "46_1312756204.79645" 
    capture_lex $P1306
    $P1306()
  if_1304_end:
.annotate 'line', 957
    find_lex $P122, "%outersym"
    find_lex $P123, "self"
    setattribute $P123, "%!symtable", $P122
.annotate 'line', 960
    find_lex $P1309, "%options"
    unless_null $P1309, vivify_288
    $P1309 = root_new ['parrot';'Hash']
  vivify_288:
    set $P122, $P1309["rtype"]
    unless_null $P122, vivify_289
    new $P122, "Undef"
  vivify_289:
    store_lex "$rtype", $P122
.annotate 'line', 962
    find_lex $P123, "$blocktype"
    set $S100, $P123
    iseq $I100, $S100, "immediate"
    if $I100, if_1310
.annotate 'line', 971
    find_lex $P127, "$rtype"
    set $S101, $P127
    isne $I101, $S101, "v"
    if $I101, if_1319
    new $P126, 'Integer'
    set $P126, $I101
    goto if_1319_end
  if_1319:
.annotate 'line', 972
    get_hll_global $P128, ["POST"], "Ops"
    find_lex $P130, "$bpost"
    find_lex $P131, "$node"
    find_lex $P132, "$blockreg"
    $P133 = $P128."new"($P130, $P131 :named("node"), $P132 :named("result"))
    store_lex "$bpost", $P133
.annotate 'line', 973
    find_lex $P128, "$bpost"
    find_lex $P130, "$blockref"
    find_lex $P131, "$blockreg"
    $P128."push_pirop"($P130, $P131 :named("result"))
.annotate 'line', 974
    find_lex $P130, "$islexical"
    if $P130, if_1320
    set $P128, $P130
    goto if_1320_end
  if_1320:
.annotate 'line', 975
    find_lex $P132, "$node"
    $P133 = $P132."closure"()
    if $P133, if_1321
.annotate 'line', 983
    find_lex $P136, "$bpost"
    find_lex $P138, "$blockreg"
    $P139 = $P136."push_pirop"("capture_lex", $P138)
.annotate 'line', 982
    set $P131, $P139
.annotate 'line', 975
    goto if_1321_end
  if_1321:
    .const 'Sub' $P1323 = "48_1312756204.79645" 
    capture_lex $P1323
    $P135 = $P1323()
    set $P131, $P135
  if_1321_end:
.annotate 'line', 974
    set $P128, $P131
  if_1320_end:
.annotate 'line', 971
    set $P126, $P128
  if_1319_end:
    set $P122, $P126
.annotate 'line', 962
    goto if_1310_end
  if_1310:
    .const 'Sub' $P1312 = "47_1312756204.79645" 
    capture_lex $P1312
    $P125 = $P1312()
    set $P122, $P125
  if_1310_end:
.annotate 'line', 838
    .return ($P122)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1263"  :anon :subid("41_1312756204.79645") :outer("40_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 847
    new $P124, "Undef"
    set $P1265, $P124
    .lex "$cpost", $P1265
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$blockreg"
    $P127 = $P125."new"($P126 :named("result"))
    store_lex "$cpost", $P127
.annotate 'line', 848
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 849
    find_lex $P125, "$cpost"
    find_lex $P126, "$blockreg"
    $P125."push_pirop"("capture_lex", $P126)
.annotate 'line', 850
    find_lex $P125, "$outerpost"
    find_lex $P126, "$cpost"
    $P127 = $P125."unshift"($P126)
.annotate 'line', 846
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1270"  :anon :subid("42_1312756204.79645") :outer("40_1312756204.79645")
    .param pmc param_1272
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 865
    .lex "$_", param_1272
.annotate 'line', 866
    find_lex $P129, "$_"
    find_lex $P128, "%symtable"
    exists $I102, $P128[$P129]
    unless $I102, if_1273_end
    die 0, .CONTROL_LOOP_NEXT
  if_1273_end:
.annotate 'line', 867
    find_lex $P128, "$_"
    find_lex $P1274, "%outersym"
    unless_null $P1274, vivify_274
    $P1274 = root_new ['parrot';'Hash']
  vivify_274:
    set $P129, $P1274[$P128]
    unless_null $P129, vivify_275
    new $P129, "Undef"
  vivify_275:
    find_lex $P130, "$_"
    find_lex $P1275, "%symtable"
    unless_null $P1275, vivify_276
    $P1275 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1275
  vivify_276:
    set $P1275[$P130], $P129
.annotate 'line', 865
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1279"  :anon :subid("43_1312756204.79645") :outer("40_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 884
    .const 'Sub' $P1301 = "45_1312756204.79645" 
    capture_lex $P1301
    .const 'Sub' $P1292 = "44_1312756204.79645" 
    capture_lex $P1292
.annotate 'line', 887
    $P1282 = root_new ['parrot';'Hash']
    set $P1281, $P1282
    .lex "%*TEMPREGS", $P1281
.annotate 'line', 896
    new $P123, "Undef"
    set $P1283, $P123
    .lex "$ctrlpast", $P1283
.annotate 'line', 897
    new $P124, "Undef"
    set $P1284, $P124
    .lex "$ctrllabel", $P1284
.annotate 'line', 910
    new $P125, "Undef"
    set $P1285, $P125
    .lex "$sig", $P1285
.annotate 'line', 912
    new $P126, "Undef"
    set $P1286, $P126
    .lex "$ops", $P1286
.annotate 'line', 914
    new $P127, "Undef"
    set $P1287, $P127
    .lex "$retval", $P1287
.annotate 'line', 916
    new $P128, "Undef"
    set $P1288, $P128
    .lex "$eh", $P1288
.annotate 'line', 884
    find_lex $P129, "%*TEMPREGS"
    unless_null $P129, vivify_279
    get_hll_global $P129, "%TEMPREGS"
    unless_null $P129, vivify_280
    die "Contextual %*TEMPREGS not found"
  vivify_280:
  vivify_279:
.annotate 'line', 888
    find_lex $P129, "$node"
    $P130 = $P129."tempregs"()
    if $P130, if_1289
.annotate 'line', 892
    find_lex $P131, "%outerregs"
    store_lex "%*TEMPREGS", $P131
.annotate 'line', 891
    goto if_1289_end
  if_1289:
.annotate 'line', 889
    find_lex $P131, "self"
    $P132 = $P131."tempreg_frame"()
    store_lex "%*TEMPREGS", $P132
  if_1289_end:
.annotate 'line', 896
    find_lex $P129, "$node"
    $P130 = $P129."control"()
    store_lex "$ctrlpast", $P130
.annotate 'line', 884
    find_lex $P129, "$ctrllabel"
.annotate 'line', 899
    find_lex $P129, "$ctrlpast"
    unless $P129, if_1290_end
    .const 'Sub' $P1292 = "44_1312756204.79645" 
    capture_lex $P1292
    $P1292()
  if_1290_end:
.annotate 'line', 910
    find_lex $P129, "$node"
    $P130 = $P129."list"()
    elements $I100, $P130
    repeat $S100, "v", $I100
    new $P131, 'String'
    set $P131, $S100
    concat $P132, $P131, "*"
    store_lex "$sig", $P132
.annotate 'line', 912
    find_lex $P129, "self"
    find_lex $P130, "$node"
    find_lex $P131, "$sig"
    $P132 = $P129."post_children"($P130, $P131 :named("signature"))
    store_lex "$ops", $P132
.annotate 'line', 914
    find_lex $P1294, "$ops"
    unless_null $P1294, vivify_281
    $P1294 = root_new ['parrot';'ResizablePMCArray']
  vivify_281:
    set $P129, $P1294[-1]
    unless_null $P129, vivify_282
    new $P129, "Undef"
  vivify_282:
    store_lex "$retval", $P129
.annotate 'line', 916
    find_lex $P129, "$node"
    $P130 = $P129."handlers"()
    store_lex "$eh", $P130
.annotate 'line', 917
    find_lex $P129, "$eh"
    unless $P129, if_1295_end
.annotate 'line', 918
    find_lex $P130, "self"
    find_lex $P131, "$ops"
    find_lex $P132, "$eh"
    find_lex $P1296, "%options"
    unless_null $P1296, vivify_283
    $P1296 = root_new ['parrot';'Hash']
  vivify_283:
    set $P133, $P1296["rtype"]
    unless_null $P133, vivify_284
    new $P133, "Undef"
  vivify_284:
    $P134 = $P130."wrap_handlers"($P131, $P132, $P133 :named("rtype"))
    store_lex "$ops", $P134
  if_1295_end:
.annotate 'line', 920
    find_lex $P129, "$bpost"
    find_lex $P130, "$ops"
    $P129."push"($P130)
.annotate 'line', 921
    find_lex $P129, "$ops"
    $P130 = $P129."list"()
    set $N100, $P130
    isgt $I100, $N100, 0.0
    unless $I100, if_1297_end
.annotate 'line', 923
    find_lex $P131, "$bpost"
    find_lex $P132, "$retval"
    $P131."push_pirop"("return", $P132)
  if_1297_end:
.annotate 'line', 926
    find_lex $P130, "$ctrlpast"
    if $P130, if_1298
    set $P129, $P130
    goto if_1298_end
  if_1298:
.annotate 'line', 927
    find_lex $P131, "$bpost"
    find_lex $P132, "$ctrllabel"
    $P131."push"($P132)
.annotate 'line', 928
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".local pmc exception")
.annotate 'line', 929
    find_lex $P131, "$bpost"
    $P131."push_pirop"(".get_results (exception)")
.annotate 'line', 930
    find_lex $P132, "$ctrlpast"
    set $S100, $P132
    iseq $I100, $S100, "return_pir"
    if $I100, if_1299
.annotate 'line', 937
    find_lex $P137, "$ctrlpast"
    get_hll_global $P138, ["PAST"], "Node"
    $P139 = $P137."isa"($P138)
    if $P139, if_1303
.annotate 'line', 941
    find_lex $P140, "self"
    new $P141, 'String'
    set $P141, "Unrecognized control handler '"
    find_lex $P142, "$ctrlpast"
    concat $P143, $P141, $P142
    concat $P145, $P143, "'"
    $P146 = $P140."panic"($P145)
.annotate 'line', 940
    set $P135, $P146
.annotate 'line', 937
    goto if_1303_end
  if_1303:
.annotate 'line', 938
    find_lex $P140, "$bpost"
    find_lex $P141, "self"
    find_lex $P142, "$ctrlpast"
    $P143 = $P141."as_post"($P142, "*" :named("rtype"))
    $P144 = $P140."push"($P143)
.annotate 'line', 937
    set $P135, $P144
  if_1303_end:
    set $P131, $P135
.annotate 'line', 930
    goto if_1299_end
  if_1299:
    .const 'Sub' $P1301 = "45_1312756204.79645" 
    capture_lex $P1301
    $P134 = $P1301()
    set $P131, $P134
  if_1299_end:
.annotate 'line', 926
    set $P129, $P131
  if_1298_end:
.annotate 'line', 884
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1291"  :anon :subid("44_1312756204.79645") :outer("43_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 901
    new $P130, "Undef"
    set $P1293, $P130
    .lex "$reg", $P1293
.annotate 'line', 900
    get_hll_global $P131, ["POST"], "Label"
    find_lex $P132, "self"
    $P133 = $P132."unique"("control_")
    $P134 = $P131."new"($P133 :named("result"))
    store_lex "$ctrllabel", $P134
.annotate 'line', 901
    find_lex $P131, "self"
    $P132 = $P131."uniquereg"("P")
    store_lex "$reg", $P132
.annotate 'line', 902
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("new", $P132, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 904
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    find_lex $P133, "$ctrllabel"
    $P131."push_pirop"("set_label", $P132, $P133)
.annotate 'line', 905
    find_lex $P131, "$bpost"
    find_lex $P132, "$reg"
    $P131."push_pirop"("push_eh", $P132)
.annotate 'line', 906
    find_lex $P131, "$bpost"
    $P132 = $P131."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 899
    .return ($P132)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1300"  :anon :subid("45_1312756204.79645") :outer("43_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 932
    new $P133, "Undef"
    set $P1302, $P133
    .lex "$reg", $P1302
    find_lex $P134, "self"
    $P135 = $P134."tempreg"("P")
    store_lex "$reg", $P135
.annotate 'line', 933
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P134."push_pirop"("getattribute", $P135, "exception", "\"payload\"")
.annotate 'line', 935
    find_lex $P134, "$bpost"
    find_lex $P135, "$reg"
    $P136 = $P134."push_pirop"("return", $P135)
.annotate 'line', 930
    .return ($P136)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1305"  :anon :subid("46_1312756204.79645") :outer("40_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 948
    new $P123, "Undef"
    set $P1307, $P123
    .lex "$lisub", $P1307
    get_hll_global $P124, ["POST"], "Sub"
    find_lex $P125, "$bpost"
    $P126 = $P124."new"($P125 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P126
.annotate 'line', 949
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockref"
    $P124."push_pirop"($P125)
.annotate 'line', 950
    find_lex $P124, "$lisub"
    $P124."push_pirop"(".local pmc", "block")
.annotate 'line', 951
    find_lex $P124, "$lisub"
    find_lex $P125, "$blockreg"
    $P124."push_pirop"("set", "block", $P125)
.annotate 'line', 952
    find_lex $P124, "$lisub"
    find_lex $P125, "self"
    find_lex $P126, "$node"
    $P127 = $P126."loadinit"()
    $P128 = $P125."as_post"($P127, "v" :named("rtype"))
    $P124."push"($P128)
.annotate 'line', 953
    find_lex $P124, "$lisub"
    find_lex $P1308, "$bpost"
    unless_null $P1308, vivify_287
    $P1308 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1308
  vivify_287:
    set $P1308["loadinit"], $P124
.annotate 'line', 947
    .return ($P124)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1322"  :anon :subid("48_1312756204.79645") :outer("40_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 978
    new $P134, "Undef"
    set $P1324, $P134
    .lex "$result", $P1324
    find_lex $P135, "self"
    $P136 = $P135."uniquereg"("P")
    store_lex "$result", $P136
.annotate 'line', 979
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    find_lex $P137, "$blockreg"
    $P135."push_pirop"("newclosure", $P136, $P137)
.annotate 'line', 980
    find_lex $P135, "$bpost"
    find_lex $P136, "$result"
    $P137 = $P135."result"($P136)
.annotate 'line', 975
    .return ($P137)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1311"  :anon :subid("47_1312756204.79645") :outer("40_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 963
    $P1314 = root_new ['parrot';'ResizablePMCArray']
    set $P1313, $P1314
    .lex "@arglist", $P1313
.annotate 'line', 965
    new $P124, "Undef"
    set $P1315, $P124
    .lex "$result", $P1315
.annotate 'line', 963
    find_lex $P1316, "%options"
    unless_null $P1316, vivify_290
    $P1316 = root_new ['parrot';'Hash']
  vivify_290:
    set $P125, $P1316["arglist"]
    unless_null $P125, vivify_291
    new $P125, "Undef"
  vivify_291:
    store_lex "@arglist", $P125
.annotate 'line', 964
    find_lex $P125, "@arglist"
    defined $I101, $P125
    if $I101, unless_1317_end
    new $P126, "ResizablePMCArray"
    store_lex "@arglist", $P126
  unless_1317_end:
.annotate 'line', 965
    find_lex $P125, "self"
    find_lex $P126, "$rtype"
    $P127 = $P125."tempreg"($P126)
    store_lex "$result", $P127
.annotate 'line', 966
    get_hll_global $P125, ["POST"], "Ops"
    find_lex $P126, "$bpost"
    find_lex $P127, "$node"
    find_lex $P128, "$result"
    $P129 = $P125."new"($P126, $P127 :named("node"), $P128 :named("result"))
    store_lex "$bpost", $P129
.annotate 'line', 967
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockref"
    $P125."push_pirop"($P126)
.annotate 'line', 968
    find_lex $P125, "$islexical"
    unless $P125, if_1318_end
    find_lex $P126, "$bpost"
    find_lex $P127, "$blockreg"
    $P126."push_pirop"("capture_lex", $P127)
  if_1318_end:
.annotate 'line', 969
    find_lex $P125, "$bpost"
    find_lex $P126, "$blockreg"
    find_lex $P127, "@arglist"
    find_lex $P128, "$result"
    $P129 = $P125."push_pirop"("call", $P126, $P127 :flat, $P128 :named("result"))
.annotate 'line', 962
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("49_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1328
    .param pmc param_1329 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1011
    new $P1327, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1327, control_1326
    push_eh $P1327
    .lex "self", self
    .lex "$node", param_1328
    .lex "%options", param_1329
.annotate 'line', 1013
    new $P105, "Undef"
    set $P1330, $P105
    .lex "$lvalue", $P1330
.annotate 'line', 1014
    new $P106, "Undef"
    set $P1331, $P106
    .lex "$child", $P1331
.annotate 'line', 1019
    new $P107, "Undef"
    set $P1332, $P107
    .lex "$pasttype", $P1332
.annotate 'line', 1024
    new $P108, "Undef"
    set $P1333, $P108
    .lex "$pirop", $P1333
.annotate 'line', 1029
    new $P109, "Undef"
    set $P1334, $P109
    .lex "$inline", $P1334
.annotate 'line', 1013
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    store_lex "$lvalue", $P111
.annotate 'line', 1014
    find_lex $P1335, "$node"
    unless_null $P1335, vivify_294
    $P1335 = root_new ['parrot';'ResizablePMCArray']
  vivify_294:
    set $P110, $P1335[0]
    unless_null $P110, vivify_295
    new $P110, "Undef"
  vivify_295:
    store_lex "$child", $P110
.annotate 'line', 1015
    find_lex $P112, "$lvalue"
    if $P112, if_1338
    set $P111, $P112
    goto if_1338_end
  if_1338:
    find_lex $P113, "$child"
    defined $I100, $P113
    new $P111, 'Integer'
    set $P111, $I100
  if_1338_end:
    if $P111, if_1337
    set $P110, $P111
    goto if_1337_end
  if_1337:
    find_lex $P114, "$child"
    exists $I101, $P114["lvalue"]
    new $P115, 'Integer'
    set $P115, $I101
    isfalse $I102, $P115
    new $P110, 'Integer'
    set $P110, $I102
  if_1337_end:
    unless $P110, if_1336_end
.annotate 'line', 1016
    find_lex $P116, "$child"
    find_lex $P117, "$lvalue"
    $P116."lvalue"($P117)
  if_1336_end:
.annotate 'line', 1019
    find_lex $P110, "$node"
    $P111 = $P110."pasttype"()
    store_lex "$pasttype", $P111
.annotate 'line', 1020
    find_lex $P110, "$pasttype"
    unless $P110, if_1339_end
.annotate 'line', 1021
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
  if_1339_end:
.annotate 'line', 1024
    find_lex $P110, "$node"
    $P111 = $P110."pirop"()
    store_lex "$pirop", $P111
.annotate 'line', 1025
    find_lex $P110, "$pirop"
    unless $P110, if_1340_end
.annotate 'line', 1026
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."pirop"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1340_end:
.annotate 'line', 1029
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1030
    find_lex $P110, "$inline"
    unless $P110, if_1341_end
.annotate 'line', 1031
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "%options"
    $P115 = $P112."inline"($P113, $P114 :flat)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1341_end:
.annotate 'line', 1034
    find_lex $P110, "self"
    find_lex $P111, "$node"
    find_lex $P112, "%options"
    $P113 = $P110."call"($P111, $P112 :flat)
.annotate 'line', 1011
    .return ($P113)
  control_1326:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("50_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1345
    .param pmc param_1346 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1042
    new $P1344, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1344, control_1343
    push_eh $P1344
    .lex "self", self
    .lex "$node", param_1345
    .lex "%options", param_1346
.annotate 'line', 1043
    new $P105, "Undef"
    set $P1347, $P105
    .lex "$pirop", $P1347
.annotate 'line', 1044
    new $P106, "Undef"
    set $P1348, $P106
    .lex "$signature", $P1348
.annotate 'line', 1045
    new $P107, "Undef"
    set $P1349, $P107
    .lex "$I0", $P1349
.annotate 'line', 1061
    new $P108, "Undef"
    set $P1350, $P108
    .lex "$ops", $P1350
.annotate 'line', 1062
    $P1352 = root_new ['parrot';'ResizablePMCArray']
    set $P1351, $P1352
    .lex "@posargs", $P1351
.annotate 'line', 1072
    $P1354 = root_new ['parrot';'ResizablePMCArray']
    set $P1353, $P1354
    .lex "@arglist", $P1353
.annotate 'line', 1074
    new $P109, "Undef"
    set $P1355, $P109
    .lex "$S0", $P1355
.annotate 'line', 1085
    new $P110, "Undef"
    set $P1356, $P110
    .lex "$result", $P1356
.annotate 'line', 1043
    find_lex $P111, "$node"
    $P112 = $P111."pirop"()
    store_lex "$pirop", $P112
.annotate 'line', 1042
    find_lex $P111, "$signature"
    find_lex $P111, "$I0"
.annotate 'line', 1046
    find_lex $P111, "$pirop"
    set $S100, $P111
    index $I100, $S100, " "
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
    set $N100, $P112
    isge $I101, $N100, 0.0
    if $I101, if_1357
.annotate 'line', 1051
    find_lex $P113, "$pirop"
    set $S101, $P113
    index $I102, $S101, "__"
    new $P114, 'Integer'
    set $P114, $I102
    store_lex "$I0", $P114
    set $N101, $P114
    isge $I103, $N101, 0.0
    if $I103, if_1358
.annotate 'line', 1057
    find_lex $P115, "$pirop"
    get_global $P1359, "%piropsig"
    unless_null $P1359, vivify_296
    $P1359 = root_new ['parrot';'Hash']
  vivify_296:
    set $P116, $P1359[$P115]
    unless_null $P116, vivify_297
    new $P116, "Undef"
  vivify_297:
    store_lex "$signature", $P116
.annotate 'line', 1058
    find_lex $P115, "$signature"
    if $P115, unless_1360_end
    new $P116, "String"
    assign $P116, "vP"
    store_lex "$signature", $P116
  unless_1360_end:
.annotate 'line', 1056
    goto if_1358_end
  if_1358:
.annotate 'line', 1053
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    add $P117, $P116, 2
    set $I104, $P117
    substr $S103, $S102, $I104
    new $P118, 'String'
    set $P118, $S103
    store_lex "$signature", $P118
.annotate 'line', 1054
    find_lex $P115, "$pirop"
    set $S102, $P115
    find_lex $P116, "$I0"
    set $I104, $P116
    substr $S103, $S102, 0, $I104
    new $P117, 'String'
    set $P117, $S103
    store_lex "$pirop", $P117
  if_1358_end:
.annotate 'line', 1051
    goto if_1357_end
  if_1357:
.annotate 'line', 1048
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    add $P115, $P114, 1
    set $I102, $P115
    substr $S102, $S101, $I102
    new $P116, 'String'
    set $P116, $S102
    store_lex "$signature", $P116
.annotate 'line', 1049
    find_lex $P113, "$pirop"
    set $S101, $P113
    find_lex $P114, "$I0"
    set $I102, $P114
    substr $S102, $S101, 0, $I102
    new $P115, 'String'
    set $P115, $S102
    store_lex "$pirop", $P115
  if_1357_end:
.annotate 'line', 1042
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
.annotate 'line', 1064

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1072
    find_lex $P111, "$ops"
    $P112 = $P111."list"()
    store_lex "@arglist", $P112
.annotate 'line', 1074
    find_lex $P111, "$signature"
    set $S100, $P111
    substr $S101, $S100, 0, 1
    new $P112, 'String'
    set $P112, $S101
    store_lex "$S0", $P112
.annotate 'line', 1075
    find_lex $P111, "$S0"
    set $S100, $P111
    iseq $I100, $S100, "v"
    unless $I100, if_1361_end
.annotate 'line', 1076
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1077
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1361_end:
.annotate 'line', 1079
    find_lex $P111, "$S0"
    set $S100, $P111
    index $I100, "0123456789", $S100
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$I0", $P112
.annotate 'line', 1080
    find_lex $P111, "$I0"
    set $N100, $P111
    isge $I100, $N100, 0.0
    unless $I100, if_1362_end
.annotate 'line', 1081
    find_lex $P112, "$ops"
    find_lex $P113, "$I0"
    set $I101, $P113
    find_lex $P1363, "@arglist"
    unless_null $P1363, vivify_298
    $P1363 = root_new ['parrot';'ResizablePMCArray']
  vivify_298:
    set $P114, $P1363[$I101]
    unless_null $P114, vivify_299
    new $P114, "Undef"
  vivify_299:
    $P112."result"($P114)
.annotate 'line', 1082
    find_lex $P112, "$ops"
    find_lex $P113, "$pirop"
    find_lex $P114, "@posargs"
    $P112."push_pirop"($P113, $P114 :flat)
.annotate 'line', 1083
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1362_end:
.annotate 'line', 1085
    find_lex $P111, "self"
    find_lex $P112, "$S0"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1086
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1087
    find_lex $P111, "$ops"
    find_lex $P112, "$pirop"
    find_lex $P113, "$result"
    find_lex $P114, "@posargs"
    $P111."push_pirop"($P112, $P113, $P114 :flat)
.annotate 'line', 1088
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "$ops"
    setattribute $P111, 'payload', $P112
    throw $P111
.annotate 'line', 1042
    .return ()
  control_1343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("51_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1367
    .param pmc param_1368 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1096
    .const 'Sub' $P1386 = "52_1312756204.79645" 
    capture_lex $P1386
    new $P1366, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1366, control_1365
    push_eh $P1366
    .lex "self", self
    .lex "$node", param_1367
    .lex "%options", param_1368
.annotate 'line', 1097
    new $P105, "Undef"
    set $P1369, $P105
    .lex "$pasttype", $P1369
.annotate 'line', 1100
    new $P106, "Undef"
    set $P1370, $P106
    .lex "$signature", $P1370
.annotate 'line', 1104
    new $P107, "Undef"
    set $P1371, $P107
    .lex "$name", $P1371
.annotate 'line', 1105
    new $P108, "Undef"
    set $P1372, $P108
    .lex "$ops", $P1372
.annotate 'line', 1106
    $P1374 = root_new ['parrot';'ResizablePMCArray']
    set $P1373, $P1374
    .lex "@posargs", $P1373
.annotate 'line', 1107
    $P1376 = root_new ['parrot';'Hash']
    set $P1375, $P1376
    .lex "%namedargs", $P1375
.annotate 'line', 1132
    new $P109, "Undef"
    set $P1377, $P109
    .lex "$rtype", $P1377
.annotate 'line', 1133
    new $P110, "Undef"
    set $P1378, $P110
    .lex "$result", $P1378
.annotate 'line', 1097
    find_lex $P111, "$node"
    $P112 = $P111."pasttype"()
    store_lex "$pasttype", $P112
.annotate 'line', 1098
    find_lex $P111, "$pasttype"
    if $P111, unless_1379_end
    new $P112, "String"
    assign $P112, "call"
    store_lex "$pasttype", $P112
  unless_1379_end:
.annotate 'line', 1100
    new $P111, "String"
    assign $P111, "v:"
    store_lex "$signature", $P111
.annotate 'line', 1102
    find_lex $P111, "$pasttype"
    set $S100, $P111
    iseq $I100, $S100, "callmethod"
    unless $I100, if_1380_end
    new $P112, "String"
    assign $P112, "vP:"
    store_lex "$signature", $P112
  if_1380_end:
.annotate 'line', 1104
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    store_lex "$name", $P112
.annotate 'line', 1096
    find_lex $P111, "$ops"
    find_lex $P111, "@posargs"
    find_lex $P111, "%namedargs"
.annotate 'line', 1109
    find_lex $P111, "$name"
    if $P111, unless_1381_end
    find_lex $P112, "$signature"
    set $S100, $P112
    replace $S101, $S100, 1, 0, "P"
    new $P113, 'String'
    set $P113, $S101
    store_lex "$signature", $P113
  unless_1381_end:
.annotate 'line', 1111

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1119
    find_lex $P111, "$name"
    unless $P111, if_1382_end
.annotate 'line', 1120
    find_lex $P113, "$name"
    isa $I100, $P113, "P6object"
    if $I100, if_1384
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1384_end
  if_1384:
    find_lex $P114, "$name"
    get_hll_global $P115, ["PAST"], "Node"
    $P116 = $P114."isa"($P115)
    set $P112, $P116
  if_1384_end:
    if $P112, if_1383
.annotate 'line', 1127
    find_lex $P119, "@posargs"
    find_lex $P120, "self"
    find_lex $P121, "$name"
    $P122 = $P120."escape"($P121)
    unshift $P119, $P122
.annotate 'line', 1126
    goto if_1383_end
  if_1383:
.annotate 'line', 1120
    .const 'Sub' $P1386 = "52_1312756204.79645" 
    capture_lex $P1386
    $P1386()
  if_1383_end:
  if_1382_end:
.annotate 'line', 1132
    find_lex $P1388, "%options"
    unless_null $P1388, vivify_300
    $P1388 = root_new ['parrot';'Hash']
  vivify_300:
    set $P111, $P1388["rtype"]
    unless_null $P111, vivify_301
    new $P111, "Undef"
  vivify_301:
    store_lex "$rtype", $P111
.annotate 'line', 1133
    find_lex $P111, "self"
    find_lex $P112, "$rtype"
    $P113 = $P111."tempreg"($P112)
    store_lex "$result", $P113
.annotate 'line', 1134
    find_lex $P111, "$ops"
    find_lex $P112, "$pasttype"
    find_lex $P113, "@posargs"
    find_lex $P114, "%namedargs"
    find_lex $P115, "$result"
    $P111."push_pirop"($P112, $P113 :flat, $P114 :flat, $P115 :named("result"))
.annotate 'line', 1135
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 1096
    find_lex $P111, "$ops"
    .return ($P111)
  control_1365:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1385"  :anon :subid("52_1312756204.79645") :outer("51_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1121
    new $P117, "Undef"
    set $P1387, $P117
    .lex "$name_post", $P1387
    find_lex $P118, "self"
    find_lex $P119, "$name"
    $P120 = $P118."as_post"($P119, "s" :named("rtype"))
    store_lex "$name_post", $P120
.annotate 'line', 1122
    find_lex $P118, "self"
    find_lex $P119, "$name_post"
    $P120 = $P118."coerce"($P119, "s")
    store_lex "$name_post", $P120
.annotate 'line', 1123
    find_lex $P118, "$ops"
    find_lex $P119, "$name_post"
    $P118."push"($P119)
.annotate 'line', 1124
    find_lex $P118, "@posargs"
    find_lex $P119, "$name_post"
    unshift $P118, $P119
.annotate 'line', 1120
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("53_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1392
    .param pmc param_1393 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1144
    new $P1391, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1391, control_1390
    push_eh $P1391
    .lex "self", self
    .lex "$node", param_1392
    .lex "%options", param_1393
.annotate 'line', 1145
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."call"($P106, $P107 :flat)
.annotate 'line', 1144
    .return ($P108)
  control_1390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("54_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1397
    .param pmc param_1398 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1154
    .const 'Sub' $P1439 = "57_1312756204.79645" 
    capture_lex $P1439
    .const 'Sub' $P1415 = "55_1312756204.79645" 
    capture_lex $P1415
    new $P1396, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1396, control_1395
    push_eh $P1396
    .lex "self", self
    .lex "$node", param_1397
    .lex "%options", param_1398
.annotate 'line', 1155
    new $P105, "Undef"
    set $P1399, $P105
    .lex "$ops", $P1399
.annotate 'line', 1157
    new $P106, "Undef"
    set $P1400, $P106
    .lex "$rtype", $P1400
.annotate 'line', 1158
    new $P107, "Undef"
    set $P1401, $P107
    .lex "$result", $P1401
.annotate 'line', 1161
    new $P108, "Undef"
    set $P1402, $P108
    .lex "$pasttype", $P1402
.annotate 'line', 1163
    new $P109, "Undef"
    set $P1403, $P109
    .lex "$exprpast", $P1403
.annotate 'line', 1164
    new $P110, "Undef"
    set $P1404, $P110
    .lex "$thenpast", $P1404
.annotate 'line', 1165
    new $P111, "Undef"
    set $P1405, $P111
    .lex "$elsepast", $P1405
.annotate 'line', 1167
    new $P112, "Undef"
    set $P1406, $P112
    .lex "$S0", $P1406
.annotate 'line', 1168
    new $P113, "Undef"
    set $P1407, $P113
    .lex "$thenlabel", $P1407
.annotate 'line', 1169
    new $P114, "Undef"
    set $P1408, $P114
    .lex "$endlabel", $P1408
.annotate 'line', 1171
    new $P115, "Undef"
    set $P1409, $P115
    .lex "$exprrtype", $P1409
.annotate 'line', 1173
    new $P116, "Undef"
    set $P1410, $P116
    .lex "$childrtype", $P1410
.annotate 'line', 1176
    new $P117, "Undef"
    set $P1411, $P117
    .lex "$exprpost", $P1411
.annotate 'line', 1178
    new $P118, "Undef"
    set $P1412, $P118
    .lex "$thenpost", $P1412
.annotate 'line', 1179
    new $P119, "Undef"
    set $P1413, $P119
    .lex "$elsepost", $P1413
.annotate 'line', 1201
    .const 'Sub' $P1415 = "55_1312756204.79645" 
    newclosure $P1428, $P1415
    set $P1414, $P1428
    .lex "make_childpost", $P1414
.annotate 'line', 1155
    get_hll_global $P124, ["POST"], "Ops"
    find_lex $P125, "$node"
    $P126 = $P124."new"($P125 :named("node"))
    store_lex "$ops", $P126
.annotate 'line', 1157
    find_lex $P1429, "%options"
    unless_null $P1429, vivify_303
    $P1429 = root_new ['parrot';'Hash']
  vivify_303:
    set $P124, $P1429["rtype"]
    unless_null $P124, vivify_304
    new $P124, "Undef"
  vivify_304:
    store_lex "$rtype", $P124
.annotate 'line', 1158
    find_lex $P124, "self"
    find_lex $P125, "$rtype"
    $P126 = $P124."tempreg"($P125)
    store_lex "$result", $P126
.annotate 'line', 1159
    find_lex $P124, "$ops"
    find_lex $P125, "$result"
    $P124."result"($P125)
.annotate 'line', 1161
    find_lex $P124, "$node"
    $P125 = $P124."pasttype"()
    store_lex "$pasttype", $P125
.annotate 'line', 1163
    find_lex $P1430, "$node"
    unless_null $P1430, vivify_305
    $P1430 = root_new ['parrot';'ResizablePMCArray']
  vivify_305:
    set $P124, $P1430[0]
    unless_null $P124, vivify_306
    new $P124, "Undef"
  vivify_306:
    store_lex "$exprpast", $P124
.annotate 'line', 1164
    find_lex $P1431, "$node"
    unless_null $P1431, vivify_307
    $P1431 = root_new ['parrot';'ResizablePMCArray']
  vivify_307:
    set $P124, $P1431[1]
    unless_null $P124, vivify_308
    new $P124, "Undef"
  vivify_308:
    store_lex "$thenpast", $P124
.annotate 'line', 1165
    find_lex $P1432, "$node"
    unless_null $P1432, vivify_309
    $P1432 = root_new ['parrot';'ResizablePMCArray']
  vivify_309:
    set $P124, $P1432[2]
    unless_null $P124, vivify_310
    new $P124, "Undef"
  vivify_310:
    store_lex "$elsepast", $P124
.annotate 'line', 1167
    find_lex $P124, "self"
    find_lex $P125, "$pasttype"
    concat $P126, $P125, "_"
    $P127 = $P124."unique"($P126)
    store_lex "$S0", $P127
.annotate 'line', 1168
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    $P126 = $P124."new"($P125 :named("result"))
    store_lex "$thenlabel", $P126
.annotate 'line', 1169
    get_hll_global $P124, ["POST"], "Label"
    find_lex $P125, "$S0"
    concat $P126, $P125, "_end"
    $P127 = $P124."new"($P126 :named("result"))
    store_lex "$endlabel", $P127
.annotate 'line', 1171
    new $P124, "String"
    assign $P124, "r"
    store_lex "$exprrtype", $P124
.annotate 'line', 1172
    find_lex $P124, "$rtype"
    set $S100, $P124
    iseq $I100, $S100, "v"
    unless $I100, if_1433_end
    new $P125, "String"
    assign $P125, "*"
    store_lex "$exprrtype", $P125
  if_1433_end:
.annotate 'line', 1173
    find_lex $P124, "$rtype"
    store_lex "$childrtype", $P124
.annotate 'line', 1174
    find_lex $P124, "$rtype"
    set $S100, $P124
    index $I100, "*:", $S100
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1434_end
    new $P125, "String"
    assign $P125, "P"
    store_lex "$childrtype", $P125
  if_1434_end:
.annotate 'line', 1176
    find_lex $P124, "self"
    find_lex $P125, "$exprpast"
    find_lex $P126, "$exprrtype"
    $P127 = $P124."as_post"($P125, $P126 :named("rtype"))
    store_lex "$exprpost", $P127
.annotate 'line', 1178
    find_lex $P124, "$thenpast"
    $P125 = "make_childpost"($P124)
    store_lex "$thenpost", $P125
.annotate 'line', 1179
    find_lex $P124, "$elsepast"
    $P125 = "make_childpost"($P124)
    store_lex "$elsepost", $P125
.annotate 'line', 1181
    find_lex $P124, "$elsepost"
    defined $I100, $P124
    if $I100, if_1435
.annotate 'line', 1191
    .const 'Sub' $P1439 = "57_1312756204.79645" 
    capture_lex $P1439
    $P1439()
    goto if_1435_end
  if_1435:
.annotate 'line', 1182
    find_lex $P125, "$ops"
    find_lex $P126, "$exprpost"
    $P125."push"($P126)
.annotate 'line', 1183
    find_lex $P125, "$ops"
    find_lex $P126, "$pasttype"
    find_lex $P127, "$exprpost"
    find_lex $P128, "$thenlabel"
    $P125."push_pirop"($P126, $P127, $P128)
.annotate 'line', 1184
    find_lex $P125, "$elsepost"
    defined $I101, $P125
    unless $I101, if_1436_end
    find_lex $P126, "$ops"
    find_lex $P127, "$elsepost"
    $P126."push"($P127)
  if_1436_end:
.annotate 'line', 1185
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push_pirop"("goto", $P126)
.annotate 'line', 1186
    find_lex $P125, "$ops"
    find_lex $P126, "$thenlabel"
    $P125."push"($P126)
.annotate 'line', 1187
    find_lex $P125, "$thenpost"
    defined $I101, $P125
    unless $I101, if_1437_end
    find_lex $P126, "$ops"
    find_lex $P127, "$thenpost"
    $P126."push"($P127)
  if_1437_end:
.annotate 'line', 1188
    find_lex $P125, "$ops"
    find_lex $P126, "$endlabel"
    $P125."push"($P126)
.annotate 'line', 1189
    new $P125, "Exception"
    set $P125['type'], .CONTROL_RETURN
    find_lex $P126, "$ops"
    setattribute $P125, 'payload', $P126
    throw $P125
  if_1435_end:
.annotate 'line', 1154
    find_lex $P124, "make_childpost"
    .return ($P124)
  control_1395:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("55_1312756204.79645") :outer("54_1312756204.79645")
    .param pmc param_1418 :optional
    .param int has_param_1418 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1201
    .const 'Sub' $P1422 = "56_1312756204.79645" 
    capture_lex $P1422
    new $P1417, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1417, control_1416
    push_eh $P1417
    if has_param_1418, optparam_302
    new $P120, "Undef"
    set param_1418, $P120
  optparam_302:
    .lex "$childpast", param_1418
.annotate 'line', 1202
    new $P121, "Undef"
    set $P1419, $P121
    .lex "$childpost", $P1419
.annotate 'line', 1201
    find_lex $P122, "$childpost"
.annotate 'line', 1203
    find_lex $P122, "$childpast"
    defined $I100, $P122
    if $I100, if_1420
.annotate 'line', 1210
    find_lex $P123, "$rtype"
    set $S100, $P123
    iseq $I101, $S100, "v"
    unless $I101, if_1426_end
    new $P124, "Exception"
    set $P124['type'], .CONTROL_RETURN
    find_lex $P125, "$childpost"
    setattribute $P124, 'payload', $P125
    throw $P124
  if_1426_end:
.annotate 'line', 1211
    get_hll_global $P123, ["POST"], "Ops"
    find_lex $P124, "$exprpost"
    $P125 = $P123."new"($P124 :named("result"))
    store_lex "$childpost", $P125
.annotate 'line', 1209
    goto if_1420_end
  if_1420:
.annotate 'line', 1203
    .const 'Sub' $P1422 = "56_1312756204.79645" 
    capture_lex $P1422
    $P1422()
  if_1420_end:
.annotate 'line', 1213
    find_lex $P122, "$result"
    unless $P122, if_1427_end
    find_lex $P123, "self"
    find_lex $P124, "$childpost"
    find_lex $P125, "$result"
    $P126 = $P123."coerce"($P124, $P125)
    store_lex "$childpost", $P126
  if_1427_end:
.annotate 'line', 1201
    find_lex $P122, "$childpost"
    .return ($P122)
  control_1416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1421"  :anon :subid("56_1312756204.79645") :outer("55_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1204
    $P1424 = root_new ['parrot';'ResizablePMCArray']
    set $P1423, $P1424
    .lex "@arglist", $P1423
    new $P123, "ResizablePMCArray"
    store_lex "@arglist", $P123
.annotate 'line', 1205
    find_lex $P123, "$childpast"
    $N100 = $P123."arity"()
    isgt $I101, $N100, 0.0
    unless $I101, if_1425_end
    find_lex $P124, "@arglist"
    find_lex $P125, "$exprpost"
    push $P124, $P125
  if_1425_end:
.annotate 'line', 1206
    find_lex $P123, "self"
    find_lex $P124, "$childpast"
    find_lex $P125, "$childrtype"
    find_lex $P126, "@arglist"
    $P127 = $P123."as_post"($P124, $P125 :named("rtype"), $P126 :named("arglist"))
    store_lex "$childpost", $P127
.annotate 'line', 1203
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1438"  :anon :subid("57_1312756204.79645") :outer("54_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1192
    new $P125, "Undef"
    set $P1440, $P125
    .lex "$S0", $P1440
    new $P126, "String"
    assign $P126, "if"
    store_lex "$S0", $P126
.annotate 'line', 1193
    find_lex $P126, "$pasttype"
    set $S100, $P126
    find_lex $P127, "$S0"
    set $S101, $P127
    iseq $I101, $S100, $S101
    unless $I101, if_1441_end
    new $P128, "String"
    assign $P128, "unless"
    store_lex "$S0", $P128
  if_1441_end:
.annotate 'line', 1194
    find_lex $P126, "$ops"
    find_lex $P127, "$exprpost"
    $P126."push"($P127)
.annotate 'line', 1195
    find_lex $P126, "$ops"
    find_lex $P127, "$S0"
    find_lex $P128, "$exprpost"
    find_lex $P129, "$endlabel"
    $P126."push_pirop"($P127, $P128, $P129)
.annotate 'line', 1196
    find_lex $P126, "$thenpost"
    defined $I101, $P126
    unless $I101, if_1442_end
    find_lex $P127, "$ops"
    find_lex $P128, "$thenpost"
    $P127."push"($P128)
  if_1442_end:
.annotate 'line', 1197
    find_lex $P126, "$ops"
    find_lex $P127, "$endlabel"
    $P126."push"($P127)
.annotate 'line', 1198
    new $P126, "Exception"
    set $P126['type'], .CONTROL_RETURN
    find_lex $P127, "$ops"
    setattribute $P126, 'payload', $P127
    throw $P126
.annotate 'line', 1191
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("58_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1446
    .param pmc param_1447 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1218
    new $P1445, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1445, control_1444
    push_eh $P1445
    .lex "self", self
    .lex "$node", param_1446
    .lex "%options", param_1447
.annotate 'line', 1219
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."if"($P106, $P107 :flat)
.annotate 'line', 1218
    .return ($P108)
  control_1444:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("59_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1451 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1226
    new $P1450, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1450, control_1449
    push_eh $P1450
    .lex "self", self
    .lex "%options", param_1451
.annotate 'line', 1227
    new $P105, "Undef"
    set $P1452, $P105
    .lex "$loopname", $P1452
.annotate 'line', 1228
    new $P106, "Undef"
    set $P1453, $P106
    .lex "$testlabel", $P1453
.annotate 'line', 1229
    new $P107, "Undef"
    set $P1454, $P107
    .lex "$redolabel", $P1454
.annotate 'line', 1230
    new $P108, "Undef"
    set $P1455, $P108
    .lex "$nextlabel", $P1455
.annotate 'line', 1231
    new $P109, "Undef"
    set $P1456, $P109
    .lex "$donelabel", $P1456
.annotate 'line', 1232
    new $P110, "Undef"
    set $P1457, $P110
    .lex "$handlabel", $P1457
.annotate 'line', 1234
    new $P111, "Undef"
    set $P1458, $P111
    .lex "$testop", $P1458
.annotate 'line', 1235
    new $P112, "Undef"
    set $P1459, $P112
    .lex "$testpost", $P1459
.annotate 'line', 1236
    new $P113, "Undef"
    set $P1460, $P113
    .lex "$prepost", $P1460
.annotate 'line', 1237
    new $P114, "Undef"
    set $P1461, $P114
    .lex "$bodypost", $P1461
.annotate 'line', 1238
    new $P115, "Undef"
    set $P1462, $P115
    .lex "$nextpost", $P1462
.annotate 'line', 1239
    new $P116, "Undef"
    set $P1463, $P116
    .lex "$bodyfirst", $P1463
.annotate 'line', 1243
    new $P117, "Undef"
    set $P1464, $P117
    .lex "$ops", $P1464
.annotate 'line', 1247
    new $P118, "Undef"
    set $P1465, $P118
    .lex "$handreg", $P1465
.annotate 'line', 1269
    new $P119, "Undef"
    set $P1466, $P119
    .lex "$S0", $P1466
.annotate 'line', 1227
    find_lex $P120, "self"
    $P121 = $P120."unique"("loop")
    store_lex "$loopname", $P121
.annotate 'line', 1228
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_test"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$testlabel", $P123
.annotate 'line', 1229
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_redo"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$redolabel", $P123
.annotate 'line', 1230
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_next"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$nextlabel", $P123
.annotate 'line', 1231
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_done"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$donelabel", $P123
.annotate 'line', 1232
    get_hll_global $P120, ["POST"], "Label"
    find_lex $P121, "$loopname"
    concat $P122, $P121, "_handler"
    $P123 = $P120."new"($P122 :named("result"))
    store_lex "$handlabel", $P123
.annotate 'line', 1234
    find_lex $P1467, "%options"
    unless_null $P1467, vivify_311
    $P1467 = root_new ['parrot';'Hash']
  vivify_311:
    set $P120, $P1467["testop"]
    unless_null $P120, vivify_312
    new $P120, "Undef"
  vivify_312:
    store_lex "$testop", $P120
.annotate 'line', 1235
    find_lex $P1468, "%options"
    unless_null $P1468, vivify_313
    $P1468 = root_new ['parrot';'Hash']
  vivify_313:
    set $P120, $P1468["test"]
    unless_null $P120, vivify_314
    new $P120, "Undef"
  vivify_314:
    store_lex "$testpost", $P120
.annotate 'line', 1236
    find_lex $P1469, "%options"
    unless_null $P1469, vivify_315
    $P1469 = root_new ['parrot';'Hash']
  vivify_315:
    set $P120, $P1469["pre"]
    unless_null $P120, vivify_316
    new $P120, "Undef"
  vivify_316:
    store_lex "$prepost", $P120
.annotate 'line', 1237
    find_lex $P1470, "%options"
    unless_null $P1470, vivify_317
    $P1470 = root_new ['parrot';'Hash']
  vivify_317:
    set $P120, $P1470["body"]
    unless_null $P120, vivify_318
    new $P120, "Undef"
  vivify_318:
    store_lex "$bodypost", $P120
.annotate 'line', 1238
    find_lex $P1471, "%options"
    unless_null $P1471, vivify_319
    $P1471 = root_new ['parrot';'Hash']
  vivify_319:
    set $P120, $P1471["next"]
    unless_null $P120, vivify_320
    new $P120, "Undef"
  vivify_320:
    store_lex "$nextpost", $P120
.annotate 'line', 1239
    find_lex $P1472, "%options"
    unless_null $P1472, vivify_321
    $P1472 = root_new ['parrot';'Hash']
  vivify_321:
    set $P120, $P1472["bodyfirst"]
    unless_null $P120, vivify_322
    new $P120, "Undef"
  vivify_322:
    store_lex "$bodyfirst", $P120
.annotate 'line', 1241
    find_lex $P120, "$testop"
    if $P120, unless_1473_end
    new $P121, "String"
    assign $P121, "unless"
    store_lex "$testop", $P121
  unless_1473_end:
.annotate 'line', 1243
    get_hll_global $P120, ["POST"], "Ops"
    $P121 = $P120."new"()
    store_lex "$ops", $P121
.annotate 'line', 1245
    find_dynamic_lex $P120, "$*SUB"
    unless_null $P120, vivify_323
    get_hll_global $P120, "$SUB"
    unless_null $P120, vivify_324
    die "Contextual $*SUB not found"
  vivify_324:
  vivify_323:
    $P120."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1247
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$handreg", $P121
.annotate 'line', 1248
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("new", $P121, "'ExceptionHandler'")
.annotate 'line', 1249
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    find_lex $P122, "$handlabel"
    $P120."push_pirop"("set_label", $P121, $P122)
.annotate 'line', 1250
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("callmethod", "\"handle_types\"", $P121, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1252
    find_lex $P120, "$ops"
    find_lex $P121, "$handreg"
    $P120."push_pirop"("push_eh", $P121)
.annotate 'line', 1254
    find_lex $P120, "$bodyfirst"
    unless $P120, if_1474_end
    find_lex $P121, "$ops"
    find_lex $P122, "$redolabel"
    $P121."push_pirop"("goto", $P122)
  if_1474_end:
.annotate 'line', 1255
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push"($P121)
.annotate 'line', 1256
    find_lex $P120, "$testpost"
    unless $P120, if_1475_end
.annotate 'line', 1257
    find_lex $P121, "$ops"
    find_lex $P122, "$testpost"
    $P121."push"($P122)
.annotate 'line', 1258
    find_lex $P121, "$ops"
    find_lex $P122, "$testop"
    find_lex $P123, "$testpost"
    find_lex $P124, "$donelabel"
    $P121."push_pirop"($P122, $P123, $P124)
  if_1475_end:
.annotate 'line', 1260
    find_lex $P120, "$prepost"
    unless $P120, if_1476_end
    find_lex $P121, "$ops"
    find_lex $P122, "$prepost"
    $P121."push"($P122)
  if_1476_end:
.annotate 'line', 1261
    find_lex $P120, "$ops"
    find_lex $P121, "$redolabel"
    $P120."push"($P121)
.annotate 'line', 1262
    find_lex $P120, "$bodypost"
    unless $P120, if_1477_end
    find_lex $P121, "$ops"
    find_lex $P122, "$bodypost"
    $P121."push"($P122)
  if_1477_end:
.annotate 'line', 1263
    find_lex $P120, "$ops"
    find_lex $P121, "$nextlabel"
    $P120."push"($P121)
.annotate 'line', 1264
    find_lex $P120, "$nextpost"
    unless $P120, if_1478_end
    find_lex $P121, "$ops"
    find_lex $P122, "$nextpost"
    $P121."push"($P122)
  if_1478_end:
.annotate 'line', 1265
    find_lex $P120, "$ops"
    find_lex $P121, "$testlabel"
    $P120."push_pirop"("goto", $P121)
.annotate 'line', 1266
    find_lex $P120, "$ops"
    find_lex $P121, "$handlabel"
    $P120."push"($P121)
.annotate 'line', 1267
    find_lex $P120, "$ops"
    $P120."push_pirop"(".local pmc exception")
.annotate 'line', 1268
    find_lex $P120, "$ops"
    $P120."push_pirop"(".get_results (exception)")
.annotate 'line', 1269
    find_lex $P120, "self"
    $P121 = $P120."tempreg"("P")
    store_lex "$S0", $P121
.annotate 'line', 1270
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    $P120."push_pirop"("getattribute", $P121, "exception", "'type'")
.annotate 'line', 1271
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$nextlabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_NEXT", $P122)
.annotate 'line', 1272
    find_lex $P120, "$ops"
    find_lex $P121, "$S0"
    find_lex $P122, "$redolabel"
    $P120."push_pirop"("eq", $P121, ".CONTROL_LOOP_REDO", $P122)
.annotate 'line', 1273
    find_lex $P120, "$ops"
    find_lex $P121, "$donelabel"
    $P120."push"($P121)
.annotate 'line', 1274
    find_lex $P120, "$ops"
    $P120."push_pirop"("pop_eh")
.annotate 'line', 1226
    find_lex $P120, "$ops"
    .return ($P120)
  control_1449:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("60_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1482
    .param pmc param_1483 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1285
    new $P1481, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1481, control_1480
    push_eh $P1481
    .lex "self", self
    .lex "$node", param_1482
    .lex "%options", param_1483
.annotate 'line', 1286
    new $P105, "Undef"
    set $P1484, $P105
    .lex "$exprpast", $P1484
.annotate 'line', 1287
    new $P106, "Undef"
    set $P1485, $P106
    .lex "$bodypast", $P1485
.annotate 'line', 1288
    new $P107, "Undef"
    set $P1486, $P107
    .lex "$nextpast", $P1486
.annotate 'line', 1290
    new $P108, "Undef"
    set $P1487, $P108
    .lex "$exprpost", $P1487
.annotate 'line', 1292
    $P1489 = root_new ['parrot';'ResizablePMCArray']
    set $P1488, $P1489
    .lex "@arglist", $P1488
.annotate 'line', 1294
    new $P109, "Undef"
    set $P1490, $P109
    .lex "$bodypost", $P1490
.annotate 'line', 1296
    new $P110, "Undef"
    set $P1491, $P110
    .lex "$nextpost", $P1491
.annotate 'line', 1299
    new $P111, "Undef"
    set $P1492, $P111
    .lex "$testop", $P1492
.annotate 'line', 1300
    new $P112, "Undef"
    set $P1493, $P112
    .lex "$bodyfirst", $P1493
.annotate 'line', 1302
    new $P113, "Undef"
    set $P1494, $P113
    .lex "$ops", $P1494
.annotate 'line', 1286
    find_lex $P1495, "$node"
    unless_null $P1495, vivify_325
    $P1495 = root_new ['parrot';'ResizablePMCArray']
  vivify_325:
    set $P114, $P1495[0]
    unless_null $P114, vivify_326
    new $P114, "Undef"
  vivify_326:
    store_lex "$exprpast", $P114
.annotate 'line', 1287
    find_lex $P1496, "$node"
    unless_null $P1496, vivify_327
    $P1496 = root_new ['parrot';'ResizablePMCArray']
  vivify_327:
    set $P114, $P1496[1]
    unless_null $P114, vivify_328
    new $P114, "Undef"
  vivify_328:
    store_lex "$bodypast", $P114
.annotate 'line', 1288
    find_lex $P1497, "$node"
    unless_null $P1497, vivify_329
    $P1497 = root_new ['parrot';'ResizablePMCArray']
  vivify_329:
    set $P114, $P1497[2]
    unless_null $P114, vivify_330
    new $P114, "Undef"
  vivify_330:
    store_lex "$nextpast", $P114
.annotate 'line', 1290
    find_lex $P114, "self"
    find_lex $P115, "$exprpast"
    $P116 = $P114."as_post"($P115, "r" :named("rtype"))
    store_lex "$exprpost", $P116
.annotate 'line', 1292
    new $P114, "ResizablePMCArray"
    store_lex "@arglist", $P114
.annotate 'line', 1293
    find_lex $P114, "$bodypast"
    $N100 = $P114."arity"()
    islt $I100, $N100, 1.0
    if $I100, unless_1498_end
    find_lex $P115, "@arglist"
    find_lex $P116, "$exprpost"
    push $P115, $P116
  unless_1498_end:
.annotate 'line', 1294
    find_lex $P114, "self"
    find_lex $P115, "$bodypast"
    find_lex $P116, "@arglist"
    $P117 = $P114."as_post"($P115, "v" :named("rtype"), $P116 :named("arglist"))
    store_lex "$bodypost", $P117
.annotate 'line', 1296
    get_hll_global $P114, "null__P"
    store_lex "$nextpost", $P114
.annotate 'line', 1297
    find_lex $P114, "$nextpast"
    unless $P114, if_1499_end
    find_lex $P115, "self"
    find_lex $P116, "$nextpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    store_lex "$nextpost", $P117
  if_1499_end:
.annotate 'line', 1299
    find_lex $P1500, "%options"
    unless_null $P1500, vivify_331
    $P1500 = root_new ['parrot';'Hash']
  vivify_331:
    set $P114, $P1500["testop"]
    unless_null $P114, vivify_332
    new $P114, "Undef"
  vivify_332:
    store_lex "$testop", $P114
.annotate 'line', 1300
    find_lex $P1501, "%options"
    unless_null $P1501, vivify_333
    $P1501 = root_new ['parrot';'Hash']
  vivify_333:
    set $P114, $P1501["bodyfirst"]
    unless_null $P114, vivify_334
    new $P114, "Undef"
  vivify_334:
    store_lex "$bodyfirst", $P114
.annotate 'line', 1302
    find_lex $P114, "self"
    find_lex $P115, "$testop"
    find_lex $P116, "$exprpost"
    find_lex $P117, "$bodypost"
    find_lex $P118, "$bodyfirst"
    find_lex $P119, "$nextpost"
    $P120 = $P114."loop_gen"($P115 :named("testop"), $P116 :named("test"), $P117 :named("body"), $P118 :named("bodyfirst"), $P119 :named("next"))
    store_lex "$ops", $P120
.annotate 'line', 1304
    find_lex $P114, "$ops"
    find_lex $P115, "$exprpost"
    $P114."result"($P115)
.annotate 'line', 1305
    find_lex $P114, "$ops"
    find_lex $P115, "$node"
    $P114."node"($P115)
.annotate 'line', 1285
    find_lex $P114, "$ops"
    .return ($P114)
  control_1480:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("61_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1505
    .param pmc param_1506 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1309
    new $P1504, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1504, control_1503
    push_eh $P1504
    .lex "self", self
    .lex "$node", param_1505
    .lex "%options", param_1506
.annotate 'line', 1310
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"))
.annotate 'line', 1309
    .return ($P108)
  control_1503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("62_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1510
    .param pmc param_1511 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1313
    new $P1509, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1509, control_1508
    push_eh $P1509
    .lex "self", self
    .lex "$node", param_1510
    .lex "%options", param_1511
.annotate 'line', 1314
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1313
    .return ($P108)
  control_1508:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("63_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1515
    .param pmc param_1516 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1317
    new $P1514, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1514, control_1513
    push_eh $P1514
    .lex "self", self
    .lex "$node", param_1515
    .lex "%options", param_1516
.annotate 'line', 1318
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."while"($P106, $P107 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1317
    .return ($P108)
  control_1513:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("64_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1520
    .param pmc param_1521 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1326
    .const 'Sub' $P1539 = "65_1312756204.79645" 
    capture_lex $P1539
    new $P1519, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1519, control_1518
    push_eh $P1519
    .lex "self", self
    .lex "$node", param_1520
    .lex "%options", param_1521
.annotate 'line', 1327
    new $P105, "Undef"
    set $P1522, $P105
    .lex "$ops", $P1522
.annotate 'line', 1328
    new $P106, "Undef"
    set $P1523, $P106
    .lex "$prepost", $P1523
.annotate 'line', 1329
    new $P107, "Undef"
    set $P1524, $P107
    .lex "$testpost", $P1524
.annotate 'line', 1331
    new $P108, "Undef"
    set $P1525, $P108
    .lex "$collpast", $P1525
.annotate 'line', 1332
    new $P109, "Undef"
    set $P1526, $P109
    .lex "$bodypast", $P1526
.annotate 'line', 1334
    new $P110, "Undef"
    set $P1527, $P110
    .lex "$collpost", $P1527
.annotate 'line', 1338
    new $P111, "Undef"
    set $P1528, $P111
    .lex "$undeflabel", $P1528
.annotate 'line', 1339
    new $P112, "Undef"
    set $P1529, $P112
    .lex "$S0", $P1529
.annotate 'line', 1347
    new $P113, "Undef"
    set $P1530, $P113
    .lex "$arity", $P1530
.annotate 'line', 1356
    $P1532 = root_new ['parrot';'ResizablePMCArray']
    set $P1531, $P1532
    .lex "@arglist", $P1531
.annotate 'line', 1366
    new $P114, "Undef"
    set $P1533, $P114
    .lex "$bodypost", $P1533
.annotate 'line', 1327
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "$node"
    $P117 = $P115."new"($P116 :named("node"))
    store_lex "$ops", $P117
.annotate 'line', 1328
    get_hll_global $P115, ["POST"], "Ops"
    $P116 = $P115."new"()
    store_lex "$prepost", $P116
.annotate 'line', 1329
    get_hll_global $P115, ["POST"], "Ops"
    find_lex $P116, "self"
    $P117 = $P116."tempreg"("P")
    $P118 = $P115."new"($P117 :named("result"))
    store_lex "$testpost", $P118
.annotate 'line', 1331
    find_lex $P1534, "$node"
    unless_null $P1534, vivify_335
    $P1534 = root_new ['parrot';'ResizablePMCArray']
  vivify_335:
    set $P115, $P1534[0]
    unless_null $P115, vivify_336
    new $P115, "Undef"
  vivify_336:
    store_lex "$collpast", $P115
.annotate 'line', 1332
    find_lex $P1535, "$node"
    unless_null $P1535, vivify_337
    $P1535 = root_new ['parrot';'ResizablePMCArray']
  vivify_337:
    set $P115, $P1535[1]
    unless_null $P115, vivify_338
    new $P115, "Undef"
  vivify_338:
    store_lex "$bodypast", $P115
.annotate 'line', 1334
    find_lex $P115, "self"
    find_lex $P116, "$collpast"
    $P117 = $P115."as_post"($P116, "P" :named("rtype"))
    store_lex "$collpost", $P117
.annotate 'line', 1335
    find_lex $P115, "$ops"
    find_lex $P116, "$collpost"
    $P115."push"($P116)
.annotate 'line', 1338
    get_hll_global $P115, ["POST"], "Label"
    $P116 = $P115."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P116
.annotate 'line', 1339
    find_lex $P115, "self"
    $P116 = $P115."tempreg"("I")
    store_lex "$S0", $P116
.annotate 'line', 1340
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("defined", $P116, $P117)
.annotate 'line', 1341
    find_lex $P115, "$ops"
    find_lex $P116, "$S0"
    find_lex $P117, "$undeflabel"
    $P115."push_pirop"("unless", $P116, $P117)
.annotate 'line', 1343
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    find_lex $P117, "$collpost"
    $P115."push_pirop"("iter", $P116, $P117)
.annotate 'line', 1347
    new $P115, "Integer"
    assign $P115, 1
    store_lex "$arity", $P115
.annotate 'line', 1348
    find_lex $P115, "$node"
    $P116 = $P115."arity"()
    defined $I100, $P116
    if $I100, if_1536
.annotate 'line', 1351
    find_lex $P117, "$bodypast"
    $P118 = $P117."arity"()
    defined $I101, $P118
    unless $I101, if_1537_end
.annotate 'line', 1352
    find_lex $P119, "$bodypast"
    $P120 = $P119."arity"()
    store_lex "$arity", $P120
  if_1537_end:
.annotate 'line', 1351
    goto if_1536_end
  if_1536:
.annotate 'line', 1349
    find_lex $P117, "$node"
    $P118 = $P117."arity"()
    store_lex "$arity", $P118
  if_1536_end:
.annotate 'line', 1356
    new $P115, "ResizablePMCArray"
    store_lex "@arglist", $P115
.annotate 'line', 1357
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1543_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
    goto loop1543_redo
  loop1543_test:
    find_lex $P115, "$arity"
    set $N100, $P115
    isgt $I100, $N100, 0.0
    unless $I100, loop1543_done
  loop1543_redo:
    .const 'Sub' $P1539 = "65_1312756204.79645" 
    capture_lex $P1539
    $P1539()
  loop1543_next:
    goto loop1543_test
  loop1543_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1543_next
    eq $P118, .CONTROL_LOOP_REDO, loop1543_redo
  loop1543_done:
    pop_eh 
.annotate 'line', 1366
    find_lex $P115, "self"
    find_lex $P116, "$bodypast"
    find_lex $P117, "@arglist"
    $P118 = $P115."as_post"($P116, "v" :named("rtype"), $P117 :named("arglist"))
    store_lex "$bodypost", $P118
.annotate 'line', 1369
    find_lex $P115, "$ops"
    find_lex $P116, "self"
    find_lex $P117, "$testpost"
    find_lex $P118, "$prepost"
    find_lex $P119, "$bodypost"
    $P120 = $P116."loop_gen"($P117 :named("test"), $P118 :named("pre"), $P119 :named("body"))
    $P115."push"($P120)
.annotate 'line', 1371
    find_lex $P115, "$ops"
    find_lex $P116, "$undeflabel"
    $P115."push"($P116)
.annotate 'line', 1372
    find_lex $P115, "$ops"
    find_lex $P116, "$testpost"
    $P115."result"($P116)
.annotate 'line', 1326
    find_lex $P115, "$ops"
    .return ($P115)
  control_1518:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1538"  :anon :subid("65_1312756204.79645") :outer("64_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1358
    new $P116, "Undef"
    set $P1540, $P116
    .lex "$nextarg", $P1540
    find_lex $P117, "self"
    $P118 = $P117."tempreg"("P")
    store_lex "$nextarg", $P118
.annotate 'line', 1359
    find_lex $P117, "$prepost"
    find_lex $P118, "$nextarg"
    find_lex $P119, "$testpost"
    $P117."push_pirop"("shift", $P118, $P119)
.annotate 'line', 1360
    find_lex $P117, "$arity"
    set $N101, $P117
    islt $I101, $N101, 1.0
    unless $I101, if_1541_end
    die 0, .CONTROL_LOOP_LAST
  if_1541_end:
.annotate 'line', 1361
    find_lex $P117, "@arglist"
    find_lex $P118, "$nextarg"
    push $P117, $P118
.annotate 'line', 1357
    find_lex $P117, "$arity"
    clone $P1542, $P117
    dec $P117
    .return ($P1542)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("66_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1547
    .param pmc param_1548 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1382
    .const 'Sub' $P1556 = "67_1312756204.79645" 
    capture_lex $P1556
    new $P1546, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1546, control_1545
    push_eh $P1546
    .lex "self", self
    .lex "$node", param_1547
    .lex "%options", param_1548
.annotate 'line', 1384
    new $P105, "Undef"
    set $P1549, $P105
    .lex "$ops", $P1549
.annotate 'line', 1385
    $P1551 = root_new ['parrot';'ResizablePMCArray']
    set $P1550, $P1551
    .lex "@posargs", $P1550
.annotate 'line', 1393
    new $P106, "Undef"
    set $P1552, $P106
    .lex "$returns", $P1552
.annotate 'line', 1396
    new $P107, "Undef"
    set $P1553, $P107
    .lex "$listpost", $P1553
.annotate 'line', 1382
    find_lex $P108, "$ops"
    find_lex $P108, "@posargs"
.annotate 'line', 1386

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1393
    find_lex $P108, "$node"
    $P109 = $P108."returns"()
    store_lex "$returns", $P109
.annotate 'line', 1394
    find_lex $P108, "$returns"
    if $P108, unless_1554_end
    new $P109, "String"
    assign $P109, "ResizablePMCArray"
    store_lex "$returns", $P109
  unless_1554_end:
.annotate 'line', 1396
    find_lex $P108, "self"
    find_lex $P109, "$returns"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$listpost", $P110
.annotate 'line', 1397
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."result"($P109)
.annotate 'line', 1398
    find_lex $P108, "$ops"
    find_lex $P109, "$listpost"
    $P108."push"($P109)
.annotate 'line', 1399
    find_lex $P109, "@posargs"
    defined $I100, $P109
    unless $I100, for_undef_339
    iter $P108, $P109
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1558_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1558_test:
    unless $P108, loop1558_done
    shift $P110, $P108
  loop1558_redo:
    .const 'Sub' $P1556 = "67_1312756204.79645" 
    capture_lex $P1556
    $P1556($P110)
  loop1558_next:
    goto loop1558_test
  loop1558_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1558_next
    eq $P116, .CONTROL_LOOP_REDO, loop1558_redo
  loop1558_done:
    pop_eh 
  for_undef_339:
.annotate 'line', 1382
    find_lex $P108, "$ops"
    .return ($P108)
  control_1545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1555"  :anon :subid("67_1312756204.79645") :outer("66_1312756204.79645")
    .param pmc param_1557
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1399
    .lex "$_", param_1557
    find_lex $P111, "$ops"
    find_lex $P112, "$listpost"
    find_lex $P113, "$_"
    $P114 = $P111."push_pirop"("push", $P112, $P113)
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("68_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1562
    .param pmc param_1563 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1408
    new $P1561, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1561, control_1560
    push_eh $P1561
    .lex "self", self
    .lex "$node", param_1562
    .lex "%options", param_1563
.annotate 'line', 1409
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "%options"
    $P108 = $P105."node_as_post"($P106, $P107)
.annotate 'line', 1408
    .return ($P108)
  control_1560:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("69_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1567
    .param pmc param_1568 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1419
    new $P1566, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1566, control_1565
    push_eh $P1566
    .lex "self", self
    .lex "$node", param_1567
    .lex "%options", param_1568
.annotate 'line', 1420
    get_hll_global $P105, ["POST"], "Ops"
    find_lex $P106, "$node"
    $P107 = $P105."new"($P106 :named("node"))
.annotate 'line', 1419
    .return ($P107)
  control_1565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("70_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1572
    .param pmc param_1573 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1428
    .const 'Sub' $P1581 = "71_1312756204.79645" 
    capture_lex $P1581
    new $P1571, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1571, control_1570
    push_eh $P1571
    .lex "self", self
    .lex "$node", param_1572
    .lex "%options", param_1573
.annotate 'line', 1429
    new $P105, "Undef"
    set $P1574, $P105
    .lex "$ops", $P1574
.annotate 'line', 1431
    new $P106, "Undef"
    set $P1575, $P106
    .lex "$exreg", $P1575
.annotate 'line', 1432
    new $P107, "Undef"
    set $P1576, $P107
    .lex "$extype", $P1576
.annotate 'line', 1437
    new $P108, "Undef"
    set $P1577, $P108
    .lex "$cpast", $P1577
.annotate 'line', 1429
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1431
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$exreg", $P110
.annotate 'line', 1432
    find_lex $P109, "$exreg"
    concat $P110, $P109, "['type']"
    store_lex "$extype", $P110
.annotate 'line', 1433
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("new", $P110, "\"Exception\"")
.annotate 'line', 1434
    find_lex $P109, "$ops"
    find_lex $P110, "$extype"
    $P109."push_pirop"("set", $P110, ".CONTROL_RETURN")
.annotate 'line', 1435
    find_dynamic_lex $P109, "$*SUB"
    unless_null $P109, vivify_340
    get_hll_global $P109, "$SUB"
    unless_null $P109, vivify_341
    die "Contextual $*SUB not found"
  vivify_341:
  vivify_340:
    $P109."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1437
    find_lex $P1578, "$node"
    unless_null $P1578, vivify_342
    $P1578 = root_new ['parrot';'ResizablePMCArray']
  vivify_342:
    set $P109, $P1578[0]
    unless_null $P109, vivify_343
    new $P109, "Undef"
  vivify_343:
    store_lex "$cpast", $P109
.annotate 'line', 1438
    find_lex $P109, "$cpast"
    unless $P109, if_1579_end
    .const 'Sub' $P1581 = "71_1312756204.79645" 
    capture_lex $P1581
    $P1581()
  if_1579_end:
.annotate 'line', 1444
    find_lex $P109, "$ops"
    find_lex $P110, "$exreg"
    $P109."push_pirop"("throw", $P110)
.annotate 'line', 1428
    find_lex $P109, "$ops"
    .return ($P109)
  control_1570:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1580"  :anon :subid("71_1312756204.79645") :outer("70_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1439
    new $P110, "Undef"
    set $P1582, $P110
    .lex "$cpost", $P1582
    find_lex $P111, "self"
    find_lex $P112, "$cpast"
    $P113 = $P111."as_post"($P112, "P" :named("rtype"))
    store_lex "$cpost", $P113
.annotate 'line', 1440
    find_lex $P111, "self"
    find_lex $P112, "$cpost"
    $P113 = $P111."coerce"($P112, "P")
    store_lex "$cpost", $P113
.annotate 'line', 1441
    find_lex $P111, "$ops"
    find_lex $P112, "$cpost"
    $P111."push"($P112)
.annotate 'line', 1442
    find_lex $P111, "$ops"
    find_lex $P112, "$exreg"
    find_lex $P113, "$cpost"
    $P114 = $P111."push_pirop"("setattribute", $P112, "'payload'", $P113)
.annotate 'line', 1438
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("72_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1586
    .param pmc param_1587 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1456
    new $P1585, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1585, control_1584
    push_eh $P1585
    .lex "self", self
    .lex "$node", param_1586
    .lex "%options", param_1587
.annotate 'line', 1457
    new $P105, "Undef"
    set $P1588, $P105
    .lex "$ops", $P1588
.annotate 'line', 1459
    new $P106, "Undef"
    set $P1589, $P106
    .lex "$S0", $P1589
.annotate 'line', 1460
    new $P107, "Undef"
    set $P1590, $P107
    .lex "$catchlabel", $P1590
.annotate 'line', 1461
    new $P108, "Undef"
    set $P1591, $P108
    .lex "$endlabel", $P1591
.annotate 'line', 1463
    new $P109, "Undef"
    set $P1592, $P109
    .lex "$rtype", $P1592
.annotate 'line', 1465
    new $P110, "Undef"
    set $P1593, $P110
    .lex "$trypost", $P1593
.annotate 'line', 1469
    new $P111, "Undef"
    set $P1594, $P111
    .lex "$elsepast", $P1594
.annotate 'line', 1475
    new $P112, "Undef"
    set $P1595, $P112
    .lex "$catchpast", $P1595
.annotate 'line', 1457
    get_hll_global $P113, ["POST"], "Ops"
    find_lex $P114, "$node"
    $P115 = $P113."new"($P114 :named("node"))
    store_lex "$ops", $P115
.annotate 'line', 1459
    find_lex $P113, "self"
    $P114 = $P113."unique"("catch_")
    store_lex "$S0", $P114
.annotate 'line', 1460
    get_hll_global $P113, ["POST"], "Label"
    find_lex $P114, "$S0"
    $P115 = $P113."new"($P114 :named("result"))
    store_lex "$catchlabel", $P115
.annotate 'line', 1461
    get_hll_global $P113, ["POST"], "Lable"
    find_lex $P114, "$S0"
    concat $P115, $P114, "_end"
    $P116 = $P113."new"($P115 :named("result"))
    store_lex "$endlabel", $P116
.annotate 'line', 1463
    find_lex $P1596, "%options"
    unless_null $P1596, vivify_344
    $P1596 = root_new ['parrot';'Hash']
  vivify_344:
    set $P113, $P1596["rtype"]
    unless_null $P113, vivify_345
    new $P113, "Undef"
  vivify_345:
    store_lex "$rtype", $P113
.annotate 'line', 1465
    find_lex $P113, "self"
    find_lex $P1597, "$node"
    unless_null $P1597, vivify_346
    $P1597 = root_new ['parrot';'ResizablePMCArray']
  vivify_346:
    set $P114, $P1597[0]
    unless_null $P114, vivify_347
    new $P114, "Undef"
  vivify_347:
    find_lex $P115, "$rtype"
    $P116 = $P113."as_post"($P114, $P115 :named("rtype"))
    store_lex "$trypost", $P116
.annotate 'line', 1466
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push_pirop"("push_eh", $P114)
.annotate 'line', 1467
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."push"($P114)
.annotate 'line', 1468
    find_lex $P113, "$ops"
    $P113."push_pirop"("pop_eh")
.annotate 'line', 1469
    find_lex $P1598, "$node"
    unless_null $P1598, vivify_348
    $P1598 = root_new ['parrot';'ResizablePMCArray']
  vivify_348:
    set $P113, $P1598[2]
    unless_null $P113, vivify_349
    new $P113, "Undef"
  vivify_349:
    store_lex "$elsepast", $P113
.annotate 'line', 1470
    find_lex $P113, "$elsepast"
    unless $P113, if_1599_end
.annotate 'line', 1471
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$elsepast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
  if_1599_end:
.annotate 'line', 1473
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push_pirop"("goto", $P114)
.annotate 'line', 1474
    find_lex $P113, "$ops"
    find_lex $P114, "$catchlabel"
    $P113."push"($P114)
.annotate 'line', 1475
    find_lex $P1600, "$node"
    unless_null $P1600, vivify_350
    $P1600 = root_new ['parrot';'ResizablePMCArray']
  vivify_350:
    set $P113, $P1600[1]
    unless_null $P113, vivify_351
    new $P113, "Undef"
  vivify_351:
    store_lex "$catchpast", $P113
.annotate 'line', 1476
    find_lex $P113, "$catchpast"
    unless $P113, if_1601_end
.annotate 'line', 1477
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    find_lex $P116, "$catchpast"
    $P117 = $P115."as_post"($P116, "v" :named("rtype"))
    $P114."push"($P117)
.annotate 'line', 1478
    find_lex $P114, "$ops"
    $P114."push_pirop"("pop_eh")
  if_1601_end:
.annotate 'line', 1480
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P113."push"($P114)
.annotate 'line', 1481
    find_lex $P113, "$ops"
    find_lex $P114, "$trypost"
    $P113."result"($P114)
.annotate 'line', 1456
    find_lex $P113, "$ops"
    .return ($P113)
  control_1584:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("73_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1605
    .param pmc param_1606 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1494
    .const 'Sub' $P1621 = "75_1312756204.79645" 
    capture_lex $P1621
    .const 'Sub' $P1614 = "74_1312756204.79645" 
    capture_lex $P1614
    new $P1604, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1604, control_1603
    push_eh $P1604
    .lex "self", self
    .lex "$node", param_1605
    .lex "%options", param_1606
.annotate 'line', 1496
    $P1608 = root_new ['parrot';'ResizablePMCArray']
    set $P1607, $P1608
    .lex "@clist", $P1607
.annotate 'line', 1497
    new $P105, "Undef"
    set $P1609, $P105
    .lex "$cpast", $P1609
.annotate 'line', 1505
    new $P106, "Undef"
    set $P1610, $P106
    .lex "$ops", $P1610
.annotate 'line', 1507
    new $P107, "Undef"
    set $P1611, $P107
    .lex "$endlabel", $P1611
.annotate 'line', 1510
    new $P108, "Undef"
    set $P1612, $P108
    .lex "$apost", $P1612
.annotate 'line', 1496
    new $P109, "ResizablePMCArray"
    store_lex "@clist", $P109
.annotate 'line', 1497
    find_lex $P109, "$node"
    store_lex "$cpast", $P109
.annotate 'line', 1498
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1618_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1618_test:
    find_lex $P109, "$cpast"
    get_hll_global $P110, ["PAST"], "Op"
    $P111 = $P109."isa"($P110)
    unless $P111, loop1618_done
  loop1618_redo:
    .const 'Sub' $P1614 = "74_1312756204.79645" 
    capture_lex $P1614
    $P1614()
  loop1618_next:
    goto loop1618_test
  loop1618_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1618_next
    eq $P115, .CONTROL_LOOP_REDO, loop1618_redo
  loop1618_done:
    pop_eh 
.annotate 'line', 1505
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1506
    find_lex $P109, "$ops"
    find_lex $P110, "self"
    $P111 = $P110."unique"("$P")
    $P109."result"($P111)
.annotate 'line', 1507
    get_hll_global $P109, ["POST"], "Label"
    $P110 = $P109("chain_end_" :named("name"))
    store_lex "$endlabel", $P110
.annotate 'line', 1509
    find_lex $P109, "@clist"
    pop $P110, $P109
    store_lex "$cpast", $P110
.annotate 'line', 1510
    find_lex $P109, "self"
    find_lex $P1619, "$cpast"
    unless_null $P1619, vivify_354
    $P1619 = root_new ['parrot';'ResizablePMCArray']
  vivify_354:
    set $P110, $P1619[0]
    unless_null $P110, vivify_355
    new $P110, "Undef"
  vivify_355:
    $P111 = $P109."as_post"($P110, "P" :named("rtype"))
    store_lex "$apost", $P111
.annotate 'line', 1511
    find_lex $P109, "$ops"
    find_lex $P110, "$apost"
    $P109."push"($P110)
.annotate 'line', 1513
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1626_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1626_test:
    new $P109, "Integer"
    assign $P109, 1
    unless $P109, loop1626_done
  loop1626_redo:
    .const 'Sub' $P1621 = "75_1312756204.79645" 
    capture_lex $P1621
    $P1621()
  loop1626_next:
    goto loop1626_test
  loop1626_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1626_next
    eq $P114, .CONTROL_LOOP_REDO, loop1626_redo
  loop1626_done:
    pop_eh 
.annotate 'line', 1523
    find_lex $P109, "$ops"
    find_lex $P110, "$endlabel"
    $P109."push"($P110)
.annotate 'line', 1494
    find_lex $P109, "$ops"
    .return ($P109)
  control_1603:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1613"  :anon :subid("74_1312756204.79645") :outer("73_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1499
    new $P112, "Undef"
    set $P1615, $P112
    .lex "$pasttype", $P1615
    find_lex $P113, "$cpast"
    $P114 = $P113."pasttype"()
    store_lex "$pasttype", $P114
.annotate 'line', 1500
    find_lex $P113, "$pasttype"
    set $S100, $P113
    isne $I100, $S100, "chain"
    unless $I100, if_1616_end
    die 0, .CONTROL_LOOP_LAST
  if_1616_end:
.annotate 'line', 1501
    find_lex $P113, "@clist"
    find_lex $P114, "$cpast"
    push $P113, $P114
.annotate 'line', 1502
    find_lex $P1617, "$cpast"
    unless_null $P1617, vivify_352
    $P1617 = root_new ['parrot';'ResizablePMCArray']
  vivify_352:
    set $P113, $P1617[0]
    unless_null $P113, vivify_353
    new $P113, "Undef"
  vivify_353:
    store_lex "$cpast", $P113
.annotate 'line', 1498
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1620"  :anon :subid("75_1312756204.79645") :outer("73_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1514
    new $P110, "Undef"
    set $P1622, $P110
    .lex "$bpost", $P1622
.annotate 'line', 1516
    new $P111, "Undef"
    set $P1623, $P111
    .lex "$name", $P1623
.annotate 'line', 1514
    find_lex $P112, "self"
    find_lex $P1624, "$cpast"
    unless_null $P1624, vivify_356
    $P1624 = root_new ['parrot';'ResizablePMCArray']
  vivify_356:
    set $P113, $P1624[1]
    unless_null $P113, vivify_357
    new $P113, "Undef"
  vivify_357:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$bpost", $P114
.annotate 'line', 1515
    find_lex $P112, "$ops"
    find_lex $P113, "$bpost"
    $P112."push"($P113)
.annotate 'line', 1516
    find_lex $P112, "self"
    find_lex $P113, "$cpast"
    $P114 = $P113."name"()
    $P115 = $P112."escape"($P114)
    store_lex "$name", $P115
.annotate 'line', 1517
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$apost"
    find_lex $P115, "$bpost"
    find_lex $P116, "$ops"
    $P112."push_pirop"("call", $P113, $P114, $P115, $P116 :named("result"))
.annotate 'line', 1518
    find_lex $P112, "@clist"
    if $P112, unless_1625_end
    die 0, .CONTROL_LOOP_LAST
  unless_1625_end:
.annotate 'line', 1519
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$endlabel"
    $P112."push_pirop"("unless", $P113, $P114)
.annotate 'line', 1520
    find_lex $P112, "@clist"
    pop $P113, $P112
    store_lex "$cpast", $P113
.annotate 'line', 1521
    find_lex $P112, "$bpost"
    store_lex "$apost", $P112
.annotate 'line', 1513
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("76_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1630
    .param pmc param_1631 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1534
    new $P1629, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1629, control_1628
    push_eh $P1629
    .lex "self", self
    .lex "$node", param_1630
    .lex "%options", param_1631
.annotate 'line', 1535
    new $P105, "Undef"
    set $P1632, $P105
    .lex "$ops", $P1632
.annotate 'line', 1537
    new $P106, "Undef"
    set $P1633, $P106
    .lex "$lpost", $P1633
.annotate 'line', 1541
    new $P107, "Undef"
    set $P1634, $P107
    .lex "$endlabel", $P1634
.annotate 'line', 1543
    new $P108, "Undef"
    set $P1635, $P108
    .lex "$reg", $P1635
.annotate 'line', 1546
    new $P109, "Undef"
    set $P1636, $P109
    .lex "$rpost", $P1636
.annotate 'line', 1535
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    $P114 = $P110."new"($P111 :named("node"), $P113 :named("result"))
    store_lex "$ops", $P114
.annotate 'line', 1537
    find_lex $P110, "self"
    find_lex $P1637, "$node"
    unless_null $P1637, vivify_358
    $P1637 = root_new ['parrot';'ResizablePMCArray']
  vivify_358:
    set $P111, $P1637[0]
    unless_null $P111, vivify_359
    new $P111, "Undef"
  vivify_359:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$lpost", $P112
.annotate 'line', 1538
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1539
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$lpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1541
    get_hll_global $P110, ["POST"], "Label"
    find_lex $P111, "self"
    $P112 = $P111."unique"("default_")
    $P113 = $P110."new"($P112 :named("result"))
    store_lex "$endlabel", $P113
.annotate 'line', 1543
    find_lex $P110, "self"
    $P111 = $P110."unique"("$I")
    store_lex "$reg", $P111
.annotate 'line', 1544
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$ops"
    $P110."push_pirop"("defined", $P111, $P112)
.annotate 'line', 1545
    find_lex $P110, "$ops"
    find_lex $P111, "$reg"
    find_lex $P112, "$endlabel"
    $P110."push_pirop"("if", $P111, $P112)
.annotate 'line', 1546
    find_lex $P110, "self"
    find_lex $P1638, "$node"
    unless_null $P1638, vivify_360
    $P1638 = root_new ['parrot';'ResizablePMCArray']
  vivify_360:
    set $P111, $P1638[1]
    unless_null $P111, vivify_361
    new $P111, "Undef"
  vivify_361:
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1547
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1548
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$rpost"
    $P110."push_pirop"("set", $P111, $P112)
.annotate 'line', 1549
    find_lex $P110, "$ops"
    find_lex $P111, "$endlabel"
    $P110."push"($P111)
.annotate 'line', 1534
    find_lex $P110, "$ops"
    .return ($P110)
  control_1628:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("77_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1642
    .param pmc param_1643 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1560
    .const 'Sub' $P1654 = "78_1312756204.79645" 
    capture_lex $P1654
    new $P1641, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1641, control_1640
    push_eh $P1641
    .lex "self", self
    .lex "$node", param_1642
    .lex "%options", param_1643
.annotate 'line', 1561
    new $P105, "Undef"
    set $P1644, $P105
    .lex "$ops", $P1644
.annotate 'line', 1564
    new $P106, "Undef"
    set $P1645, $P106
    .lex "$falselabel", $P1645
.annotate 'line', 1565
    new $P107, "Undef"
    set $P1646, $P107
    .lex "$endlabel", $P1646
.annotate 'line', 1567
    new $P108, "Undef"
    set $P1647, $P108
    .lex "$i", $P1647
.annotate 'line', 1568
    new $P109, "Undef"
    set $P1648, $P109
    .lex "$t", $P1648
.annotate 'line', 1569
    new $P110, "Undef"
    set $P1649, $P110
    .lex "$u", $P1649
.annotate 'line', 1570
    new $P111, "Undef"
    set $P1650, $P111
    .lex "$iter", $P1650
.annotate 'line', 1571
    new $P112, "Undef"
    set $P1651, $P112
    .lex "$apost", $P1651
.annotate 'line', 1572
    new $P113, "Undef"
    set $P1652, $P113
    .lex "$bpost", $P1652
.annotate 'line', 1561
    get_hll_global $P114, ["POST"], "Ops"
    find_lex $P115, "$node"
    $P116 = $P114."new"($P115 :named("node"))
    store_lex "$ops", $P116
.annotate 'line', 1562
    find_lex $P114, "$ops"
    find_lex $P115, "self"
    $P116 = $P115."unique"("$P")
    $P114."result"($P116)
.annotate 'line', 1564
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P115
.annotate 'line', 1565
    get_hll_global $P114, ["POST"], "Label"
    $P115 = $P114."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P115
.annotate 'line', 1567
    find_lex $P114, "self"
    $P115 = $P114."unique"("$I")
    store_lex "$i", $P115
.annotate 'line', 1568
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$t", $P115
.annotate 'line', 1569
    find_lex $P114, "self"
    $P115 = $P114."unique"("$i")
    store_lex "$u", $P115
.annotate 'line', 1570
    get_hll_global $P114, "node"
    $P115 = $P114."iterator"()
    store_lex "$iter", $P115
.annotate 'line', 1571
    find_lex $P114, "self"
    find_lex $P115, "$iter"
    shift $P116, $P115
    $P117 = $P114."as_post"($P116, "P" :named("rtype"))
    store_lex "$apost", $P117
.annotate 'line', 1560
    find_lex $P114, "$bpost"
.annotate 'line', 1573
    find_lex $P114, "$ops"
    find_lex $P115, "$apost"
    $P114."push"($P115)
.annotate 'line', 1574
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$apost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1575
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$apost"
    $P114."push_pirop"("istrue", $P115, $P116)
.annotate 'line', 1576
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1657_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1657_test:
    new $P114, "Integer"
    assign $P114, 1
    unless $P114, loop1657_done
  loop1657_redo:
    .const 'Sub' $P1654 = "78_1312756204.79645" 
    capture_lex $P1654
    $P1654()
  loop1657_next:
    goto loop1657_test
  loop1657_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1657_next
    eq $P117, .CONTROL_LOOP_REDO, loop1657_redo
  loop1657_done:
    pop_eh 
.annotate 'line', 1589
    find_lex $P114, "$ops"
    find_lex $P115, "$t"
    find_lex $P116, "$endlabel"
    $P114."push_pirop"("if", $P115, $P116)
.annotate 'line', 1590
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    find_lex $P116, "$bpost"
    $P114."push_pirop"("set", $P115, $P116)
.annotate 'line', 1591
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push_pirop"("goto", $P115)
.annotate 'line', 1592
    find_lex $P114, "$ops"
    find_lex $P115, "$falselabel"
    $P114."push"($P115)
.annotate 'line', 1593
    find_lex $P114, "$ops"
    find_lex $P115, "$ops"
    $P114."push_pirop"("new", $P115, "\"Undef\"")
.annotate 'line', 1594
    find_lex $P114, "$ops"
    find_lex $P115, "$endlabel"
    $P114."push"($P115)
.annotate 'line', 1560
    find_lex $P114, "$ops"
    .return ($P114)
  control_1640:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1653"  :anon :subid("78_1312756204.79645") :outer("77_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1583
    new $P115, "Undef"
    set $P1655, $P115
    .lex "$truelabel", $P1655
.annotate 'line', 1577
    find_lex $P116, "self"
    find_lex $P117, "$iter"
    shift $P118, $P117
    $P119 = $P116."as_post"($P118, "P" :named("rtype"))
    store_lex "$bpost", $P119
.annotate 'line', 1578
    find_lex $P116, "$ops"
    find_lex $P117, "$bpost"
    $P116."push"($P117)
.annotate 'line', 1579
    find_lex $P116, "$ops"
    find_lex $P117, "$u"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("istrue", $P117, $P118)
.annotate 'line', 1580
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$t"
    find_lex $P119, "$u"
    $P116."push_pirop"("and", $P117, $P118, $P119)
.annotate 'line', 1581
    find_lex $P116, "$ops"
    find_lex $P117, "$i"
    find_lex $P118, "$falselabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1582
    find_lex $P116, "$iter"
    if $P116, unless_1656_end
    die 0, .CONTROL_LOOP_LAST
  unless_1656_end:
.annotate 'line', 1583
    get_hll_global $P116, ["POST"], "Label"
    $P117 = $P116."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P117
.annotate 'line', 1584
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$truelabel"
    $P116."push_pirop"("if", $P117, $P118)
.annotate 'line', 1585
    find_lex $P116, "$ops"
    find_lex $P117, "$ops"
    find_lex $P118, "$bpost"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1586
    find_lex $P116, "$ops"
    find_lex $P117, "$t"
    find_lex $P118, "$u"
    $P116."push_pirop"("set", $P117, $P118)
.annotate 'line', 1587
    find_lex $P116, "$ops"
    find_lex $P117, "$truelabel"
    $P118 = $P116."push"($P117)
.annotate 'line', 1576
    .return ($P118)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("79_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1661
    .param pmc param_1662 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1603
    new $P1660, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1660, control_1659
    push_eh $P1660
    .lex "self", self
    .lex "$node", param_1661
    .lex "%options", param_1662
.annotate 'line', 1604
    new $P105, "Undef"
    set $P1663, $P105
    .lex "$lpast", $P1663
.annotate 'line', 1605
    new $P106, "Undef"
    set $P1664, $P106
    .lex "$rpast", $P1664
.annotate 'line', 1607
    new $P107, "Undef"
    set $P1665, $P107
    .lex "$ops", $P1665
.annotate 'line', 1608
    new $P108, "Undef"
    set $P1666, $P108
    .lex "$rpost", $P1666
.annotate 'line', 1613
    new $P109, "Undef"
    set $P1667, $P109
    .lex "$lpost", $P1667
.annotate 'line', 1604
    find_lex $P1668, "$node"
    unless_null $P1668, vivify_362
    $P1668 = root_new ['parrot';'ResizablePMCArray']
  vivify_362:
    set $P110, $P1668[0]
    unless_null $P110, vivify_363
    new $P110, "Undef"
  vivify_363:
    store_lex "$lpast", $P110
.annotate 'line', 1605
    find_lex $P1669, "$node"
    unless_null $P1669, vivify_364
    $P1669 = root_new ['parrot';'ResizablePMCArray']
  vivify_364:
    set $P110, $P1669[1]
    unless_null $P110, vivify_365
    new $P110, "Undef"
  vivify_365:
    store_lex "$rpast", $P110
.annotate 'line', 1607
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1608
    find_lex $P110, "self"
    find_lex $P111, "$rpast"
    $P112 = $P110."as_post"($P111, "P" :named("rtype"))
    store_lex "$rpost", $P112
.annotate 'line', 1609
    find_lex $P110, "self"
    find_lex $P111, "$rpost"
    $P112 = $P110."coerce"($P111, "P")
    store_lex "$rpost", $P112
.annotate 'line', 1610
    find_lex $P110, "$ops"
    find_lex $P111, "$rpost"
    $P110."push"($P111)
.annotate 'line', 1612
    find_lex $P110, "$lpast"
    $P110."lvalue"(1)
.annotate 'line', 1613
    find_lex $P110, "self"
    find_lex $P111, "$lpast"
    find_lex $P112, "$rpost"
    $P113 = $P110."as_post"($P111, $P112 :named("bindpost"))
    store_lex "$lpost", $P113
.annotate 'line', 1614
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."push"($P111)
.annotate 'line', 1615
    find_lex $P110, "$ops"
    find_lex $P111, "$lpost"
    $P110."result"($P111)
.annotate 'line', 1603
    find_lex $P110, "$ops"
    .return ($P110)
  control_1659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("80_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1673
    .param pmc param_1674 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1623
    new $P1672, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1672, control_1671
    push_eh $P1672
    .lex "self", self
    .lex "$node", param_1673
    .lex "%options", param_1674
.annotate 'line', 1624
    new $P105, "Undef"
    set $P1675, $P105
    .lex "$rpost", $P1675
.annotate 'line', 1625
    new $P106, "Undef"
    set $P1676, $P106
    .lex "$lpost", $P1676
.annotate 'line', 1626
    new $P107, "Undef"
    set $P1677, $P107
    .lex "$ops", $P1677
.annotate 'line', 1624
    find_lex $P108, "self"
    find_lex $P1678, "$node"
    unless_null $P1678, vivify_366
    $P1678 = root_new ['parrot';'ResizablePMCArray']
  vivify_366:
    set $P109, $P1678[1]
    unless_null $P109, vivify_367
    new $P109, "Undef"
  vivify_367:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$rpost", $P110
.annotate 'line', 1625
    find_lex $P108, "self"
    find_lex $P1679, "$node"
    unless_null $P1679, vivify_368
    $P1679 = root_new ['parrot';'ResizablePMCArray']
  vivify_368:
    set $P109, $P1679[0]
    unless_null $P109, vivify_369
    new $P109, "Undef"
  vivify_369:
    $P110 = $P108."as_post"($P109, "P" :named("rtype"))
    store_lex "$lpost", $P110
.annotate 'line', 1626
    get_hll_global $P108, ["POST"], "Ops"
    find_lex $P109, "$rpost"
    find_lex $P110, "$lpost"
    find_lex $P111, "$node"
    find_lex $P112, "$lpost"
    $P113 = $P108."new"($P109, $P110, $P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1628
    find_lex $P108, "$ops"
    find_lex $P109, "$lpost"
    find_lex $P110, "$rpost"
    $P108."push_pirop"("copy", $P109, $P110)
.annotate 'line', 1623
    find_lex $P108, "$ops"
    .return ($P108)
  control_1671:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("81_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Op"])
    .param pmc param_1683
    .param pmc param_1684 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1637
    new $P1682, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1682, control_1681
    push_eh $P1682
    .lex "self", self
    .lex "$node", param_1683
    .lex "%options", param_1684
.annotate 'line', 1642
    new $P105, "Undef"
    set $P1685, $P105
    .lex "$ops", $P1685
.annotate 'line', 1643
    new $P106, "Undef"
    set $P1686, $P106
    .lex "$inline", $P1686
.annotate 'line', 1646
    new $P107, "Undef"
    set $P1687, $P107
    .lex "$result", $P1687
.annotate 'line', 1647
    new $P108, "Undef"
    set $P1688, $P108
    .lex "$i", $P1688
.annotate 'line', 1660
    $P1690 = root_new ['parrot';'ResizablePMCArray']
    set $P1689, $P1690
    .lex "@arglist", $P1689
.annotate 'line', 1662
    new $P109, "Undef"
    set $P1691, $P109
    .lex "$s", $P1691
.annotate 'line', 1642
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P110."post_children"($P111, "vP" :named("signature"))
    store_lex "$ops", $P112
.annotate 'line', 1643
    find_lex $P110, "$node"
    $P111 = $P110."inline"()
    store_lex "$inline", $P111
.annotate 'line', 1644
    find_lex $P110, "$inline"
    does $I100, $P110, "array"
    unless $I100, if_1692_end
    find_lex $P111, "$inline"
    join $S100, "\n", $P111
    new $P112, 'String'
    set $P112, $S100
    store_lex "$inline", $P112
  if_1692_end:
.annotate 'line', 1646
    new $P110, "String"
    assign $P110, ""
    store_lex "$result", $P110
.annotate 'line', 1647
    find_lex $P110, "$inline"
    set $S100, $P110
    index $I100, $S100, "%t"
    new $P111, 'Integer'
    set $P111, $I100
    store_lex "$i", $P111
.annotate 'line', 1648
    find_lex $P110, "$i"
    set $N100, $P110
    isge $I100, $N100, 0.0
    if $I100, if_1693
.annotate 'line', 1654
    find_lex $P111, "$inline"
    set $S100, $P111
    index $I101, $S100, "%r"
    new $P112, 'Integer'
    set $P112, $I101
    store_lex "$i", $P112
.annotate 'line', 1655
    find_lex $P111, "$i"
    set $N101, $P111
    isge $I101, $N101, 0.0
    unless $I101, if_1694_end
.annotate 'line', 1656
    find_lex $P112, "self"
    $P113 = $P112."unique"("$P")
    store_lex "$result", $P113
.annotate 'line', 1657
    find_lex $P112, "$ops"
    find_lex $P113, "$result"
    $P112."result"($P113)
  if_1694_end:
.annotate 'line', 1653
    goto if_1693_end
  if_1693:
.annotate 'line', 1649
    find_lex $P111, "self"
    $P112 = $P111."unique"("$P")
    store_lex "$result", $P112
.annotate 'line', 1650
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."push_pirop"("new", $P112, "'Undef'")
.annotate 'line', 1651
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
  if_1693_end:
.annotate 'line', 1660
    find_lex $P110, "$ops"
    $P111 = $P110."list"()
    store_lex "@arglist", $P111
.annotate 'line', 1661
    find_lex $P110, "$ops"
    find_lex $P111, "@arglist"
    find_lex $P112, "$inline"
    find_lex $P113, "$result"
    $P110."push_pirop"("inline", $P111 :flat, $P112 :named("inline"), $P113 :named("result"))
.annotate 'line', 1662
    find_lex $P1695, "%options"
    unless_null $P1695, vivify_370
    $P1695 = root_new ['parrot';'Hash']
  vivify_370:
    set $P110, $P1695["rtype"]
    unless_null $P110, vivify_371
    new $P110, "Undef"
  vivify_371:
    store_lex "$s", $P110
.annotate 'line', 1637
    find_lex $P110, "$ops"
    .return ($P110)
  control_1681:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("82_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"])
    .param pmc param_1699
    .param pmc param_1700 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1674
    .const 'Sub' $P1740 = "86_1312756204.79645" 
    capture_lex $P1740
    .const 'Sub' $P1729 = "85_1312756204.79645" 
    capture_lex $P1729
    .const 'Sub' $P1705 = "83_1312756204.79645" 
    capture_lex $P1705
    new $P1698, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1698, control_1697
    push_eh $P1698
    .lex "self", self
    .lex "$node", param_1699
    .lex "%options", param_1700
.annotate 'line', 1676
    new $P105, "Undef"
    set $P1701, $P105
    .lex "$bindpost", $P1701
.annotate 'line', 1680
    new $P106, "Undef"
    set $P1702, $P106
    .lex "$scope", $P1702
.annotate 'line', 1681
    new $P107, "Undef"
    set $P1703, $P107
    .lex "$name", $P1703
.annotate 'line', 1700
    .const 'Sub' $P1705 = "83_1312756204.79645" 
    newclosure $P1724, $P1705
    set $P1704, $P1724
    .lex "scope_error", $P1704
.annotate 'line', 1676
    find_lex $P1725, "%options"
    unless_null $P1725, vivify_379
    $P1725 = root_new ['parrot';'Hash']
  vivify_379:
    set $P114, $P1725["bindpost"]
    unless_null $P114, vivify_380
    new $P114, "Undef"
  vivify_380:
    store_lex "$bindpost", $P114
.annotate 'line', 1677
    find_lex $P114, "$bindpost"
    if $P114, unless_1726_end
    new $P115, "Undef"
    store_lex "$bindpost", $P115
  unless_1726_end:
.annotate 'line', 1680
    find_lex $P114, "$node"
    $P115 = $P114."scope"()
    store_lex "$scope", $P115
.annotate 'line', 1681
    find_lex $P114, "$node"
    $P115 = $P114."name"()
    store_lex "$name", $P115
.annotate 'line', 1682
    find_lex $P114, "$scope"
    if $P114, unless_1727_end
    .const 'Sub' $P1729 = "85_1312756204.79645" 
    capture_lex $P1729
    $P1729()
  unless_1727_end:
.annotate 'line', 1695
    .const 'Sub' $P1740 = "86_1312756204.79645" 
    capture_lex $P1740
    $P1740()
.annotate 'line', 1674
    find_lex $P114, "scope_error"
    .return ($P114)
  control_1697:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("83_1312756204.79645") :outer("82_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1700
    .const 'Sub' $P1715 = "84_1312756204.79645" 
    capture_lex $P1715
    new $P1707, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1707, control_1706
    push_eh $P1707
.annotate 'line', 1702
    new $P108, "Undef"
    set $P1708, $P108
    .lex "$blockname", $P1708
.annotate 'line', 1709
    new $P109, "Undef"
    set $P1709, $P109
    .lex "$sourceline", $P1709
.annotate 'line', 1710
    new $P110, "Undef"
    set $P1710, $P110
    .lex "$source", $P1710
.annotate 'line', 1711
    new $P111, "Undef"
    set $P1711, $P111
    .lex "$pos", $P1711
.annotate 'line', 1712
    new $P112, "Undef"
    set $P1712, $P112
    .lex "$files", $P1712
.annotate 'line', 1701
    find_lex $P113, "$scope"
    unless $P113, if_1713_end
    new $P114, 'String'
    set $P114, " in '"
    find_lex $P115, "$scope"
    concat $P116, $P114, $P115
    concat $P117, $P116, "' scope"
    store_lex "$scope", $P117
  if_1713_end:
.annotate 'line', 1702
    new $P113, "String"
    assign $P113, ""
    store_lex "$blockname", $P113
.annotate 'line', 1703
    find_dynamic_lex $P114, "@*BLOCKPAST"
    unless_null $P114, vivify_372
    get_hll_global $P114, "@BLOCKPAST"
    unless_null $P114, vivify_373
    die "Contextual @*BLOCKPAST not found"
  vivify_373:
  vivify_372:
    defined $I100, $P114
    unless $I100, for_undef_374
    iter $P113, $P114
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1718_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1718_test:
    unless $P113, loop1718_done
    shift $P115, $P113
  loop1718_redo:
    .const 'Sub' $P1715 = "84_1312756204.79645" 
    capture_lex $P1715
    $P1715($P115)
  loop1718_next:
    goto loop1718_test
  loop1718_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1718_next
    eq $P118, .CONTROL_LOOP_REDO, loop1718_redo
  loop1718_done:
    pop_eh 
  for_undef_374:
.annotate 'line', 1707
    find_lex $P113, "$blockname"
    if $P113, unless_1719_end
    new $P114, "String"
    assign $P114, "<anonymous>"
    store_lex "$blockname", $P114
  unless_1719_end:
.annotate 'line', 1709
    new $P113, "String"
    assign $P113, ""
    store_lex "$sourceline", $P113
.annotate 'line', 1710
    find_lex $P1720, "$node"
    unless_null $P1720, vivify_375
    $P1720 = root_new ['parrot';'Hash']
  vivify_375:
    set $P113, $P1720["source"]
    unless_null $P113, vivify_376
    new $P113, "Undef"
  vivify_376:
    store_lex "$source", $P113
.annotate 'line', 1711
    find_lex $P1721, "$node"
    unless_null $P1721, vivify_377
    $P1721 = root_new ['parrot';'Hash']
  vivify_377:
    set $P113, $P1721["pos"]
    unless_null $P113, vivify_378
    new $P113, "Undef"
  vivify_378:
    store_lex "$pos", $P113
.annotate 'line', 1712
    find_caller_lex $P113, "$?FILES"
    store_lex "$files", $P113
.annotate 'line', 1713
    find_lex $P114, "$source"
    if $P114, if_1723
    set $P113, $P114
    goto if_1723_end
  if_1723:
    find_lex $P115, "$files"
    set $P113, $P115
  if_1723_end:
    if $P113, unless_1722_end
.annotate 'line', 1714
    new $P116, "String"
    assign $P116, " ("
    find_lex $P117, "$files"
    concat $P118, $P116, $P117
    concat $P119, $P118, ":"
.annotate 'line', 1715
    find_lex $P120, "self"
    find_lex $P121, "$source"
    find_lex $P122, "$pos"
    $P123 = $P120."lineof"($P121, $P122)
    add $P124, $P123, 1
    concat $P125, $P119, $P124
.annotate 'line', 1714
    concat $P126, $P125, ")"
.annotate 'line', 1715
    store_lex "$sourceline", $P126
  unless_1722_end:
.annotate 'line', 1717
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
.annotate 'line', 1700
    .return ($P121)
  control_1706:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1714"  :anon :subid("84_1312756204.79645") :outer("83_1312756204.79645")
    .param pmc param_1716
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1703
    .lex "$_", param_1716
.annotate 'line', 1704
    find_lex $P116, "$_"
    $P117 = $P116."name"()
    store_lex "$blockname", $P117
.annotate 'line', 1705
    find_lex $P117, "$blockname"
    if $P117, if_1717
    set $P116, $P117
    goto if_1717_end
  if_1717:
    die 0, .CONTROL_LOOP_LAST
  if_1717_end:
.annotate 'line', 1703
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1728"  :anon :subid("85_1312756204.79645") :outer("82_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1684
    new $P115, "Undef"
    set $P1730, $P115
    .lex "$P0", $P1730
    find_lex $P116, "$name"
    find_lex $P117, "self"
    getattribute $P1731, $P117, "%!symtable"
    unless_null $P1731, vivify_381
    $P1731 = root_new ['parrot';'Hash']
  vivify_381:
    set $P118, $P1731[$P116]
    unless_null $P118, vivify_382
    new $P118, "Undef"
  vivify_382:
    store_lex "$P0", $P118
.annotate 'line', 1685
    find_lex $P116, "$P0"
    unless $P116, if_1732_end
    find_lex $P1733, "$P0"
    unless_null $P1733, vivify_383
    $P1733 = root_new ['parrot';'Hash']
  vivify_383:
    set $P117, $P1733["scope"]
    unless_null $P117, vivify_384
    new $P117, "Undef"
  vivify_384:
    store_lex "$scope", $P117
  if_1732_end:
.annotate 'line', 1686
    find_lex $P117, "$scope"
    unless $P117, unless_1734
    set $P116, $P117
    goto unless_1734_end
  unless_1734:
.annotate 'line', 1688
    find_lex $P118, "self"
    getattribute $P1735, $P118, "%!symtable"
    unless_null $P1735, vivify_385
    $P1735 = root_new ['parrot';'Hash']
  vivify_385:
    set $P119, $P1735[""]
    unless_null $P119, vivify_386
    new $P119, "Undef"
  vivify_386:
    store_lex "$P0", $P119
.annotate 'line', 1689
    find_lex $P118, "$P0"
    if $P118, unless_1736_end
    "scope_error"()
  unless_1736_end:
.annotate 'line', 1690
    find_lex $P1737, "$P0"
    unless_null $P1737, vivify_387
    $P1737 = root_new ['parrot';'Hash']
  vivify_387:
    set $P118, $P1737["scope"]
    unless_null $P118, vivify_388
    new $P118, "Undef"
  vivify_388:
    store_lex "$scope", $P118
.annotate 'line', 1691
    find_lex $P119, "$scope"
    unless $P119, unless_1738
    set $P118, $P119
    goto unless_1738_end
  unless_1738:
    $P120 = "scope_error"()
    set $P118, $P120
  unless_1738_end:
.annotate 'line', 1686
    set $P116, $P118
  unless_1734_end:
.annotate 'line', 1682
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1739"  :anon :subid("86_1312756204.79645") :outer("82_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1695
    .const 'Sub' $P1747 = "87_1312756204.79645" 
    capture_lex $P1747
    new $P1743, 'ExceptionHandler'
    set_label $P1743, control_1742
    $P1743."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P1743
.annotate 'line', 1696
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
.annotate 'line', 1695
    pop_eh 
    goto skip_handler_1741
  control_1742:
.annotate 'line', 1697
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P1747 = "87_1312756204.79645" 
    newclosure $P1752, $P1747
    $P1752(exception)
    new $P1753, 'Integer'
    set $P1753, 1
    set exception["handled"], $P1753
    set $I1754, exception["handled"]
    ne $I1754, 1, nothandled_1745
  handled_1744:
    .return (exception)
  nothandled_1745:
    rethrow exception
  skip_handler_1741:
.annotate 'line', 1695
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1746"  :anon :subid("87_1312756204.79645") :outer("86_1312756204.79645")
    .param pmc param_1748
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1697
    .lex "$_", param_1748
    find_lex $P1749, "$_"
    set $P1750, $P1749
    .lex "$!", $P1750
    $P1751 = "scope_error"()
    .return ($P1751)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("88_1312756204.79645") :method :outer("11_1312756204.79645")
    .param pmc param_1758
    .param pmc param_1759
    .param pmc param_1760
    .param pmc param_1761
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1723
    .const 'Sub' $P1768 = "89_1312756204.79645" 
    capture_lex $P1768
    new $P1757, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1757, control_1756
    push_eh $P1757
    .lex "self", self
    .lex "$node", param_1758
    .lex "$ops", param_1759
    .lex "$fetchop", param_1760
    .lex "$storeop", param_1761
.annotate 'line', 1724
    new $P105, "Undef"
    set $P1762, $P105
    .lex "$viviself", $P1762
.annotate 'line', 1725
    new $P106, "Undef"
    set $P1763, $P106
    .lex "$vivipost", $P1763
.annotate 'line', 1726
    new $P107, "Undef"
    set $P1764, $P107
    .lex "$result", $P1764
.annotate 'line', 1724
    find_lex $P108, "$node"
    $P109 = $P108."viviself"()
    store_lex "$viviself", $P109
.annotate 'line', 1725
    find_lex $P108, "self"
    find_lex $P109, "$viviself"
    $P110 = $P108."as_vivipost"($P109, "P" :named("rtype"))
    store_lex "$vivipost", $P110
.annotate 'line', 1726
    find_lex $P108, "$vivipost"
    $P109 = $P108."result"()
    store_lex "$result", $P109
.annotate 'line', 1727
    find_lex $P108, "$result"
    set $S100, $P108
    iseq $I100, $S100, ""
    unless $I100, if_1765_end
    find_lex $P109, "self"
    $P110 = $P109."tempreg"("P")
    store_lex "$result", $P110
  if_1765_end:
.annotate 'line', 1729
    find_lex $P108, "$ops"
    find_lex $P109, "$result"
    $P108."result"($P109)
.annotate 'line', 1730
    find_lex $P108, "$ops"
    find_lex $P109, "$fetchop"
    $P108."push"($P109)
.annotate 'line', 1731
    find_lex $P108, "$viviself"
    unless $P108, if_1766_end
    .const 'Sub' $P1768 = "89_1312756204.79645" 
    capture_lex $P1768
    $P1768()
  if_1766_end:
.annotate 'line', 1723
    find_lex $P108, "$ops"
    .return ($P108)
  control_1756:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1767"  :anon :subid("89_1312756204.79645") :outer("88_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1732
    new $P109, "Undef"
    set $P1769, $P109
    .lex "$vivilabel", $P1769
    get_hll_global $P110, ["POST"], "Label"
    $P111 = $P110."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P111
.annotate 'line', 1733
    find_lex $P110, "$ops"
    find_lex $P111, "$ops"
    find_lex $P112, "$vivilabel"
    $P110."push_pirop"("unless_null", $P111, $P112)
.annotate 'line', 1734
    find_lex $P110, "$ops"
    find_lex $P111, "$vivipost"
    $P110."push"($P111)
.annotate 'line', 1735
    find_lex $P110, "$node"
    $P111 = $P110."lvalue"()
    unless $P111, if_1770_end
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P112."push"($P113)
  if_1770_end:
.annotate 'line', 1736
    find_lex $P110, "$ops"
    find_lex $P111, "$vivilabel"
    $P112 = $P110."push"($P111)
.annotate 'line', 1731
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("90_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1774
    .param pmc param_1775
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1742
    .const 'Sub' $P1783 = "91_1312756204.79645" 
    capture_lex $P1783
    new $P1773, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1773, control_1772
    push_eh $P1773
    .lex "self", self
    .lex "$node", param_1774
    .lex "$bindpost", param_1775
.annotate 'line', 1744
    new $P105, "Undef"
    set $P1776, $P105
    .lex "$name", $P1776
.annotate 'line', 1745
    new $P106, "Undef"
    set $P1777, $P106
    .lex "$named", $P1777
.annotate 'line', 1746
    new $P107, "Undef"
    set $P1778, $P107
    .lex "$pname", $P1778
.annotate 'line', 1749
    new $P108, "Undef"
    set $P1779, $P108
    .lex "$ops", $P1779
.annotate 'line', 1751
    new $P109, "Undef"
    set $P1780, $P109
    .lex "$viviself", $P1780
.annotate 'line', 1744
    find_lex $P110, "$node"
    $P111 = $P110."name"()
    store_lex "$name", $P111
.annotate 'line', 1745
    find_lex $P110, "$node"
    $P111 = $P110."named"()
    store_lex "$named", $P111
.annotate 'line', 1746
    find_lex $P110, "self"
    $P111 = $P110."unique"("param_")
    store_lex "$pname", $P111
.annotate 'line', 1749
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    find_lex $P112, "$pname"
    $P113 = $P110."new"($P111 :named("node"), $P112 :named("result"))
    store_lex "$ops", $P113
.annotate 'line', 1751
    find_lex $P110, "$node"
    $P111 = $P110."viviself"()
    store_lex "$viviself", $P111
.annotate 'line', 1752
    find_lex $P110, "$viviself"
    if $P110, if_1781
.annotate 'line', 1763
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_389
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_390
    die "Contextual $*SUB not found"
  vivify_390:
  vivify_389:
    find_lex $P114, "$pname"
    find_lex $P116, "$named"
.annotate 'line', 1764
    find_lex $P117, "$node"
    $P118 = $P117."slurpy"()
    find_lex $P119, "$node"
    $P120 = $P119."call_sig"()
.annotate 'line', 1763
    $P113."add_param"($P114, $P116 :named("named"), $P118 :named("slurpy"), $P120 :named("call_sig"))
.annotate 'line', 1762
    goto if_1781_end
  if_1781:
.annotate 'line', 1752
    .const 'Sub' $P1783 = "91_1312756204.79645" 
    capture_lex $P1783
    $P1783()
  if_1781_end:
.annotate 'line', 1767
    find_lex $P110, "$name"
    defined $I100, $P110
    unless $I100, if_1786_end
.annotate 'line', 1768
    find_lex $P111, "$ops"
    find_lex $P112, "self"
    find_lex $P113, "$name"
    $P114 = $P112."escape"($P113)
    find_lex $P115, "$ops"
    $P111."push_pirop"(".lex", $P114, $P115)
  if_1786_end:
.annotate 'line', 1742
    find_lex $P110, "$ops"
    .return ($P110)
  control_1772:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1782"  :anon :subid("91_1312756204.79645") :outer("90_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1754
    new $P111, "Undef"
    set $P1784, $P111
    .lex "$vivipost", $P1784
.annotate 'line', 1755
    new $P112, "Undef"
    set $P1785, $P112
    .lex "$vivilabel", $P1785
.annotate 'line', 1754
    find_lex $P113, "self"
    find_lex $P114, "$viviself"
    $P115 = $P113."as_vivipost"($P114, "P" :named("rtype"))
    store_lex "$vivipost", $P115
.annotate 'line', 1755
    get_hll_global $P113, ["POST"], "Label"
    $P114 = $P113."new"("optparam_" :named("name"))
    store_lex "$vivilabel", $P114
.annotate 'line', 1756
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_391
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_392
    die "Contextual $*SUB not found"
  vivify_392:
  vivify_391:
    find_lex $P114, "$pname"
    find_lex $P115, "$named"
    $P113."add_param"($P114, $P115 :named("named"), 1 :named("optional"))
.annotate 'line', 1757
    find_lex $P113, "$ops"
    new $P114, 'String'
    set $P114, "has_"
    find_lex $P115, "$pname"
    concat $P116, $P114, $P115
    find_lex $P117, "$vivilabel"
    $P113."push_pirop"("if", $P116, $P117)
.annotate 'line', 1758
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P113."push"($P114)
.annotate 'line', 1759
    find_lex $P113, "$ops"
    find_lex $P114, "$ops"
    find_lex $P115, "$vivipost"
    $P113."push_pirop"("set", $P114, $P115)
.annotate 'line', 1760
    find_lex $P113, "$ops"
    find_lex $P114, "$vivilabel"
    $P115 = $P113."push"($P114)
.annotate 'line', 1752
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("92_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1790
    .param pmc param_1791
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1775
    new $P1789, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1789, control_1788
    push_eh $P1789
    .lex "self", self
    .lex "$node", param_1790
    .lex "$bindpost", param_1791
.annotate 'line', 1776
    new $P105, "Undef"
    set $P1792, $P105
    .lex "$ops", $P1792
.annotate 'line', 1777
    new $P106, "Undef"
    set $P1793, $P106
    .lex "$name", $P1793
.annotate 'line', 1778
    new $P107, "Undef"
    set $P1794, $P107
    .lex "$ns", $P1794
.annotate 'line', 1780
    new $P108, "Undef"
    set $P1795, $P108
    .lex "$fetchop", $P1795
.annotate 'line', 1781
    new $P109, "Undef"
    set $P1796, $P109
    .lex "$storeop", $P1796
.annotate 'line', 1782
    $P1798 = root_new ['parrot';'ResizablePMCArray']
    set $P1797, $P1798
    .lex "@name", $P1797
.annotate 'line', 1776
    get_hll_global $P110, ["POST"], "Ops"
    find_lex $P111, "$node"
    $P112 = $P110."new"($P111 :named("node"))
    store_lex "$ops", $P112
.annotate 'line', 1777
    find_lex $P110, "self"
    find_lex $P111, "$node"
    $P112 = $P111."name"()
    $P113 = $P110."escape"($P112)
    store_lex "$name", $P113
.annotate 'line', 1778
    find_lex $P110, "$node"
    $P111 = $P110."namespace"()
    store_lex "$ns", $P111
.annotate 'line', 1780
    new $P110, "String"
    assign $P110, "get_global"
    store_lex "$fetchop", $P110
.annotate 'line', 1781
    new $P110, "String"
    assign $P110, "set_global"
    store_lex "$storeop", $P110
.annotate 'line', 1782
    find_lex $P110, "$name"
    new $P111, "ResizablePMCArray"
    push $P111, $P110
    store_lex "@name", $P111
.annotate 'line', 1784
    find_lex $P110, "$ns"
    defined $I100, $P110
    unless $I100, if_1799_end
.annotate 'line', 1785
    new $P111, "String"
    assign $P111, "get_hll_global"
    store_lex "$fetchop", $P111
.annotate 'line', 1786
    new $P111, "String"
    assign $P111, "set_hll_global"
    store_lex "$storeop", $P111
.annotate 'line', 1788
    find_lex $P111, "$ns"
    unless $P111, if_1800_end
.annotate 'line', 1789
    get_hll_global $P112, ["POST"], "Compiler"
    find_lex $P113, "$ns"
    $P114 = $P112."key_pir"($P113)
    store_lex "$ns", $P114
.annotate 'line', 1790
    find_lex $P112, "@name"
    find_lex $P113, "$ns"
    $P112."unshift"($P113)
  if_1800_end:
  if_1799_end:
.annotate 'line', 1794
    find_lex $P110, "$bindpost"
    unless $P110, if_1801_end
.annotate 'line', 1795
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
  if_1801_end:
.annotate 'line', 1799
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "$ops"
    find_lex $P112, "@name"
    find_lex $P113, "$fetchop"
    $P114 = $P110."new"($P111, $P112 :flat, $P113 :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1800
    get_hll_global $P110, ["POST"], "Op"
    find_lex $P111, "@name"
    find_lex $P112, "$ops"
    find_lex $P113, "$storeop"
    $P114 = $P110."new"($P111 :flat, $P112, $P113 :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1801
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
.annotate 'line', 1775
    .return ()
  control_1788:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("93_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1805
    .param pmc param_1806
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1805
    .const 'Sub' $P1819 = "95_1312756204.79645" 
    capture_lex $P1819
    .const 'Sub' $P1811 = "94_1312756204.79645" 
    capture_lex $P1811
    new $P1804, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1804, control_1803
    push_eh $P1804
    .lex "self", self
    .lex "$node", param_1805
    .lex "$bindpost", param_1806
.annotate 'line', 1806
    new $P105, "Undef"
    set $P1807, $P105
    .lex "$name", $P1807
.annotate 'line', 1807
    new $P106, "Undef"
    set $P1808, $P106
    .lex "$isdecl", $P1808
.annotate 'line', 1806
    find_lex $P107, "self"
    find_lex $P108, "$node"
    $P109 = $P108."name"()
    $P110 = $P107."escape"($P109)
    store_lex "$name", $P110
.annotate 'line', 1807
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    store_lex "$isdecl", $P108
.annotate 'line', 1809
    find_lex $P108, "$isdecl"
    if $P108, if_1809
.annotate 'line', 1826
    .const 'Sub' $P1819 = "95_1312756204.79645" 
    capture_lex $P1819
    $P116 = $P1819()
    set $P107, $P116
.annotate 'line', 1809
    goto if_1809_end
  if_1809:
    .const 'Sub' $P1811 = "94_1312756204.79645" 
    capture_lex $P1811
    $P112 = $P1811()
    set $P107, $P112
  if_1809_end:
.annotate 'line', 1805
    .return ($P107)
  control_1803:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1818"  :anon :subid("95_1312756204.79645") :outer("93_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1832
    new $P113, "Undef"
    set $P1820, $P113
    .lex "$ops", $P1820
.annotate 'line', 1833
    new $P114, "Undef"
    set $P1821, $P114
    .lex "$fetchop", $P1821
.annotate 'line', 1834
    new $P115, "Undef"
    set $P1822, $P115
    .lex "$storeop", $P1822
.annotate 'line', 1827
    find_lex $P116, "$bindpost"
    unless $P116, if_1823_end
.annotate 'line', 1828
    new $P117, "Exception"
    set $P117['type'], .CONTROL_RETURN
    get_hll_global $P118, ["POST"], "Op"
    find_lex $P119, "$name"
    find_lex $P120, "$bindpost"
    find_lex $P121, "$bindpost"
    $P122 = $P118."new"($P119, $P120, "store_lex" :named("pirop"), $P121 :named("result"))
    setattribute $P117, 'payload', $P122
    throw $P117
  if_1823_end:
.annotate 'line', 1832
    get_hll_global $P116, ["POST"], "Ops"
    find_lex $P117, "$node"
    $P118 = $P116."new"($P117 :named("node"))
    store_lex "$ops", $P118
.annotate 'line', 1833
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$ops"
    find_lex $P118, "$name"
    $P119 = $P116."new"($P117, $P118, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P119
.annotate 'line', 1834
    get_hll_global $P116, ["POST"], "Op"
    find_lex $P117, "$name"
    find_lex $P118, "$ops"
    $P119 = $P116."new"($P117, $P118, "store_lex" :named("pirop"))
    store_lex "$storeop", $P119
.annotate 'line', 1835
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
.annotate 'line', 1826
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1810"  :anon :subid("94_1312756204.79645") :outer("93_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1811
    new $P109, "Undef"
    set $P1812, $P109
    .lex "$lexreg", $P1812
.annotate 'line', 1812
    new $P110, "Undef"
    set $P1813, $P110
    .lex "$ops", $P1813
.annotate 'line', 1813
    new $P111, "Undef"
    set $P1814, $P111
    .lex "$viviself", $P1814
.annotate 'line', 1811
    find_lex $P112, "self"
    $P113 = $P112."uniquereg"("P")
    store_lex "$lexreg", $P113
.annotate 'line', 1812
    get_hll_global $P112, ["POST"], "Ops"
    find_lex $P113, "$node"
    $P114 = $P112."new"($P113 :named("node"))
    store_lex "$ops", $P114
.annotate 'line', 1813
    find_lex $P112, "$node"
    $P113 = $P112."viviself"()
    store_lex "$viviself", $P113
.annotate 'line', 1815
    find_lex $P113, "$bindpost"
    isfalse $I100, $P113
    if $I100, if_1816
    new $P112, 'Integer'
    set $P112, $I100
    goto if_1816_end
  if_1816:
    find_lex $P114, "$viviself"
    set $P112, $P114
  if_1816_end:
    unless $P112, if_1815_end
.annotate 'line', 1816
    find_lex $P115, "self"
    find_lex $P116, "$viviself"
    $P117 = $P115."as_vivipost"($P116, "P" :named("rtype"))
    store_lex "$bindpost", $P117
.annotate 'line', 1817
    find_lex $P115, "$ops"
    find_lex $P116, "$bindpost"
    $P115."push"($P116)
  if_1815_end:
.annotate 'line', 1820
    find_lex $P112, "$bindpost"
    unless $P112, if_1817_end
    find_lex $P113, "$ops"
    find_lex $P114, "$lexreg"
    find_lex $P115, "$bindpost"
    $P113."push_pirop"("set", $P114, $P115)
  if_1817_end:
.annotate 'line', 1822
    find_lex $P112, "$ops"
    find_lex $P113, "$name"
    find_lex $P114, "$lexreg"
    $P112."push_pirop"(".lex", $P113, $P114)
.annotate 'line', 1823
    find_lex $P112, "$ops"
    find_lex $P113, "$lexreg"
    $P112."result"($P113)
.annotate 'line', 1824
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
.annotate 'line', 1809
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("96_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1827
    .param pmc param_1828
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1840
    .const 'Sub' $P1839 = "97_1312756204.79645" 
    capture_lex $P1839
    new $P1826, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1826, control_1825
    push_eh $P1826
    .lex "self", self
    .lex "$node", param_1827
    .lex "$bindpost", param_1828
.annotate 'line', 1845
    new $P105, "Undef"
    set $P1829, $P105
    .lex "$name", $P1829
.annotate 'line', 1847
    $P1831 = root_new ['parrot';'Hash']
    set $P1830, $P1831
    .lex "%symtable", $P1830
.annotate 'line', 1869
    new $P106, "Undef"
    set $P1832, $P106
    .lex "$ops", $P1832
.annotate 'line', 1870
    new $P107, "Undef"
    set $P1833, $P107
    .lex "$fetchop", $P1833
.annotate 'line', 1871
    new $P108, "Undef"
    set $P1834, $P108
    .lex "$storeop", $P1834
.annotate 'line', 1845
    find_lex $P109, "$node"
    $P110 = $P109."name"()
    store_lex "$name", $P110
.annotate 'line', 1847
    find_dynamic_lex $P109, "@*BLOCKPAST"
    unless_null $P109, vivify_393
    get_hll_global $P109, "@BLOCKPAST"
    unless_null $P109, vivify_394
    die "Contextual @*BLOCKPAST not found"
  vivify_394:
  vivify_393:
    set $P110, $P109[0]
    unless_null $P110, vivify_395
    new $P110, "Undef"
  vivify_395:
    $P111 = $P110."symtable"()
    store_lex "%symtable", $P111
.annotate 'line', 1848
    find_lex $P109, "%symtable"
    defined $I100, $P109
    unless $I100, if_1835_end
.annotate 'line', 1849
    find_lex $P110, "$name"
    find_lex $P1836, "%symtable"
    unless_null $P1836, vivify_396
    $P1836 = root_new ['parrot';'Hash']
  vivify_396:
    set $P111, $P1836[$P110]
    unless_null $P111, vivify_397
    new $P111, "Undef"
  vivify_397:
    store_lex "%symtable", $P111
.annotate 'line', 1850
    find_lex $P110, "%symtable"
    defined $I101, $P110
    unless $I101, if_1837_end
    .const 'Sub' $P1839 = "97_1312756204.79645" 
    capture_lex $P1839
    $P1839()
  if_1837_end:
  if_1835_end:
.annotate 'line', 1859
    find_lex $P109, "$node"
    $P110 = $P109."isdecl"()
    unless $P110, if_1844_end
    new $P111, "Exception"
    set $P111['type'], .CONTROL_RETURN
    find_lex $P112, "self"
    find_lex $P113, "$node"
    find_lex $P114, "$bindpost"
    $P115 = $P112."lexical"($P113, $P114)
    setattribute $P111, 'payload', $P115
    throw $P111
  if_1844_end:
.annotate 'line', 1861
    find_lex $P109, "self"
    find_lex $P110, "$name"
    $P111 = $P109."escape"($P110)
    store_lex "$name", $P111
.annotate 'line', 1863
    find_lex $P109, "$bindpost"
    unless $P109, if_1845_end
.annotate 'line', 1864
    new $P110, "Exception"
    set $P110['type'], .CONTROL_RETURN
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$name"
    find_lex $P113, "$bindpost"
    find_lex $P114, "$bindpost"
    $P115 = $P111."new"($P112, $P113, "store_dynamic_lex" :named("pirop"), $P114 :named("result"))
    setattribute $P110, 'payload', $P115
    throw $P110
  if_1845_end:
.annotate 'line', 1869
    get_hll_global $P109, ["POST"], "Ops"
    find_lex $P110, "$node"
    $P111 = $P109."new"($P110 :named("node"))
    store_lex "$ops", $P111
.annotate 'line', 1870
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$ops"
    find_lex $P111, "$name"
    $P112 = $P109."new"($P110, $P111, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P112
.annotate 'line', 1871
    get_hll_global $P109, ["POST"], "Op"
    find_lex $P110, "$name"
    find_lex $P111, "$ops"
    $P112 = $P109."new"($P110, $P111, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P112
.annotate 'line', 1872
    find_lex $P109, "self"
    find_lex $P110, "$node"
    find_lex $P111, "$ops"
    find_lex $P112, "$fetchop"
    find_lex $P113, "$storeop"
    $P114 = $P109."vivify"($P110, $P111, $P112, $P113)
.annotate 'line', 1840
    .return ($P114)
  control_1825:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1838"  :anon :subid("97_1312756204.79645") :outer("96_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1851
    new $P111, "Undef"
    set $P1840, $P111
    .lex "$scope", $P1840
    find_lex $P1841, "%symtable"
    unless_null $P1841, vivify_398
    $P1841 = root_new ['parrot';'Hash']
  vivify_398:
    set $P112, $P1841["scope"]
    unless_null $P112, vivify_399
    new $P112, "Undef"
  vivify_399:
    store_lex "$scope", $P112
.annotate 'line', 1852
    find_lex $P114, "$scope"
    if $P114, if_1843
    set $P113, $P114
    goto if_1843_end
  if_1843:
    find_lex $P115, "$scope"
    set $S100, $P115
    isne $I102, $S100, "contextual"
    new $P113, 'Integer'
    set $P113, $I102
  if_1843_end:
    if $P113, if_1842
    set $P112, $P113
    goto if_1842_end
  if_1842:
.annotate 'line', 1853
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
  if_1842_end:
.annotate 'line', 1850
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("98_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1849
    .param pmc param_1850
    .param pmc param_1851 :optional
    .param int has_param_1851 :opt_flag
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1876
    new $P1848, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1848, control_1847
    push_eh $P1848
    .lex "self", self
    .lex "$node", param_1849
    .lex "$bindpost", param_1850
    if has_param_1851, optparam_400
    new $P105, "Undef"
    set param_1851, $P105
  optparam_400:
    .lex "$keyrtype", param_1851
.annotate 'line', 1877

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
    
.annotate 'line', 1876
    .return ()
  control_1847:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("99_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1855
    .param pmc param_1856
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1945
    new $P1854, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1854, control_1853
    push_eh $P1854
    .lex "self", self
    .lex "$node", param_1855
    .lex "$bindpost", param_1856
.annotate 'line', 1946
    find_lex $P105, "self"
    find_lex $P106, "$node"
    find_lex $P107, "$bindpost"
    $P108 = $P105."keyed"($P106, $P107, "i")
.annotate 'line', 1945
    .return ($P108)
  control_1853:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("100_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1860
    .param pmc param_1861
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1950
    .const 'Sub' $P1874 = "101_1312756204.79645" 
    capture_lex $P1874
    new $P1859, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1859, control_1858
    push_eh $P1859
    .lex "self", self
    .lex "$node", param_1860
    .lex "$bindpost", param_1861
.annotate 'line', 1951
    new $P105, "Undef"
    set $P1862, $P105
    .lex "$ops", $P1862
.annotate 'line', 1952
    new $P106, "Undef"
    set $P1863, $P106
    .lex "$name", $P1863
.annotate 'line', 1960
    new $P107, "Undef"
    set $P1864, $P107
    .lex "$call_on", $P1864
.annotate 'line', 1961
    $P1866 = root_new ['parrot';'ResizablePMCArray']
    set $P1865, $P1866
    .lex "@attribute", $P1865
.annotate 'line', 1962
    new $P108, "Undef"
    set $P1867, $P108
    .lex "$elements", $P1867
.annotate 'line', 1983
    new $P109, "Undef"
    set $P1868, $P109
    .lex "$fetchop", $P1868
.annotate 'line', 1984
    new $P110, "Undef"
    set $P1869, $P110
    .lex "$storeop", $P1869
.annotate 'line', 1951
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 1952
    find_lex $P111, "self"
    find_lex $P112, "$node"
    $P113 = $P112."name"()
    $P114 = $P111."escape"($P113)
    store_lex "$name", $P114
.annotate 'line', 1950
    find_lex $P111, "$call_on"
.annotate 'line', 1961
    find_lex $P111, "$name"
    new $P112, "ResizablePMCArray"
    push $P112, $P111
    store_lex "@attribute", $P112
.annotate 'line', 1962
    find_lex $P111, "$node"
    elements $I100, $P111
    new $P112, 'Integer'
    set $P112, $I100
    store_lex "$elements", $P112
.annotate 'line', 1963
    find_lex $P111, "$elements"
    set $N100, $P111
    iseq $I100, $N100, 0.0
    if $I100, if_1870
.annotate 'line', 1967
    find_lex $P112, "self"
    find_lex $P1871, "$node"
    unless_null $P1871, vivify_401
    $P1871 = root_new ['parrot';'ResizablePMCArray']
  vivify_401:
    set $P113, $P1871[0]
    unless_null $P113, vivify_402
    new $P113, "Undef"
  vivify_402:
    $P114 = $P112."as_post"($P113, "P" :named("rtype"))
    store_lex "$call_on", $P114
.annotate 'line', 1968
    find_lex $P112, "$ops"
    find_lex $P113, "$call_on"
    $P112."push"($P113)
.annotate 'line', 1969
    find_lex $P112, "$elements"
    set $N101, $P112
    iseq $I101, $N101, 2.0
    unless $I101, if_1872_end
    .const 'Sub' $P1874 = "101_1312756204.79645" 
    capture_lex $P1874
    $P1874()
  if_1872_end:
.annotate 'line', 1966
    goto if_1870_end
  if_1870:
.annotate 'line', 1964
    new $P112, "String"
    assign $P112, "self"
    store_lex "$call_on", $P112
  if_1870_end:
.annotate 'line', 1975
    find_lex $P111, "@attribute"
    find_lex $P112, "$call_on"
    $P111."unshift"($P112)
.annotate 'line', 1977
    find_lex $P111, "$bindpost"
    unless $P111, if_1877_end
.annotate 'line', 1978
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    find_lex $P114, "$bindpost"
    $P112."push_pirop"("setattribute", $P113 :flat, $P114)
.annotate 'line', 1979
    find_lex $P112, "$ops"
    find_lex $P113, "$bindpost"
    $P112."result"($P113)
.annotate 'line', 1980
    new $P112, "Exception"
    set $P112['type'], .CONTROL_RETURN
    find_lex $P113, "$ops"
    setattribute $P112, 'payload', $P113
    throw $P112
  if_1877_end:
.annotate 'line', 1983
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "$ops"
    find_lex $P113, "@attribute"
    $P114 = $P111."new"($P112, $P113 :flat, "getattribute" :named("pirop"))
    store_lex "$fetchop", $P114
.annotate 'line', 1984
    get_hll_global $P111, ["POST"], "Op"
    find_lex $P112, "@attribute"
    find_lex $P113, "$ops"
    $P114 = $P111."new"($P112 :flat, $P113, "setattribute" :named("pirop"))
    store_lex "$storeop", $P114
.annotate 'line', 1985
    find_lex $P111, "self"
    find_lex $P112, "$node"
    find_lex $P113, "$ops"
    find_lex $P114, "$fetchop"
    find_lex $P115, "$storeop"
    $P116 = $P111."vivify"($P112, $P113, $P114, $P115)
.annotate 'line', 1950
    .return ($P116)
  control_1858:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1873"  :anon :subid("101_1312756204.79645") :outer("100_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1970
    new $P113, "Undef"
    set $P1875, $P113
    .lex "$handle", $P1875
    find_lex $P114, "self"
    find_lex $P1876, "$node"
    unless_null $P1876, vivify_403
    $P1876 = root_new ['parrot';'ResizablePMCArray']
  vivify_403:
    set $P115, $P1876[1]
    unless_null $P115, vivify_404
    new $P115, "Undef"
  vivify_404:
    $P116 = $P114."as_post"($P115, "P" :named("rtype"))
    store_lex "$handle", $P116
.annotate 'line', 1971
    find_lex $P114, "$ops"
    find_lex $P115, "$handle"
    $P114."push"($P115)
.annotate 'line', 1972
    find_lex $P114, "@attribute"
    find_lex $P115, "$handle"
    $P116 = $P114."unshift"($P115)
.annotate 'line', 1969
    .return ($P116)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("102_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Var"],_)
    .param pmc param_1881
    .param pmc param_1882
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1989
    .const 'Sub' $P1889 = "103_1312756204.79645" 
    capture_lex $P1889
    new $P1880, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1880, control_1879
    push_eh $P1880
    .lex "self", self
    .lex "$node", param_1881
    .lex "$bindpost", param_1882
.annotate 'line', 1990
    new $P105, "Undef"
    set $P1883, $P105
    .lex "$name", $P1883
.annotate 'line', 1997
    new $P106, "Undef"
    set $P1884, $P106
    .lex "$ops", $P1884
.annotate 'line', 1990
    find_lex $P107, "$node"
    $P108 = $P107."name"()
    store_lex "$name", $P108
.annotate 'line', 1992
    find_lex $P107, "$name"
    if $P107, unless_1885_end
.annotate 'line', 1993
    find_lex $P108, "self"
    $P109 = $P108."uniquereg"("P")
    store_lex "$name", $P109
.annotate 'line', 1994
    find_lex $P108, "$node"
    find_lex $P109, "$name"
    $P108."name"($P109)
  unless_1885_end:
.annotate 'line', 1997
    get_hll_global $P107, ["POST"], "Ops"
    find_lex $P108, "$name"
    find_lex $P109, "$node"
    $P110 = $P107."new"($P108 :named("result"), $P109 :named("node"))
    store_lex "$ops", $P110
.annotate 'line', 1999
    find_lex $P107, "$node"
    $P108 = $P107."isdecl"()
    unless $P108, if_1886_end
    find_lex $P109, "$ops"
    find_lex $P110, "$ops"
    $P109."push_pirop"(".local pmc", $P110)
  if_1886_end:
.annotate 'line', 2001
    find_lex $P107, "$bindpost"
    if $P107, if_1887
.annotate 'line', 2004
    .const 'Sub' $P1889 = "103_1312756204.79645" 
    capture_lex $P1889
    $P1889()
    goto if_1887_end
  if_1887:
.annotate 'line', 2002
    find_lex $P108, "$ops"
    find_lex $P109, "$ops"
    find_lex $P110, "$bindpost"
    $P108."push_pirop"("set", $P109, $P110)
  if_1887_end:
.annotate 'line', 1989
    find_lex $P107, "$ops"
    .return ($P107)
  control_1879:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1888"  :anon :subid("103_1312756204.79645") :outer("102_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2004
    .const 'Sub' $P1893 = "104_1312756204.79645" 
    capture_lex $P1893
.annotate 'line', 2005
    new $P108, "Undef"
    set $P1890, $P108
    .lex "$viviself", $P1890
    find_lex $P109, "$node"
    $P110 = $P109."viviself"()
    store_lex "$viviself", $P110
.annotate 'line', 2006
    find_lex $P110, "$viviself"
    if $P110, if_1891
    set $P109, $P110
    goto if_1891_end
  if_1891:
    .const 'Sub' $P1893 = "104_1312756204.79645" 
    capture_lex $P1893
    $P112 = $P1893()
    set $P109, $P112
  if_1891_end:
.annotate 'line', 2004
    .return ($P109)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1892"  :anon :subid("104_1312756204.79645") :outer("103_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2007
    new $P111, "Undef"
    set $P1894, $P111
    .lex "$vivipost", $P1894
    find_lex $P112, "self"
    find_lex $P113, "$viviself"
    $P114 = $P112."as_vivipost"($P113, "P" :named("rtype"))
    store_lex "$vivipost", $P114
.annotate 'line', 2008
    find_lex $P112, "$ops"
    find_lex $P113, "$vivipost"
    $P112."push"($P113)
.annotate 'line', 2009
    find_lex $P112, "$ops"
    find_lex $P113, "$ops"
    find_lex $P114, "$vivipost"
    $P115 = $P112."push_pirop"("set", $P113, $P114)
.annotate 'line', 2006
    .return ($P115)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("105_1312756204.79645") :method :outer("11_1312756204.79645") :multi(_,["PAST";"Val"])
    .param pmc param_1898
    .param pmc param_1899 :slurpy :named
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2025
    .const 'Sub' $P1910 = "106_1312756204.79645" 
    capture_lex $P1910
    new $P1897, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1897, control_1896
    push_eh $P1897
    .lex "self", self
    .lex "$node", param_1898
    .lex "%options", param_1899
.annotate 'line', 2026
    new $P105, "Undef"
    set $P1900, $P105
    .lex "$ops", $P1900
.annotate 'line', 2028
    new $P106, "Undef"
    set $P1901, $P106
    .lex "$value", $P1901
.annotate 'line', 2041
    new $P107, "Undef"
    set $P1902, $P107
    .lex "$returns", $P1902
.annotate 'line', 2044
    new $P108, "Undef"
    set $P1903, $P108
    .lex "$valflags", $P1903
.annotate 'line', 2059
    new $P109, "Undef"
    set $P1904, $P109
    .lex "$rtype", $P1904
.annotate 'line', 2072
    new $P110, "Undef"
    set $P1905, $P110
    .lex "$result", $P1905
.annotate 'line', 2026
    get_hll_global $P111, ["POST"], "Ops"
    find_lex $P112, "$node"
    $P113 = $P111."new"($P112 :named("node"))
    store_lex "$ops", $P113
.annotate 'line', 2028
    find_lex $P1906, "$node"
    unless_null $P1906, vivify_405
    $P1906 = root_new ['parrot';'Hash']
  vivify_405:
    set $P111, $P1906["value"]
    unless_null $P111, vivify_406
    new $P111, "Undef"
  vivify_406:
    store_lex "$value", $P111
.annotate 'line', 2029
    find_lex $P111, "$value"
    defined $I100, $P111
    if $I100, unless_1907_end
.annotate 'line', 2030
    find_lex $P112, "self"
    $P112."panic"("PAST::Val node missing :value attribute")
  unless_1907_end:
.annotate 'line', 2032
    get_hll_global $P111, ["PAST"], "Block"
    find_lex $P112, "$value"
    $P113 = $P111."ACCEPTS"($P112)
    unless $P113, if_1908_end
    .const 'Sub' $P1910 = "106_1312756204.79645" 
    capture_lex $P1910
    $P1910()
  if_1908_end:
.annotate 'line', 2041
    find_lex $P1913, "$node"
    unless_null $P1913, vivify_407
    $P1913 = root_new ['parrot';'Hash']
  vivify_407:
    set $P111, $P1913["returns"]
    unless_null $P111, vivify_408
    new $P111, "Undef"
  vivify_408:
    store_lex "$returns", $P111
.annotate 'line', 2042
    find_lex $P111, "$returns"
    if $P111, unless_1914_end
    find_lex $P112, "$value"
    typeof $S100, $P112
    new $P113, 'String'
    set $P113, $S100
    store_lex "$returns", $P113
  unless_1914_end:
.annotate 'line', 2044
    find_lex $P111, "$returns"
    get_global $P1915, "%valflags"
    unless_null $P1915, vivify_409
    $P1915 = root_new ['parrot';'Hash']
  vivify_409:
    set $P112, $P1915[$P111]
    unless_null $P112, vivify_410
    new $P112, "Undef"
  vivify_410:
    store_lex "$valflags", $P112
.annotate 'line', 2045
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "e"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1916_end
    find_lex $P112, "self"
    find_lex $P113, "$value"
    $P114 = $P112."escape"($P113)
    store_lex "$value", $P114
  if_1916_end:
.annotate 'line', 2048
    find_lex $P111, "$valflags"
    set $S100, $P111
    index $I100, $S100, "c"
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1917_end
.annotate 'line', 2050
    find_lex $P112, "$returns"
    set $S101, $P112
    isne $I102, $S101, "!macro_const"
    unless $I102, if_1918_end
.annotate 'line', 2051
    find_dynamic_lex $P113, "$*SUB"
    unless_null $P113, vivify_411
    get_hll_global $P113, "$SUB"
    unless_null $P113, vivify_412
    die "Contextual $*SUB not found"
  vivify_412:
  vivify_411:
.annotate 'line', 2052
    find_lex $P114, "$returns"
    set $S102, $P114
    replace $S103, $S102, 0, 1, ".include \""
    new $P115, 'String'
    set $P115, $S103
    concat $P116, $P115, ".pasm\""
    $P113."add_directive"($P116)
  if_1918_end:
.annotate 'line', 2056
    find_lex $P112, "$value"
    set $S101, $P112
    substr $S102, $S101, 0, 1
    iseq $I102, $S102, "."
    if $I102, unless_1919_end
    new $P113, "String"
    assign $P113, "."
    find_lex $P114, "$value"
    concat $P115, $P113, $P114
    store_lex "$value", $P115
  unless_1919_end:
  if_1917_end:
.annotate 'line', 2059
    find_lex $P1920, "%options"
    unless_null $P1920, vivify_413
    $P1920 = root_new ['parrot';'Hash']
  vivify_413:
    set $P111, $P1920["rtype"]
    unless_null $P111, vivify_414
    new $P111, "Undef"
  vivify_414:
    store_lex "$rtype", $P111
.annotate 'line', 2060
    find_lex $P111, "$valflags"
    set $S100, $P111
    find_lex $P112, "$rtype"
    set $S101, $P112
    index $I100, $S100, $S101
    set $N100, $I100
    isge $I101, $N100, 0.0
    unless $I101, if_1921_end
.annotate 'line', 2061
    find_lex $P113, "$ops"
    find_lex $P114, "$value"
    $P113."result"($P114)
.annotate 'line', 2062
    new $P113, "Exception"
    set $P113['type'], .CONTROL_RETURN
    find_lex $P114, "$ops"
    setattribute $P113, 'payload', $P114
    throw $P113
  if_1921_end:
.annotate 'line', 2066
    find_lex $P112, "$rtype"
    set $S100, $P112
    iseq $I100, $S100, "n"
    if $I100, if_1923
    new $P111, 'Integer'
    set $P111, $I100
    goto if_1923_end
  if_1923:
    find_lex $P113, "$valflags"
    set $S101, $P113
    index $I101, $S101, "i"
    set $N100, $I101
    isge $I102, $N100, 0.0
    new $P111, 'Integer'
    set $P111, $I102
  if_1923_end:
    unless $P111, if_1922_end
.annotate 'line', 2067
    find_lex $P114, "$value"
    concat $P115, $P114, ".0"
    store_lex "$value", $P115
.annotate 'line', 2068
    find_lex $P114, "$ops"
    find_lex $P115, "$value"
    $P114."result"($P115)
.annotate 'line', 2069
    new $P114, "Exception"
    set $P114['type'], .CONTROL_RETURN
    find_lex $P115, "$ops"
    setattribute $P114, 'payload', $P115
    throw $P114
  if_1922_end:
.annotate 'line', 2072
    find_lex $P111, "self"
    $P112 = $P111."tempreg"("P")
    store_lex "$result", $P112
.annotate 'line', 2073
    find_lex $P111, "self"
    find_lex $P112, "$returns"
    $P113 = $P111."escape"($P112)
    store_lex "$returns", $P113
.annotate 'line', 2074
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$returns"
    $P111."push_pirop"("new", $P112, $P113)
.annotate 'line', 2075
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    find_lex $P113, "$value"
    $P111."push_pirop"("assign", $P112, $P113)
.annotate 'line', 2076
    find_lex $P111, "$ops"
    find_lex $P112, "$result"
    $P111."result"($P112)
.annotate 'line', 2025
    find_lex $P111, "$ops"
    .return ($P111)
  control_1896:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1909"  :anon :subid("106_1312756204.79645") :outer("105_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 2033
    new $P114, "Undef"
    set $P1911, $P114
    .lex "$blockreg", $P1911
.annotate 'line', 2034
    new $P115, "Undef"
    set $P1912, $P115
    .lex "$blockref", $P1912
.annotate 'line', 2033
    find_lex $P116, "self"
    $P117 = $P116."uniquereg"("P")
    store_lex "$blockreg", $P117
.annotate 'line', 2034
    new $P116, 'String'
    set $P116, ".const 'Sub' "
    find_lex $P117, "$blockreg"
    concat $P118, $P116, $P117
    concat $P119, $P118, " = "
    store_lex "$blockref", $P119
.annotate 'line', 2035
    find_lex $P116, "$blockref"
    find_lex $P117, "self"
    find_lex $P118, "$value"
    $P119 = $P118."subid"()
    set $S100, $P119
    $S101 = $P117."escape"($S100)
    concat $P120, $P116, $S101
    store_lex "$blockref", $P120
.annotate 'line', 2036
    find_lex $P116, "$ops"
    find_lex $P117, "$blockref"
    $P116."push_pirop"($P117)
.annotate 'line', 2037
    find_lex $P116, "$ops"
    find_lex $P117, "$blockreg"
    $P116."result"($P117)
.annotate 'line', 2038
    new $P116, "Exception"
    set $P116['type'], .CONTROL_RETURN
    find_lex $P117, "$ops"
    setattribute $P116, 'payload', $P117
    throw $P116
.annotate 'line', 2032
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block1925" :load :anon :subid("107_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 41
    .const 'Sub' $P1927 = "11_1312756204.79645" 
    $P105 = $P1927()
    .return ($P105)
.end


.namespace []
.sub "_block2019" :load :anon :subid("108_1312756204.79645")
.annotate 'file', "PAST/Compiler.pm"
.annotate 'line', 1
    .const 'Sub' $P2021 = "10_1312756204.79645" 
    $P100 = $P2021()
    .return ($P100)
.end

