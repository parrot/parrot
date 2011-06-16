
.namespace []
.sub "_block1000"  :anon :subid("10_1308206306.49694")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206306.49694" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1308206306.49694" 
    capture_lex $P1003
    $P3216 = $P1003()
.annotate 'line', 1
    .return ($P3216)
    .const 'Sub' $P3218 = "103_1308206306.49694" 
    .return ($P3218)
.end


.namespace []
.sub "" :load :init :subid("post104") :outer("10_1308206306.49694")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206306.49694" 
    .local pmc block
    set block, $P1001
.annotate 'line', 1
    load_bytecode "PCT/HLLCompiler.pbc"
    $P3221 = get_root_global ["parrot"], "P6metaclass"
    new $P3222, "ResizablePMCArray"
    push $P3222, "%!symtable"
    $P3221."new_class"("PAST::Compiler", "PCT::HLLCompiler" :named("parent"), $P3222 :named("attr"))
.end


.namespace ["PAST";"Compiler"]
.sub "_block1002"  :subid("11_1308206306.49694") :outer("10_1308206306.49694")
.annotate 'line', 41
    .const 'Sub' $P3016 = "101_1308206306.49694" 
    capture_lex $P3016
    .const 'Sub' $P2960 = "98_1308206306.49694" 
    capture_lex $P2960
    .const 'Sub' $P2954 = "97_1308206306.49694" 
    capture_lex $P2954
    .const 'Sub' $P2944 = "96_1308206306.49694" 
    capture_lex $P2944
    .const 'Sub' $P2936 = "95_1308206306.49694" 
    capture_lex $P2936
    .const 'Sub' $P2849 = "93_1308206306.49694" 
    capture_lex $P2849
    .const 'Sub' $P2756 = "90_1308206306.49694" 
    capture_lex $P2756
    .const 'Sub' $P2750 = "89_1308206306.49694" 
    capture_lex $P2750
    .const 'Sub' $P2744 = "88_1308206306.49694" 
    capture_lex $P2744
    .const 'Sub' $P2691 = "86_1308206306.49694" 
    capture_lex $P2691
    .const 'Sub' $P2546 = "80_1308206306.49694" 
    capture_lex $P2546
    .const 'Sub' $P2481 = "79_1308206306.49694" 
    capture_lex $P2481
    .const 'Sub' $P2451 = "78_1308206306.49694" 
    capture_lex $P2451
    .const 'Sub' $P2410 = "77_1308206306.49694" 
    capture_lex $P2410
    .const 'Sub' $P2300 = "75_1308206306.49694" 
    capture_lex $P2300
    .const 'Sub' $P2246 = "74_1308206306.49694" 
    capture_lex $P2246
    .const 'Sub' $P2156 = "71_1308206306.49694" 
    capture_lex $P2156
    .const 'Sub' $P2084 = "70_1308206306.49694" 
    capture_lex $P2084
    .const 'Sub' $P2035 = "68_1308206306.49694" 
    capture_lex $P2035
    .const 'Sub' $P2026 = "67_1308206306.49694" 
    capture_lex $P2026
    .const 'Sub' $P2016 = "66_1308206306.49694" 
    capture_lex $P2016
    .const 'Sub' $P1973 = "64_1308206306.49694" 
    capture_lex $P1973
    .const 'Sub' $P1862 = "62_1308206306.49694" 
    capture_lex $P1862
    .const 'Sub' $P1852 = "61_1308206306.49694" 
    capture_lex $P1852
    .const 'Sub' $P1842 = "60_1308206306.49694" 
    capture_lex $P1842
    .const 'Sub' $P1832 = "59_1308206306.49694" 
    capture_lex $P1832
    .const 'Sub' $P1764 = "58_1308206306.49694" 
    capture_lex $P1764
    .const 'Sub' $P1628 = "57_1308206306.49694" 
    capture_lex $P1628
    .const 'Sub' $P1618 = "56_1308206306.49694" 
    capture_lex $P1618
    .const 'Sub' $P1430 = "52_1308206306.49694" 
    capture_lex $P1430
    .const 'Sub' $P1420 = "51_1308206306.49694" 
    capture_lex $P1420
    .const 'Sub' $P1349 = "49_1308206306.49694" 
    capture_lex $P1349
    .const 'Sub' $P1327 = "48_1308206306.49694" 
    capture_lex $P1327
    .const 'Sub' $P1310 = "47_1308206306.49694" 
    capture_lex $P1310
    .const 'Sub' $P1208 = "37_1308206306.49694" 
    capture_lex $P1208
    .const 'Sub' $P1172 = "33_1308206306.49694" 
    capture_lex $P1172
    .const 'Sub' $P1158 = "32_1308206306.49694" 
    capture_lex $P1158
    .const 'Sub' $P1139 = "30_1308206306.49694" 
    capture_lex $P1139
    .const 'Sub' $P1127 = "29_1308206306.49694" 
    capture_lex $P1127
    .const 'Sub' $P1122 = "28_1308206306.49694" 
    capture_lex $P1122
    .const 'Sub' $P1117 = "27_1308206306.49694" 
    capture_lex $P1117
    .const 'Sub' $P1110 = "26_1308206306.49694" 
    capture_lex $P1110
    .const 'Sub' $P1103 = "25_1308206306.49694" 
    capture_lex $P1103
    .const 'Sub' $P1097 = "24_1308206306.49694" 
    capture_lex $P1097
    .const 'Sub' $P1091 = "23_1308206306.49694" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "22_1308206306.49694" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "21_1308206306.49694" 
    capture_lex $P1079
    .const 'Sub' $P1074 = "20_1308206306.49694" 
    capture_lex $P1074
    .const 'Sub' $P1069 = "19_1308206306.49694" 
    capture_lex $P1069
    .const 'Sub' $P1055 = "18_1308206306.49694" 
    capture_lex $P1055
    .const 'Sub' $P1046 = "17_1308206306.49694" 
    capture_lex $P1046
    .const 'Sub' $P1038 = "16_1308206306.49694" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "15_1308206306.49694" 
    capture_lex $P1032
    .const 'Sub' $P1025 = "14_1308206306.49694" 
    capture_lex $P1025
    .const 'Sub' $P1008 = "12_1308206306.49694" 
    capture_lex $P1008
.annotate 'line', 43
    get_global $P1004, "%piropsig"
    unless_null $P1004, vivify_197
    $P1004 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P1004
  vivify_197:
.annotate 'line', 44
    get_global $P1005, "%valflags"
    unless_null $P1005, vivify_198
    $P1005 = root_new ['parrot';'Hash']
    set_global "%valflags", $P1005
  vivify_198:
.annotate 'line', 45
    get_global $P1006, "%controltypes"
    unless_null $P1006, vivify_199
    $P1006 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P1006
  vivify_199:
.annotate 'line', 46
    get_global $P101, "$serno"
    unless_null $P101, vivify_200
    new $P101, "Undef"
    set_global "$serno", $P101
  vivify_200:
.annotate 'line', 49
    get_global $P102, "$TEMPREG_BASE"
    unless_null $P102, vivify_201
    new $P102, "Undef"
    set_global "$TEMPREG_BASE", $P102
  vivify_201:
.annotate 'line', 50
    get_global $P103, "$UNIQUE_BASE"
    unless_null $P103, vivify_202
    new $P103, "Undef"
    set_global "$UNIQUE_BASE", $P103
  vivify_202:
.annotate 'line', 172
    get_global $P1007, "@?BLOCK"
    unless_null $P1007, vivify_203
    $P1007 = root_new ['parrot';'ResizablePMCArray']
    set_global "@?BLOCK", $P1007
  vivify_203:
.annotate 'line', 41
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P104, "%piropsig"
    get_global $P105, "%valflags"
    get_global $P106, "%controltypes"
    get_global $P107, "$serno"
    get_global $P108, "$TEMPREG_BASE"
    get_global $P109, "$UNIQUE_BASE"
.annotate 'line', 53
    get_global $P110, "@?BLOCK"
.annotate 'line', 2083
    .const 'Sub' $P3016 = "101_1308206306.49694" 
    newclosure $P3022, $P3016
.annotate 'line', 41
    .return ($P3022)
    .const 'Sub' $P3024 = "102_1308206306.49694" 
    .return ($P3024)
.end


.namespace ["PAST";"Compiler"]
.sub "" :load :init :subid("post105") :outer("11_1308206306.49694")
.annotate 'line', 41
    .const 'Sub' $P1003 = "11_1308206306.49694" 
    .local pmc block
    set block, $P1003
.annotate 'line', 54
    get_hll_global $P3027, ["PAST"], "Compiler"
    $P3027."language"("PAST")
.annotate 'line', 55
    get_hll_global $P3028, ["PAST"], "Compiler"
    new $P3029, "ResizablePMCArray"
    push $P3029, "post"
    push $P3029, "pir"
    push $P3029, "evalpmc"
    $P3028."stages"($P3029)
.annotate 'line', 58
    new $P3030, "String"
    assign $P3030, "PP+"
    get_global $P3031, "%piropsig"
    unless_null $P3031, vivify_106
    $P3031 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3031
  vivify_106:
    set $P3031["add"], $P3030
.annotate 'line', 59
    new $P3032, "String"
    assign $P3032, "PPP"
    get_global $P3033, "%piropsig"
    unless_null $P3033, vivify_107
    $P3033 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3033
  vivify_107:
    set $P3033["band"], $P3032
.annotate 'line', 60
    new $P3034, "String"
    assign $P3034, "PPP"
    get_global $P3035, "%piropsig"
    unless_null $P3035, vivify_108
    $P3035 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3035
  vivify_108:
    set $P3035["bxor"], $P3034
.annotate 'line', 61
    new $P3036, "String"
    assign $P3036, "PP"
    get_global $P3037, "%piropsig"
    unless_null $P3037, vivify_109
    $P3037 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3037
  vivify_109:
    set $P3037["bnot"], $P3036
.annotate 'line', 62
    new $P3038, "String"
    assign $P3038, "PPP"
    get_global $P3039, "%piropsig"
    unless_null $P3039, vivify_110
    $P3039 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3039
  vivify_110:
    set $P3039["bor"], $P3038
.annotate 'line', 63
    new $P3040, "String"
    assign $P3040, "IPs"
    get_global $P3041, "%piropsig"
    unless_null $P3041, vivify_111
    $P3041 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3041
  vivify_111:
    set $P3041["can"], $P3040
.annotate 'line', 64
    new $P3042, "String"
    assign $P3042, "Si"
    get_global $P3043, "%piropsig"
    unless_null $P3043, vivify_112
    $P3043 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3043
  vivify_112:
    set $P3043["chr"], $P3042
.annotate 'line', 65
    new $P3044, "String"
    assign $P3044, "PP"
    get_global $P3045, "%piropsig"
    unless_null $P3045, vivify_113
    $P3045 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3045
  vivify_113:
    set $P3045["clone"], $P3044
.annotate 'line', 66
    new $P3046, "String"
    assign $P3046, "PP~"
    get_global $P3047, "%piropsig"
    unless_null $P3047, vivify_114
    $P3047 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3047
  vivify_114:
    set $P3047["concat"], $P3046
.annotate 'line', 67
    new $P3048, "String"
    assign $P3048, "0PP"
    get_global $P3049, "%piropsig"
    unless_null $P3049, vivify_115
    $P3049 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3049
  vivify_115:
    set $P3049["copy"], $P3048
.annotate 'line', 68
    new $P3050, "String"
    assign $P3050, "IP"
    get_global $P3051, "%piropsig"
    unless_null $P3051, vivify_116
    $P3051 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3051
  vivify_116:
    set $P3051["defined"], $P3050
.annotate 'line', 69
    new $P3052, "String"
    assign $P3052, "vQ*"
    get_global $P3053, "%piropsig"
    unless_null $P3053, vivify_117
    $P3053 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3053
  vivify_117:
    set $P3053["delete"], $P3052
.annotate 'line', 70
    new $P3054, "String"
    assign $P3054, "v~"
    get_global $P3055, "%piropsig"
    unless_null $P3055, vivify_118
    $P3055 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3055
  vivify_118:
    set $P3055["die"], $P3054
.annotate 'line', 71
    new $P3056, "String"
    assign $P3056, "PP+"
    get_global $P3057, "%piropsig"
    unless_null $P3057, vivify_119
    $P3057 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3057
  vivify_119:
    set $P3057["div"], $P3056
.annotate 'line', 72
    new $P3058, "String"
    assign $P3058, "IPs"
    get_global $P3059, "%piropsig"
    unless_null $P3059, vivify_120
    $P3059 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3059
  vivify_120:
    set $P3059["does"], $P3058
.annotate 'line', 73
    new $P3060, "String"
    assign $P3060, "Ss"
    get_global $P3061, "%piropsig"
    unless_null $P3061, vivify_121
    $P3061 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3061
  vivify_121:
    set $P3061["downcase"], $P3060
.annotate 'line', 74
    new $P3062, "String"
    assign $P3062, "IP"
    get_global $P3063, "%piropsig"
    unless_null $P3063, vivify_122
    $P3063 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3063
  vivify_122:
    set $P3063["elements"], $P3062
.annotate 'line', 75
    new $P3064, "String"
    assign $P3064, "IQ*"
    get_global $P3065, "%piropsig"
    unless_null $P3065, vivify_123
    $P3065 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3065
  vivify_123:
    set $P3065["exists"], $P3064
.annotate 'line', 76
    new $P3066, "String"
    assign $P3066, "vi"
    get_global $P3067, "%piropsig"
    unless_null $P3067, vivify_124
    $P3067 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3067
  vivify_124:
    set $P3067["exit"], $P3066
.annotate 'line', 77
    new $P3068, "String"
    assign $P3068, "PP+"
    get_global $P3069, "%piropsig"
    unless_null $P3069, vivify_125
    $P3069 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3069
  vivify_125:
    set $P3069["fdiv"], $P3068
.annotate 'line', 78
    new $P3070, "String"
    assign $P3070, "Is"
    get_global $P3071, "%piropsig"
    unless_null $P3071, vivify_126
    $P3071 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3071
  vivify_126:
    set $P3071["find_codepoint"], $P3070
.annotate 'line', 79
    new $P3072, "String"
    assign $P3072, "Ps"
    get_global $P3073, "%piropsig"
    unless_null $P3073, vivify_127
    $P3073 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3073
  vivify_127:
    set $P3073["find_dynamic_lex"], $P3072
.annotate 'line', 80
    new $P3074, "String"
    assign $P3074, "Ps"
    get_global $P3075, "%piropsig"
    unless_null $P3075, vivify_128
    $P3075 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3075
  vivify_128:
    set $P3075["find_name"], $P3074
.annotate 'line', 81
    new $P3076, "String"
    assign $P3076, "P"
    get_global $P3077, "%piropsig"
    unless_null $P3077, vivify_129
    $P3077 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3077
  vivify_129:
    set $P3077["getinterp"], $P3076
.annotate 'line', 82
    new $P3078, "String"
    assign $P3078, "P~P"
    get_global $P3079, "%piropsig"
    unless_null $P3079, vivify_130
    $P3079 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3079
  vivify_130:
    set $P3079["getprop"], $P3078
.annotate 'line', 83
    new $P3080, "String"
    assign $P3080, "P"
    get_global $P3081, "%piropsig"
    unless_null $P3081, vivify_131
    $P3081 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3081
  vivify_131:
    set $P3081["getstderr"], $P3080
.annotate 'line', 84
    new $P3082, "String"
    assign $P3082, "P"
    get_global $P3083, "%piropsig"
    unless_null $P3083, vivify_132
    $P3083 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3083
  vivify_132:
    set $P3083["getstdin"], $P3082
.annotate 'line', 85
    new $P3084, "String"
    assign $P3084, "P"
    get_global $P3085, "%piropsig"
    unless_null $P3085, vivify_133
    $P3085 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3085
  vivify_133:
    set $P3085["getstdout"], $P3084
.annotate 'line', 86
    new $P3086, "String"
    assign $P3086, "Issi"
    get_global $P3087, "%piropsig"
    unless_null $P3087, vivify_134
    $P3087 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3087
  vivify_134:
    set $P3087["index"], $P3086
.annotate 'line', 87
    new $P3088, "String"
    assign $P3088, "IP~"
    get_global $P3089, "%piropsig"
    unless_null $P3089, vivify_135
    $P3089 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3089
  vivify_135:
    set $P3089["isa"], $P3088
.annotate 'line', 88
    new $P3090, "String"
    assign $P3090, "IP"
    get_global $P3091, "%piropsig"
    unless_null $P3091, vivify_136
    $P3091 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3091
  vivify_136:
    set $P3091["isfalse"], $P3090
.annotate 'line', 89
    new $P3092, "String"
    assign $P3092, "IP"
    get_global $P3093, "%piropsig"
    unless_null $P3093, vivify_137
    $P3093 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3093
  vivify_137:
    set $P3093["isnull"], $P3092
.annotate 'line', 90
    new $P3094, "String"
    assign $P3094, "IPP"
    get_global $P3095, "%piropsig"
    unless_null $P3095, vivify_138
    $P3095 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3095
  vivify_138:
    set $P3095["issame"], $P3094
.annotate 'line', 91
    new $P3096, "String"
    assign $P3096, "IP"
    get_global $P3097, "%piropsig"
    unless_null $P3097, vivify_139
    $P3097 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3097
  vivify_139:
    set $P3097["istrue"], $P3096
.annotate 'line', 92
    new $P3098, "String"
    assign $P3098, "SsP"
    get_global $P3099, "%piropsig"
    unless_null $P3099, vivify_140
    $P3099 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3099
  vivify_140:
    set $P3099["join"], $P3098
.annotate 'line', 93
    new $P3100, "String"
    assign $P3100, "Is"
    get_global $P3101, "%piropsig"
    unless_null $P3101, vivify_141
    $P3101 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3101
  vivify_141:
    set $P3101["length"], $P3100
.annotate 'line', 94
    new $P3102, "String"
    assign $P3102, "vs"
    get_global $P3103, "%piropsig"
    unless_null $P3103, vivify_142
    $P3103 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3103
  vivify_142:
    set $P3103["load_bytecode"], $P3102
.annotate 'line', 95
    new $P3104, "String"
    assign $P3104, "vs"
    get_global $P3105, "%piropsig"
    unless_null $P3105, vivify_143
    $P3105 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3105
  vivify_143:
    set $P3105["load_language"], $P3104
.annotate 'line', 96
    new $P3106, "String"
    assign $P3106, "P~"
    get_global $P3107, "%piropsig"
    unless_null $P3107, vivify_144
    $P3107 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3107
  vivify_144:
    set $P3107["loadlib"], $P3106
.annotate 'line', 97
    new $P3108, "String"
    assign $P3108, "PP+"
    get_global $P3109, "%piropsig"
    unless_null $P3109, vivify_145
    $P3109 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3109
  vivify_145:
    set $P3109["mod"], $P3108
.annotate 'line', 98
    new $P3110, "String"
    assign $P3110, "PP+"
    get_global $P3111, "%piropsig"
    unless_null $P3111, vivify_146
    $P3111 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3111
  vivify_146:
    set $P3111["mul"], $P3110
.annotate 'line', 99
    new $P3112, "String"
    assign $P3112, "PP"
    get_global $P3113, "%piropsig"
    unless_null $P3113, vivify_147
    $P3113 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3113
  vivify_147:
    set $P3113["neg"], $P3112
.annotate 'line', 100
    new $P3114, "String"
    assign $P3114, "P~"
    get_global $P3115, "%piropsig"
    unless_null $P3115, vivify_148
    $P3115 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3115
  vivify_148:
    set $P3115["new"], $P3114
.annotate 'line', 101
    new $P3116, "String"
    assign $P3116, "PP"
    get_global $P3117, "%piropsig"
    unless_null $P3117, vivify_149
    $P3117 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3117
  vivify_149:
    set $P3117["newclosure"], $P3116
.annotate 'line', 102
    new $P3118, "String"
    assign $P3118, "PP"
    get_global $P3119, "%piropsig"
    unless_null $P3119, vivify_150
    $P3119 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3119
  vivify_150:
    set $P3119["not"], $P3118
.annotate 'line', 103
    new $P3120, "String"
    assign $P3120, "Isi"
    get_global $P3121, "%piropsig"
    unless_null $P3121, vivify_151
    $P3121 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3121
  vivify_151:
    set $P3121["ord"], $P3120
.annotate 'line', 104
    new $P3122, "String"
    assign $P3122, "PP"
    get_global $P3123, "%piropsig"
    unless_null $P3123, vivify_152
    $P3123 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3123
  vivify_152:
    set $P3123["pop"], $P3122
.annotate 'line', 105
    new $P3124, "String"
    assign $P3124, "NN+"
    get_global $P3125, "%piropsig"
    unless_null $P3125, vivify_153
    $P3125 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3125
  vivify_153:
    set $P3125["pow"], $P3124
.annotate 'line', 106
    new $P3126, "String"
    assign $P3126, "v*"
    get_global $P3127, "%piropsig"
    unless_null $P3127, vivify_154
    $P3127 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3127
  vivify_154:
    set $P3127["print"], $P3126
.annotate 'line', 107
    new $P3128, "String"
    assign $P3128, "v*"
    get_global $P3129, "%piropsig"
    unless_null $P3129, vivify_155
    $P3129 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3129
  vivify_155:
    set $P3129["printerr"], $P3128
.annotate 'line', 108
    new $P3130, "String"
    assign $P3130, "0P*"
    get_global $P3131, "%piropsig"
    unless_null $P3131, vivify_156
    $P3131 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3131
  vivify_156:
    set $P3131["push"], $P3130
.annotate 'line', 109
    new $P3132, "String"
    assign $P3132, "Ssi"
    get_global $P3133, "%piropsig"
    unless_null $P3133, vivify_157
    $P3133 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3133
  vivify_157:
    set $P3133["repeat"], $P3132
.annotate 'line', 110
    new $P3134, "String"
    assign $P3134, "Ssiis"
    get_global $P3135, "%piropsig"
    unless_null $P3135, vivify_158
    $P3135 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3135
  vivify_158:
    set $P3135["replace"], $P3134
.annotate 'line', 111
    new $P3136, "String"
    assign $P3136, "v*"
    get_global $P3137, "%piropsig"
    unless_null $P3137, vivify_159
    $P3137 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3137
  vivify_159:
    set $P3137["say"], $P3136
.annotate 'line', 112
    new $P3138, "String"
    assign $P3138, "PP"
    get_global $P3139, "%piropsig"
    unless_null $P3139, vivify_160
    $P3139 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3139
  vivify_160:
    set $P3139["set"], $P3138
.annotate 'line', 113
    new $P3140, "String"
    assign $P3140, "0P~P"
    get_global $P3141, "%piropsig"
    unless_null $P3141, vivify_161
    $P3141 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3141
  vivify_161:
    set $P3141["setprop"], $P3140
.annotate 'line', 114
    new $P3142, "String"
    assign $P3142, "0P~P"
    get_global $P3143, "%piropsig"
    unless_null $P3143, vivify_162
    $P3143 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3143
  vivify_162:
    set $P3143["setattribute"], $P3142
.annotate 'line', 115
    new $P3144, "String"
    assign $P3144, "PP"
    get_global $P3145, "%piropsig"
    unless_null $P3145, vivify_163
    $P3145 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3145
  vivify_163:
    set $P3145["shift"], $P3144
.annotate 'line', 116
    new $P3146, "String"
    assign $P3146, "PP+"
    get_global $P3147, "%piropsig"
    unless_null $P3147, vivify_164
    $P3147 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3147
  vivify_164:
    set $P3147["shl"], $P3146
.annotate 'line', 117
    new $P3148, "String"
    assign $P3148, "PP+"
    get_global $P3149, "%piropsig"
    unless_null $P3149, vivify_165
    $P3149 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3149
  vivify_165:
    set $P3149["shr"], $P3148
.annotate 'line', 118
    new $P3150, "String"
    assign $P3150, "v+"
    get_global $P3151, "%piropsig"
    unless_null $P3151, vivify_166
    $P3151 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3151
  vivify_166:
    set $P3151["sleep"], $P3150
.annotate 'line', 119
    new $P3152, "String"
    assign $P3152, "0PPii"
    get_global $P3153, "%piropsig"
    unless_null $P3153, vivify_167
    $P3153 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3153
  vivify_167:
    set $P3153["splice"], $P3152
.annotate 'line', 120
    new $P3154, "String"
    assign $P3154, "Pss"
    get_global $P3155, "%piropsig"
    unless_null $P3155, vivify_168
    $P3155 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3155
  vivify_168:
    set $P3155["split"], $P3154
.annotate 'line', 121
    new $P3156, "String"
    assign $P3156, "PP+"
    get_global $P3157, "%piropsig"
    unless_null $P3157, vivify_169
    $P3157 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3157
  vivify_169:
    set $P3157["sub"], $P3156
.annotate 'line', 122
    new $P3158, "String"
    assign $P3158, "Ssii"
    get_global $P3159, "%piropsig"
    unless_null $P3159, vivify_170
    $P3159 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3159
  vivify_170:
    set $P3159["substr"], $P3158
.annotate 'line', 123
    new $P3160, "String"
    assign $P3160, "Ss"
    get_global $P3161, "%piropsig"
    unless_null $P3161, vivify_171
    $P3161 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3161
  vivify_171:
    set $P3161["titlecase"], $P3160
.annotate 'line', 124
    new $P3162, "String"
    assign $P3162, "vi"
    get_global $P3163, "%piropsig"
    unless_null $P3163, vivify_172
    $P3163 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3163
  vivify_172:
    set $P3163["trace"], $P3162
.annotate 'line', 125
    new $P3164, "String"
    assign $P3164, "SP"
    get_global $P3165, "%piropsig"
    unless_null $P3165, vivify_173
    $P3165 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3165
  vivify_173:
    set $P3165["typeof"], $P3164
.annotate 'line', 126
    new $P3166, "String"
    assign $P3166, "0P*"
    get_global $P3167, "%piropsig"
    unless_null $P3167, vivify_174
    $P3167 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3167
  vivify_174:
    set $P3167["unshift"], $P3166
.annotate 'line', 127
    new $P3168, "String"
    assign $P3168, "Ss"
    get_global $P3169, "%piropsig"
    unless_null $P3169, vivify_175
    $P3169 = root_new ['parrot';'Hash']
    set_global "%piropsig", $P3169
  vivify_175:
    set $P3169["upcase"], $P3168
.annotate 'line', 132
    new $P3170, "String"
    assign $P3170, "s~*:e"
    get_global $P3171, "%valflags"
    unless_null $P3171, vivify_176
    $P3171 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3171
  vivify_176:
    set $P3171["String"], $P3170
.annotate 'line', 133
    new $P3172, "String"
    assign $P3172, "i+*:"
    get_global $P3173, "%valflags"
    unless_null $P3173, vivify_177
    $P3173 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3173
  vivify_177:
    set $P3173["Integer"], $P3172
.annotate 'line', 134
    new $P3174, "String"
    assign $P3174, "n+*:"
    get_global $P3175, "%valflags"
    unless_null $P3175, vivify_178
    $P3175 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3175
  vivify_178:
    set $P3175["Float"], $P3174
.annotate 'line', 135
    new $P3176, "String"
    assign $P3176, "i+*:c"
    get_global $P3177, "%valflags"
    unless_null $P3177, vivify_179
    $P3177 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3177
  vivify_179:
    set $P3177["!macro_const"], $P3176
.annotate 'line', 136
    new $P3178, "String"
    assign $P3178, "i+*:c"
    get_global $P3179, "%valflags"
    unless_null $P3179, vivify_180
    $P3179 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3179
  vivify_180:
    set $P3179["!cclass"], $P3178
.annotate 'line', 137
    new $P3180, "String"
    assign $P3180, "i+*:c"
    get_global $P3181, "%valflags"
    unless_null $P3181, vivify_181
    $P3181 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3181
  vivify_181:
    set $P3181["!except_severity"], $P3180
.annotate 'line', 138
    new $P3182, "String"
    assign $P3182, "i+*:c"
    get_global $P3183, "%valflags"
    unless_null $P3183, vivify_182
    $P3183 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3183
  vivify_182:
    set $P3183["!except_types"], $P3182
.annotate 'line', 139
    new $P3184, "String"
    assign $P3184, "i+*:c"
    get_global $P3185, "%valflags"
    unless_null $P3185, vivify_183
    $P3185 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3185
  vivify_183:
    set $P3185["!iterator"], $P3184
.annotate 'line', 140
    new $P3186, "String"
    assign $P3186, "i+*:c"
    get_global $P3187, "%valflags"
    unless_null $P3187, vivify_184
    $P3187 = root_new ['parrot';'Hash']
    set_global "%valflags", $P3187
  vivify_184:
    set $P3187["!socket"], $P3186
.annotate 'line', 144
    new $P3188, "String"
    assign $P3188, ".CONTROL_RETURN, .CONTROL_OK, .CONTROL_BREAK, .CONTROL_CONTINUE, .CONTROL_TAKE, .CONTROL_LEAVE, .CONTROL_EXIT, .CONTROL_LOOP_NEXT, .CONTROL_LOOP_LAST, .CONTROL_LOOP_REDO"
    get_global $P3189, "%controltypes"
    unless_null $P3189, vivify_185
    $P3189 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3189
  vivify_185:
    set $P3189["CONTROL"], $P3188
.annotate 'line', 145
    new $P3190, "String"
    assign $P3190, ".CONTROL_RETURN"
    get_global $P3191, "%controltypes"
    unless_null $P3191, vivify_186
    $P3191 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3191
  vivify_186:
    set $P3191["RETURN"], $P3190
.annotate 'line', 146
    new $P3192, "String"
    assign $P3192, ".CONTROL_OK"
    get_global $P3193, "%controltypes"
    unless_null $P3193, vivify_187
    $P3193 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3193
  vivify_187:
    set $P3193["OK"], $P3192
.annotate 'line', 147
    new $P3194, "String"
    assign $P3194, ".CONTROL_BREAK"
    get_global $P3195, "%controltypes"
    unless_null $P3195, vivify_188
    $P3195 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3195
  vivify_188:
    set $P3195["BREAK"], $P3194
.annotate 'line', 148
    new $P3196, "String"
    assign $P3196, ".CONTROL_CONTINUE"
    get_global $P3197, "%controltypes"
    unless_null $P3197, vivify_189
    $P3197 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3197
  vivify_189:
    set $P3197["CONTINUE"], $P3196
.annotate 'line', 149
    new $P3198, "String"
    assign $P3198, ".CONTROL_ERROR"
    get_global $P3199, "%controltypes"
    unless_null $P3199, vivify_190
    $P3199 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3199
  vivify_190:
    set $P3199["ERROR"], $P3198
.annotate 'line', 150
    new $P3200, "String"
    assign $P3200, ".CONTROL_TAKE"
    get_global $P3201, "%controltypes"
    unless_null $P3201, vivify_191
    $P3201 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3201
  vivify_191:
    set $P3201["GATHER"], $P3200
.annotate 'line', 151
    new $P3202, "String"
    assign $P3202, ".CONTROL_LEAVE"
    get_global $P3203, "%controltypes"
    unless_null $P3203, vivify_192
    $P3203 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3203
  vivify_192:
    set $P3203["LEAVE"], $P3202
.annotate 'line', 152
    new $P3204, "String"
    assign $P3204, ".CONTROL_EXIT"
    get_global $P3205, "%controltypes"
    unless_null $P3205, vivify_193
    $P3205 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3205
  vivify_193:
    set $P3205["EXIT"], $P3204
.annotate 'line', 153
    new $P3206, "String"
    assign $P3206, ".CONTROL_NEXT"
    get_global $P3207, "%controltypes"
    unless_null $P3207, vivify_194
    $P3207 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3207
  vivify_194:
    set $P3207["NEXT"], $P3206
.annotate 'line', 154
    new $P3208, "String"
    assign $P3208, ".CONTROL_LAST"
    get_global $P3209, "%controltypes"
    unless_null $P3209, vivify_195
    $P3209 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3209
  vivify_195:
    set $P3209["LAST"], $P3208
.annotate 'line', 155
    new $P3210, "String"
    assign $P3210, ".CONTROL_REDO"
    get_global $P3211, "%controltypes"
    unless_null $P3211, vivify_196
    $P3211 = root_new ['parrot';'Hash']
    set_global "%controltypes", $P3211
  vivify_196:
    set $P3211["REDO"], $P3210
.annotate 'line', 160
    new $P3212, "Integer"
    assign $P3212, 100
    set_global "$TEMPREG_BASE", $P3212
.annotate 'line', 161
    new $P3213, "Integer"
    assign $P3213, 1000
    set_global "$UNIQUE_BASE", $P3213
.annotate 'line', 164
    get_global $P3214, "$UNIQUE_BASE"
    clone $P3215, $P3214
    set_global "$serno", $P3215
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("12_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1011
    .param pmc param_1012 :slurpy :named
.annotate 'line', 174
    .const 'Sub' $P1021 = "13_1308206306.49694" 
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
    new $P111, "Undef"
    set $P1015, $P111
    .lex "$*SUB", $P1015
.annotate 'line', 183
    $P1017 = root_new ['parrot';'Hash']
    set $P1016, $P1017
    .lex "%tempregs", $P1016
.annotate 'line', 175
    $P1018 = root_new ['parrot';'Hash']
    find_lex $P112, "self"
    setattribute $P112, "%!symtable", $P1018
.annotate 'line', 177
    get_global $P113, "@?BLOCK"
    defined $I114, $P113
    if $I114, unless_1019_end
.annotate 'line', 178
    new $P115, "ResizablePMCArray"
    set_global "@?BLOCK", $P115
  unless_1019_end:
.annotate 'line', 181
    get_global $P116, "@?BLOCK"
    store_lex "@*BLOCKPAST", $P116
    find_lex $P117, "$*SUB"
    unless_null $P117, vivify_204
    get_hll_global $P117, "$SUB"
    unless_null $P117, vivify_205
    die "Contextual $*SUB not found"
  vivify_205:
  vivify_204:
.annotate 'line', 183
    find_dynamic_lex $P118, "%*TEMPREGS"
    store_lex "%tempregs", $P118
.annotate 'line', 185
    .const 'Sub' $P1021 = "13_1308206306.49694" 
    capture_lex $P1021
    $P128 = $P1021()
.annotate 'line', 174
    .return ($P128)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1020"  :anon :subid("13_1308206306.49694") :outer("12_1308206306.49694")
.annotate 'line', 186
    $P1023 = root_new ['parrot';'Hash']
    set $P1022, $P1023
    .lex "%*TEMPREGS", $P1022
.annotate 'line', 185
    find_lex $P119, "%*TEMPREGS"
    unless_null $P119, vivify_206
    get_hll_global $P119, "%TEMPREGS"
    unless_null $P119, vivify_207
    die "Contextual %*TEMPREGS not found"
  vivify_207:
  vivify_206:
.annotate 'line', 187
    find_lex $P120, "%tempregs"
    defined $I121, $P120
    if $I121, if_1024
.annotate 'line', 191
    find_lex $P123, "self"
    $P124 = $P123."tempreg_frame"()
    store_lex "%*TEMPREGS", $P124
.annotate 'line', 190
    goto if_1024_end
  if_1024:
.annotate 'line', 188
    find_lex $P122, "%tempregs"
    store_lex "%*TEMPREGS", $P122
  if_1024_end:
.annotate 'line', 194
    find_lex $P125, "self"
    find_lex $P126, "$past"
    $P127 = $P125."as_post"($P126, "v" :named("rtype"))
.annotate 'line', 185
    .return ($P127)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("14_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1028
.annotate 'line', 201
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$str", param_1028
.annotate 'line', 202
    new $P130, "Undef"
    set $P1029, $P130
    .lex "$estr", $P1029
    find_lex $P131, "$str"
    set $S132, $P131
    escape $S133, $S132
    new $P134, 'String'
    set $P134, $S133
    store_lex "$estr", $P134
.annotate 'line', 203
    find_lex $P136, "$estr"
    set $S137, $P136
    index $I138, $S137, unicode:"\\x"
    set $N139, $I138
    isge $I140, $N139, 0.0
    unless $I140, unless_1031
    new $P135, 'Integer'
    set $P135, $I140
    goto unless_1031_end
  unless_1031:
    find_lex $P141, "$estr"
    set $S142, $P141
    index $I143, $S142, unicode:"\\u"
    set $N144, $I143
    isgt $I145, $N144, 0.0
    new $P135, 'Integer'
    set $P135, $I145
  unless_1031_end:
    if $P135, if_1030
.annotate 'line', 207
    new $P149, "String"
    assign $P149, "\""
    find_lex $P150, "$estr"
    concat $P151, $P149, $P150
    store_lex "$estr", $P151
.annotate 'line', 206
    goto if_1030_end
  if_1030:
.annotate 'line', 204
    new $P146, "String"
    assign $P146, "unicode:\""
    find_lex $P147, "$estr"
    concat $P148, $P146, $P147
    store_lex "$estr", $P148
  if_1030_end:
.annotate 'line', 209
    find_lex $P152, "$estr"
    concat $P153, $P152, "\""
    store_lex "$estr", $P153
.annotate 'line', 201
    .return ($P153)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unique"  :subid("15_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1035 :optional
    .param int has_param_1035 :opt_flag
.annotate 'line', 217
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    if has_param_1035, optparam_208
    new $P155, "Undef"
    set param_1035, $P155
  optparam_208:
    .lex "$fmt", param_1035
.annotate 'line', 218
    find_lex $P156, "$fmt"
    defined $I157, $P156
    if $I157, unless_1036_end
    new $P158, "String"
    assign $P158, ""
    store_lex "$fmt", $P158
  unless_1036_end:
.annotate 'line', 219
    find_lex $P159, "$fmt"
    get_global $P160, "$serno"
    clone $P1037, $P160
    inc $P160
    concat $P161, $P159, $P1037
    store_lex "$fmt", $P161
.annotate 'line', 217
    .return ($P161)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "uniquereg"  :subid("16_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1041
.annotate 'line', 226
    new $P1040, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1040, control_1039
    push_eh $P1040
    .lex "self", self
    .lex "$rtype", param_1041
.annotate 'line', 231
    new $P163, "Undef"
    set $P1042, $P163
    .lex "$i", $P1042
.annotate 'line', 227
    find_lex $P164, "$rtype"
    if $P164, unless_1043_end
    find_lex $P165, "self"
    $P165."panic"("rtype not set")
  unless_1043_end:
.annotate 'line', 229
    find_lex $P166, "$rtype"
    set $S167, $P166
    iseq $I168, $S167, "v"
    unless $I168, if_1044_end
    new $P169, "Exception"
    set $P169['type'], .CONTROL_RETURN
    new $P170, "String"
    assign $P170, ""
    setattribute $P169, 'payload', $P170
    throw $P169
  if_1044_end:
.annotate 'line', 231
    find_lex $P171, "$rtype"
    set $S172, $P171
    index $I173, "Ss~Nn+Ii", $S172
    new $P174, 'Integer'
    set $P174, $I173
    store_lex "$i", $P174
.annotate 'line', 232
    new $P175, "String"
    assign $P175, "P"
    store_lex "$rtype", $P175
.annotate 'line', 233
    find_lex $P176, "$i"
    set $N177, $P176
    islt $I178, $N177, 0.0
    if $I178, unless_1045_end
    find_lex $P179, "$i"
    set $I180, $P179
    substr $S181, "SSSNNNII", $I180, 1
    new $P182, 'String'
    set $P182, $S181
    store_lex "$rtype", $P182
  unless_1045_end:
.annotate 'line', 234
    new $P183, "String"
    assign $P183, "$"
    find_lex $P184, "$rtype"
    concat $P185, $P183, $P184
    store_lex "$rtype", $P185
.annotate 'line', 236
    find_lex $P186, "self"
    find_lex $P187, "$rtype"
    $P188 = $P186."unique"($P187)
.annotate 'line', 226
    .return ($P188)
  control_1039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg_frame"  :subid("17_1308206306.49694") :method :outer("11_1308206306.49694")
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
    find_lex $P190, "%tempregs"
.annotate 'line', 245
    get_global $P191, "$TEMPREG_BASE"
    find_lex $P1051, "%tempregs"
    unless_null $P1051, vivify_209
    $P1051 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1051
  vivify_209:
    set $P1051["I"], $P191
.annotate 'line', 246
    get_global $P192, "$TEMPREG_BASE"
    find_lex $P1052, "%tempregs"
    unless_null $P1052, vivify_210
    $P1052 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1052
  vivify_210:
    set $P1052["N"], $P192
.annotate 'line', 247
    get_global $P193, "$TEMPREG_BASE"
    find_lex $P1053, "%tempregs"
    unless_null $P1053, vivify_211
    $P1053 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1053
  vivify_211:
    set $P1053["S"], $P193
.annotate 'line', 248
    get_global $P194, "$TEMPREG_BASE"
    find_lex $P1054, "%tempregs"
    unless_null $P1054, vivify_212
    $P1054 = root_new ['parrot';'Hash']
    store_lex "%tempregs", $P1054
  vivify_212:
    set $P1054["P"], $P194
    find_lex $P195, "%tempregs"
.annotate 'line', 243
    .return ($P195)
  control_1047:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "tempreg"  :subid("18_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1058
.annotate 'line', 267
    new $P1057, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1057, control_1056
    push_eh $P1057
    .lex "self", self
    .lex "$rtype", param_1058
.annotate 'line', 272
    new $P197, "Undef"
    set $P1059, $P197
    .lex "$I0", $P1059
.annotate 'line', 279
    new $P198, "Undef"
    set $P1060, $P198
    .lex "$reg", $P1060
.annotate 'line', 280
    new $P199, "Undef"
    set $P1061, $P199
    .lex "$rnum", $P1061
.annotate 'line', 268
    find_lex $P200, "$rtype"
    if $P200, unless_1062_end
    find_lex $P201, "self"
    $P201."panic"("rtype not set")
  unless_1062_end:
.annotate 'line', 270
    find_lex $P202, "$rtype"
    set $S203, $P202
    iseq $I204, $S203, "v"
    unless $I204, if_1063_end
    new $P205, "Exception"
    set $P205['type'], .CONTROL_RETURN
    new $P206, "String"
    assign $P206, ""
    setattribute $P205, 'payload', $P206
    throw $P205
  if_1063_end:
.annotate 'line', 272
    find_lex $P207, "$rtype"
    set $S208, $P207
    index $I209, "Ss~Nn+Ii", $S208
    new $P210, 'Integer'
    set $P210, $I209
    store_lex "$I0", $P210
.annotate 'line', 273
    new $P211, "String"
    assign $P211, "P"
    store_lex "$rtype", $P211
.annotate 'line', 274
    find_lex $P212, "$I0"
    set $N213, $P212
    islt $I214, $N213, 0.0
    if $I214, unless_1064_end
    find_lex $P215, "$I0"
    set $I216, $P215
    substr $S217, "SSSNNNII", $I216, 1
    new $P218, 'String'
    set $P218, $S217
    store_lex "$rtype", $P218
  unless_1064_end:
.annotate 'line', 277
    find_dynamic_lex $P219, "%*TEMPREGS"
    unless_null $P219, vivify_213
    get_hll_global $P219, "%TEMPREGS"
    unless_null $P219, vivify_214
    die "Contextual %*TEMPREGS not found"
  vivify_214:
  vivify_213:
    if $P219, unless_1065_end
    new $P220, "Exception"
    set $P220['type'], .CONTROL_RETURN
    find_lex $P221, "self"
    new $P222, "String"
    assign $P222, "$"
    find_lex $P223, "$rtype"
    concat $P224, $P222, $P223
    $P225 = $P221."unique"($P224)
    setattribute $P220, 'payload', $P225
    throw $P220
  unless_1065_end:
    find_lex $P226, "$reg"
.annotate 'line', 280
    find_lex $P227, "$rtype"
    find_dynamic_lex $P228, "%*TEMPREGS"
    unless_null $P228, vivify_215
    get_hll_global $P228, "%TEMPREGS"
    unless_null $P228, vivify_216
    die "Contextual %*TEMPREGS not found"
  vivify_216:
  vivify_215:
    set $P229, $P228[$P227]
    unless_null $P229, vivify_217
    new $P229, "Undef"
  vivify_217:
    store_lex "$rnum", $P229
.annotate 'line', 281
    new $P253, 'ExceptionHandler'
    set_label $P253, loop1068_handler
    $P253."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P253
    goto loop1068_redo
  loop1068_test:
    find_lex $P230, "$reg"
    find_dynamic_lex $P231, "%*TEMPREGS"
    unless_null $P231, vivify_218
    get_hll_global $P231, "%TEMPREGS"
    unless_null $P231, vivify_219
    die "Contextual %*TEMPREGS not found"
  vivify_219:
  vivify_218:
    set $P232, $P231[$P230]
    unless_null $P232, vivify_220
    new $P232, "Undef"
  vivify_220:
    unless $P232, loop1068_done
  loop1068_redo:
.annotate 'line', 283
    find_lex $P233, "$rnum"
    set $N234, $P233
    get_global $P235, "$UNIQUE_BASE"
    set $N236, $P235
    isge $I237, $N234, $N236
    unless $I237, if_1066_end
    new $P238, "Exception"
    set $P238['type'], .CONTROL_RETURN
    find_lex $P239, "self"
    new $P240, "String"
    assign $P240, "$"
    find_lex $P241, "$rtype"
    concat $P242, $P240, $P241
    $P243 = $P239."unique"($P242)
    setattribute $P238, 'payload', $P243
    throw $P238
  if_1066_end:
    find_lex $P244, "$rnum"
    clone $P1067, $P244
    inc $P244
.annotate 'line', 286
    find_lex $P245, "$rnum"
    find_lex $P246, "$rtype"
    find_dynamic_lex $P247, "%*TEMPREGS"
    unless_null $P247, vivify_221
    get_hll_global $P247, "%TEMPREGS"
    unless_null $P247, vivify_222
    die "Contextual %*TEMPREGS not found"
  vivify_222:
    store_dynamic_lex "%*TEMPREGS", $P247
  vivify_221:
    set $P247[$P246], $P245
.annotate 'line', 287
    new $P248, "String"
    assign $P248, "$"
    find_lex $P249, "$rtype"
    concat $P250, $P248, $P249
    find_lex $P251, "$rnum"
    concat $P252, $P250, $P251
    store_lex "$reg", $P252
  loop1068_next:
.annotate 'line', 281
    goto loop1068_test
  loop1068_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P254, exception, 'type'
    eq $P254, .CONTROL_LOOP_NEXT, loop1068_next
    eq $P254, .CONTROL_LOOP_REDO, loop1068_redo
  loop1068_done:
    pop_eh 
    find_lex $P255, "$reg"
.annotate 'line', 267
    .return ($P255)
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P256, exception, "payload"
    .return ($P256)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "coerce"  :subid("19_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1072
    .param pmc param_1073
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
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "post_children"  :subid("20_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1077
    .param pmc param_1078 :slurpy :named
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
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("21_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,_)
    .param pmc param_1082
    .param pmc param_1083 :slurpy :named
.annotate 'line', 576
    new $P1081, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1081, control_1080
    push_eh $P1081
    .lex "self", self
    .lex "$node", param_1082
    .lex "%options", param_1083
.annotate 'line', 577
    new $P259, "Undef"
    set $P1084, $P259
    .lex "$what", $P1084
.annotate 'line', 576
    find_lex $P260, "$what"
.annotate 'line', 579
    find_lex $P261, "$node"
    isnull $I262, $P261
    if $I262, if_1085
.annotate 'line', 583
    new $P264, "String"
    assign $P264, "node of type "
    find_lex $P265, "$node"
    typeof $S266, $P265
    concat $P267, $P264, $S266
    store_lex "$what", $P267
.annotate 'line', 582
    goto if_1085_end
  if_1085:
.annotate 'line', 580
    new $P263, "String"
    assign $P263, "a null node"
    store_lex "$what", $P263
  if_1085_end:
.annotate 'line', 586
    find_lex $P268, "self"
    new $P269, "String"
    assign $P269, "PAST::Compiler can't compile "
    find_lex $P270, "$what"
    concat $P271, $P269, $P270
    $P272 = $P268."panic"($P271)
.annotate 'line', 576
    .return ($P272)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P273, exception, "payload"
    .return ($P273)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("22_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["Undef"])
    .param pmc param_1089
    .param pmc param_1090 :slurpy :named
.annotate 'line', 592
    new $P1088, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1088, control_1087
    push_eh $P1088
    .lex "self", self
    .lex "$node", param_1089
    .lex "%options", param_1090
.annotate 'line', 593
    get_hll_global $P274, ["POST"], "Ops"
    find_lex $P275, "self"
    $P276 = $P275."tempreg"("P")
    $P277 = $P274."new"($P276 :named("result"))
.annotate 'line', 592
    .return ($P277)
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, "payload"
    .return ($P278)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("23_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["Integer"])
    .param pmc param_1094
    .param pmc param_1095 :slurpy :named
.annotate 'line', 603
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$node", param_1094
    .lex "%options", param_1095
.annotate 'line', 604
    find_lex $P279, "self"
    get_hll_global $P280, ["POST"], "Ops"
    find_lex $P281, "$node"
    $P282 = $P280."new"($P281 :named("result"))
    find_lex $P1096, "%options"
    unless_null $P1096, vivify_223
    $P1096 = root_new ['parrot';'Hash']
  vivify_223:
    set $P283, $P1096["rtype"]
    unless_null $P283, vivify_224
    new $P283, "Undef"
  vivify_224:
    $P284 = $P279."coerce"($P282, $P283)
.annotate 'line', 603
    .return ($P284)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("24_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["Float"])
    .param pmc param_1100
    .param pmc param_1101 :slurpy :named
.annotate 'line', 607
    new $P1099, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1099, control_1098
    push_eh $P1099
    .lex "self", self
    .lex "$node", param_1100
    .lex "%options", param_1101
.annotate 'line', 608
    find_lex $P286, "self"
    get_hll_global $P287, ["POST"], "Ops"
    find_lex $P288, "$node"
    $P289 = $P287."new"($P288 :named("result"))
    find_lex $P1102, "%options"
    unless_null $P1102, vivify_225
    $P1102 = root_new ['parrot';'Hash']
  vivify_225:
    set $P290, $P1102["rtype"]
    unless_null $P290, vivify_226
    new $P290, "Undef"
  vivify_226:
    $P291 = $P286."coerce"($P289, $P290)
.annotate 'line', 607
    .return ($P291)
  control_1098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P292, exception, "payload"
    .return ($P292)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("25_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["String"])
    .param pmc param_1106
    .param pmc param_1107 :slurpy :named
.annotate 'line', 611
    new $P1105, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1105, control_1104
    push_eh $P1105
    .lex "self", self
    .lex "$node", param_1106
    .lex "%options", param_1107
.annotate 'line', 612
    new $P293, "Undef"
    set $P1108, $P293
    .lex "$value", $P1108
    find_lex $P294, "self"
    find_lex $P295, "$node"
    $P296 = $P294."escape"($P295)
    store_lex "$value", $P296
.annotate 'line', 613
    find_lex $P297, "self"
    get_hll_global $P298, ["POST"], "Ops"
    find_lex $P299, "$value"
    $P300 = $P298."new"($P299 :named("result"))
    find_lex $P1109, "%options"
    unless_null $P1109, vivify_227
    $P1109 = root_new ['parrot';'Hash']
  vivify_227:
    set $P301, $P1109["rtype"]
    unless_null $P301, vivify_228
    new $P301, "Undef"
  vivify_228:
    $P302 = $P297."coerce"($P300, $P301)
.annotate 'line', 611
    .return ($P302)
  control_1104:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, "payload"
    .return ($P303)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("26_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["String"])
    .param pmc param_1113
    .param pmc param_1114 :slurpy :named
.annotate 'line', 622
    new $P1112, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1112, control_1111
    push_eh $P1112
    .lex "self", self
    .lex "$node", param_1113
    .lex "%options", param_1114
.annotate 'line', 623
    new $P304, "Undef"
    set $P1115, $P304
    .lex "$result", $P1115
.annotate 'line', 624
    new $P305, "Undef"
    set $P1116, $P305
    .lex "$s", $P1116
.annotate 'line', 623
    find_lex $P306, "self"
    $P307 = $P306."tempreg"("P")
    store_lex "$result", $P307
.annotate 'line', 624
    find_lex $P308, "self"
    find_lex $P309, "$node"
    $P310 = $P308."escape"($P309)
    store_lex "$s", $P310
.annotate 'line', 625
    get_hll_global $P311, ["POST"], "Op"
    find_lex $P312, "$result"
    find_lex $P313, "$s"
    find_lex $P314, "$result"
    $P315 = $P311."new"($P312, $P313, "new" :named("pirop"), $P314 :named("result"))
.annotate 'line', 622
    .return ($P315)
  control_1111:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P316, exception, "payload"
    .return ($P316)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_vivipost"  :subid("27_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,_)
    .param pmc param_1120
    .param pmc param_1121 :slurpy :named
.annotate 'line', 630
    new $P1119, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1119, control_1118
    push_eh $P1119
    .lex "self", self
    .lex "$node", param_1120
    .lex "%options", param_1121
.annotate 'line', 631
    find_lex $P317, "self"
    find_lex $P318, "$node"
    find_lex $P319, "%options"
    $P320 = $P317."as_post"($P318, $P319 :flat)
.annotate 'line', 630
    .return ($P320)
  control_1118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, "payload"
    .return ($P321)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("28_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Node"])
    .param pmc param_1125
    .param pmc param_1126 :slurpy :named
.annotate 'line', 646
    new $P1124, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1124, control_1123
    push_eh $P1124
    .lex "self", self
    .lex "$node", param_1125
    .lex "%options", param_1126
.annotate 'line', 647
    find_lex $P322, "self"
    find_lex $P323, "$node"
    find_lex $P324, "%options"
    $P325 = $P322."node_as_post"($P323, $P324)
.annotate 'line', 646
    .return ($P325)
  control_1123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P326, exception, "payload"
    .return ($P326)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "node_as_post"  :subid("29_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1130
    .param pmc param_1131
.annotate 'line', 651
    new $P1129, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1129, control_1128
    push_eh $P1129
    .lex "self", self
    .lex "$node", param_1130
    .lex "%options", param_1131
.annotate 'line', 652
    new $P327, "Undef"
    set $P1132, $P327
    .lex "$rtype", $P1132
.annotate 'line', 654
    new $P328, "Undef"
    set $P1133, $P328
    .lex "$signature", $P1133
.annotate 'line', 657
    new $P329, "Undef"
    set $P1134, $P329
    .lex "$ops", $P1134
.annotate 'line', 660
    new $P330, "Undef"
    set $P1135, $P330
    .lex "$eh", $P1135
.annotate 'line', 652
    find_lex $P1136, "%options"
    unless_null $P1136, vivify_229
    $P1136 = root_new ['parrot';'Hash']
  vivify_229:
    set $P331, $P1136["rtype"]
    unless_null $P331, vivify_230
    new $P331, "Undef"
  vivify_230:
    store_lex "$rtype", $P331
.annotate 'line', 654
    find_lex $P332, "$node"
    $P333 = $P332."list"()
    set $N334, $P333
    set $I335, $N334
    repeat $S336, "v", $I335
    new $P337, 'String'
    set $P337, $S336
    store_lex "$signature", $P337
.annotate 'line', 655
    find_lex $P338, "$signature"
    find_lex $P339, "$rtype"
    concat $P340, $P338, $P339
    store_lex "$signature", $P340
.annotate 'line', 657
    find_lex $P341, "self"
    find_lex $P342, "$node"
    find_lex $P343, "$signature"
    $P344 = $P341."post_children"($P342, $P343 :named("signature"))
    store_lex "$ops", $P344
.annotate 'line', 658
    find_lex $P345, "$ops"
    find_lex $P1137, "$ops"
    unless_null $P1137, vivify_231
    $P1137 = root_new ['parrot';'ResizablePMCArray']
  vivify_231:
    set $P346, $P1137[-1]
    unless_null $P346, vivify_232
    new $P346, "Undef"
  vivify_232:
    $P345."result"($P346)
.annotate 'line', 660
    find_lex $P347, "$node"
    $P348 = $P347."handlers"()
    store_lex "$eh", $P348
.annotate 'line', 661
    find_lex $P349, "$eh"
    unless $P349, if_1138_end
    find_lex $P350, "self"
    find_lex $P351, "$ops"
    find_lex $P352, "$eh"
    find_lex $P353, "$rtype"
    $P354 = $P350."wrap_handlers"($P351, $P352, $P353 :named("rtype"))
    store_lex "$ops", $P354
  if_1138_end:
    find_lex $P355, "$ops"
.annotate 'line', 651
    .return ($P355)
  control_1128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("30_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Stmt"])
    .param pmc param_1142
    .param pmc param_1143 :slurpy :named
.annotate 'line', 673
    .const 'Sub' $P1149 = "31_1308206306.49694" 
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
    new $P357, "Undef"
    set $P1146, $P357
    .lex "$post", $P1146
.annotate 'line', 683
    new $P358, "Undef"
    set $P1147, $P358
    .lex "$result", $P1147
.annotate 'line', 674
    find_dynamic_lex $P359, "%*TEMPREGS"
    unless_null $P359, vivify_233
    get_hll_global $P359, "%TEMPREGS"
    unless_null $P359, vivify_234
    die "Contextual %*TEMPREGS not found"
  vivify_234:
  vivify_233:
    store_lex "%outerregs", $P359
    find_lex $P360, "$post"
.annotate 'line', 677
    .const 'Sub' $P1149 = "31_1308206306.49694" 
    capture_lex $P1149
    $P1149()
.annotate 'line', 683
    find_lex $P369, "$post"
    $P370 = $P369."result"()
    store_lex "$result", $P370
.annotate 'line', 685
    find_lex $P373, "%outerregs"
    if $P373, if_1155
    set $P372, $P373
    goto if_1155_end
  if_1155:
    find_lex $P1156, "%options"
    unless_null $P1156, vivify_237
    $P1156 = root_new ['parrot';'Hash']
  vivify_237:
    set $P374, $P1156["rtype"]
    unless_null $P374, vivify_238
    new $P374, "Undef"
  vivify_238:
    set $S375, $P374
    isne $I376, $S375, "v"
    new $P372, 'Integer'
    set $P372, $I376
  if_1155_end:
    if $P372, if_1154
    set $P371, $P372
    goto if_1154_end
  if_1154:
.annotate 'line', 686
    find_lex $P377, "$result"
    set $S378, $P377
    substr $S379, $S378, 0, 1
    iseq $I380, $S379, "$"
    new $P371, 'Integer'
    set $P371, $I380
  if_1154_end:
    unless $P371, if_1153_end
.annotate 'line', 688
    new $P381, "Integer"
    assign $P381, 1
    find_lex $P382, "$result"
    find_lex $P1157, "%outerregs"
    unless_null $P1157, vivify_239
    $P1157 = root_new ['parrot';'Hash']
    store_lex "%outerregs", $P1157
  vivify_239:
    set $P1157[$P382], $P381
  if_1153_end:
.annotate 'line', 684
    find_lex $P383, "$post"
.annotate 'line', 673
    .return ($P383)
  control_1140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P384, exception, "payload"
    .return ($P384)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1148"  :anon :subid("31_1308206306.49694") :outer("30_1308206306.49694")
.annotate 'line', 678
    $P1151 = root_new ['parrot';'Hash']
    set $P1150, $P1151
    .lex "%*TEMPREGS", $P1150
.annotate 'line', 677
    find_lex $P361, "%*TEMPREGS"
    unless_null $P361, vivify_235
    get_hll_global $P361, "%TEMPREGS"
    unless_null $P361, vivify_236
    die "Contextual %*TEMPREGS not found"
  vivify_236:
  vivify_235:
.annotate 'line', 679
    find_lex $P362, "%outerregs"
    unless $P362, if_1152_end
    find_lex $P363, "%outerregs"
    clone $P364, $P363
    store_lex "%*TEMPREGS", $P364
  if_1152_end:
.annotate 'line', 680
    find_lex $P365, "self"
    find_lex $P366, "$node"
    find_lex $P367, "%options"
    $P368 = $P365."node_as_post"($P366, $P367)
    store_lex "$post", $P368
.annotate 'line', 677
    .return ($P368)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("32_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Control"])
    .param pmc param_1161
    .param pmc param_1162 :slurpy :named
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
    new $P385, "Undef"
    set $P1165, $P385
    .lex "$ishandled", $P1165
.annotate 'line', 705
    new $P386, "Undef"
    set $P1166, $P386
    .lex "$nothandled", $P1166
.annotate 'line', 707
    new $P387, "Undef"
    set $P1167, $P387
    .lex "$ops", $P1167
.annotate 'line', 709
    new $P388, "Undef"
    set $P1168, $P388
    .lex "$signature", $P1168
.annotate 'line', 714
    new $P389, "Undef"
    set $P1169, $P389
    .lex "$children", $P1169
.annotate 'line', 716
    new $P390, "Undef"
    set $P1170, $P390
    .lex "$handled", $P1170
.annotate 'line', 700
    find_lex $P391, "%*TEMPREGS"
    unless_null $P391, vivify_240
    get_hll_global $P391, "%TEMPREGS"
    unless_null $P391, vivify_241
    die "Contextual %*TEMPREGS not found"
  vivify_241:
  vivify_240:
.annotate 'line', 704
    get_hll_global $P392, ["POST"], "Label"
    find_lex $P393, "self"
    $P394 = $P393."unique"("handled_")
    $P395 = $P392."new"($P394 :named("result"))
    store_lex "$ishandled", $P395
.annotate 'line', 705
    get_hll_global $P396, ["POST"], "Label"
    find_lex $P397, "self"
    $P398 = $P397."unique"("nothandled_")
    $P399 = $P396."new"($P398 :named("result"))
    store_lex "$nothandled", $P399
.annotate 'line', 707
    get_hll_global $P400, ["POST"], "Ops"
    find_lex $P401, "$node"
    $P402 = $P400."new"($P401 :named("node"))
    store_lex "$ops", $P402
.annotate 'line', 709
    find_lex $P403, "$node"
    $P404 = $P403."list"()
    set $N405, $P404
    set $I406, $N405
    repeat $S407, "v", $I406
    new $P408, 'String'
    set $P408, $S407
    store_lex "$signature", $P408
.annotate 'line', 710
    find_lex $P409, "$signature"
    find_lex $P1171, "%options"
    unless_null $P1171, vivify_242
    $P1171 = root_new ['parrot';'Hash']
  vivify_242:
    set $P410, $P1171["rtype"]
    unless_null $P410, vivify_243
    new $P410, "Undef"
  vivify_243:
    concat $P411, $P409, $P410
    store_lex "$signature", $P411
.annotate 'line', 712
    find_lex $P412, "$ops"
    $P412."push_pirop"(".local pmc exception")
.annotate 'line', 713
    find_lex $P413, "$ops"
    $P413."push_pirop"(".get_results (exception)")
.annotate 'line', 714
    find_lex $P414, "self"
    find_lex $P415, "$node"
    find_lex $P416, "$signature"
    $P417 = $P414."post_children"($P415, $P416 :named("signature"))
    store_lex "$children", $P417
.annotate 'line', 715
    find_lex $P418, "$ops"
    find_lex $P419, "$children"
    $P418."push"($P419)
.annotate 'line', 716
    find_lex $P420, "self"
    $P421 = $P420."uniquereg"("I")
    store_lex "$handled", $P421
.annotate 'line', 718
    find_lex $P422, "$ops"
    find_lex $P423, "$handled"
    $P422."push_pirop"("set", $P423, "exception[\"handled\"]")
.annotate 'line', 719
    find_lex $P424, "$ops"
    find_lex $P425, "$handled"
    find_lex $P426, "$nothandled"
    $P424."push_pirop"("ne", $P425, 1, $P426)
.annotate 'line', 720
    find_lex $P427, "$ops"
    find_lex $P428, "$ishandled"
    $P427."push"($P428)
.annotate 'line', 721
    find_lex $P429, "$ops"
    $P429."push_pirop"("return", "exception")
.annotate 'line', 722
    find_lex $P430, "$ops"
    find_lex $P431, "$nothandled"
    $P430."push"($P431)
.annotate 'line', 723
    find_lex $P432, "$ops"
    $P432."push_pirop"("rethrow", "exception")
    find_lex $P433, "$ops"
.annotate 'line', 700
    .return ($P433)
  control_1159:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P434, exception, "payload"
    .return ($P434)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "wrap_handlers"  :subid("33_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1175
    .param pmc param_1176
    .param pmc param_1177 :slurpy :named
.annotate 'line', 727
    .const 'Sub' $P1187 = "34_1308206306.49694" 
    capture_lex $P1187
    new $P1174, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1174, control_1173
    push_eh $P1174
    .lex "self", self
    .lex "$child", param_1175
    .lex "$ehs", param_1176
    .lex "%options", param_1177
.annotate 'line', 728
    new $P435, "Undef"
    set $P1178, $P435
    .lex "$rtype", $P1178
.annotate 'line', 731
    $P1180 = root_new ['parrot';'Hash']
    set $P1179, $P1180
    .lex "%*TEMPREGS", $P1179
.annotate 'line', 733
    new $P436, "Undef"
    set $P1181, $P436
    .lex "$ops", $P1181
.annotate 'line', 734
    new $P437, "Undef"
    set $P1182, $P437
    .lex "$pops", $P1182
.annotate 'line', 735
    new $P438, "Undef"
    set $P1183, $P438
    .lex "$tail", $P1183
.annotate 'line', 736
    new $P439, "Undef"
    set $P1184, $P439
    .lex "$skip", $P1184
.annotate 'line', 728
    find_lex $P1185, "%options"
    unless_null $P1185, vivify_244
    $P1185 = root_new ['parrot';'Hash']
  vivify_244:
    set $P440, $P1185["rtype"]
    unless_null $P440, vivify_245
    new $P440, "Undef"
  vivify_245:
    store_lex "$rtype", $P440
    find_lex $P441, "%*TEMPREGS"
    unless_null $P441, vivify_246
    get_hll_global $P441, "%TEMPREGS"
    unless_null $P441, vivify_247
    die "Contextual %*TEMPREGS not found"
  vivify_247:
  vivify_246:
.annotate 'line', 733
    get_hll_global $P442, ["POST"], "Ops"
    $P443 = $P442."new"()
    store_lex "$ops", $P443
.annotate 'line', 734
    get_hll_global $P444, ["POST"], "Ops"
    $P445 = $P444."new"()
    store_lex "$pops", $P445
.annotate 'line', 735
    get_hll_global $P446, ["POST"], "Ops"
    $P447 = $P446."new"()
    store_lex "$tail", $P447
.annotate 'line', 736
    get_hll_global $P448, ["POST"], "Label"
    find_lex $P449, "self"
    $P450 = $P449."unique"("skip_handler_")
    $P451 = $P448."new"($P450 :named("result"))
    store_lex "$skip", $P451
.annotate 'line', 738
    find_lex $P453, "$ehs"
    defined $I454, $P453
    unless $I454, for_undef_248
    iter $P452, $P453
    new $P511, 'ExceptionHandler'
    set_label $P511, loop1207_handler
    $P511."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P511
  loop1207_test:
    unless $P452, loop1207_done
    shift $P455, $P452
  loop1207_redo:
    .const 'Sub' $P1187 = "34_1308206306.49694" 
    capture_lex $P1187
    $P1187($P455)
  loop1207_next:
    goto loop1207_test
  loop1207_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P512, exception, 'type'
    eq $P512, .CONTROL_LOOP_NEXT, loop1207_next
    eq $P512, .CONTROL_LOOP_REDO, loop1207_redo
  loop1207_done:
    pop_eh 
  for_undef_248:
.annotate 'line', 771
    find_lex $P513, "$ops"
    find_lex $P514, "$child"
    $P513."push"($P514)
.annotate 'line', 773
    find_lex $P515, "$ops"
    find_lex $P516, "$pops"
    $P515."push"($P516)
.annotate 'line', 774
    find_lex $P517, "$ops"
    find_lex $P518, "$skip"
    $P517."push_pirop"("goto", $P518)
.annotate 'line', 775
    find_lex $P519, "$ops"
    find_lex $P520, "$tail"
    $P519."push"($P520)
.annotate 'line', 776
    find_lex $P521, "$ops"
    find_lex $P522, "$skip"
    $P521."push"($P522)
    find_lex $P523, "$ops"
.annotate 'line', 727
    .return ($P523)
  control_1173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P524, exception, "payload"
    .return ($P524)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1186"  :anon :subid("34_1308206306.49694") :outer("33_1308206306.49694")
    .param pmc param_1192
.annotate 'line', 738
    .const 'Sub' $P1204 = "36_1308206306.49694" 
    capture_lex $P1204
    .const 'Sub' $P1197 = "35_1308206306.49694" 
    capture_lex $P1197
.annotate 'line', 739
    new $P456, "Undef"
    set $P1188, $P456
    .lex "$node", $P1188
.annotate 'line', 740
    new $P457, "Undef"
    set $P1189, $P457
    .lex "$label", $P1189
.annotate 'line', 741
    new $P458, "Undef"
    set $P1190, $P458
    .lex "$ehreg", $P1190
.annotate 'line', 746
    new $P459, "Undef"
    set $P1191, $P459
    .lex "$type", $P1191
    .lex "$_", param_1192
.annotate 'line', 739
    find_lex $P460, "$_"
    store_lex "$node", $P460
.annotate 'line', 740
    get_hll_global $P461, ["POST"], "Label"
    find_lex $P462, "self"
    $P463 = $P462."unique"("control_")
    $P464 = $P461."new"($P463 :named("result"))
    store_lex "$label", $P464
.annotate 'line', 741
    find_lex $P465, "self"
    $P466 = $P465."uniquereg"("P")
    store_lex "$ehreg", $P466
.annotate 'line', 743
    find_lex $P467, "$ops"
    find_lex $P468, "$ehreg"
    $P467."push_pirop"("new", $P468, "'ExceptionHandler'")
.annotate 'line', 744
    find_lex $P469, "$ops"
    find_lex $P470, "$ehreg"
    find_lex $P471, "$label"
    $P469."push_pirop"("set_label", $P470, $P471)
.annotate 'line', 746
    find_lex $P472, "$node"
    $P473 = $P472."handle_types"()
    store_lex "$type", $P473
.annotate 'line', 747
    find_lex $P475, "$type"
    if $P475, if_1194
    set $P474, $P475
    goto if_1194_end
  if_1194:
    find_lex $P476, "$type"
    get_global $P1195, "%controltypes"
    unless_null $P1195, vivify_249
    $P1195 = root_new ['parrot';'Hash']
  vivify_249:
    set $P477, $P1195[$P476]
    unless_null $P477, vivify_250
    new $P477, "Undef"
  vivify_250:
    store_lex "$type", $P477
    set $P474, $P477
  if_1194_end:
    unless $P474, if_1193_end
    .const 'Sub' $P1197 = "35_1308206306.49694" 
    capture_lex $P1197
    $P1197()
  if_1193_end:
.annotate 'line', 753
    find_lex $P486, "$node"
    $P487 = $P486."handle_types_except"()
    store_lex "$type", $P487
.annotate 'line', 754
    find_lex $P489, "$type"
    if $P489, if_1201
    set $P488, $P489
    goto if_1201_end
  if_1201:
    find_lex $P490, "$type"
    get_global $P1202, "%controltypes"
    unless_null $P1202, vivify_253
    $P1202 = root_new ['parrot';'Hash']
  vivify_253:
    set $P491, $P1202[$P490]
    unless_null $P491, vivify_254
    new $P491, "Undef"
  vivify_254:
    store_lex "$type", $P491
    set $P488, $P491
  if_1201_end:
    unless $P488, if_1200_end
    .const 'Sub' $P1204 = "36_1308206306.49694" 
    capture_lex $P1204
    $P1204()
  if_1200_end:
.annotate 'line', 761
    find_lex $P500, "$ops"
    find_lex $P501, "$ehreg"
    $P500."push_pirop"("push_eh", $P501)
.annotate 'line', 764
    find_lex $P502, "$pops"
    $P502."push_pirop"("pop_eh")
.annotate 'line', 767
    find_lex $P503, "$tail"
    find_lex $P504, "$label"
    $P503."push"($P504)
.annotate 'line', 768
    find_lex $P505, "$tail"
    find_lex $P506, "self"
    find_lex $P507, "$node"
    find_lex $P508, "$rtype"
    $P509 = $P506."as_post"($P507, $P508 :named("rtype"))
    $P510 = $P505."push"($P509)
.annotate 'line', 738
    .return ($P510)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1196"  :anon :subid("35_1308206306.49694") :outer("34_1308206306.49694")
.annotate 'line', 748
    $P1199 = root_new ['parrot';'ResizablePMCArray']
    set $P1198, $P1199
    .lex "@types", $P1198
    find_lex $P478, "$type"
    set $S479, $P478
    split $P480, ",", $S479
    store_lex "@types", $P480
.annotate 'line', 749
    find_lex $P481, "$ops"
    find_lex $P482, "$ehreg"
    find_lex $P483, "@types"
    $P481."push_pirop"("callmethod", "\"handle_types\"", $P482, $P483 :flat)
.annotate 'line', 750
    find_dynamic_lex $P484, "$*SUB"
    unless_null $P484, vivify_251
    get_hll_global $P484, "$SUB"
    unless_null $P484, vivify_252
    die "Contextual $*SUB not found"
  vivify_252:
  vivify_251:
    $P485 = $P484."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 747
    .return ($P485)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1203"  :anon :subid("36_1308206306.49694") :outer("34_1308206306.49694")
.annotate 'line', 755
    $P1206 = root_new ['parrot';'ResizablePMCArray']
    set $P1205, $P1206
    .lex "@types", $P1205
    find_lex $P492, "$type"
    set $S493, $P492
    split $P494, ",", $S493
    store_lex "@types", $P494
.annotate 'line', 756
    find_lex $P495, "$ops"
    find_lex $P496, "$ehreg"
    find_lex $P497, "@types"
    $P495."push_pirop"("callmethod", "\"handle_types_except\"", $P496, $P497 :flat)
.annotate 'line', 758
    find_dynamic_lex $P498, "$*SUB"
    unless_null $P498, vivify_255
    get_hll_global $P498, "$SUB"
    unless_null $P498, vivify_256
    die "Contextual $*SUB not found"
  vivify_256:
  vivify_255:
    $P499 = $P498."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 754
    .return ($P499)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("37_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Block"])
    .param pmc param_1211
    .param pmc param_1212 :slurpy :named
.annotate 'line', 786
    .const 'Sub' $P1236 = "38_1308206306.49694" 
    capture_lex $P1236
    new $P1210, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1210, control_1209
    push_eh $P1210
    .lex "self", self
    .lex "$node", param_1211
    .lex "%options", param_1212
.annotate 'line', 790
    new $P525, "Undef"
    set $P1213, $P525
    .lex "$name", $P1213
.annotate 'line', 791
    new $P526, "Undef"
    set $P1214, $P526
    .lex "$pirflags", $P1214
.annotate 'line', 792
    new $P527, "Undef"
    set $P1215, $P527
    .lex "$blocktype", $P1215
.annotate 'line', 793
    new $P528, "Undef"
    set $P1216, $P528
    .lex "$nsentry", $P1216
.annotate 'line', 794
    new $P529, "Undef"
    set $P1217, $P529
    .lex "$subid", $P1217
.annotate 'line', 795
    new $P530, "Undef"
    set $P1218, $P530
    .lex "$ns", $P1218
.annotate 'line', 796
    new $P531, "Undef"
    set $P1219, $P531
    .lex "$hll", $P1219
.annotate 'line', 797
    new $P532, "Undef"
    set $P1220, $P532
    .lex "$multi", $P1220
.annotate 'line', 798
    new $P533, "Undef"
    set $P1221, $P533
    .lex "$loadlibs", $P1221
.annotate 'line', 823
    new $P534, "Undef"
    set $P1222, $P534
    .lex "$bpost", $P1222
.annotate 'line', 831
    new $P535, "Undef"
    set $P1223, $P535
    .lex "$blockreg", $P1223
.annotate 'line', 832
    new $P536, "Undef"
    set $P1224, $P536
    .lex "$blockref", $P1224
.annotate 'line', 837
    new $P537, "Undef"
    set $P1225, $P537
    .lex "$outerpost", $P1225
.annotate 'line', 788
    find_dynamic_lex $P538, "@*BLOCKPAST"
    unless_null $P538, vivify_257
    get_hll_global $P538, "@BLOCKPAST"
    unless_null $P538, vivify_258
    die "Contextual @*BLOCKPAST not found"
  vivify_258:
  vivify_257:
    find_lex $P539, "$node"
    unshift $P538, $P539
.annotate 'line', 790
    find_lex $P540, "$node"
    $P541 = $P540."name"()
    store_lex "$name", $P541
.annotate 'line', 791
    find_lex $P542, "$node"
    $P543 = $P542."pirflags"()
    store_lex "$pirflags", $P543
.annotate 'line', 792
    find_lex $P544, "$node"
    $P545 = $P544."blocktype"()
    store_lex "$blocktype", $P545
.annotate 'line', 793
    find_lex $P546, "$node"
    $P547 = $P546."nsentry"()
    store_lex "$nsentry", $P547
.annotate 'line', 794
    find_lex $P548, "$node"
    $P549 = $P548."subid"()
    store_lex "$subid", $P549
.annotate 'line', 795
    find_lex $P550, "$node"
    $P551 = $P550."namespace"()
    store_lex "$ns", $P551
.annotate 'line', 796
    find_lex $P552, "$node"
    $P553 = $P552."hll"()
    store_lex "$hll", $P553
.annotate 'line', 797
    find_lex $P554, "$node"
    $P555 = $P554."multi"()
    store_lex "$multi", $P555
.annotate 'line', 798
    find_lex $P556, "$node"
    $P557 = $P556."loadlibs"()
    store_lex "$loadlibs", $P557
.annotate 'line', 801
    find_lex $P558, "$name"
    defined $I559, $P558
    if $I559, unless_1226_end
    new $P560, "String"
    assign $P560, ""
    store_lex "$name", $P560
  unless_1226_end:
.annotate 'line', 802
    find_lex $P561, "$pirflags"
    defined $I562, $P561
    if $I562, unless_1227_end
    new $P563, "String"
    assign $P563, ""
    store_lex "$pirflags", $P563
  unless_1227_end:
.annotate 'line', 803
    find_lex $P564, "$blocktype"
    defined $I565, $P564
    if $I565, unless_1228_end
    new $P566, "String"
    assign $P566, ""
    store_lex "$blocktype", $P566
  unless_1228_end:
.annotate 'line', 806
    find_lex $P567, "$nsentry"
    defined $I568, $P567
    unless $I568, if_1229_end
.annotate 'line', 807
    find_lex $P569, "$nsentry"
    if $P569, if_1230
.annotate 'line', 812
    find_lex $P577, "$pirflags"
    concat $P578, $P577, " :anon"
    store_lex "$pirflags", $P578
.annotate 'line', 811
    goto if_1230_end
  if_1230:
.annotate 'line', 809
    find_lex $P570, "$pirflags"
    concat $P571, $P570, " :nsentry("
    find_lex $P572, "self"
    find_lex $P573, "$nsentry"
    $S574 = $P572."escape"($P573)
    concat $P575, $P571, $S574
    concat $P576, $P575, ")"
    store_lex "$pirflags", $P576
  if_1230_end:
  if_1229_end:
.annotate 'line', 817
    find_lex $P579, "$name"
    if $P579, unless_1231_end
.annotate 'line', 818
    find_lex $P580, "self"
    $P581 = $P580."unique"("_block")
    store_lex "$name", $P581
.annotate 'line', 819
    find_lex $P583, "$ns"
    unless $P583, unless_1233
    set $P582, $P583
    goto unless_1233_end
  unless_1233:
    find_lex $P584, "$nsentry"
    set $P582, $P584
  unless_1233_end:
    if $P582, unless_1232_end
    find_lex $P585, "$pirflags"
    concat $P586, $P585, " :anon"
    store_lex "$pirflags", $P586
  unless_1232_end:
  unless_1231_end:
.annotate 'line', 823
    get_hll_global $P587, ["POST"], "Sub"
    find_lex $P588, "$node"
    find_lex $P589, "$name"
    find_lex $P590, "$blocktype"
    find_lex $P591, "$ns"
    find_lex $P592, "$hll"
    find_lex $P593, "$subid"
    find_lex $P594, "$multi"
    find_lex $P595, "$loadlibs"
    $P596 = $P587."new"($P588 :named("node"), $P589 :named("name"), $P590 :named("blocktype"), $P591 :named("namespace"), $P592 :named("hll"), $P593 :named("subid"), $P594 :named("multi"), $P595 :named("loadlibs"))
    store_lex "$bpost", $P596
.annotate 'line', 828
    find_lex $P597, "$pirflags"
    unless $P597, if_1234_end
    find_lex $P598, "$bpost"
    find_lex $P599, "$pirflags"
    $P598."pirflags"($P599)
  if_1234_end:
.annotate 'line', 831
    find_lex $P600, "self"
    $P601 = $P600."uniquereg"("P")
    store_lex "$blockreg", $P601
.annotate 'line', 832
    new $P602, 'String'
    set $P602, ".const 'Sub' "
    find_lex $P603, "$blockreg"
    concat $P604, $P602, $P603
    concat $P605, $P604, " = "
    find_lex $P606, "self"
    find_lex $P607, "$bpost"
    $P608 = $P607."subid"()
    $S609 = $P606."escape"($P608)
    concat $P610, $P605, $S609
    store_lex "$blockref", $P610
.annotate 'line', 837
    find_dynamic_lex $P611, "$*SUB"
    unless_null $P611, vivify_259
    get_hll_global $P611, "$SUB"
    unless_null $P611, vivify_260
    die "Contextual $*SUB not found"
  vivify_260:
  vivify_259:
    store_lex "$outerpost", $P611
.annotate 'line', 838
    .const 'Sub' $P1236 = "38_1308206306.49694" 
    capture_lex $P1236
    $P1236()
.annotate 'line', 987
    find_dynamic_lex $P837, "@*BLOCKPAST"
    unless_null $P837, vivify_283
    get_hll_global $P837, "@BLOCKPAST"
    unless_null $P837, vivify_284
    die "Contextual @*BLOCKPAST not found"
  vivify_284:
  vivify_283:
    shift $P838, $P837
    find_lex $P839, "$bpost"
.annotate 'line', 786
    .return ($P839)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P840, exception, "payload"
    .return ($P840)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1235"  :anon :subid("38_1308206306.49694") :outer("37_1308206306.49694")
.annotate 'line', 838
    .const 'Sub' $P1308 = "46_1308206306.49694" 
    capture_lex $P1308
    .const 'Sub' $P1297 = "45_1308206306.49694" 
    capture_lex $P1297
    .const 'Sub' $P1291 = "44_1308206306.49694" 
    capture_lex $P1291
    .const 'Sub' $P1266 = "41_1308206306.49694" 
    capture_lex $P1266
    .const 'Sub' $P1257 = "40_1308206306.49694" 
    capture_lex $P1257
    .const 'Sub' $P1250 = "39_1308206306.49694" 
    capture_lex $P1250
.annotate 'line', 839
    new $P612, "Undef"
    set $P1237, $P612
    .lex "$*SUB", $P1237
.annotate 'line', 841
    new $P613, "Undef"
    set $P1238, $P613
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
    new $P614, "Undef"
    set $P1245, $P614
    .lex "$compiler", $P1245
.annotate 'line', 957
    new $P615, "Undef"
    set $P1246, $P615
    .lex "$rtype", $P1246
.annotate 'line', 839
    find_lex $P616, "$bpost"
    store_lex "$*SUB", $P616
.annotate 'line', 841
    find_lex $P617, "$node"
    $P618 = $P617."lexical"()
    store_lex "$islexical", $P618
.annotate 'line', 842
    find_lex $P619, "$islexical"
    unless $P619, if_1247_end
.annotate 'line', 843
    find_lex $P620, "$bpost"
    find_lex $P621, "$outerpost"
    $P620."outer"($P621)
.annotate 'line', 846
    find_lex $P622, "$outerpost"
    defined $I623, $P622
    unless $I623, if_1248_end
    .const 'Sub' $P1250 = "39_1308206306.49694" 
    capture_lex $P1250
    $P1250()
  if_1248_end:
  if_1247_end:
.annotate 'line', 855
    find_lex $P635, "self"
    getattribute $P1252, $P635, "%!symtable"
    unless_null $P1252, vivify_261
    $P1252 = root_new ['parrot';'Hash']
  vivify_261:
    store_lex "%outersym", $P1252
.annotate 'line', 856
    find_lex $P636, "%outersym"
    store_lex "%symtable", $P636
.annotate 'line', 858
    find_lex $P637, "$node"
    $P638 = $P637."symtable"()
    unless $P638, if_1253_end
.annotate 'line', 861
    find_lex $P639, "$node"
    $P640 = $P639."symtable"()
    store_lex "%symtable", $P640
.annotate 'line', 862
    find_lex $P1255, "%symtable"
    unless_null $P1255, vivify_262
    $P1255 = root_new ['parrot';'Hash']
  vivify_262:
    set $P641, $P1255[""]
    unless_null $P641, vivify_263
    new $P641, "Undef"
  vivify_263:
    defined $I642, $P641
    if $I642, unless_1254_end
.annotate 'line', 864
    find_lex $P643, "%symtable"
    clone $P644, $P643
    store_lex "%symtable", $P644
.annotate 'line', 865
    find_lex $P646, "%outersym"
    defined $I647, $P646
    unless $I647, for_undef_264
    iter $P645, $P646
    new $P655, 'ExceptionHandler'
    set_label $P655, loop1262_handler
    $P655."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P655
  loop1262_test:
    unless $P645, loop1262_done
    shift $P648, $P645
  loop1262_redo:
    .const 'Sub' $P1257 = "40_1308206306.49694" 
    capture_lex $P1257
    $P1257($P648)
  loop1262_next:
    goto loop1262_test
  loop1262_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P656, exception, 'type'
    eq $P656, .CONTROL_LOOP_NEXT, loop1262_next
    eq $P656, .CONTROL_LOOP_REDO, loop1262_redo
  loop1262_done:
    pop_eh 
  for_undef_264:
  unless_1254_end:
  if_1253_end:
.annotate 'line', 871
    find_lex $P657, "%symtable"
    find_lex $P658, "self"
    setattribute $P658, "%!symtable", $P657
.annotate 'line', 874
    find_dynamic_lex $P659, "%*TEMPREGS"
    unless_null $P659, vivify_268
    get_hll_global $P659, "%TEMPREGS"
    unless_null $P659, vivify_269
    die "Contextual %*TEMPREGS not found"
  vivify_269:
  vivify_268:
    store_lex "%outerregs", $P659
.annotate 'line', 876
    find_lex $P660, "$node"
    $P661 = $P660."compiler"()
    store_lex "$compiler", $P661
.annotate 'line', 877
    find_lex $P662, "$compiler"
    if $P662, if_1263
.annotate 'line', 884
    .const 'Sub' $P1266 = "41_1308206306.49694" 
    capture_lex $P1266
    $P1266()
    goto if_1263_end
  if_1263:
.annotate 'line', 880
    find_lex $P663, "$bpost"
    find_lex $P664, "$compiler"
    $P663."compiler"($P664)
.annotate 'line', 881
    find_lex $P665, "$bpost"
    find_lex $P666, "$node"
    $P667 = $P666."compiler_args"()
    $P665."compiler_args"($P667)
.annotate 'line', 882
    find_lex $P668, "$bpost"
    find_lex $P1264, "$node"
    unless_null $P1264, vivify_276
    $P1264 = root_new ['parrot';'ResizablePMCArray']
  vivify_276:
    set $P669, $P1264[0]
    unless_null $P669, vivify_277
    new $P669, "Undef"
  vivify_277:
    $P668."push"($P669)
  if_1263_end:
.annotate 'line', 944
    find_lex $P759, "$node"
    exists $I760, $P759["loadinit"]
    unless $I760, if_1289_end
    .const 'Sub' $P1291 = "44_1308206306.49694" 
    capture_lex $P1291
    $P1291()
  if_1289_end:
.annotate 'line', 954
    find_lex $P776, "%outersym"
    find_lex $P777, "self"
    setattribute $P777, "%!symtable", $P776
.annotate 'line', 957
    find_lex $P1294, "%options"
    unless_null $P1294, vivify_279
    $P1294 = root_new ['parrot';'Hash']
  vivify_279:
    set $P778, $P1294["rtype"]
    unless_null $P778, vivify_280
    new $P778, "Undef"
  vivify_280:
    store_lex "$rtype", $P778
.annotate 'line', 959
    find_lex $P780, "$blocktype"
    set $S781, $P780
    iseq $I782, $S781, "immediate"
    if $I782, if_1295
.annotate 'line', 968
    find_lex $P808, "$rtype"
    set $S809, $P808
    isne $I810, $S809, "v"
    if $I810, if_1304
    new $P807, 'Integer'
    set $P807, $I810
    goto if_1304_end
  if_1304:
.annotate 'line', 969
    get_hll_global $P811, ["POST"], "Ops"
    find_lex $P812, "$bpost"
    find_lex $P813, "$node"
    find_lex $P814, "$blockreg"
    $P815 = $P811."new"($P812, $P813 :named("node"), $P814 :named("result"))
    store_lex "$bpost", $P815
.annotate 'line', 970
    find_lex $P816, "$bpost"
    find_lex $P817, "$blockref"
    find_lex $P818, "$blockreg"
    $P816."push_pirop"($P817, $P818 :named("result"))
.annotate 'line', 971
    find_lex $P820, "$islexical"
    if $P820, if_1305
    set $P819, $P820
    goto if_1305_end
  if_1305:
.annotate 'line', 972
    find_lex $P822, "$node"
    $P823 = $P822."closure"()
    if $P823, if_1306
.annotate 'line', 980
    find_lex $P834, "$bpost"
    find_lex $P835, "$blockreg"
    $P836 = $P834."push_pirop"("capture_lex", $P835)
.annotate 'line', 979
    set $P821, $P836
.annotate 'line', 972
    goto if_1306_end
  if_1306:
    .const 'Sub' $P1308 = "46_1308206306.49694" 
    capture_lex $P1308
    $P833 = $P1308()
    set $P821, $P833
  if_1306_end:
.annotate 'line', 971
    set $P819, $P821
  if_1305_end:
.annotate 'line', 968
    set $P807, $P819
  if_1304_end:
    set $P779, $P807
.annotate 'line', 959
    goto if_1295_end
  if_1295:
    .const 'Sub' $P1297 = "45_1308206306.49694" 
    capture_lex $P1297
    $P806 = $P1297()
    set $P779, $P806
  if_1295_end:
.annotate 'line', 838
    .return ($P779)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1249"  :anon :subid("39_1308206306.49694") :outer("38_1308206306.49694")
.annotate 'line', 847
    new $P624, "Undef"
    set $P1251, $P624
    .lex "$cpost", $P1251
    get_hll_global $P625, ["POST"], "Ops"
    find_lex $P626, "$blockreg"
    $P627 = $P625."new"($P626 :named("result"))
    store_lex "$cpost", $P627
.annotate 'line', 848
    find_lex $P628, "$cpost"
    find_lex $P629, "$blockref"
    $P628."push_pirop"($P629)
.annotate 'line', 849
    find_lex $P630, "$cpost"
    find_lex $P631, "$blockreg"
    $P630."push_pirop"("capture_lex", $P631)
.annotate 'line', 850
    find_lex $P632, "$outerpost"
    find_lex $P633, "$cpost"
    $P634 = $P632."unshift"($P633)
.annotate 'line', 846
    .return ($P634)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1256"  :anon :subid("40_1308206306.49694") :outer("38_1308206306.49694")
    .param pmc param_1258
.annotate 'line', 865
    .lex "$_", param_1258
.annotate 'line', 866
    find_lex $P650, "$_"
    find_lex $P649, "%symtable"
    exists $I651, $P649[$P650]
    unless $I651, if_1259_end
    die 0, .CONTROL_LOOP_NEXT
  if_1259_end:
.annotate 'line', 867
    find_lex $P652, "$_"
    find_lex $P1260, "%outersym"
    unless_null $P1260, vivify_265
    $P1260 = root_new ['parrot';'Hash']
  vivify_265:
    set $P653, $P1260[$P652]
    unless_null $P653, vivify_266
    new $P653, "Undef"
  vivify_266:
    find_lex $P654, "$_"
    find_lex $P1261, "%symtable"
    unless_null $P1261, vivify_267
    $P1261 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1261
  vivify_267:
    set $P1261[$P654], $P653
.annotate 'line', 865
    .return ($P653)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1265"  :anon :subid("41_1308206306.49694") :outer("38_1308206306.49694")
.annotate 'line', 884
    .const 'Sub' $P1286 = "43_1308206306.49694" 
    capture_lex $P1286
    .const 'Sub' $P1278 = "42_1308206306.49694" 
    capture_lex $P1278
.annotate 'line', 887
    $P1268 = root_new ['parrot';'Hash']
    set $P1267, $P1268
    .lex "%*TEMPREGS", $P1267
.annotate 'line', 896
    new $P670, "Undef"
    set $P1269, $P670
    .lex "$ctrlpast", $P1269
.annotate 'line', 897
    new $P671, "Undef"
    set $P1270, $P671
    .lex "$ctrllabel", $P1270
.annotate 'line', 910
    new $P672, "Undef"
    set $P1271, $P672
    .lex "$sig", $P1271
.annotate 'line', 912
    new $P673, "Undef"
    set $P1272, $P673
    .lex "$ops", $P1272
.annotate 'line', 914
    new $P674, "Undef"
    set $P1273, $P674
    .lex "$retval", $P1273
.annotate 'line', 916
    new $P675, "Undef"
    set $P1274, $P675
    .lex "$eh", $P1274
.annotate 'line', 884
    find_lex $P676, "%*TEMPREGS"
    unless_null $P676, vivify_270
    get_hll_global $P676, "%TEMPREGS"
    unless_null $P676, vivify_271
    die "Contextual %*TEMPREGS not found"
  vivify_271:
  vivify_270:
.annotate 'line', 888
    find_lex $P677, "$node"
    $P678 = $P677."tempregs"()
    if $P678, if_1275
.annotate 'line', 892
    find_lex $P681, "%outerregs"
    store_lex "%*TEMPREGS", $P681
.annotate 'line', 891
    goto if_1275_end
  if_1275:
.annotate 'line', 889
    find_lex $P679, "self"
    $P680 = $P679."tempreg_frame"()
    store_lex "%*TEMPREGS", $P680
  if_1275_end:
.annotate 'line', 896
    find_lex $P682, "$node"
    $P683 = $P682."control"()
    store_lex "$ctrlpast", $P683
    find_lex $P684, "$ctrllabel"
.annotate 'line', 899
    find_lex $P685, "$ctrlpast"
    unless $P685, if_1276_end
    .const 'Sub' $P1278 = "42_1308206306.49694" 
    capture_lex $P1278
    $P1278()
  if_1276_end:
.annotate 'line', 910
    find_lex $P702, "$node"
    $P703 = $P702."list"()
    elements $I704, $P703
    repeat $S705, "v", $I704
    new $P706, 'String'
    set $P706, $S705
    concat $P707, $P706, "*"
    store_lex "$sig", $P707
.annotate 'line', 912
    find_lex $P708, "self"
    find_lex $P709, "$node"
    find_lex $P710, "$sig"
    $P711 = $P708."post_children"($P709, $P710 :named("signature"))
    store_lex "$ops", $P711
.annotate 'line', 914
    find_lex $P1280, "$ops"
    unless_null $P1280, vivify_272
    $P1280 = root_new ['parrot';'ResizablePMCArray']
  vivify_272:
    set $P712, $P1280[-1]
    unless_null $P712, vivify_273
    new $P712, "Undef"
  vivify_273:
    store_lex "$retval", $P712
.annotate 'line', 916
    find_lex $P713, "$node"
    $P714 = $P713."handlers"()
    store_lex "$eh", $P714
.annotate 'line', 917
    find_lex $P715, "$eh"
    unless $P715, if_1281_end
.annotate 'line', 918
    find_lex $P716, "self"
    find_lex $P717, "$ops"
    find_lex $P718, "$eh"
    find_lex $P1282, "%options"
    unless_null $P1282, vivify_274
    $P1282 = root_new ['parrot';'Hash']
  vivify_274:
    set $P719, $P1282["rtype"]
    unless_null $P719, vivify_275
    new $P719, "Undef"
  vivify_275:
    $P720 = $P716."wrap_handlers"($P717, $P718, $P719 :named("rtype"))
    store_lex "$ops", $P720
  if_1281_end:
.annotate 'line', 920
    find_lex $P721, "$bpost"
    find_lex $P722, "$ops"
    $P721."push"($P722)
.annotate 'line', 921
    find_lex $P723, "$bpost"
    find_lex $P724, "$retval"
    $P723."push_pirop"("return", $P724)
.annotate 'line', 923
    find_lex $P726, "$ctrlpast"
    if $P726, if_1283
    set $P725, $P726
    goto if_1283_end
  if_1283:
.annotate 'line', 924
    find_lex $P727, "$bpost"
    find_lex $P728, "$ctrllabel"
    $P727."push"($P728)
.annotate 'line', 925
    find_lex $P729, "$bpost"
    $P729."push_pirop"(".local pmc exception")
.annotate 'line', 926
    find_lex $P730, "$bpost"
    $P730."push_pirop"(".get_results (exception)")
.annotate 'line', 927
    find_lex $P732, "$ctrlpast"
    set $S733, $P732
    iseq $I734, $S733, "return_pir"
    if $I734, if_1284
.annotate 'line', 934
    find_lex $P745, "$ctrlpast"
    get_hll_global $P746, ["PAST"], "Node"
    $P747 = $P745."isa"($P746)
    if $P747, if_1288
.annotate 'line', 938
    find_lex $P753, "self"
    new $P754, 'String'
    set $P754, "Unrecognized control handler '"
    find_lex $P755, "$ctrlpast"
    concat $P756, $P754, $P755
    concat $P757, $P756, "'"
    $P758 = $P753."panic"($P757)
.annotate 'line', 937
    set $P744, $P758
.annotate 'line', 934
    goto if_1288_end
  if_1288:
.annotate 'line', 935
    find_lex $P748, "$bpost"
    find_lex $P749, "self"
    find_lex $P750, "$ctrlpast"
    $P751 = $P749."as_post"($P750, "*" :named("rtype"))
    $P752 = $P748."push"($P751)
.annotate 'line', 934
    set $P744, $P752
  if_1288_end:
    set $P731, $P744
.annotate 'line', 927
    goto if_1284_end
  if_1284:
    .const 'Sub' $P1286 = "43_1308206306.49694" 
    capture_lex $P1286
    $P743 = $P1286()
    set $P731, $P743
  if_1284_end:
.annotate 'line', 923
    set $P725, $P731
  if_1283_end:
.annotate 'line', 884
    .return ($P725)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1277"  :anon :subid("42_1308206306.49694") :outer("41_1308206306.49694")
.annotate 'line', 901
    new $P686, "Undef"
    set $P1279, $P686
    .lex "$reg", $P1279
.annotate 'line', 900
    get_hll_global $P687, ["POST"], "Label"
    find_lex $P688, "self"
    $P689 = $P688."unique"("control_")
    $P690 = $P687."new"($P689 :named("result"))
    store_lex "$ctrllabel", $P690
.annotate 'line', 901
    find_lex $P691, "self"
    $P692 = $P691."uniquereg"("P")
    store_lex "$reg", $P692
.annotate 'line', 902
    find_lex $P693, "$bpost"
    find_lex $P694, "$reg"
    $P693."push_pirop"("new", $P694, "['ExceptionHandler']", ".CONTROL_RETURN")
.annotate 'line', 904
    find_lex $P695, "$bpost"
    find_lex $P696, "$reg"
    find_lex $P697, "$ctrllabel"
    $P695."push_pirop"("set_label", $P696, $P697)
.annotate 'line', 905
    find_lex $P698, "$bpost"
    find_lex $P699, "$reg"
    $P698."push_pirop"("push_eh", $P699)
.annotate 'line', 906
    find_lex $P700, "$bpost"
    $P701 = $P700."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 899
    .return ($P701)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1285"  :anon :subid("43_1308206306.49694") :outer("41_1308206306.49694")
.annotate 'line', 929
    new $P735, "Undef"
    set $P1287, $P735
    .lex "$reg", $P1287
    find_lex $P736, "self"
    $P737 = $P736."tempreg"("P")
    store_lex "$reg", $P737
.annotate 'line', 930
    find_lex $P738, "$bpost"
    find_lex $P739, "$reg"
    $P738."push_pirop"("getattribute", $P739, "exception", "\"payload\"")
.annotate 'line', 932
    find_lex $P740, "$bpost"
    find_lex $P741, "$reg"
    $P742 = $P740."push_pirop"("return", $P741)
.annotate 'line', 927
    .return ($P742)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1290"  :anon :subid("44_1308206306.49694") :outer("38_1308206306.49694")
.annotate 'line', 945
    new $P761, "Undef"
    set $P1292, $P761
    .lex "$lisub", $P1292
    get_hll_global $P762, ["POST"], "Sub"
    find_lex $P763, "$bpost"
    $P764 = $P762."new"($P763 :named("outer"), ":load :init" :named("pirflags"))
    store_lex "$lisub", $P764
.annotate 'line', 946
    find_lex $P765, "$lisub"
    find_lex $P766, "$blockref"
    $P765."push_pirop"($P766)
.annotate 'line', 947
    find_lex $P767, "$lisub"
    $P767."push_pirop"(".local pmc", "block")
.annotate 'line', 948
    find_lex $P768, "$lisub"
    find_lex $P769, "$blockreg"
    $P768."push_pirop"("set", "block", $P769)
.annotate 'line', 949
    find_lex $P770, "$lisub"
    find_lex $P771, "self"
    find_lex $P772, "$node"
    $P773 = $P772."loadinit"()
    $P774 = $P771."as_post"($P773, "v" :named("rtype"))
    $P770."push"($P774)
.annotate 'line', 950
    find_lex $P775, "$lisub"
    find_lex $P1293, "$bpost"
    unless_null $P1293, vivify_278
    $P1293 = root_new ['parrot';'Hash']
    store_lex "$bpost", $P1293
  vivify_278:
    set $P1293["loadinit"], $P775
.annotate 'line', 944
    .return ($P775)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1307"  :anon :subid("46_1308206306.49694") :outer("38_1308206306.49694")
.annotate 'line', 975
    new $P824, "Undef"
    set $P1309, $P824
    .lex "$result", $P1309
    find_lex $P825, "self"
    $P826 = $P825."uniquereg"("P")
    store_lex "$result", $P826
.annotate 'line', 976
    find_lex $P827, "$bpost"
    find_lex $P828, "$result"
    find_lex $P829, "$blockreg"
    $P827."push_pirop"("newclosure", $P828, $P829)
.annotate 'line', 977
    find_lex $P830, "$bpost"
    find_lex $P831, "$result"
    $P832 = $P830."result"($P831)
.annotate 'line', 972
    .return ($P832)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1296"  :anon :subid("45_1308206306.49694") :outer("38_1308206306.49694")
.annotate 'line', 960
    $P1299 = root_new ['parrot';'ResizablePMCArray']
    set $P1298, $P1299
    .lex "@arglist", $P1298
.annotate 'line', 962
    new $P783, "Undef"
    set $P1300, $P783
    .lex "$result", $P1300
.annotate 'line', 960
    find_lex $P1301, "%options"
    unless_null $P1301, vivify_281
    $P1301 = root_new ['parrot';'Hash']
  vivify_281:
    set $P784, $P1301["arglist"]
    unless_null $P784, vivify_282
    new $P784, "Undef"
  vivify_282:
    store_lex "@arglist", $P784
.annotate 'line', 961
    find_lex $P785, "@arglist"
    defined $I786, $P785
    if $I786, unless_1302_end
    new $P787, "ResizablePMCArray"
    store_lex "@arglist", $P787
  unless_1302_end:
.annotate 'line', 962
    find_lex $P788, "self"
    find_lex $P789, "$rtype"
    $P790 = $P788."tempreg"($P789)
    store_lex "$result", $P790
.annotate 'line', 963
    get_hll_global $P791, ["POST"], "Ops"
    find_lex $P792, "$bpost"
    find_lex $P793, "$node"
    find_lex $P794, "$result"
    $P795 = $P791."new"($P792, $P793 :named("node"), $P794 :named("result"))
    store_lex "$bpost", $P795
.annotate 'line', 964
    find_lex $P796, "$bpost"
    find_lex $P797, "$blockref"
    $P796."push_pirop"($P797)
.annotate 'line', 965
    find_lex $P798, "$islexical"
    unless $P798, if_1303_end
    find_lex $P799, "$bpost"
    find_lex $P800, "$blockreg"
    $P799."push_pirop"("capture_lex", $P800)
  if_1303_end:
.annotate 'line', 966
    find_lex $P801, "$bpost"
    find_lex $P802, "$blockreg"
    find_lex $P803, "@arglist"
    find_lex $P804, "$result"
    $P805 = $P801."push_pirop"("call", $P802, $P803 :flat, $P804 :named("result"))
.annotate 'line', 959
    .return ($P805)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("47_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1313
    .param pmc param_1314 :slurpy :named
.annotate 'line', 999
    new $P1312, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1312, control_1311
    push_eh $P1312
    .lex "self", self
    .lex "$node", param_1313
    .lex "%options", param_1314
.annotate 'line', 1001
    new $P841, "Undef"
    set $P1315, $P841
    .lex "$lvalue", $P1315
.annotate 'line', 1002
    new $P842, "Undef"
    set $P1316, $P842
    .lex "$child", $P1316
.annotate 'line', 1007
    new $P843, "Undef"
    set $P1317, $P843
    .lex "$pasttype", $P1317
.annotate 'line', 1012
    new $P844, "Undef"
    set $P1318, $P844
    .lex "$pirop", $P1318
.annotate 'line', 1017
    new $P845, "Undef"
    set $P1319, $P845
    .lex "$inline", $P1319
.annotate 'line', 1001
    find_lex $P846, "$node"
    $P847 = $P846."lvalue"()
    store_lex "$lvalue", $P847
.annotate 'line', 1002
    find_lex $P1320, "$node"
    unless_null $P1320, vivify_285
    $P1320 = root_new ['parrot';'ResizablePMCArray']
  vivify_285:
    set $P848, $P1320[0]
    unless_null $P848, vivify_286
    new $P848, "Undef"
  vivify_286:
    store_lex "$child", $P848
.annotate 'line', 1003
    find_lex $P851, "$lvalue"
    if $P851, if_1323
    set $P850, $P851
    goto if_1323_end
  if_1323:
    find_lex $P852, "$child"
    defined $I853, $P852
    new $P850, 'Integer'
    set $P850, $I853
  if_1323_end:
    if $P850, if_1322
    set $P849, $P850
    goto if_1322_end
  if_1322:
    find_lex $P854, "$child"
    exists $I855, $P854["lvalue"]
    new $P856, 'Integer'
    set $P856, $I855
    isfalse $I857, $P856
    new $P849, 'Integer'
    set $P849, $I857
  if_1322_end:
    unless $P849, if_1321_end
.annotate 'line', 1004
    find_lex $P858, "$child"
    find_lex $P859, "$lvalue"
    $P858."lvalue"($P859)
  if_1321_end:
.annotate 'line', 1007
    find_lex $P860, "$node"
    $P861 = $P860."pasttype"()
    store_lex "$pasttype", $P861
.annotate 'line', 1008
    find_lex $P862, "$pasttype"
    unless $P862, if_1324_end
.annotate 'line', 1009
    new $P863, "Exception"
    set $P863['type'], .CONTROL_RETURN
    find_lex $P864, "self"
    find_lex $P865, "$node"
    find_lex $P866, "%options"
    find_lex $P867, "$pasttype"
    set $S868, $P867
    $P869 = $P864.$S868($P865, $P866 :flat)
    setattribute $P863, 'payload', $P869
    throw $P863
  if_1324_end:
.annotate 'line', 1012
    find_lex $P870, "$node"
    $P871 = $P870."pirop"()
    store_lex "$pirop", $P871
.annotate 'line', 1013
    find_lex $P872, "$pirop"
    unless $P872, if_1325_end
.annotate 'line', 1014
    new $P873, "Exception"
    set $P873['type'], .CONTROL_RETURN
    find_lex $P874, "self"
    find_lex $P875, "$node"
    find_lex $P876, "%options"
    $P877 = $P874."pirop"($P875, $P876 :flat)
    setattribute $P873, 'payload', $P877
    throw $P873
  if_1325_end:
.annotate 'line', 1017
    find_lex $P878, "$node"
    $P879 = $P878."inline"()
    store_lex "$inline", $P879
.annotate 'line', 1018
    find_lex $P880, "$inline"
    unless $P880, if_1326_end
.annotate 'line', 1019
    new $P881, "Exception"
    set $P881['type'], .CONTROL_RETURN
    find_lex $P882, "self"
    find_lex $P883, "$node"
    find_lex $P884, "%options"
    $P885 = $P882."inline"($P883, $P884 :flat)
    setattribute $P881, 'payload', $P885
    throw $P881
  if_1326_end:
.annotate 'line', 1022
    find_lex $P886, "self"
    find_lex $P887, "$node"
    find_lex $P888, "%options"
    $P889 = $P886."call"($P887, $P888 :flat)
.annotate 'line', 999
    .return ($P889)
  control_1311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P890, exception, "payload"
    .return ($P890)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "pirop"  :subid("48_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1330
    .param pmc param_1331 :slurpy :named
.annotate 'line', 1030
    new $P1329, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1329, control_1328
    push_eh $P1329
    .lex "self", self
    .lex "$node", param_1330
    .lex "%options", param_1331
.annotate 'line', 1031
    new $P891, "Undef"
    set $P1332, $P891
    .lex "$pirop", $P1332
.annotate 'line', 1032
    new $P892, "Undef"
    set $P1333, $P892
    .lex "$signature", $P1333
.annotate 'line', 1033
    new $P893, "Undef"
    set $P1334, $P893
    .lex "$I0", $P1334
.annotate 'line', 1049
    new $P894, "Undef"
    set $P1335, $P894
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
    new $P895, "Undef"
    set $P1340, $P895
    .lex "$S0", $P1340
.annotate 'line', 1073
    new $P896, "Undef"
    set $P1341, $P896
    .lex "$result", $P1341
.annotate 'line', 1031
    find_lex $P897, "$node"
    $P898 = $P897."pirop"()
    store_lex "$pirop", $P898
    find_lex $P899, "$signature"
    find_lex $P900, "$I0"
.annotate 'line', 1034
    find_lex $P901, "$pirop"
    set $S902, $P901
    index $I903, $S902, " "
    new $P904, 'Integer'
    set $P904, $I903
    store_lex "$I0", $P904
    set $N905, $P904
    isge $I906, $N905, 0.0
    if $I906, if_1342
.annotate 'line', 1039
    find_lex $P920, "$pirop"
    set $S921, $P920
    index $I922, $S921, "__"
    new $P923, 'Integer'
    set $P923, $I922
    store_lex "$I0", $P923
    set $N924, $P923
    isge $I925, $N924, 0.0
    if $I925, if_1343
.annotate 'line', 1045
    find_lex $P939, "$pirop"
    get_global $P1344, "%piropsig"
    unless_null $P1344, vivify_287
    $P1344 = root_new ['parrot';'Hash']
  vivify_287:
    set $P940, $P1344[$P939]
    unless_null $P940, vivify_288
    new $P940, "Undef"
  vivify_288:
    store_lex "$signature", $P940
.annotate 'line', 1046
    find_lex $P941, "$signature"
    if $P941, unless_1345_end
    new $P942, "String"
    assign $P942, "vP"
    store_lex "$signature", $P942
  unless_1345_end:
.annotate 'line', 1044
    goto if_1343_end
  if_1343:
.annotate 'line', 1041
    find_lex $P926, "$pirop"
    set $S927, $P926
    find_lex $P928, "$I0"
    add $P929, $P928, 2
    set $I930, $P929
    substr $S931, $S927, $I930
    new $P932, 'String'
    set $P932, $S931
    store_lex "$signature", $P932
.annotate 'line', 1042
    find_lex $P933, "$pirop"
    set $S934, $P933
    find_lex $P935, "$I0"
    set $I936, $P935
    substr $S937, $S934, 0, $I936
    new $P938, 'String'
    set $P938, $S937
    store_lex "$pirop", $P938
  if_1343_end:
.annotate 'line', 1039
    goto if_1342_end
  if_1342:
.annotate 'line', 1036
    find_lex $P907, "$pirop"
    set $S908, $P907
    find_lex $P909, "$I0"
    add $P910, $P909, 1
    set $I911, $P910
    substr $S912, $S908, $I911
    new $P913, 'String'
    set $P913, $S912
    store_lex "$signature", $P913
.annotate 'line', 1037
    find_lex $P914, "$pirop"
    set $S915, $P914
    find_lex $P916, "$I0"
    set $I917, $P916
    substr $S918, $S915, 0, $I917
    new $P919, 'String'
    set $P919, $S918
    store_lex "$pirop", $P919
  if_1342_end:
.annotate 'line', 1034
    find_lex $P943, "$ops"
    find_lex $P944, "@posargs"
.annotate 'line', 1052

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1) = self.'post_children'($P0, 'signature' => $P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1060
    find_lex $P945, "$ops"
    $P946 = $P945."list"()
    store_lex "@arglist", $P946
.annotate 'line', 1062
    find_lex $P947, "$signature"
    set $S948, $P947
    substr $S949, $S948, 0, 1
    new $P950, 'String'
    set $P950, $S949
    store_lex "$S0", $P950
.annotate 'line', 1063
    find_lex $P951, "$S0"
    set $S952, $P951
    iseq $I953, $S952, "v"
    unless $I953, if_1346_end
.annotate 'line', 1064
    find_lex $P954, "$ops"
    find_lex $P955, "$pirop"
    find_lex $P956, "@posargs"
    $P954."push_pirop"($P955, $P956 :flat)
.annotate 'line', 1065
    new $P957, "Exception"
    set $P957['type'], .CONTROL_RETURN
    find_lex $P958, "$ops"
    setattribute $P957, 'payload', $P958
    throw $P957
  if_1346_end:
.annotate 'line', 1067
    find_lex $P959, "$S0"
    set $S960, $P959
    index $I961, "0123456789", $S960
    new $P962, 'Integer'
    set $P962, $I961
    store_lex "$I0", $P962
.annotate 'line', 1068
    find_lex $P963, "$I0"
    set $N964, $P963
    isge $I965, $N964, 0.0
    unless $I965, if_1347_end
.annotate 'line', 1069
    find_lex $P966, "$ops"
    find_lex $P967, "$I0"
    set $I968, $P967
    find_lex $P1348, "@arglist"
    unless_null $P1348, vivify_289
    $P1348 = root_new ['parrot';'ResizablePMCArray']
  vivify_289:
    set $P969, $P1348[$I968]
    unless_null $P969, vivify_290
    new $P969, "Undef"
  vivify_290:
    $P966."result"($P969)
.annotate 'line', 1070
    find_lex $P970, "$ops"
    find_lex $P971, "$pirop"
    find_lex $P972, "@posargs"
    $P970."push_pirop"($P971, $P972 :flat)
.annotate 'line', 1071
    new $P973, "Exception"
    set $P973['type'], .CONTROL_RETURN
    find_lex $P974, "$ops"
    setattribute $P973, 'payload', $P974
    throw $P973
  if_1347_end:
.annotate 'line', 1073
    find_lex $P975, "self"
    find_lex $P976, "$S0"
    $P977 = $P975."tempreg"($P976)
    store_lex "$result", $P977
.annotate 'line', 1074
    find_lex $P978, "$ops"
    find_lex $P979, "$result"
    $P978."result"($P979)
.annotate 'line', 1075
    find_lex $P980, "$ops"
    find_lex $P981, "$pirop"
    find_lex $P982, "$result"
    find_lex $P983, "@posargs"
    $P980."push_pirop"($P981, $P982, $P983 :flat)
.annotate 'line', 1076
    new $P984, "Exception"
    set $P984['type'], .CONTROL_RETURN
    find_lex $P985, "$ops"
    setattribute $P984, 'payload', $P985
    throw $P984
.annotate 'line', 1030
    .return ()
  control_1328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P986, exception, "payload"
    .return ($P986)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "call"  :subid("49_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1352
    .param pmc param_1353 :slurpy :named
.annotate 'line', 1084
    .const 'Sub' $P1389 = "50_1308206306.49694" 
    capture_lex $P1389
    new $P1351, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1351, control_1350
    push_eh $P1351
    .lex "self", self
    .lex "$node", param_1352
    .lex "%options", param_1353
.annotate 'line', 1085
    new $P987, "Undef"
    set $P1354, $P987
    .lex "$pasttype", $P1354
.annotate 'line', 1088
    new $P988, "Undef"
    set $P1355, $P988
    .lex "$signature", $P1355
.annotate 'line', 1092
    new $P989, "Undef"
    set $P1356, $P989
    .lex "$name", $P1356
.annotate 'line', 1093
    new $P990, "Undef"
    set $P1357, $P990
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
    new $P991, "Undef"
    set $P1362, $P991
    .lex "$rtype", $P1362
.annotate 'line', 1121
    new $P992, "Undef"
    set $P1363, $P992
    .lex "$result", $P1363
.annotate 'line', 1085
    find_lex $P993, "$node"
    $P994 = $P993."pasttype"()
    store_lex "$pasttype", $P994
.annotate 'line', 1086
    find_lex $P995, "$pasttype"
    if $P995, unless_1364_end
    new $P996, "String"
    assign $P996, "call"
    store_lex "$pasttype", $P996
  unless_1364_end:
.annotate 'line', 1088
    new $P997, "String"
    assign $P997, "v:"
    store_lex "$signature", $P997
.annotate 'line', 1090
    find_lex $P998, "$pasttype"
    set $S999, $P998
    iseq $I1000, $S999, "callmethod"
    unless $I1000, if_1365_end
    new $P1366, "String"
    assign $P1366, "vP:"
    store_lex "$signature", $P1366
  if_1365_end:
.annotate 'line', 1092
    find_lex $P1367, "$node"
    $P1368 = $P1367."name"()
    store_lex "$name", $P1368
    find_lex $P1369, "$ops"
    find_lex $P1370, "@posargs"
    find_lex $P1371, "%namedargs"
.annotate 'line', 1097
    find_lex $P1373, "$name"
    if $P1373, unless_1372_end
    find_lex $P1374, "$signature"
    set $S1375, $P1374
    replace $S1376, $S1375, 1, 0, "P"
    new $P1377, 'String'
    set $P1377, $S1376
    store_lex "$signature", $P1377
  unless_1372_end:
.annotate 'line', 1099

        $P0 = find_lex '$node'
        $P1 = find_lex '$signature'
        ($P0, $P1, $P2) = self.'post_children'($P0, 'signature'=>$P1)
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
        store_lex '%namedargs', $P2
    
.annotate 'line', 1107
    find_lex $P1379, "$name"
    unless $P1379, if_1378_end
.annotate 'line', 1108
    find_lex $P1383, "$name"
    isa $I1384, $P1383, "P6object"
    if $I1384, if_1382
    new $P1381, 'Integer'
    set $P1381, $I1384
    goto if_1382_end
  if_1382:
    find_lex $P1385, "$name"
    get_hll_global $P1386, ["PAST"], "Node"
    $P1387 = $P1385."isa"($P1386)
    set $P1381, $P1387
  if_1382_end:
    if $P1381, if_1380
.annotate 'line', 1115
    find_lex $P1402, "@posargs"
    find_lex $P1403, "self"
    find_lex $P1404, "$name"
    $P1405 = $P1403."escape"($P1404)
    unshift $P1402, $P1405
.annotate 'line', 1114
    goto if_1380_end
  if_1380:
.annotate 'line', 1108
    .const 'Sub' $P1389 = "50_1308206306.49694" 
    capture_lex $P1389
    $P1389()
  if_1380_end:
  if_1378_end:
.annotate 'line', 1120
    find_lex $P1406, "%options"
    unless_null $P1406, vivify_291
    $P1406 = root_new ['parrot';'Hash']
  vivify_291:
    set $P1407, $P1406["rtype"]
    unless_null $P1407, vivify_292
    new $P1407, "Undef"
  vivify_292:
    store_lex "$rtype", $P1407
.annotate 'line', 1121
    find_lex $P1408, "self"
    find_lex $P1409, "$rtype"
    $P1410 = $P1408."tempreg"($P1409)
    store_lex "$result", $P1410
.annotate 'line', 1122
    find_lex $P1411, "$ops"
    find_lex $P1412, "$pasttype"
    find_lex $P1413, "@posargs"
    find_lex $P1414, "%namedargs"
    find_lex $P1415, "$result"
    $P1411."push_pirop"($P1412, $P1413 :flat, $P1414 :flat, $P1415 :named("result"))
.annotate 'line', 1123
    find_lex $P1416, "$ops"
    find_lex $P1417, "$result"
    $P1416."result"($P1417)
    find_lex $P1418, "$ops"
.annotate 'line', 1084
    .return ($P1418)
  control_1350:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1419, exception, "payload"
    .return ($P1419)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1388"  :anon :subid("50_1308206306.49694") :outer("49_1308206306.49694")
.annotate 'line', 1109
    new $P1391, "Undef"
    set $P1390, $P1391
    .lex "$name_post", $P1390
    find_lex $P1392, "self"
    find_lex $P1393, "$name"
    $P1394 = $P1392."as_post"($P1393, "s" :named("rtype"))
    store_lex "$name_post", $P1394
.annotate 'line', 1110
    find_lex $P1395, "self"
    find_lex $P1396, "$name_post"
    $P1397 = $P1395."coerce"($P1396, "s")
    store_lex "$name_post", $P1397
.annotate 'line', 1111
    find_lex $P1398, "$ops"
    find_lex $P1399, "$name_post"
    $P1398."push"($P1399)
.annotate 'line', 1112
    find_lex $P1400, "@posargs"
    find_lex $P1401, "$name_post"
    unshift $P1400, $P1401
.annotate 'line', 1108
    .return ($P1400)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "callmethod"  :subid("51_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1423
    .param pmc param_1424 :slurpy :named
.annotate 'line', 1132
    new $P1422, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1422, control_1421
    push_eh $P1422
    .lex "self", self
    .lex "$node", param_1423
    .lex "%options", param_1424
.annotate 'line', 1133
    find_lex $P1425, "self"
    find_lex $P1426, "$node"
    find_lex $P1427, "%options"
    $P1428 = $P1425."call"($P1426, $P1427 :flat)
.annotate 'line', 1132
    .return ($P1428)
  control_1421:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1429, exception, "payload"
    .return ($P1429)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "if"  :subid("52_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1433
    .param pmc param_1434 :slurpy :named
.annotate 'line', 1142
    .const 'Sub' $P1590 = "55_1308206306.49694" 
    capture_lex $P1590
    .const 'Sub' $P1466 = "53_1308206306.49694" 
    capture_lex $P1466
    new $P1432, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1432, control_1431
    push_eh $P1432
    .lex "self", self
    .lex "$node", param_1433
    .lex "%options", param_1434
.annotate 'line', 1143
    new $P1436, "Undef"
    set $P1435, $P1436
    .lex "$ops", $P1435
.annotate 'line', 1145
    new $P1438, "Undef"
    set $P1437, $P1438
    .lex "$rtype", $P1437
.annotate 'line', 1146
    new $P1440, "Undef"
    set $P1439, $P1440
    .lex "$result", $P1439
.annotate 'line', 1149
    new $P1442, "Undef"
    set $P1441, $P1442
    .lex "$pasttype", $P1441
.annotate 'line', 1151
    new $P1444, "Undef"
    set $P1443, $P1444
    .lex "$exprpast", $P1443
.annotate 'line', 1152
    new $P1446, "Undef"
    set $P1445, $P1446
    .lex "$thenpast", $P1445
.annotate 'line', 1153
    new $P1448, "Undef"
    set $P1447, $P1448
    .lex "$elsepast", $P1447
.annotate 'line', 1155
    new $P1450, "Undef"
    set $P1449, $P1450
    .lex "$S0", $P1449
.annotate 'line', 1156
    new $P1452, "Undef"
    set $P1451, $P1452
    .lex "$thenlabel", $P1451
.annotate 'line', 1157
    new $P1454, "Undef"
    set $P1453, $P1454
    .lex "$endlabel", $P1453
.annotate 'line', 1159
    new $P1456, "Undef"
    set $P1455, $P1456
    .lex "$exprrtype", $P1455
.annotate 'line', 1161
    new $P1458, "Undef"
    set $P1457, $P1458
    .lex "$childrtype", $P1457
.annotate 'line', 1164
    new $P1460, "Undef"
    set $P1459, $P1460
    .lex "$exprpost", $P1459
.annotate 'line', 1166
    new $P1462, "Undef"
    set $P1461, $P1462
    .lex "$thenpost", $P1461
.annotate 'line', 1167
    new $P1464, "Undef"
    set $P1463, $P1464
    .lex "$elsepost", $P1463
.annotate 'line', 1189
    .const 'Sub' $P1466 = "53_1308206306.49694" 
    newclosure $P1510, $P1466
    set $P1465, $P1510
    .lex "make_childpost", $P1465
.annotate 'line', 1143
    get_hll_global $P1511, ["POST"], "Ops"
    find_lex $P1512, "$node"
    $P1513 = $P1511."new"($P1512 :named("node"))
    store_lex "$ops", $P1513
.annotate 'line', 1145
    find_lex $P1514, "%options"
    unless_null $P1514, vivify_294
    $P1514 = root_new ['parrot';'Hash']
  vivify_294:
    set $P1515, $P1514["rtype"]
    unless_null $P1515, vivify_295
    new $P1515, "Undef"
  vivify_295:
    store_lex "$rtype", $P1515
.annotate 'line', 1146
    find_lex $P1516, "self"
    find_lex $P1517, "$rtype"
    $P1518 = $P1516."tempreg"($P1517)
    store_lex "$result", $P1518
.annotate 'line', 1147
    find_lex $P1519, "$ops"
    find_lex $P1520, "$result"
    $P1519."result"($P1520)
.annotate 'line', 1149
    find_lex $P1521, "$node"
    $P1522 = $P1521."pasttype"()
    store_lex "$pasttype", $P1522
.annotate 'line', 1151
    find_lex $P1523, "$node"
    unless_null $P1523, vivify_296
    $P1523 = root_new ['parrot';'ResizablePMCArray']
  vivify_296:
    set $P1524, $P1523[0]
    unless_null $P1524, vivify_297
    new $P1524, "Undef"
  vivify_297:
    store_lex "$exprpast", $P1524
.annotate 'line', 1152
    find_lex $P1525, "$node"
    unless_null $P1525, vivify_298
    $P1525 = root_new ['parrot';'ResizablePMCArray']
  vivify_298:
    set $P1526, $P1525[1]
    unless_null $P1526, vivify_299
    new $P1526, "Undef"
  vivify_299:
    store_lex "$thenpast", $P1526
.annotate 'line', 1153
    find_lex $P1527, "$node"
    unless_null $P1527, vivify_300
    $P1527 = root_new ['parrot';'ResizablePMCArray']
  vivify_300:
    set $P1528, $P1527[2]
    unless_null $P1528, vivify_301
    new $P1528, "Undef"
  vivify_301:
    store_lex "$elsepast", $P1528
.annotate 'line', 1155
    find_lex $P1529, "self"
    find_lex $P1530, "$pasttype"
    concat $P1531, $P1530, "_"
    $P1532 = $P1529."unique"($P1531)
    store_lex "$S0", $P1532
.annotate 'line', 1156
    get_hll_global $P1533, ["POST"], "Label"
    find_lex $P1534, "$S0"
    $P1535 = $P1533."new"($P1534 :named("result"))
    store_lex "$thenlabel", $P1535
.annotate 'line', 1157
    get_hll_global $P1536, ["POST"], "Label"
    find_lex $P1537, "$S0"
    concat $P1538, $P1537, "_end"
    $P1539 = $P1536."new"($P1538 :named("result"))
    store_lex "$endlabel", $P1539
.annotate 'line', 1159
    new $P1540, "String"
    assign $P1540, "r"
    store_lex "$exprrtype", $P1540
.annotate 'line', 1160
    find_lex $P1542, "$rtype"
    set $S1543, $P1542
    iseq $I1544, $S1543, "v"
    unless $I1544, if_1541_end
    new $P1545, "String"
    assign $P1545, "*"
    store_lex "$exprrtype", $P1545
  if_1541_end:
.annotate 'line', 1161
    find_lex $P1546, "$rtype"
    store_lex "$childrtype", $P1546
.annotate 'line', 1162
    find_lex $P1548, "$rtype"
    set $S1549, $P1548
    index $I1550, "*:", $S1549
    set $N1551, $I1550
    isge $I1552, $N1551, 0.0
    unless $I1552, if_1547_end
    new $P1553, "String"
    assign $P1553, "P"
    store_lex "$childrtype", $P1553
  if_1547_end:
.annotate 'line', 1164
    find_lex $P1554, "self"
    find_lex $P1555, "$exprpast"
    find_lex $P1556, "$exprrtype"
    $P1557 = $P1554."as_post"($P1555, $P1556 :named("rtype"))
    store_lex "$exprpost", $P1557
.annotate 'line', 1166
    find_lex $P1558, "$thenpast"
    $P1559 = "make_childpost"($P1558)
    store_lex "$thenpost", $P1559
.annotate 'line', 1167
    find_lex $P1560, "$elsepast"
    $P1561 = "make_childpost"($P1560)
    store_lex "$elsepost", $P1561
.annotate 'line', 1169
    find_lex $P1563, "$elsepost"
    defined $I1564, $P1563
    if $I1564, if_1562
.annotate 'line', 1179
    .const 'Sub' $P1590 = "55_1308206306.49694" 
    capture_lex $P1590
    $P1590()
    goto if_1562_end
  if_1562:
.annotate 'line', 1170
    find_lex $P1565, "$ops"
    find_lex $P1566, "$exprpost"
    $P1565."push"($P1566)
.annotate 'line', 1171
    find_lex $P1567, "$ops"
    find_lex $P1568, "$pasttype"
    find_lex $P1569, "$exprpost"
    find_lex $P1570, "$thenlabel"
    $P1567."push_pirop"($P1568, $P1569, $P1570)
.annotate 'line', 1172
    find_lex $P1572, "$elsepost"
    defined $I1573, $P1572
    unless $I1573, if_1571_end
    find_lex $P1574, "$ops"
    find_lex $P1575, "$elsepost"
    $P1574."push"($P1575)
  if_1571_end:
.annotate 'line', 1173
    find_lex $P1576, "$ops"
    find_lex $P1577, "$endlabel"
    $P1576."push_pirop"("goto", $P1577)
.annotate 'line', 1174
    find_lex $P1578, "$ops"
    find_lex $P1579, "$thenlabel"
    $P1578."push"($P1579)
.annotate 'line', 1175
    find_lex $P1581, "$thenpost"
    defined $I1582, $P1581
    unless $I1582, if_1580_end
    find_lex $P1583, "$ops"
    find_lex $P1584, "$thenpost"
    $P1583."push"($P1584)
  if_1580_end:
.annotate 'line', 1176
    find_lex $P1585, "$ops"
    find_lex $P1586, "$endlabel"
    $P1585."push"($P1586)
.annotate 'line', 1177
    new $P1587, "Exception"
    set $P1587['type'], .CONTROL_RETURN
    find_lex $P1588, "$ops"
    setattribute $P1587, 'payload', $P1588
    throw $P1587
  if_1562_end:
.annotate 'line', 1169
    find_lex $P1616, "make_childpost"
.annotate 'line', 1142
    .return ($P1616)
  control_1431:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1617, exception, "payload"
    .return ($P1617)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "make_childpost"  :subid("53_1308206306.49694") :outer("52_1308206306.49694")
    .param pmc param_1469 :optional
    .param int has_param_1469 :opt_flag
.annotate 'line', 1189
    .const 'Sub' $P1478 = "54_1308206306.49694" 
    capture_lex $P1478
    new $P1468, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1468, control_1467
    push_eh $P1468
    if has_param_1469, optparam_293
    new $P1470, "Undef"
    set param_1469, $P1470
  optparam_293:
    .lex "$childpast", param_1469
.annotate 'line', 1190
    new $P1472, "Undef"
    set $P1471, $P1472
    .lex "$childpost", $P1471
.annotate 'line', 1189
    find_lex $P1473, "$childpost"
.annotate 'line', 1191
    find_lex $P1475, "$childpast"
    defined $I1476, $P1475
    if $I1476, if_1474
.annotate 'line', 1198
    find_lex $P1494, "$rtype"
    set $S1495, $P1494
    iseq $I1496, $S1495, "v"
    unless $I1496, if_1493_end
    new $P1497, "Exception"
    set $P1497['type'], .CONTROL_RETURN
    find_lex $P1498, "$childpost"
    setattribute $P1497, 'payload', $P1498
    throw $P1497
  if_1493_end:
.annotate 'line', 1199
    get_hll_global $P1499, ["POST"], "Ops"
    find_lex $P1500, "$exprpost"
    $P1501 = $P1499."new"($P1500 :named("result"))
    store_lex "$childpost", $P1501
.annotate 'line', 1197
    goto if_1474_end
  if_1474:
.annotate 'line', 1191
    .const 'Sub' $P1478 = "54_1308206306.49694" 
    capture_lex $P1478
    $P1478()
  if_1474_end:
.annotate 'line', 1201
    find_lex $P1503, "$result"
    unless $P1503, if_1502_end
    find_lex $P1504, "self"
    find_lex $P1505, "$childpost"
    find_lex $P1506, "$result"
    $P1507 = $P1504."coerce"($P1505, $P1506)
    store_lex "$childpost", $P1507
  if_1502_end:
    find_lex $P1508, "$childpost"
.annotate 'line', 1189
    .return ($P1508)
  control_1467:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1509, exception, "payload"
    .return ($P1509)
.end


.namespace ["PAST";"Compiler"]
.sub "_block1477"  :anon :subid("54_1308206306.49694") :outer("53_1308206306.49694")
.annotate 'line', 1192
    $P1480 = root_new ['parrot';'ResizablePMCArray']
    set $P1479, $P1480
    .lex "@arglist", $P1479
    new $P1481, "ResizablePMCArray"
    store_lex "@arglist", $P1481
.annotate 'line', 1193
    find_lex $P1483, "$childpast"
    $N1484 = $P1483."arity"()
    isgt $I1485, $N1484, 0.0
    unless $I1485, if_1482_end
    find_lex $P1486, "@arglist"
    find_lex $P1487, "$exprpost"
    push $P1486, $P1487
  if_1482_end:
.annotate 'line', 1194
    find_lex $P1488, "self"
    find_lex $P1489, "$childpast"
    find_lex $P1490, "$childrtype"
    find_lex $P1491, "@arglist"
    $P1492 = $P1488."as_post"($P1489, $P1490 :named("rtype"), $P1491 :named("arglist"))
    store_lex "$childpost", $P1492
.annotate 'line', 1191
    .return ($P1492)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1589"  :anon :subid("55_1308206306.49694") :outer("52_1308206306.49694")
.annotate 'line', 1180
    new $P1592, "Undef"
    set $P1591, $P1592
    .lex "$S0", $P1591
    new $P1593, "String"
    assign $P1593, "if"
    store_lex "$S0", $P1593
.annotate 'line', 1181
    find_lex $P1595, "$pasttype"
    set $S1596, $P1595
    find_lex $P1597, "$S0"
    set $S1598, $P1597
    iseq $I1599, $S1596, $S1598
    unless $I1599, if_1594_end
    new $P1600, "String"
    assign $P1600, "unless"
    store_lex "$S0", $P1600
  if_1594_end:
.annotate 'line', 1182
    find_lex $P1601, "$ops"
    find_lex $P1602, "$exprpost"
    $P1601."push"($P1602)
.annotate 'line', 1183
    find_lex $P1603, "$ops"
    find_lex $P1604, "$S0"
    find_lex $P1605, "$exprpost"
    find_lex $P1606, "$endlabel"
    $P1603."push_pirop"($P1604, $P1605, $P1606)
.annotate 'line', 1184
    find_lex $P1608, "$thenpost"
    defined $I1609, $P1608
    unless $I1609, if_1607_end
    find_lex $P1610, "$ops"
    find_lex $P1611, "$thenpost"
    $P1610."push"($P1611)
  if_1607_end:
.annotate 'line', 1185
    find_lex $P1612, "$ops"
    find_lex $P1613, "$endlabel"
    $P1612."push"($P1613)
.annotate 'line', 1186
    new $P1614, "Exception"
    set $P1614['type'], .CONTROL_RETURN
    find_lex $P1615, "$ops"
    setattribute $P1614, 'payload', $P1615
    throw $P1614
.annotate 'line', 1179
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "unless"  :subid("56_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1621
    .param pmc param_1622 :slurpy :named
.annotate 'line', 1206
    new $P1620, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1620, control_1619
    push_eh $P1620
    .lex "self", self
    .lex "$node", param_1621
    .lex "%options", param_1622
.annotate 'line', 1207
    find_lex $P1623, "self"
    find_lex $P1624, "$node"
    find_lex $P1625, "%options"
    $P1626 = $P1623."if"($P1624, $P1625 :flat)
.annotate 'line', 1206
    .return ($P1626)
  control_1619:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1627, exception, "payload"
    .return ($P1627)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "loop_gen"  :subid("57_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_1631 :slurpy :named
.annotate 'line', 1214
    new $P1630, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1630, control_1629
    push_eh $P1630
    .lex "self", self
    .lex "%options", param_1631
.annotate 'line', 1215
    new $P1633, "Undef"
    set $P1632, $P1633
    .lex "$loopname", $P1632
.annotate 'line', 1216
    new $P1635, "Undef"
    set $P1634, $P1635
    .lex "$testlabel", $P1634
.annotate 'line', 1217
    new $P1637, "Undef"
    set $P1636, $P1637
    .lex "$redolabel", $P1636
.annotate 'line', 1218
    new $P1639, "Undef"
    set $P1638, $P1639
    .lex "$nextlabel", $P1638
.annotate 'line', 1219
    new $P1641, "Undef"
    set $P1640, $P1641
    .lex "$donelabel", $P1640
.annotate 'line', 1220
    new $P1643, "Undef"
    set $P1642, $P1643
    .lex "$handlabel", $P1642
.annotate 'line', 1222
    new $P1645, "Undef"
    set $P1644, $P1645
    .lex "$testop", $P1644
.annotate 'line', 1223
    new $P1647, "Undef"
    set $P1646, $P1647
    .lex "$testpost", $P1646
.annotate 'line', 1224
    new $P1649, "Undef"
    set $P1648, $P1649
    .lex "$prepost", $P1648
.annotate 'line', 1225
    new $P1651, "Undef"
    set $P1650, $P1651
    .lex "$bodypost", $P1650
.annotate 'line', 1226
    new $P1653, "Undef"
    set $P1652, $P1653
    .lex "$nextpost", $P1652
.annotate 'line', 1227
    new $P1655, "Undef"
    set $P1654, $P1655
    .lex "$bodyfirst", $P1654
.annotate 'line', 1231
    new $P1657, "Undef"
    set $P1656, $P1657
    .lex "$ops", $P1656
.annotate 'line', 1235
    new $P1659, "Undef"
    set $P1658, $P1659
    .lex "$handreg", $P1658
.annotate 'line', 1257
    new $P1661, "Undef"
    set $P1660, $P1661
    .lex "$S0", $P1660
.annotate 'line', 1215
    find_lex $P1662, "self"
    $P1663 = $P1662."unique"("loop")
    store_lex "$loopname", $P1663
.annotate 'line', 1216
    get_hll_global $P1664, ["POST"], "Label"
    find_lex $P1665, "$loopname"
    concat $P1666, $P1665, "_test"
    $P1667 = $P1664."new"($P1666 :named("result"))
    store_lex "$testlabel", $P1667
.annotate 'line', 1217
    get_hll_global $P1668, ["POST"], "Label"
    find_lex $P1669, "$loopname"
    concat $P1670, $P1669, "_redo"
    $P1671 = $P1668."new"($P1670 :named("result"))
    store_lex "$redolabel", $P1671
.annotate 'line', 1218
    get_hll_global $P1672, ["POST"], "Label"
    find_lex $P1673, "$loopname"
    concat $P1674, $P1673, "_next"
    $P1675 = $P1672."new"($P1674 :named("result"))
    store_lex "$nextlabel", $P1675
.annotate 'line', 1219
    get_hll_global $P1676, ["POST"], "Label"
    find_lex $P1677, "$loopname"
    concat $P1678, $P1677, "_done"
    $P1679 = $P1676."new"($P1678 :named("result"))
    store_lex "$donelabel", $P1679
.annotate 'line', 1220
    get_hll_global $P1680, ["POST"], "Label"
    find_lex $P1681, "$loopname"
    concat $P1682, $P1681, "_handler"
    $P1683 = $P1680."new"($P1682 :named("result"))
    store_lex "$handlabel", $P1683
.annotate 'line', 1222
    find_lex $P1684, "%options"
    unless_null $P1684, vivify_302
    $P1684 = root_new ['parrot';'Hash']
  vivify_302:
    set $P1685, $P1684["testop"]
    unless_null $P1685, vivify_303
    new $P1685, "Undef"
  vivify_303:
    store_lex "$testop", $P1685
.annotate 'line', 1223
    find_lex $P1686, "%options"
    unless_null $P1686, vivify_304
    $P1686 = root_new ['parrot';'Hash']
  vivify_304:
    set $P1687, $P1686["test"]
    unless_null $P1687, vivify_305
    new $P1687, "Undef"
  vivify_305:
    store_lex "$testpost", $P1687
.annotate 'line', 1224
    find_lex $P1688, "%options"
    unless_null $P1688, vivify_306
    $P1688 = root_new ['parrot';'Hash']
  vivify_306:
    set $P1689, $P1688["pre"]
    unless_null $P1689, vivify_307
    new $P1689, "Undef"
  vivify_307:
    store_lex "$prepost", $P1689
.annotate 'line', 1225
    find_lex $P1690, "%options"
    unless_null $P1690, vivify_308
    $P1690 = root_new ['parrot';'Hash']
  vivify_308:
    set $P1691, $P1690["body"]
    unless_null $P1691, vivify_309
    new $P1691, "Undef"
  vivify_309:
    store_lex "$bodypost", $P1691
.annotate 'line', 1226
    find_lex $P1692, "%options"
    unless_null $P1692, vivify_310
    $P1692 = root_new ['parrot';'Hash']
  vivify_310:
    set $P1693, $P1692["next"]
    unless_null $P1693, vivify_311
    new $P1693, "Undef"
  vivify_311:
    store_lex "$nextpost", $P1693
.annotate 'line', 1227
    find_lex $P1694, "%options"
    unless_null $P1694, vivify_312
    $P1694 = root_new ['parrot';'Hash']
  vivify_312:
    set $P1695, $P1694["bodyfirst"]
    unless_null $P1695, vivify_313
    new $P1695, "Undef"
  vivify_313:
    store_lex "$bodyfirst", $P1695
.annotate 'line', 1229
    find_lex $P1697, "$testop"
    if $P1697, unless_1696_end
    new $P1698, "String"
    assign $P1698, "unless"
    store_lex "$testop", $P1698
  unless_1696_end:
.annotate 'line', 1231
    get_hll_global $P1699, ["POST"], "Ops"
    $P1700 = $P1699."new"()
    store_lex "$ops", $P1700
.annotate 'line', 1233
    find_dynamic_lex $P1701, "$*SUB"
    unless_null $P1701, vivify_314
    get_hll_global $P1701, "$SUB"
    unless_null $P1701, vivify_315
    die "Contextual $*SUB not found"
  vivify_315:
  vivify_314:
    $P1701."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1235
    find_lex $P1702, "self"
    $P1703 = $P1702."tempreg"("P")
    store_lex "$handreg", $P1703
.annotate 'line', 1236
    find_lex $P1704, "$ops"
    find_lex $P1705, "$handreg"
    $P1704."push_pirop"("new", $P1705, "'ExceptionHandler'")
.annotate 'line', 1237
    find_lex $P1706, "$ops"
    find_lex $P1707, "$handreg"
    find_lex $P1708, "$handlabel"
    $P1706."push_pirop"("set_label", $P1707, $P1708)
.annotate 'line', 1238
    find_lex $P1709, "$ops"
    find_lex $P1710, "$handreg"
    $P1709."push_pirop"("callmethod", "\"handle_types\"", $P1710, ".CONTROL_LOOP_NEXT", ".CONTROL_LOOP_REDO", ".CONTROL_LOOP_LAST")
.annotate 'line', 1240
    find_lex $P1711, "$ops"
    find_lex $P1712, "$handreg"
    $P1711."push_pirop"("push_eh", $P1712)
.annotate 'line', 1242
    find_lex $P1714, "$bodyfirst"
    unless $P1714, if_1713_end
    find_lex $P1715, "$ops"
    find_lex $P1716, "$redolabel"
    $P1715."push_pirop"("goto", $P1716)
  if_1713_end:
.annotate 'line', 1243
    find_lex $P1717, "$ops"
    find_lex $P1718, "$testlabel"
    $P1717."push"($P1718)
.annotate 'line', 1244
    find_lex $P1720, "$testpost"
    unless $P1720, if_1719_end
.annotate 'line', 1245
    find_lex $P1721, "$ops"
    find_lex $P1722, "$testpost"
    $P1721."push"($P1722)
.annotate 'line', 1246
    find_lex $P1723, "$ops"
    find_lex $P1724, "$testop"
    find_lex $P1725, "$testpost"
    find_lex $P1726, "$donelabel"
    $P1723."push_pirop"($P1724, $P1725, $P1726)
  if_1719_end:
.annotate 'line', 1248
    find_lex $P1728, "$prepost"
    unless $P1728, if_1727_end
    find_lex $P1729, "$ops"
    find_lex $P1730, "$prepost"
    $P1729."push"($P1730)
  if_1727_end:
.annotate 'line', 1249
    find_lex $P1731, "$ops"
    find_lex $P1732, "$redolabel"
    $P1731."push"($P1732)
.annotate 'line', 1250
    find_lex $P1734, "$bodypost"
    unless $P1734, if_1733_end
    find_lex $P1735, "$ops"
    find_lex $P1736, "$bodypost"
    $P1735."push"($P1736)
  if_1733_end:
.annotate 'line', 1251
    find_lex $P1737, "$ops"
    find_lex $P1738, "$nextlabel"
    $P1737."push"($P1738)
.annotate 'line', 1252
    find_lex $P1740, "$nextpost"
    unless $P1740, if_1739_end
    find_lex $P1741, "$ops"
    find_lex $P1742, "$nextpost"
    $P1741."push"($P1742)
  if_1739_end:
.annotate 'line', 1253
    find_lex $P1743, "$ops"
    find_lex $P1744, "$testlabel"
    $P1743."push_pirop"("goto", $P1744)
.annotate 'line', 1254
    find_lex $P1745, "$ops"
    find_lex $P1746, "$handlabel"
    $P1745."push"($P1746)
.annotate 'line', 1255
    find_lex $P1747, "$ops"
    $P1747."push_pirop"(".local pmc exception")
.annotate 'line', 1256
    find_lex $P1748, "$ops"
    $P1748."push_pirop"(".get_results (exception)")
.annotate 'line', 1257
    find_lex $P1749, "self"
    $P1750 = $P1749."tempreg"("P")
    store_lex "$S0", $P1750
.annotate 'line', 1258
    find_lex $P1751, "$ops"
    find_lex $P1752, "$S0"
    $P1751."push_pirop"("getattribute", $P1752, "exception", "'type'")
.annotate 'line', 1259
    find_lex $P1753, "$ops"
    find_lex $P1754, "$S0"
    find_lex $P1755, "$nextlabel"
    $P1753."push_pirop"("eq", $P1754, ".CONTROL_LOOP_NEXT", $P1755)
.annotate 'line', 1260
    find_lex $P1756, "$ops"
    find_lex $P1757, "$S0"
    find_lex $P1758, "$redolabel"
    $P1756."push_pirop"("eq", $P1757, ".CONTROL_LOOP_REDO", $P1758)
.annotate 'line', 1261
    find_lex $P1759, "$ops"
    find_lex $P1760, "$donelabel"
    $P1759."push"($P1760)
.annotate 'line', 1262
    find_lex $P1761, "$ops"
    $P1761."push_pirop"("pop_eh")
    find_lex $P1762, "$ops"
.annotate 'line', 1214
    .return ($P1762)
  control_1629:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1763, exception, "payload"
    .return ($P1763)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "while"  :subid("58_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1767
    .param pmc param_1768 :slurpy :named
.annotate 'line', 1273
    new $P1766, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1766, control_1765
    push_eh $P1766
    .lex "self", self
    .lex "$node", param_1767
    .lex "%options", param_1768
.annotate 'line', 1274
    new $P1770, "Undef"
    set $P1769, $P1770
    .lex "$exprpast", $P1769
.annotate 'line', 1275
    new $P1772, "Undef"
    set $P1771, $P1772
    .lex "$bodypast", $P1771
.annotate 'line', 1276
    new $P1774, "Undef"
    set $P1773, $P1774
    .lex "$nextpast", $P1773
.annotate 'line', 1278
    new $P1776, "Undef"
    set $P1775, $P1776
    .lex "$exprpost", $P1775
.annotate 'line', 1280
    $P1778 = root_new ['parrot';'ResizablePMCArray']
    set $P1777, $P1778
    .lex "@arglist", $P1777
.annotate 'line', 1282
    new $P1780, "Undef"
    set $P1779, $P1780
    .lex "$bodypost", $P1779
.annotate 'line', 1284
    new $P1782, "Undef"
    set $P1781, $P1782
    .lex "$nextpost", $P1781
.annotate 'line', 1287
    new $P1784, "Undef"
    set $P1783, $P1784
    .lex "$testop", $P1783
.annotate 'line', 1288
    new $P1786, "Undef"
    set $P1785, $P1786
    .lex "$bodyfirst", $P1785
.annotate 'line', 1290
    new $P1788, "Undef"
    set $P1787, $P1788
    .lex "$ops", $P1787
.annotate 'line', 1274
    find_lex $P1789, "$node"
    unless_null $P1789, vivify_316
    $P1789 = root_new ['parrot';'ResizablePMCArray']
  vivify_316:
    set $P1790, $P1789[0]
    unless_null $P1790, vivify_317
    new $P1790, "Undef"
  vivify_317:
    store_lex "$exprpast", $P1790
.annotate 'line', 1275
    find_lex $P1791, "$node"
    unless_null $P1791, vivify_318
    $P1791 = root_new ['parrot';'ResizablePMCArray']
  vivify_318:
    set $P1792, $P1791[1]
    unless_null $P1792, vivify_319
    new $P1792, "Undef"
  vivify_319:
    store_lex "$bodypast", $P1792
.annotate 'line', 1276
    find_lex $P1793, "$node"
    unless_null $P1793, vivify_320
    $P1793 = root_new ['parrot';'ResizablePMCArray']
  vivify_320:
    set $P1794, $P1793[2]
    unless_null $P1794, vivify_321
    new $P1794, "Undef"
  vivify_321:
    store_lex "$nextpast", $P1794
.annotate 'line', 1278
    find_lex $P1795, "self"
    find_lex $P1796, "$exprpast"
    $P1797 = $P1795."as_post"($P1796, "r" :named("rtype"))
    store_lex "$exprpost", $P1797
.annotate 'line', 1280
    new $P1798, "ResizablePMCArray"
    store_lex "@arglist", $P1798
.annotate 'line', 1281
    find_lex $P1800, "$bodypast"
    $N1801 = $P1800."arity"()
    islt $I1802, $N1801, 1.0
    if $I1802, unless_1799_end
    find_lex $P1803, "@arglist"
    find_lex $P1804, "$exprpost"
    push $P1803, $P1804
  unless_1799_end:
.annotate 'line', 1282
    find_lex $P1805, "self"
    find_lex $P1806, "$bodypast"
    find_lex $P1807, "@arglist"
    $P1808 = $P1805."as_post"($P1806, "v" :named("rtype"), $P1807 :named("arglist"))
    store_lex "$bodypost", $P1808
.annotate 'line', 1284
    get_hll_global $P1809, "null__P"
    store_lex "$nextpost", $P1809
.annotate 'line', 1285
    find_lex $P1811, "$nextpast"
    unless $P1811, if_1810_end
    find_lex $P1812, "self"
    find_lex $P1813, "$nextpast"
    $P1814 = $P1812."as_post"($P1813, "v" :named("rtype"))
    store_lex "$nextpost", $P1814
  if_1810_end:
.annotate 'line', 1287
    find_lex $P1815, "%options"
    unless_null $P1815, vivify_322
    $P1815 = root_new ['parrot';'Hash']
  vivify_322:
    set $P1816, $P1815["testop"]
    unless_null $P1816, vivify_323
    new $P1816, "Undef"
  vivify_323:
    store_lex "$testop", $P1816
.annotate 'line', 1288
    find_lex $P1817, "%options"
    unless_null $P1817, vivify_324
    $P1817 = root_new ['parrot';'Hash']
  vivify_324:
    set $P1818, $P1817["bodyfirst"]
    unless_null $P1818, vivify_325
    new $P1818, "Undef"
  vivify_325:
    store_lex "$bodyfirst", $P1818
.annotate 'line', 1290
    find_lex $P1819, "self"
    find_lex $P1820, "$testop"
    find_lex $P1821, "$exprpost"
    find_lex $P1822, "$bodypost"
    find_lex $P1823, "$bodyfirst"
    find_lex $P1824, "$nextpost"
    $P1825 = $P1819."loop_gen"($P1820 :named("testop"), $P1821 :named("test"), $P1822 :named("body"), $P1823 :named("bodyfirst"), $P1824 :named("next"))
    store_lex "$ops", $P1825
.annotate 'line', 1292
    find_lex $P1826, "$ops"
    find_lex $P1827, "$exprpost"
    $P1826."result"($P1827)
.annotate 'line', 1293
    find_lex $P1828, "$ops"
    find_lex $P1829, "$node"
    $P1828."node"($P1829)
    find_lex $P1830, "$ops"
.annotate 'line', 1273
    .return ($P1830)
  control_1765:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1831, exception, "payload"
    .return ($P1831)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "until"  :subid("59_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1835
    .param pmc param_1836 :slurpy :named
.annotate 'line', 1297
    new $P1834, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1834, control_1833
    push_eh $P1834
    .lex "self", self
    .lex "$node", param_1835
    .lex "%options", param_1836
.annotate 'line', 1298
    find_lex $P1837, "self"
    find_lex $P1838, "$node"
    find_lex $P1839, "%options"
    $P1840 = $P1837."while"($P1838, $P1839 :flat, "if" :named("testop"))
.annotate 'line', 1297
    .return ($P1840)
  control_1833:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1841, exception, "payload"
    .return ($P1841)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_while"  :subid("60_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1845
    .param pmc param_1846 :slurpy :named
.annotate 'line', 1301
    new $P1844, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1844, control_1843
    push_eh $P1844
    .lex "self", self
    .lex "$node", param_1845
    .lex "%options", param_1846
.annotate 'line', 1302
    find_lex $P1847, "self"
    find_lex $P1848, "$node"
    find_lex $P1849, "%options"
    $P1850 = $P1847."while"($P1848, $P1849 :flat, 1 :named("bodyfirst"))
.annotate 'line', 1301
    .return ($P1850)
  control_1843:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1851, exception, "payload"
    .return ($P1851)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "repeat_until"  :subid("61_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1855
    .param pmc param_1856 :slurpy :named
.annotate 'line', 1305
    new $P1854, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1854, control_1853
    push_eh $P1854
    .lex "self", self
    .lex "$node", param_1855
    .lex "%options", param_1856
.annotate 'line', 1306
    find_lex $P1857, "self"
    find_lex $P1858, "$node"
    find_lex $P1859, "%options"
    $P1860 = $P1857."while"($P1858, $P1859 :flat, "if" :named("testop"), 1 :named("bodyfirst"))
.annotate 'line', 1305
    .return ($P1860)
  control_1853:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1861, exception, "payload"
    .return ($P1861)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "for"  :subid("62_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1865
    .param pmc param_1866 :slurpy :named
.annotate 'line', 1314
    .const 'Sub' $P1938 = "63_1308206306.49694" 
    capture_lex $P1938
    new $P1864, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1864, control_1863
    push_eh $P1864
    .lex "self", self
    .lex "$node", param_1865
    .lex "%options", param_1866
.annotate 'line', 1315
    new $P1868, "Undef"
    set $P1867, $P1868
    .lex "$ops", $P1867
.annotate 'line', 1316
    new $P1870, "Undef"
    set $P1869, $P1870
    .lex "$prepost", $P1869
.annotate 'line', 1317
    new $P1872, "Undef"
    set $P1871, $P1872
    .lex "$testpost", $P1871
.annotate 'line', 1319
    new $P1874, "Undef"
    set $P1873, $P1874
    .lex "$collpast", $P1873
.annotate 'line', 1320
    new $P1876, "Undef"
    set $P1875, $P1876
    .lex "$bodypast", $P1875
.annotate 'line', 1322
    new $P1878, "Undef"
    set $P1877, $P1878
    .lex "$collpost", $P1877
.annotate 'line', 1326
    new $P1880, "Undef"
    set $P1879, $P1880
    .lex "$undeflabel", $P1879
.annotate 'line', 1327
    new $P1882, "Undef"
    set $P1881, $P1882
    .lex "$S0", $P1881
.annotate 'line', 1335
    new $P1884, "Undef"
    set $P1883, $P1884
    .lex "$arity", $P1883
.annotate 'line', 1344
    $P1886 = root_new ['parrot';'ResizablePMCArray']
    set $P1885, $P1886
    .lex "@arglist", $P1885
.annotate 'line', 1354
    new $P1888, "Undef"
    set $P1887, $P1888
    .lex "$bodypost", $P1887
.annotate 'line', 1315
    get_hll_global $P1889, ["POST"], "Ops"
    find_lex $P1890, "$node"
    $P1891 = $P1889."new"($P1890 :named("node"))
    store_lex "$ops", $P1891
.annotate 'line', 1316
    get_hll_global $P1892, ["POST"], "Ops"
    $P1893 = $P1892."new"()
    store_lex "$prepost", $P1893
.annotate 'line', 1317
    get_hll_global $P1894, ["POST"], "Ops"
    find_lex $P1895, "self"
    $P1896 = $P1895."tempreg"("P")
    $P1897 = $P1894."new"($P1896 :named("result"))
    store_lex "$testpost", $P1897
.annotate 'line', 1319
    find_lex $P1898, "$node"
    unless_null $P1898, vivify_326
    $P1898 = root_new ['parrot';'ResizablePMCArray']
  vivify_326:
    set $P1899, $P1898[0]
    unless_null $P1899, vivify_327
    new $P1899, "Undef"
  vivify_327:
    store_lex "$collpast", $P1899
.annotate 'line', 1320
    find_lex $P1900, "$node"
    unless_null $P1900, vivify_328
    $P1900 = root_new ['parrot';'ResizablePMCArray']
  vivify_328:
    set $P1901, $P1900[1]
    unless_null $P1901, vivify_329
    new $P1901, "Undef"
  vivify_329:
    store_lex "$bodypast", $P1901
.annotate 'line', 1322
    find_lex $P1902, "self"
    find_lex $P1903, "$collpast"
    $P1904 = $P1902."as_post"($P1903, "P" :named("rtype"))
    store_lex "$collpost", $P1904
.annotate 'line', 1323
    find_lex $P1905, "$ops"
    find_lex $P1906, "$collpost"
    $P1905."push"($P1906)
.annotate 'line', 1326
    get_hll_global $P1907, ["POST"], "Label"
    $P1908 = $P1907."new"("for_undef_" :named("name"))
    store_lex "$undeflabel", $P1908
.annotate 'line', 1327
    find_lex $P1909, "self"
    $P1910 = $P1909."tempreg"("I")
    store_lex "$S0", $P1910
.annotate 'line', 1328
    find_lex $P1911, "$ops"
    find_lex $P1912, "$S0"
    find_lex $P1913, "$collpost"
    $P1911."push_pirop"("defined", $P1912, $P1913)
.annotate 'line', 1329
    find_lex $P1914, "$ops"
    find_lex $P1915, "$S0"
    find_lex $P1916, "$undeflabel"
    $P1914."push_pirop"("unless", $P1915, $P1916)
.annotate 'line', 1331
    find_lex $P1917, "$ops"
    find_lex $P1918, "$testpost"
    find_lex $P1919, "$collpost"
    $P1917."push_pirop"("iter", $P1918, $P1919)
.annotate 'line', 1335
    new $P1920, "Integer"
    assign $P1920, 1
    store_lex "$arity", $P1920
.annotate 'line', 1336
    find_lex $P1922, "$node"
    $P1923 = $P1922."arity"()
    defined $I1924, $P1923
    if $I1924, if_1921
.annotate 'line', 1339
    find_lex $P1928, "$bodypast"
    $P1929 = $P1928."arity"()
    defined $I1930, $P1929
    unless $I1930, if_1927_end
.annotate 'line', 1340
    find_lex $P1931, "$bodypast"
    $P1932 = $P1931."arity"()
    store_lex "$arity", $P1932
  if_1927_end:
.annotate 'line', 1339
    goto if_1921_end
  if_1921:
.annotate 'line', 1337
    find_lex $P1925, "$node"
    $P1926 = $P1925."arity"()
    store_lex "$arity", $P1926
  if_1921_end:
.annotate 'line', 1344
    new $P1933, "ResizablePMCArray"
    store_lex "@arglist", $P1933
.annotate 'line', 1345
    new $P1955, 'ExceptionHandler'
    set_label $P1955, loop1954_handler
    $P1955."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1955
    goto loop1954_redo
  loop1954_test:
    find_lex $P1934, "$arity"
    set $N1935, $P1934
    isgt $I1936, $N1935, 0.0
    unless $I1936, loop1954_done
  loop1954_redo:
    .const 'Sub' $P1938 = "63_1308206306.49694" 
    capture_lex $P1938
    $P1938()
  loop1954_next:
    goto loop1954_test
  loop1954_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1956, exception, 'type'
    eq $P1956, .CONTROL_LOOP_NEXT, loop1954_next
    eq $P1956, .CONTROL_LOOP_REDO, loop1954_redo
  loop1954_done:
    pop_eh 
.annotate 'line', 1354
    find_lex $P1957, "self"
    find_lex $P1958, "$bodypast"
    find_lex $P1959, "@arglist"
    $P1960 = $P1957."as_post"($P1958, "v" :named("rtype"), $P1959 :named("arglist"))
    store_lex "$bodypost", $P1960
.annotate 'line', 1357
    find_lex $P1961, "$ops"
    find_lex $P1962, "self"
    find_lex $P1963, "$testpost"
    find_lex $P1964, "$prepost"
    find_lex $P1965, "$bodypost"
    $P1966 = $P1962."loop_gen"($P1963 :named("test"), $P1964 :named("pre"), $P1965 :named("body"))
    $P1961."push"($P1966)
.annotate 'line', 1359
    find_lex $P1967, "$ops"
    find_lex $P1968, "$undeflabel"
    $P1967."push"($P1968)
.annotate 'line', 1360
    find_lex $P1969, "$ops"
    find_lex $P1970, "$testpost"
    $P1969."result"($P1970)
    find_lex $P1971, "$ops"
.annotate 'line', 1314
    .return ($P1971)
  control_1863:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1972, exception, "payload"
    .return ($P1972)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block1937"  :anon :subid("63_1308206306.49694") :outer("62_1308206306.49694")
.annotate 'line', 1346
    new $P1940, "Undef"
    set $P1939, $P1940
    .lex "$nextarg", $P1939
    find_lex $P1941, "self"
    $P1942 = $P1941."tempreg"("P")
    store_lex "$nextarg", $P1942
.annotate 'line', 1347
    find_lex $P1943, "$prepost"
    find_lex $P1944, "$nextarg"
    find_lex $P1945, "$testpost"
    $P1943."push_pirop"("shift", $P1944, $P1945)
.annotate 'line', 1348
    find_lex $P1947, "$arity"
    set $N1948, $P1947
    islt $I1949, $N1948, 1.0
    unless $I1949, if_1946_end
    die 0, .CONTROL_LOOP_LAST
  if_1946_end:
.annotate 'line', 1349
    find_lex $P1950, "@arglist"
    find_lex $P1951, "$nextarg"
    push $P1950, $P1951
    find_lex $P1952, "$arity"
    clone $P1953, $P1952
    dec $P1952
.annotate 'line', 1345
    .return ($P1953)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "list"  :subid("64_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_1976
    .param pmc param_1977 :slurpy :named
.annotate 'line', 1370
    .const 'Sub' $P2005 = "65_1308206306.49694" 
    capture_lex $P2005
    new $P1975, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1975, control_1974
    push_eh $P1975
    .lex "self", self
    .lex "$node", param_1976
    .lex "%options", param_1977
.annotate 'line', 1372
    new $P1979, "Undef"
    set $P1978, $P1979
    .lex "$ops", $P1978
.annotate 'line', 1373
    $P1981 = root_new ['parrot';'ResizablePMCArray']
    set $P1980, $P1981
    .lex "@posargs", $P1980
.annotate 'line', 1381
    new $P1983, "Undef"
    set $P1982, $P1983
    .lex "$returns", $P1982
.annotate 'line', 1384
    new $P1985, "Undef"
    set $P1984, $P1985
    .lex "$listpost", $P1984
.annotate 'line', 1370
    find_lex $P1986, "$ops"
    find_lex $P1987, "@posargs"
.annotate 'line', 1374

        $P0 = find_lex '$node'
        ($P0, $P1) = self.'post_children'($P0, 'signature'=>'v*')
        store_lex '$ops', $P0
        store_lex '@posargs', $P1
    
.annotate 'line', 1381
    find_lex $P1988, "$node"
    $P1989 = $P1988."returns"()
    store_lex "$returns", $P1989
.annotate 'line', 1382
    find_lex $P1991, "$returns"
    if $P1991, unless_1990_end
    new $P1992, "String"
    assign $P1992, "ResizablePMCArray"
    store_lex "$returns", $P1992
  unless_1990_end:
.annotate 'line', 1384
    find_lex $P1993, "self"
    find_lex $P1994, "$returns"
    $P1995 = $P1993."as_vivipost"($P1994, "P" :named("rtype"))
    store_lex "$listpost", $P1995
.annotate 'line', 1385
    find_lex $P1996, "$ops"
    find_lex $P1997, "$listpost"
    $P1996."result"($P1997)
.annotate 'line', 1386
    find_lex $P1998, "$ops"
    find_lex $P1999, "$listpost"
    $P1998."push"($P1999)
.annotate 'line', 1387
    find_lex $P2001, "@posargs"
    defined $I2002, $P2001
    unless $I2002, for_undef_330
    iter $P2000, $P2001
    new $P2012, 'ExceptionHandler'
    set_label $P2012, loop2011_handler
    $P2012."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2012
  loop2011_test:
    unless $P2000, loop2011_done
    shift $P2003, $P2000
  loop2011_redo:
    .const 'Sub' $P2005 = "65_1308206306.49694" 
    capture_lex $P2005
    $P2005($P2003)
  loop2011_next:
    goto loop2011_test
  loop2011_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2013, exception, 'type'
    eq $P2013, .CONTROL_LOOP_NEXT, loop2011_next
    eq $P2013, .CONTROL_LOOP_REDO, loop2011_redo
  loop2011_done:
    pop_eh 
  for_undef_330:
    find_lex $P2014, "$ops"
.annotate 'line', 1370
    .return ($P2014)
  control_1974:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2015, exception, "payload"
    .return ($P2015)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2004"  :anon :subid("65_1308206306.49694") :outer("64_1308206306.49694")
    .param pmc param_2006
.annotate 'line', 1387
    .lex "$_", param_2006
    find_lex $P2007, "$ops"
    find_lex $P2008, "$listpost"
    find_lex $P2009, "$_"
    $P2010 = $P2007."push_pirop"("push", $P2008, $P2009)
    .return ($P2010)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "stmts"  :subid("66_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2019
    .param pmc param_2020 :slurpy :named
.annotate 'line', 1396
    new $P2018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2018, control_2017
    push_eh $P2018
    .lex "self", self
    .lex "$node", param_2019
    .lex "%options", param_2020
.annotate 'line', 1397
    find_lex $P2021, "self"
    find_lex $P2022, "$node"
    find_lex $P2023, "%options"
    $P2024 = $P2021."node_as_post"($P2022, $P2023)
.annotate 'line', 1396
    .return ($P2024)
  control_2017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2025, exception, "payload"
    .return ($P2025)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "null"  :subid("67_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2029
    .param pmc param_2030 :slurpy :named
.annotate 'line', 1407
    new $P2028, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2028, control_2027
    push_eh $P2028
    .lex "self", self
    .lex "$node", param_2029
    .lex "%options", param_2030
.annotate 'line', 1408
    get_hll_global $P2031, ["POST"], "Ops"
    find_lex $P2032, "$node"
    $P2033 = $P2031."new"($P2032 :named("node"))
.annotate 'line', 1407
    .return ($P2033)
  control_2027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2034, exception, "payload"
    .return ($P2034)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "return"  :subid("68_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2038
    .param pmc param_2039 :slurpy :named
.annotate 'line', 1416
    .const 'Sub' $P2065 = "69_1308206306.49694" 
    capture_lex $P2065
    new $P2037, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2037, control_2036
    push_eh $P2037
    .lex "self", self
    .lex "$node", param_2038
    .lex "%options", param_2039
.annotate 'line', 1417
    new $P2041, "Undef"
    set $P2040, $P2041
    .lex "$ops", $P2040
.annotate 'line', 1419
    new $P2043, "Undef"
    set $P2042, $P2043
    .lex "$exreg", $P2042
.annotate 'line', 1420
    new $P2045, "Undef"
    set $P2044, $P2045
    .lex "$extype", $P2044
.annotate 'line', 1425
    new $P2047, "Undef"
    set $P2046, $P2047
    .lex "$cpast", $P2046
.annotate 'line', 1417
    get_hll_global $P2048, ["POST"], "Ops"
    find_lex $P2049, "$node"
    $P2050 = $P2048."new"($P2049 :named("node"))
    store_lex "$ops", $P2050
.annotate 'line', 1419
    find_lex $P2051, "self"
    $P2052 = $P2051."tempreg"("P")
    store_lex "$exreg", $P2052
.annotate 'line', 1420
    find_lex $P2053, "$exreg"
    concat $P2054, $P2053, "['type']"
    store_lex "$extype", $P2054
.annotate 'line', 1421
    find_lex $P2055, "$ops"
    find_lex $P2056, "$exreg"
    $P2055."push_pirop"("new", $P2056, "\"Exception\"")
.annotate 'line', 1422
    find_lex $P2057, "$ops"
    find_lex $P2058, "$extype"
    $P2057."push_pirop"("set", $P2058, ".CONTROL_RETURN")
.annotate 'line', 1423
    find_dynamic_lex $P2059, "$*SUB"
    unless_null $P2059, vivify_331
    get_hll_global $P2059, "$SUB"
    unless_null $P2059, vivify_332
    die "Contextual $*SUB not found"
  vivify_332:
  vivify_331:
    $P2059."add_directive"(".include \"except_types.pasm\"")
.annotate 'line', 1425
    find_lex $P2060, "$node"
    unless_null $P2060, vivify_333
    $P2060 = root_new ['parrot';'ResizablePMCArray']
  vivify_333:
    set $P2061, $P2060[0]
    unless_null $P2061, vivify_334
    new $P2061, "Undef"
  vivify_334:
    store_lex "$cpast", $P2061
.annotate 'line', 1426
    find_lex $P2063, "$cpast"
    unless $P2063, if_2062_end
    .const 'Sub' $P2065 = "69_1308206306.49694" 
    capture_lex $P2065
    $P2065()
  if_2062_end:
.annotate 'line', 1432
    find_lex $P2080, "$ops"
    find_lex $P2081, "$exreg"
    $P2080."push_pirop"("throw", $P2081)
    find_lex $P2082, "$ops"
.annotate 'line', 1416
    .return ($P2082)
  control_2036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2083, exception, "payload"
    .return ($P2083)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2064"  :anon :subid("69_1308206306.49694") :outer("68_1308206306.49694")
.annotate 'line', 1427
    new $P2067, "Undef"
    set $P2066, $P2067
    .lex "$cpost", $P2066
    find_lex $P2068, "self"
    find_lex $P2069, "$cpast"
    $P2070 = $P2068."as_post"($P2069, "P" :named("rtype"))
    store_lex "$cpost", $P2070
.annotate 'line', 1428
    find_lex $P2071, "self"
    find_lex $P2072, "$cpost"
    $P2073 = $P2071."coerce"($P2072, "P")
    store_lex "$cpost", $P2073
.annotate 'line', 1429
    find_lex $P2074, "$ops"
    find_lex $P2075, "$cpost"
    $P2074."push"($P2075)
.annotate 'line', 1430
    find_lex $P2076, "$ops"
    find_lex $P2077, "$exreg"
    find_lex $P2078, "$cpost"
    $P2079 = $P2076."push_pirop"("setattribute", $P2077, "'payload'", $P2078)
.annotate 'line', 1426
    .return ($P2079)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "try"  :subid("70_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2087
    .param pmc param_2088 :slurpy :named
.annotate 'line', 1444
    new $P2086, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2086, control_2085
    push_eh $P2086
    .lex "self", self
    .lex "$node", param_2087
    .lex "%options", param_2088
.annotate 'line', 1445
    new $P2090, "Undef"
    set $P2089, $P2090
    .lex "$ops", $P2089
.annotate 'line', 1447
    new $P2092, "Undef"
    set $P2091, $P2092
    .lex "$S0", $P2091
.annotate 'line', 1448
    new $P2094, "Undef"
    set $P2093, $P2094
    .lex "$catchlabel", $P2093
.annotate 'line', 1449
    new $P2096, "Undef"
    set $P2095, $P2096
    .lex "$endlabel", $P2095
.annotate 'line', 1451
    new $P2098, "Undef"
    set $P2097, $P2098
    .lex "$rtype", $P2097
.annotate 'line', 1453
    new $P2100, "Undef"
    set $P2099, $P2100
    .lex "$trypost", $P2099
.annotate 'line', 1457
    new $P2102, "Undef"
    set $P2101, $P2102
    .lex "$elsepast", $P2101
.annotate 'line', 1463
    new $P2104, "Undef"
    set $P2103, $P2104
    .lex "$catchpast", $P2103
.annotate 'line', 1445
    get_hll_global $P2105, ["POST"], "Ops"
    find_lex $P2106, "$node"
    $P2107 = $P2105."new"($P2106 :named("node"))
    store_lex "$ops", $P2107
.annotate 'line', 1447
    find_lex $P2108, "self"
    $P2109 = $P2108."unique"("catch_")
    store_lex "$S0", $P2109
.annotate 'line', 1448
    get_hll_global $P2110, ["POST"], "Label"
    find_lex $P2111, "$S0"
    $P2112 = $P2110."new"($P2111 :named("result"))
    store_lex "$catchlabel", $P2112
.annotate 'line', 1449
    get_hll_global $P2113, ["POST"], "Lable"
    find_lex $P2114, "$S0"
    concat $P2115, $P2114, "_end"
    $P2116 = $P2113."new"($P2115 :named("result"))
    store_lex "$endlabel", $P2116
.annotate 'line', 1451
    find_lex $P2117, "%options"
    unless_null $P2117, vivify_335
    $P2117 = root_new ['parrot';'Hash']
  vivify_335:
    set $P2118, $P2117["rtype"]
    unless_null $P2118, vivify_336
    new $P2118, "Undef"
  vivify_336:
    store_lex "$rtype", $P2118
.annotate 'line', 1453
    find_lex $P2119, "self"
    find_lex $P2120, "$node"
    unless_null $P2120, vivify_337
    $P2120 = root_new ['parrot';'ResizablePMCArray']
  vivify_337:
    set $P2121, $P2120[0]
    unless_null $P2121, vivify_338
    new $P2121, "Undef"
  vivify_338:
    find_lex $P2122, "$rtype"
    $P2123 = $P2119."as_post"($P2121, $P2122 :named("rtype"))
    store_lex "$trypost", $P2123
.annotate 'line', 1454
    find_lex $P2124, "$ops"
    find_lex $P2125, "$catchlabel"
    $P2124."push_pirop"("push_eh", $P2125)
.annotate 'line', 1455
    find_lex $P2126, "$ops"
    find_lex $P2127, "$trypost"
    $P2126."push"($P2127)
.annotate 'line', 1456
    find_lex $P2128, "$ops"
    $P2128."push_pirop"("pop_eh")
.annotate 'line', 1457
    find_lex $P2129, "$node"
    unless_null $P2129, vivify_339
    $P2129 = root_new ['parrot';'ResizablePMCArray']
  vivify_339:
    set $P2130, $P2129[2]
    unless_null $P2130, vivify_340
    new $P2130, "Undef"
  vivify_340:
    store_lex "$elsepast", $P2130
.annotate 'line', 1458
    find_lex $P2132, "$elsepast"
    unless $P2132, if_2131_end
.annotate 'line', 1459
    find_lex $P2133, "$ops"
    find_lex $P2134, "self"
    find_lex $P2135, "$elsepast"
    $P2136 = $P2134."as_post"($P2135, "v" :named("rtype"))
    $P2133."push"($P2136)
  if_2131_end:
.annotate 'line', 1461
    find_lex $P2137, "$ops"
    find_lex $P2138, "$endlabel"
    $P2137."push_pirop"("goto", $P2138)
.annotate 'line', 1462
    find_lex $P2139, "$ops"
    find_lex $P2140, "$catchlabel"
    $P2139."push"($P2140)
.annotate 'line', 1463
    find_lex $P2141, "$node"
    unless_null $P2141, vivify_341
    $P2141 = root_new ['parrot';'ResizablePMCArray']
  vivify_341:
    set $P2142, $P2141[1]
    unless_null $P2142, vivify_342
    new $P2142, "Undef"
  vivify_342:
    store_lex "$catchpast", $P2142
.annotate 'line', 1464
    find_lex $P2144, "$catchpast"
    unless $P2144, if_2143_end
.annotate 'line', 1465
    find_lex $P2145, "$ops"
    find_lex $P2146, "self"
    find_lex $P2147, "$catchpast"
    $P2148 = $P2146."as_post"($P2147, "v" :named("rtype"))
    $P2145."push"($P2148)
.annotate 'line', 1466
    find_lex $P2149, "$ops"
    $P2149."push_pirop"("pop_eh")
  if_2143_end:
.annotate 'line', 1468
    find_lex $P2150, "$ops"
    find_lex $P2151, "$endlabel"
    $P2150."push"($P2151)
.annotate 'line', 1469
    find_lex $P2152, "$ops"
    find_lex $P2153, "$trypost"
    $P2152."result"($P2153)
    find_lex $P2154, "$ops"
.annotate 'line', 1444
    .return ($P2154)
  control_2085:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2155, exception, "payload"
    .return ($P2155)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "chain"  :subid("71_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2159
    .param pmc param_2160 :slurpy :named
.annotate 'line', 1482
    .const 'Sub' $P2211 = "73_1308206306.49694" 
    capture_lex $P2211
    .const 'Sub' $P2177 = "72_1308206306.49694" 
    capture_lex $P2177
    new $P2158, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2158, control_2157
    push_eh $P2158
    .lex "self", self
    .lex "$node", param_2159
    .lex "%options", param_2160
.annotate 'line', 1484
    $P2162 = root_new ['parrot';'ResizablePMCArray']
    set $P2161, $P2162
    .lex "@clist", $P2161
.annotate 'line', 1485
    new $P2164, "Undef"
    set $P2163, $P2164
    .lex "$cpast", $P2163
.annotate 'line', 1493
    new $P2166, "Undef"
    set $P2165, $P2166
    .lex "$ops", $P2165
.annotate 'line', 1495
    new $P2168, "Undef"
    set $P2167, $P2168
    .lex "$endlabel", $P2167
.annotate 'line', 1498
    new $P2170, "Undef"
    set $P2169, $P2170
    .lex "$apost", $P2169
.annotate 'line', 1484
    new $P2171, "ResizablePMCArray"
    store_lex "@clist", $P2171
.annotate 'line', 1485
    find_lex $P2172, "$node"
    store_lex "$cpast", $P2172
.annotate 'line', 1486
    new $P2191, 'ExceptionHandler'
    set_label $P2191, loop2190_handler
    $P2191."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2191
  loop2190_test:
    find_lex $P2173, "$cpast"
    get_hll_global $P2174, ["PAST"], "Op"
    $P2175 = $P2173."isa"($P2174)
    unless $P2175, loop2190_done
  loop2190_redo:
    .const 'Sub' $P2177 = "72_1308206306.49694" 
    capture_lex $P2177
    $P2177()
  loop2190_next:
    goto loop2190_test
  loop2190_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2192, exception, 'type'
    eq $P2192, .CONTROL_LOOP_NEXT, loop2190_next
    eq $P2192, .CONTROL_LOOP_REDO, loop2190_redo
  loop2190_done:
    pop_eh 
.annotate 'line', 1493
    get_hll_global $P2193, ["POST"], "Ops"
    find_lex $P2194, "$node"
    $P2195 = $P2193."new"($P2194 :named("node"))
    store_lex "$ops", $P2195
.annotate 'line', 1494
    find_lex $P2196, "$ops"
    find_lex $P2197, "self"
    $P2198 = $P2197."unique"("$P")
    $P2196."result"($P2198)
.annotate 'line', 1495
    get_hll_global $P2199, ["POST"], "Label"
    $P2200 = $P2199("chain_end_" :named("name"))
    store_lex "$endlabel", $P2200
.annotate 'line', 1497
    find_lex $P2201, "@clist"
    pop $P2202, $P2201
    store_lex "$cpast", $P2202
.annotate 'line', 1498
    find_lex $P2203, "self"
    find_lex $P2204, "$cpast"
    unless_null $P2204, vivify_345
    $P2204 = root_new ['parrot';'ResizablePMCArray']
  vivify_345:
    set $P2205, $P2204[0]
    unless_null $P2205, vivify_346
    new $P2205, "Undef"
  vivify_346:
    $P2206 = $P2203."as_post"($P2205, "P" :named("rtype"))
    store_lex "$apost", $P2206
.annotate 'line', 1499
    find_lex $P2207, "$ops"
    find_lex $P2208, "$apost"
    $P2207."push"($P2208)
.annotate 'line', 1501
    new $P2240, 'ExceptionHandler'
    set_label $P2240, loop2239_handler
    $P2240."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2240
  loop2239_test:
    new $P2209, "Integer"
    assign $P2209, 1
    unless $P2209, loop2239_done
  loop2239_redo:
    .const 'Sub' $P2211 = "73_1308206306.49694" 
    capture_lex $P2211
    $P2211()
  loop2239_next:
    goto loop2239_test
  loop2239_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2241, exception, 'type'
    eq $P2241, .CONTROL_LOOP_NEXT, loop2239_next
    eq $P2241, .CONTROL_LOOP_REDO, loop2239_redo
  loop2239_done:
    pop_eh 
.annotate 'line', 1511
    find_lex $P2242, "$ops"
    find_lex $P2243, "$endlabel"
    $P2242."push"($P2243)
    find_lex $P2244, "$ops"
.annotate 'line', 1482
    .return ($P2244)
  control_2157:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2245, exception, "payload"
    .return ($P2245)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2176"  :anon :subid("72_1308206306.49694") :outer("71_1308206306.49694")
.annotate 'line', 1487
    new $P2179, "Undef"
    set $P2178, $P2179
    .lex "$pasttype", $P2178
    find_lex $P2180, "$cpast"
    $P2181 = $P2180."pasttype"()
    store_lex "$pasttype", $P2181
.annotate 'line', 1488
    find_lex $P2183, "$pasttype"
    set $S2184, $P2183
    isne $I2185, $S2184, "chain"
    unless $I2185, if_2182_end
    die 0, .CONTROL_LOOP_LAST
  if_2182_end:
.annotate 'line', 1489
    find_lex $P2186, "@clist"
    find_lex $P2187, "$cpast"
    push $P2186, $P2187
.annotate 'line', 1490
    find_lex $P2188, "$cpast"
    unless_null $P2188, vivify_343
    $P2188 = root_new ['parrot';'ResizablePMCArray']
  vivify_343:
    set $P2189, $P2188[0]
    unless_null $P2189, vivify_344
    new $P2189, "Undef"
  vivify_344:
    store_lex "$cpast", $P2189
.annotate 'line', 1486
    .return ($P2189)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2210"  :anon :subid("73_1308206306.49694") :outer("71_1308206306.49694")
.annotate 'line', 1502
    new $P2213, "Undef"
    set $P2212, $P2213
    .lex "$bpost", $P2212
.annotate 'line', 1504
    new $P2215, "Undef"
    set $P2214, $P2215
    .lex "$name", $P2214
.annotate 'line', 1502
    find_lex $P2216, "self"
    find_lex $P2217, "$cpast"
    unless_null $P2217, vivify_347
    $P2217 = root_new ['parrot';'ResizablePMCArray']
  vivify_347:
    set $P2218, $P2217[1]
    unless_null $P2218, vivify_348
    new $P2218, "Undef"
  vivify_348:
    $P2219 = $P2216."as_post"($P2218, "P" :named("rtype"))
    store_lex "$bpost", $P2219
.annotate 'line', 1503
    find_lex $P2220, "$ops"
    find_lex $P2221, "$bpost"
    $P2220."push"($P2221)
.annotate 'line', 1504
    find_lex $P2222, "self"
    find_lex $P2223, "$cpast"
    $P2224 = $P2223."name"()
    $P2225 = $P2222."escape"($P2224)
    store_lex "$name", $P2225
.annotate 'line', 1505
    find_lex $P2226, "$ops"
    find_lex $P2227, "$name"
    find_lex $P2228, "$apost"
    find_lex $P2229, "$bpost"
    find_lex $P2230, "$ops"
    $P2226."push_pirop"("call", $P2227, $P2228, $P2229, $P2230 :named("result"))
.annotate 'line', 1506
    find_lex $P2232, "@clist"
    if $P2232, unless_2231_end
    die 0, .CONTROL_LOOP_LAST
  unless_2231_end:
.annotate 'line', 1507
    find_lex $P2233, "$ops"
    find_lex $P2234, "$ops"
    find_lex $P2235, "$endlabel"
    $P2233."push_pirop"("unless", $P2234, $P2235)
.annotate 'line', 1508
    find_lex $P2236, "@clist"
    pop $P2237, $P2236
    store_lex "$cpast", $P2237
.annotate 'line', 1509
    find_lex $P2238, "$bpost"
    store_lex "$apost", $P2238
.annotate 'line', 1501
    .return ($P2238)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "def_or"  :subid("74_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2249
    .param pmc param_2250 :slurpy :named
.annotate 'line', 1522
    new $P2248, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2248, control_2247
    push_eh $P2248
    .lex "self", self
    .lex "$node", param_2249
    .lex "%options", param_2250
.annotate 'line', 1523
    new $P2252, "Undef"
    set $P2251, $P2252
    .lex "$ops", $P2251
.annotate 'line', 1525
    new $P2254, "Undef"
    set $P2253, $P2254
    .lex "$lpost", $P2253
.annotate 'line', 1529
    new $P2256, "Undef"
    set $P2255, $P2256
    .lex "$endlabel", $P2255
.annotate 'line', 1531
    new $P2258, "Undef"
    set $P2257, $P2258
    .lex "$reg", $P2257
.annotate 'line', 1534
    new $P2260, "Undef"
    set $P2259, $P2260
    .lex "$rpost", $P2259
.annotate 'line', 1523
    get_hll_global $P2261, ["POST"], "Ops"
    find_lex $P2262, "$node"
    find_lex $P2263, "self"
    $P2264 = $P2263."unique"("$P")
    $P2265 = $P2261."new"($P2262 :named("node"), $P2264 :named("result"))
    store_lex "$ops", $P2265
.annotate 'line', 1525
    find_lex $P2266, "self"
    find_lex $P2267, "$node"
    unless_null $P2267, vivify_349
    $P2267 = root_new ['parrot';'ResizablePMCArray']
  vivify_349:
    set $P2268, $P2267[0]
    unless_null $P2268, vivify_350
    new $P2268, "Undef"
  vivify_350:
    $P2269 = $P2266."as_post"($P2268, "P" :named("rtype"))
    store_lex "$lpost", $P2269
.annotate 'line', 1526
    find_lex $P2270, "$ops"
    find_lex $P2271, "$lpost"
    $P2270."push"($P2271)
.annotate 'line', 1527
    find_lex $P2272, "$ops"
    find_lex $P2273, "$ops"
    find_lex $P2274, "$lpost"
    $P2272."push_pirop"("set", $P2273, $P2274)
.annotate 'line', 1529
    get_hll_global $P2275, ["POST"], "Label"
    find_lex $P2276, "self"
    $P2277 = $P2276."unique"("default_")
    $P2278 = $P2275."new"($P2277 :named("result"))
    store_lex "$endlabel", $P2278
.annotate 'line', 1531
    find_lex $P2279, "self"
    $P2280 = $P2279."unique"("$I")
    store_lex "$reg", $P2280
.annotate 'line', 1532
    find_lex $P2281, "$ops"
    find_lex $P2282, "$reg"
    find_lex $P2283, "$ops"
    $P2281."push_pirop"("defined", $P2282, $P2283)
.annotate 'line', 1533
    find_lex $P2284, "$ops"
    find_lex $P2285, "$reg"
    find_lex $P2286, "$endlabel"
    $P2284."push_pirop"("if", $P2285, $P2286)
.annotate 'line', 1534
    find_lex $P2287, "self"
    find_lex $P2288, "$node"
    unless_null $P2288, vivify_351
    $P2288 = root_new ['parrot';'ResizablePMCArray']
  vivify_351:
    set $P2289, $P2288[1]
    unless_null $P2289, vivify_352
    new $P2289, "Undef"
  vivify_352:
    $P2290 = $P2287."as_post"($P2289, "P" :named("rtype"))
    store_lex "$rpost", $P2290
.annotate 'line', 1535
    find_lex $P2291, "$ops"
    find_lex $P2292, "$rpost"
    $P2291."push"($P2292)
.annotate 'line', 1536
    find_lex $P2293, "$ops"
    find_lex $P2294, "$ops"
    find_lex $P2295, "$rpost"
    $P2293."push_pirop"("set", $P2294, $P2295)
.annotate 'line', 1537
    find_lex $P2296, "$ops"
    find_lex $P2297, "$endlabel"
    $P2296."push"($P2297)
    find_lex $P2298, "$ops"
.annotate 'line', 1522
    .return ($P2298)
  control_2247:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2299, exception, "payload"
    .return ($P2299)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "xor"  :subid("75_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2303
    .param pmc param_2304 :slurpy :named
.annotate 'line', 1548
    .const 'Sub' $P2356 = "76_1308206306.49694" 
    capture_lex $P2356
    new $P2302, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2302, control_2301
    push_eh $P2302
    .lex "self", self
    .lex "$node", param_2303
    .lex "%options", param_2304
.annotate 'line', 1549
    new $P2306, "Undef"
    set $P2305, $P2306
    .lex "$ops", $P2305
.annotate 'line', 1552
    new $P2308, "Undef"
    set $P2307, $P2308
    .lex "$falselabel", $P2307
.annotate 'line', 1553
    new $P2310, "Undef"
    set $P2309, $P2310
    .lex "$endlabel", $P2309
.annotate 'line', 1555
    new $P2312, "Undef"
    set $P2311, $P2312
    .lex "$i", $P2311
.annotate 'line', 1556
    new $P2314, "Undef"
    set $P2313, $P2314
    .lex "$t", $P2313
.annotate 'line', 1557
    new $P2316, "Undef"
    set $P2315, $P2316
    .lex "$u", $P2315
.annotate 'line', 1558
    new $P2318, "Undef"
    set $P2317, $P2318
    .lex "$iter", $P2317
.annotate 'line', 1559
    new $P2320, "Undef"
    set $P2319, $P2320
    .lex "$apost", $P2319
.annotate 'line', 1560
    new $P2322, "Undef"
    set $P2321, $P2322
    .lex "$bpost", $P2321
.annotate 'line', 1549
    get_hll_global $P2323, ["POST"], "Ops"
    find_lex $P2324, "$node"
    $P2325 = $P2323."new"($P2324 :named("node"))
    store_lex "$ops", $P2325
.annotate 'line', 1550
    find_lex $P2326, "$ops"
    find_lex $P2327, "self"
    $P2328 = $P2327."unique"("$P")
    $P2326."result"($P2328)
.annotate 'line', 1552
    get_hll_global $P2329, ["POST"], "Label"
    $P2330 = $P2329."new"("xor_false" :named("name"))
    store_lex "$falselabel", $P2330
.annotate 'line', 1553
    get_hll_global $P2331, ["POST"], "Label"
    $P2332 = $P2331."new"("xor_end" :named("name"))
    store_lex "$endlabel", $P2332
.annotate 'line', 1555
    find_lex $P2333, "self"
    $P2334 = $P2333."unique"("$I")
    store_lex "$i", $P2334
.annotate 'line', 1556
    find_lex $P2335, "self"
    $P2336 = $P2335."unique"("$i")
    store_lex "$t", $P2336
.annotate 'line', 1557
    find_lex $P2337, "self"
    $P2338 = $P2337."unique"("$i")
    store_lex "$u", $P2338
.annotate 'line', 1558
    get_hll_global $P2339, "node"
    $P2340 = $P2339."iterator"()
    store_lex "$iter", $P2340
.annotate 'line', 1559
    find_lex $P2341, "self"
    find_lex $P2342, "$iter"
    shift $P2343, $P2342
    $P2344 = $P2341."as_post"($P2343, "P" :named("rtype"))
    store_lex "$apost", $P2344
    find_lex $P2345, "$bpost"
.annotate 'line', 1561
    find_lex $P2346, "$ops"
    find_lex $P2347, "$apost"
    $P2346."push"($P2347)
.annotate 'line', 1562
    find_lex $P2348, "$ops"
    find_lex $P2349, "$ops"
    find_lex $P2350, "$apost"
    $P2348."push_pirop"("set", $P2349, $P2350)
.annotate 'line', 1563
    find_lex $P2351, "$ops"
    find_lex $P2352, "$t"
    find_lex $P2353, "$apost"
    $P2351."push_pirop"("istrue", $P2352, $P2353)
.annotate 'line', 1564
    new $P2392, 'ExceptionHandler'
    set_label $P2392, loop2391_handler
    $P2392."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2392
  loop2391_test:
    new $P2354, "Integer"
    assign $P2354, 1
    unless $P2354, loop2391_done
  loop2391_redo:
    .const 'Sub' $P2356 = "76_1308206306.49694" 
    capture_lex $P2356
    $P2356()
  loop2391_next:
    goto loop2391_test
  loop2391_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2393, exception, 'type'
    eq $P2393, .CONTROL_LOOP_NEXT, loop2391_next
    eq $P2393, .CONTROL_LOOP_REDO, loop2391_redo
  loop2391_done:
    pop_eh 
.annotate 'line', 1577
    find_lex $P2394, "$ops"
    find_lex $P2395, "$t"
    find_lex $P2396, "$endlabel"
    $P2394."push_pirop"("if", $P2395, $P2396)
.annotate 'line', 1578
    find_lex $P2397, "$ops"
    find_lex $P2398, "$ops"
    find_lex $P2399, "$bpost"
    $P2397."push_pirop"("set", $P2398, $P2399)
.annotate 'line', 1579
    find_lex $P2400, "$ops"
    find_lex $P2401, "$endlabel"
    $P2400."push_pirop"("goto", $P2401)
.annotate 'line', 1580
    find_lex $P2402, "$ops"
    find_lex $P2403, "$falselabel"
    $P2402."push"($P2403)
.annotate 'line', 1581
    find_lex $P2404, "$ops"
    find_lex $P2405, "$ops"
    $P2404."push_pirop"("new", $P2405, "\"Undef\"")
.annotate 'line', 1582
    find_lex $P2406, "$ops"
    find_lex $P2407, "$endlabel"
    $P2406."push"($P2407)
    find_lex $P2408, "$ops"
.annotate 'line', 1548
    .return ($P2408)
  control_2301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2409, exception, "payload"
    .return ($P2409)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2355"  :anon :subid("76_1308206306.49694") :outer("75_1308206306.49694")
.annotate 'line', 1571
    new $P2358, "Undef"
    set $P2357, $P2358
    .lex "$truelabel", $P2357
.annotate 'line', 1565
    find_lex $P2359, "self"
    find_lex $P2360, "$iter"
    shift $P2361, $P2360
    $P2362 = $P2359."as_post"($P2361, "P" :named("rtype"))
    store_lex "$bpost", $P2362
.annotate 'line', 1566
    find_lex $P2363, "$ops"
    find_lex $P2364, "$bpost"
    $P2363."push"($P2364)
.annotate 'line', 1567
    find_lex $P2365, "$ops"
    find_lex $P2366, "$u"
    find_lex $P2367, "$bpost"
    $P2365."push_pirop"("istrue", $P2366, $P2367)
.annotate 'line', 1568
    find_lex $P2368, "$ops"
    find_lex $P2369, "$i"
    find_lex $P2370, "$t"
    find_lex $P2371, "$u"
    $P2368."push_pirop"("and", $P2369, $P2370, $P2371)
.annotate 'line', 1569
    find_lex $P2372, "$ops"
    find_lex $P2373, "$i"
    find_lex $P2374, "$falselabel"
    $P2372."push_pirop"("if", $P2373, $P2374)
.annotate 'line', 1570
    find_lex $P2376, "$iter"
    if $P2376, unless_2375_end
    die 0, .CONTROL_LOOP_LAST
  unless_2375_end:
.annotate 'line', 1571
    get_hll_global $P2377, ["POST"], "Label"
    $P2378 = $P2377."new"("xor_true" :named("name"))
    store_lex "$truelabel", $P2378
.annotate 'line', 1572
    find_lex $P2379, "$ops"
    find_lex $P2380, "$t"
    find_lex $P2381, "$truelabel"
    $P2379."push_pirop"("if", $P2380, $P2381)
.annotate 'line', 1573
    find_lex $P2382, "$ops"
    find_lex $P2383, "$ops"
    find_lex $P2384, "$bpost"
    $P2382."push_pirop"("set", $P2383, $P2384)
.annotate 'line', 1574
    find_lex $P2385, "$ops"
    find_lex $P2386, "$t"
    find_lex $P2387, "$u"
    $P2385."push_pirop"("set", $P2386, $P2387)
.annotate 'line', 1575
    find_lex $P2388, "$ops"
    find_lex $P2389, "$truelabel"
    $P2390 = $P2388."push"($P2389)
.annotate 'line', 1564
    .return ($P2390)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "bind"  :subid("77_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2413
    .param pmc param_2414 :slurpy :named
.annotate 'line', 1591
    new $P2412, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2412, control_2411
    push_eh $P2412
    .lex "self", self
    .lex "$node", param_2413
    .lex "%options", param_2414
.annotate 'line', 1592
    new $P2416, "Undef"
    set $P2415, $P2416
    .lex "$lpast", $P2415
.annotate 'line', 1593
    new $P2418, "Undef"
    set $P2417, $P2418
    .lex "$rpast", $P2417
.annotate 'line', 1595
    new $P2420, "Undef"
    set $P2419, $P2420
    .lex "$ops", $P2419
.annotate 'line', 1596
    new $P2422, "Undef"
    set $P2421, $P2422
    .lex "$rpost", $P2421
.annotate 'line', 1601
    new $P2424, "Undef"
    set $P2423, $P2424
    .lex "$lpost", $P2423
.annotate 'line', 1592
    find_lex $P2425, "$node"
    unless_null $P2425, vivify_353
    $P2425 = root_new ['parrot';'ResizablePMCArray']
  vivify_353:
    set $P2426, $P2425[0]
    unless_null $P2426, vivify_354
    new $P2426, "Undef"
  vivify_354:
    store_lex "$lpast", $P2426
.annotate 'line', 1593
    find_lex $P2427, "$node"
    unless_null $P2427, vivify_355
    $P2427 = root_new ['parrot';'ResizablePMCArray']
  vivify_355:
    set $P2428, $P2427[1]
    unless_null $P2428, vivify_356
    new $P2428, "Undef"
  vivify_356:
    store_lex "$rpast", $P2428
.annotate 'line', 1595
    get_hll_global $P2429, ["POST"], "Ops"
    find_lex $P2430, "$node"
    $P2431 = $P2429."new"($P2430 :named("node"))
    store_lex "$ops", $P2431
.annotate 'line', 1596
    find_lex $P2432, "self"
    find_lex $P2433, "$rpast"
    $P2434 = $P2432."as_post"($P2433, "P" :named("rtype"))
    store_lex "$rpost", $P2434
.annotate 'line', 1597
    find_lex $P2435, "self"
    find_lex $P2436, "$rpost"
    $P2437 = $P2435."coerce"($P2436, "P")
    store_lex "$rpost", $P2437
.annotate 'line', 1598
    find_lex $P2438, "$ops"
    find_lex $P2439, "$rpost"
    $P2438."push"($P2439)
.annotate 'line', 1600
    find_lex $P2440, "$lpast"
    $P2440."lvalue"(1)
.annotate 'line', 1601
    find_lex $P2441, "self"
    find_lex $P2442, "$lpast"
    find_lex $P2443, "$rpost"
    $P2444 = $P2441."as_post"($P2442, $P2443 :named("bindpost"))
    store_lex "$lpost", $P2444
.annotate 'line', 1602
    find_lex $P2445, "$ops"
    find_lex $P2446, "$lpost"
    $P2445."push"($P2446)
.annotate 'line', 1603
    find_lex $P2447, "$ops"
    find_lex $P2448, "$lpost"
    $P2447."result"($P2448)
    find_lex $P2449, "$ops"
.annotate 'line', 1591
    .return ($P2449)
  control_2411:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2450, exception, "payload"
    .return ($P2450)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "copy"  :subid("78_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2454
    .param pmc param_2455 :slurpy :named
.annotate 'line', 1611
    new $P2453, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2453, control_2452
    push_eh $P2453
    .lex "self", self
    .lex "$node", param_2454
    .lex "%options", param_2455
.annotate 'line', 1612
    new $P2457, "Undef"
    set $P2456, $P2457
    .lex "$rpost", $P2456
.annotate 'line', 1613
    new $P2459, "Undef"
    set $P2458, $P2459
    .lex "$lpost", $P2458
.annotate 'line', 1614
    new $P2461, "Undef"
    set $P2460, $P2461
    .lex "$ops", $P2460
.annotate 'line', 1612
    find_lex $P2462, "self"
    find_lex $P2463, "$node"
    unless_null $P2463, vivify_357
    $P2463 = root_new ['parrot';'ResizablePMCArray']
  vivify_357:
    set $P2464, $P2463[1]
    unless_null $P2464, vivify_358
    new $P2464, "Undef"
  vivify_358:
    $P2465 = $P2462."as_post"($P2464, "P" :named("rtype"))
    store_lex "$rpost", $P2465
.annotate 'line', 1613
    find_lex $P2466, "self"
    find_lex $P2467, "$node"
    unless_null $P2467, vivify_359
    $P2467 = root_new ['parrot';'ResizablePMCArray']
  vivify_359:
    set $P2468, $P2467[0]
    unless_null $P2468, vivify_360
    new $P2468, "Undef"
  vivify_360:
    $P2469 = $P2466."as_post"($P2468, "P" :named("rtype"))
    store_lex "$lpost", $P2469
.annotate 'line', 1614
    get_hll_global $P2470, ["POST"], "Ops"
    find_lex $P2471, "$rpost"
    find_lex $P2472, "$lpost"
    find_lex $P2473, "$node"
    find_lex $P2474, "$lpost"
    $P2475 = $P2470."new"($P2471, $P2472, $P2473 :named("node"), $P2474 :named("result"))
    store_lex "$ops", $P2475
.annotate 'line', 1616
    find_lex $P2476, "$ops"
    find_lex $P2477, "$lpost"
    find_lex $P2478, "$rpost"
    $P2476."push_pirop"("copy", $P2477, $P2478)
    find_lex $P2479, "$ops"
.annotate 'line', 1611
    .return ($P2479)
  control_2452:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2480, exception, "payload"
    .return ($P2480)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "inline"  :subid("79_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Op"])
    .param pmc param_2484
    .param pmc param_2485 :slurpy :named
.annotate 'line', 1625
    new $P2483, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2483, control_2482
    push_eh $P2483
    .lex "self", self
    .lex "$node", param_2484
    .lex "%options", param_2485
.annotate 'line', 1630
    new $P2487, "Undef"
    set $P2486, $P2487
    .lex "$ops", $P2486
.annotate 'line', 1631
    new $P2489, "Undef"
    set $P2488, $P2489
    .lex "$inline", $P2488
.annotate 'line', 1634
    new $P2491, "Undef"
    set $P2490, $P2491
    .lex "$result", $P2490
.annotate 'line', 1635
    new $P2493, "Undef"
    set $P2492, $P2493
    .lex "$i", $P2492
.annotate 'line', 1648
    $P2495 = root_new ['parrot';'ResizablePMCArray']
    set $P2494, $P2495
    .lex "@arglist", $P2494
.annotate 'line', 1650
    new $P2497, "Undef"
    set $P2496, $P2497
    .lex "$s", $P2496
.annotate 'line', 1630
    find_lex $P2498, "self"
    find_lex $P2499, "$node"
    $P2500 = $P2498."post_children"($P2499, "vP" :named("signature"))
    store_lex "$ops", $P2500
.annotate 'line', 1631
    find_lex $P2501, "$node"
    $P2502 = $P2501."inline"()
    store_lex "$inline", $P2502
.annotate 'line', 1632
    find_lex $P2504, "$inline"
    does $I2505, $P2504, "array"
    unless $I2505, if_2503_end
    find_lex $P2506, "$inline"
    join $S2507, "\n", $P2506
    new $P2508, 'String'
    set $P2508, $S2507
    store_lex "$inline", $P2508
  if_2503_end:
.annotate 'line', 1634
    new $P2509, "String"
    assign $P2509, ""
    store_lex "$result", $P2509
.annotate 'line', 1635
    find_lex $P2510, "$inline"
    set $S2511, $P2510
    index $I2512, $S2511, "%t"
    new $P2513, 'Integer'
    set $P2513, $I2512
    store_lex "$i", $P2513
.annotate 'line', 1636
    find_lex $P2515, "$i"
    set $N2516, $P2515
    isge $I2517, $N2516, 0.0
    if $I2517, if_2514
.annotate 'line', 1642
    find_lex $P2524, "$inline"
    set $S2525, $P2524
    index $I2526, $S2525, "%r"
    new $P2527, 'Integer'
    set $P2527, $I2526
    store_lex "$i", $P2527
.annotate 'line', 1643
    find_lex $P2529, "$i"
    set $N2530, $P2529
    isge $I2531, $N2530, 0.0
    unless $I2531, if_2528_end
.annotate 'line', 1644
    find_lex $P2532, "self"
    $P2533 = $P2532."unique"("$P")
    store_lex "$result", $P2533
.annotate 'line', 1645
    find_lex $P2534, "$ops"
    find_lex $P2535, "$result"
    $P2534."result"($P2535)
  if_2528_end:
.annotate 'line', 1641
    goto if_2514_end
  if_2514:
.annotate 'line', 1637
    find_lex $P2518, "self"
    $P2519 = $P2518."unique"("$P")
    store_lex "$result", $P2519
.annotate 'line', 1638
    find_lex $P2520, "$ops"
    find_lex $P2521, "$result"
    $P2520."push_pirop"("new", $P2521, "'Undef'")
.annotate 'line', 1639
    find_lex $P2522, "$ops"
    find_lex $P2523, "$result"
    $P2522."result"($P2523)
  if_2514_end:
.annotate 'line', 1648
    find_lex $P2536, "$ops"
    $P2537 = $P2536."list"()
    store_lex "@arglist", $P2537
.annotate 'line', 1649
    find_lex $P2538, "$ops"
    find_lex $P2539, "@arglist"
    find_lex $P2540, "$inline"
    find_lex $P2541, "$result"
    $P2538."push_pirop"("inline", $P2539 :flat, $P2540 :named("inline"), $P2541 :named("result"))
.annotate 'line', 1650
    find_lex $P2542, "%options"
    unless_null $P2542, vivify_361
    $P2542 = root_new ['parrot';'Hash']
  vivify_361:
    set $P2543, $P2542["rtype"]
    unless_null $P2543, vivify_362
    new $P2543, "Undef"
  vivify_362:
    store_lex "$s", $P2543
    find_lex $P2544, "$ops"
.annotate 'line', 1625
    .return ($P2544)
  control_2482:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2545, exception, "payload"
    .return ($P2545)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("80_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"])
    .param pmc param_2549
    .param pmc param_2550 :slurpy :named
.annotate 'line', 1662
    .const 'Sub' $P2667 = "84_1308206306.49694" 
    capture_lex $P2667
    .const 'Sub' $P2641 = "83_1308206306.49694" 
    capture_lex $P2641
    .const 'Sub' $P2558 = "81_1308206306.49694" 
    capture_lex $P2558
    new $P2548, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2548, control_2547
    push_eh $P2548
    .lex "self", self
    .lex "$node", param_2549
    .lex "%options", param_2550
.annotate 'line', 1664
    new $P2552, "Undef"
    set $P2551, $P2552
    .lex "$bindpost", $P2551
.annotate 'line', 1668
    new $P2554, "Undef"
    set $P2553, $P2554
    .lex "$scope", $P2553
.annotate 'line', 1669
    new $P2556, "Undef"
    set $P2555, $P2556
    .lex "$name", $P2555
.annotate 'line', 1688
    .const 'Sub' $P2558 = "81_1308206306.49694" 
    newclosure $P2628, $P2558
    set $P2557, $P2628
    .lex "scope_error", $P2557
.annotate 'line', 1664
    find_lex $P2629, "%options"
    unless_null $P2629, vivify_370
    $P2629 = root_new ['parrot';'Hash']
  vivify_370:
    set $P2630, $P2629["bindpost"]
    unless_null $P2630, vivify_371
    new $P2630, "Undef"
  vivify_371:
    store_lex "$bindpost", $P2630
.annotate 'line', 1665
    find_lex $P2632, "$bindpost"
    if $P2632, unless_2631_end
    new $P2633, "Undef"
    store_lex "$bindpost", $P2633
  unless_2631_end:
.annotate 'line', 1668
    find_lex $P2634, "$node"
    $P2635 = $P2634."scope"()
    store_lex "$scope", $P2635
.annotate 'line', 1669
    find_lex $P2636, "$node"
    $P2637 = $P2636."name"()
    store_lex "$name", $P2637
.annotate 'line', 1670
    find_lex $P2639, "$scope"
    if $P2639, unless_2638_end
    .const 'Sub' $P2641 = "83_1308206306.49694" 
    capture_lex $P2641
    $P2641()
  unless_2638_end:
.annotate 'line', 1683
    .const 'Sub' $P2667 = "84_1308206306.49694" 
    capture_lex $P2667
    $P2667()
    find_lex $P2689, "scope_error"
.annotate 'line', 1662
    .return ($P2689)
  control_2547:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2690, exception, "payload"
    .return ($P2690)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "scope_error"  :subid("81_1308206306.49694") :outer("80_1308206306.49694")
.annotate 'line', 1688
    .const 'Sub' $P2583 = "82_1308206306.49694" 
    capture_lex $P2583
    new $P2560, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2560, control_2559
    push_eh $P2560
.annotate 'line', 1690
    new $P2562, "Undef"
    set $P2561, $P2562
    .lex "$blockname", $P2561
.annotate 'line', 1697
    new $P2564, "Undef"
    set $P2563, $P2564
    .lex "$sourceline", $P2563
.annotate 'line', 1698
    new $P2566, "Undef"
    set $P2565, $P2566
    .lex "$source", $P2565
.annotate 'line', 1699
    new $P2568, "Undef"
    set $P2567, $P2568
    .lex "$pos", $P2567
.annotate 'line', 1700
    new $P2570, "Undef"
    set $P2569, $P2570
    .lex "$files", $P2569
.annotate 'line', 1689
    find_lex $P2572, "$scope"
    unless $P2572, if_2571_end
    new $P2573, 'String'
    set $P2573, " in '"
    find_lex $P2574, "$scope"
    concat $P2575, $P2573, $P2574
    concat $P2576, $P2575, "' scope"
    store_lex "$scope", $P2576
  if_2571_end:
.annotate 'line', 1690
    new $P2577, "String"
    assign $P2577, ""
    store_lex "$blockname", $P2577
.annotate 'line', 1691
    find_dynamic_lex $P2579, "@*BLOCKPAST"
    unless_null $P2579, vivify_363
    get_hll_global $P2579, "@BLOCKPAST"
    unless_null $P2579, vivify_364
    die "Contextual @*BLOCKPAST not found"
  vivify_364:
  vivify_363:
    defined $I2580, $P2579
    unless $I2580, for_undef_365
    iter $P2578, $P2579
    new $P2591, 'ExceptionHandler'
    set_label $P2591, loop2590_handler
    $P2591."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P2591
  loop2590_test:
    unless $P2578, loop2590_done
    shift $P2581, $P2578
  loop2590_redo:
    .const 'Sub' $P2583 = "82_1308206306.49694" 
    capture_lex $P2583
    $P2583($P2581)
  loop2590_next:
    goto loop2590_test
  loop2590_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2592, exception, 'type'
    eq $P2592, .CONTROL_LOOP_NEXT, loop2590_next
    eq $P2592, .CONTROL_LOOP_REDO, loop2590_redo
  loop2590_done:
    pop_eh 
  for_undef_365:
.annotate 'line', 1695
    find_lex $P2594, "$blockname"
    if $P2594, unless_2593_end
    new $P2595, "String"
    assign $P2595, "<anonymous>"
    store_lex "$blockname", $P2595
  unless_2593_end:
.annotate 'line', 1697
    new $P2596, "String"
    assign $P2596, ""
    store_lex "$sourceline", $P2596
.annotate 'line', 1698
    find_lex $P2597, "$node"
    unless_null $P2597, vivify_366
    $P2597 = root_new ['parrot';'Hash']
  vivify_366:
    set $P2598, $P2597["source"]
    unless_null $P2598, vivify_367
    new $P2598, "Undef"
  vivify_367:
    store_lex "$source", $P2598
.annotate 'line', 1699
    find_lex $P2599, "$node"
    unless_null $P2599, vivify_368
    $P2599 = root_new ['parrot';'Hash']
  vivify_368:
    set $P2600, $P2599["pos"]
    unless_null $P2600, vivify_369
    new $P2600, "Undef"
  vivify_369:
    store_lex "$pos", $P2600
.annotate 'line', 1700
    find_caller_lex $P2601, "$?FILES"
    store_lex "$files", $P2601
.annotate 'line', 1701
    find_lex $P2605, "$source"
    if $P2605, if_2604
    set $P2603, $P2605
    goto if_2604_end
  if_2604:
    find_lex $P2606, "$files"
    set $P2603, $P2606
  if_2604_end:
    if $P2603, unless_2602_end
.annotate 'line', 1702
    new $P2607, "String"
    assign $P2607, " ("
    find_lex $P2608, "$files"
    concat $P2609, $P2607, $P2608
    concat $P2610, $P2609, ":"
.annotate 'line', 1703
    find_lex $P2611, "self"
    find_lex $P2612, "$source"
    find_lex $P2613, "$pos"
    $P2614 = $P2611."lineof"($P2612, $P2613)
    add $P2615, $P2614, 1
    concat $P2616, $P2610, $P2615
.annotate 'line', 1702
    concat $P2617, $P2616, ")"
.annotate 'line', 1703
    store_lex "$sourceline", $P2617
  unless_2602_end:
.annotate 'line', 1705
    find_lex $P2618, "self"
    new $P2619, 'String'
    set $P2619, "Symbol '"
    find_lex $P2620, "$name"
    concat $P2621, $P2619, $P2620
    concat $P2622, $P2621, "' not predeclared"
    find_lex $P2623, "$scope"
    find_lex $P2624, "$blockname"
    find_lex $P2625, "$sourceline"
    $P2626 = $P2618."panic"($P2622, $P2623, " in ", $P2624, $P2625)
.annotate 'line', 1688
    .return ($P2626)
  control_2559:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2627, exception, "payload"
    .return ($P2627)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2582"  :anon :subid("82_1308206306.49694") :outer("81_1308206306.49694")
    .param pmc param_2584
.annotate 'line', 1691
    .lex "$_", param_2584
.annotate 'line', 1692
    find_lex $P2585, "$_"
    $P2586 = $P2585."name"()
    store_lex "$blockname", $P2586
.annotate 'line', 1693
    find_lex $P2589, "$blockname"
    if $P2589, if_2588
    set $P2587, $P2589
    goto if_2588_end
  if_2588:
    die 0, .CONTROL_LOOP_LAST
  if_2588_end:
.annotate 'line', 1691
    .return ($P2587)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2640"  :anon :subid("83_1308206306.49694") :outer("80_1308206306.49694")
.annotate 'line', 1672
    new $P2643, "Undef"
    set $P2642, $P2643
    .lex "$P0", $P2642
    find_lex $P2644, "$name"
    find_lex $P2645, "self"
    getattribute $P2646, $P2645, "%!symtable"
    unless_null $P2646, vivify_372
    $P2646 = root_new ['parrot';'Hash']
  vivify_372:
    set $P2647, $P2646[$P2644]
    unless_null $P2647, vivify_373
    new $P2647, "Undef"
  vivify_373:
    store_lex "$P0", $P2647
.annotate 'line', 1673
    find_lex $P2649, "$P0"
    unless $P2649, if_2648_end
    find_lex $P2650, "$P0"
    unless_null $P2650, vivify_374
    $P2650 = root_new ['parrot';'Hash']
  vivify_374:
    set $P2651, $P2650["scope"]
    unless_null $P2651, vivify_375
    new $P2651, "Undef"
  vivify_375:
    store_lex "$scope", $P2651
  if_2648_end:
.annotate 'line', 1674
    find_lex $P2654, "$scope"
    unless $P2654, unless_2653
    set $P2652, $P2654
    goto unless_2653_end
  unless_2653:
.annotate 'line', 1676
    find_lex $P2655, "self"
    getattribute $P2656, $P2655, "%!symtable"
    unless_null $P2656, vivify_376
    $P2656 = root_new ['parrot';'Hash']
  vivify_376:
    set $P2657, $P2656[""]
    unless_null $P2657, vivify_377
    new $P2657, "Undef"
  vivify_377:
    store_lex "$P0", $P2657
.annotate 'line', 1677
    find_lex $P2659, "$P0"
    if $P2659, unless_2658_end
    "scope_error"()
  unless_2658_end:
.annotate 'line', 1678
    find_lex $P2660, "$P0"
    unless_null $P2660, vivify_378
    $P2660 = root_new ['parrot';'Hash']
  vivify_378:
    set $P2661, $P2660["scope"]
    unless_null $P2661, vivify_379
    new $P2661, "Undef"
  vivify_379:
    store_lex "$scope", $P2661
.annotate 'line', 1679
    find_lex $P2664, "$scope"
    unless $P2664, unless_2663
    set $P2662, $P2664
    goto unless_2663_end
  unless_2663:
    $P2665 = "scope_error"()
    set $P2662, $P2665
  unless_2663_end:
.annotate 'line', 1674
    set $P2652, $P2662
  unless_2653_end:
.annotate 'line', 1670
    .return ($P2652)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2666"  :anon :subid("84_1308206306.49694") :outer("80_1308206306.49694")
.annotate 'line', 1683
    .const 'Sub' $P2681 = "85_1308206306.49694" 
    capture_lex $P2681
    new $P2677, 'ExceptionHandler'
    set_label $P2677, control_2676
    $P2677."handle_types_except"(.CONTROL_RETURN,  .CONTROL_OK,  .CONTROL_BREAK,  .CONTROL_CONTINUE,  .CONTROL_TAKE,  .CONTROL_LEAVE,  .CONTROL_EXIT,  .CONTROL_LOOP_NEXT,  .CONTROL_LOOP_LAST,  .CONTROL_LOOP_REDO)
    push_eh $P2677
.annotate 'line', 1684
    new $P2668, "Exception"
    set $P2668['type'], .CONTROL_RETURN
    find_lex $P2669, "self"
    find_lex $P2670, "$node"
    find_lex $P2671, "$bindpost"
    find_lex $P2672, "$scope"
    set $S2673, $P2672
    $P2674 = $P2669.$S2673($P2670, $P2671)
    setattribute $P2668, 'payload', $P2674
    throw $P2668
.annotate 'line', 1683
    pop_eh 
    goto skip_handler_2675
  control_2676:
.annotate 'line', 1685
    .local pmc exception 
    .get_results (exception) 
    .const 'Sub' $P2681 = "85_1308206306.49694" 
    newclosure $P2686, $P2681
    $P2686(exception)
    new $P2687, 'Integer'
    set $P2687, 1
    set exception["handled"], $P2687
    set $I2688, exception["handled"]
    ne $I2688, 1, nothandled_2679
  handled_2678:
    .return (exception)
  nothandled_2679:
    rethrow exception
  skip_handler_2675:
.annotate 'line', 1683
    .return ()
.end


.namespace ["PAST";"Compiler"]
.sub "_block2680"  :anon :subid("85_1308206306.49694") :outer("84_1308206306.49694")
    .param pmc param_2682
.annotate 'line', 1685
    .lex "$_", param_2682
    find_lex $P2683, "$_"
    set $P2684, $P2683
    .lex "$!", $P2684
    $P2685 = "scope_error"()
    .return ($P2685)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "vivify"  :subid("86_1308206306.49694") :method :outer("11_1308206306.49694")
    .param pmc param_2694
    .param pmc param_2695
    .param pmc param_2696
    .param pmc param_2697
.annotate 'line', 1711
    .const 'Sub' $P2724 = "87_1308206306.49694" 
    capture_lex $P2724
    new $P2693, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2693, control_2692
    push_eh $P2693
    .lex "self", self
    .lex "$node", param_2694
    .lex "$ops", param_2695
    .lex "$fetchop", param_2696
    .lex "$storeop", param_2697
.annotate 'line', 1712
    new $P2699, "Undef"
    set $P2698, $P2699
    .lex "$viviself", $P2698
.annotate 'line', 1713
    new $P2701, "Undef"
    set $P2700, $P2701
    .lex "$vivipost", $P2700
.annotate 'line', 1714
    new $P2703, "Undef"
    set $P2702, $P2703
    .lex "$result", $P2702
.annotate 'line', 1712
    find_lex $P2704, "$node"
    $P2705 = $P2704."viviself"()
    store_lex "$viviself", $P2705
.annotate 'line', 1713
    find_lex $P2706, "self"
    find_lex $P2707, "$viviself"
    $P2708 = $P2706."as_vivipost"($P2707, "P" :named("rtype"))
    store_lex "$vivipost", $P2708
.annotate 'line', 1714
    find_lex $P2709, "$vivipost"
    $P2710 = $P2709."result"()
    store_lex "$result", $P2710
.annotate 'line', 1715
    find_lex $P2712, "$result"
    set $S2713, $P2712
    iseq $I2714, $S2713, ""
    unless $I2714, if_2711_end
    find_lex $P2715, "self"
    $P2716 = $P2715."tempreg"("P")
    store_lex "$result", $P2716
  if_2711_end:
.annotate 'line', 1717
    find_lex $P2717, "$ops"
    find_lex $P2718, "$result"
    $P2717."result"($P2718)
.annotate 'line', 1718
    find_lex $P2719, "$ops"
    find_lex $P2720, "$fetchop"
    $P2719."push"($P2720)
.annotate 'line', 1719
    find_lex $P2722, "$viviself"
    unless $P2722, if_2721_end
    .const 'Sub' $P2724 = "87_1308206306.49694" 
    capture_lex $P2724
    $P2724()
  if_2721_end:
    find_lex $P2742, "$ops"
.annotate 'line', 1711
    .return ($P2742)
  control_2692:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2743, exception, "payload"
    .return ($P2743)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2723"  :anon :subid("87_1308206306.49694") :outer("86_1308206306.49694")
.annotate 'line', 1720
    new $P2726, "Undef"
    set $P2725, $P2726
    .lex "$vivilabel", $P2725
    get_hll_global $P2727, ["POST"], "Label"
    $P2728 = $P2727."new"("vivify_" :named("name"))
    store_lex "$vivilabel", $P2728
.annotate 'line', 1721
    find_lex $P2729, "$ops"
    find_lex $P2730, "$ops"
    find_lex $P2731, "$vivilabel"
    $P2729."push_pirop"("unless_null", $P2730, $P2731)
.annotate 'line', 1722
    find_lex $P2732, "$ops"
    find_lex $P2733, "$vivipost"
    $P2732."push"($P2733)
.annotate 'line', 1723
    find_lex $P2735, "$node"
    $P2736 = $P2735."lvalue"()
    unless $P2736, if_2734_end
    find_lex $P2737, "$ops"
    find_lex $P2738, "$storeop"
    $P2737."push"($P2738)
  if_2734_end:
.annotate 'line', 1724
    find_lex $P2739, "$ops"
    find_lex $P2740, "$vivilabel"
    $P2741 = $P2739."push"($P2740)
.annotate 'line', 1719
    .return ($P2741)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "parameter"  :subid("88_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2747
    .param pmc param_2748
.annotate 'line', 1730
    new $P2746, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2746, control_2745
    push_eh $P2746
    .lex "self", self
    .lex "$node", param_2747
    .lex "$bindpost", param_2748
.annotate 'line', 1731

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
    
.annotate 'line', 1730
    .return ()
  control_2745:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2749, exception, "payload"
    .return ($P2749)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "package"  :subid("89_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2753
    .param pmc param_2754
.annotate 'line', 1785
    new $P2752, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2752, control_2751
    push_eh $P2752
    .lex "self", self
    .lex "$node", param_2753
    .lex "$bindpost", param_2754
.annotate 'line', 1786

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
    
.annotate 'line', 1785
    .return ()
  control_2751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2755, exception, "payload"
    .return ($P2755)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "lexical"  :subid("90_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2759
    .param pmc param_2760
.annotate 'line', 1834
    .const 'Sub' $P2814 = "92_1308206306.49694" 
    capture_lex $P2814
    .const 'Sub' $P2775 = "91_1308206306.49694" 
    capture_lex $P2775
    new $P2758, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2758, control_2757
    push_eh $P2758
    .lex "self", self
    .lex "$node", param_2759
    .lex "$bindpost", param_2760
.annotate 'line', 1835
    new $P2762, "Undef"
    set $P2761, $P2762
    .lex "$name", $P2761
.annotate 'line', 1836
    new $P2764, "Undef"
    set $P2763, $P2764
    .lex "$isdecl", $P2763
.annotate 'line', 1835
    find_lex $P2765, "self"
    find_lex $P2766, "$node"
    $P2767 = $P2766."name"()
    $P2768 = $P2765."escape"($P2767)
    store_lex "$name", $P2768
.annotate 'line', 1836
    find_lex $P2769, "$node"
    $P2770 = $P2769."isdecl"()
    store_lex "$isdecl", $P2770
.annotate 'line', 1838
    find_lex $P2773, "$isdecl"
    if $P2773, if_2772
.annotate 'line', 1855
    .const 'Sub' $P2814 = "92_1308206306.49694" 
    capture_lex $P2814
    $P2847 = $P2814()
    set $P2771, $P2847
.annotate 'line', 1838
    goto if_2772_end
  if_2772:
    .const 'Sub' $P2775 = "91_1308206306.49694" 
    capture_lex $P2775
    $P2812 = $P2775()
    set $P2771, $P2812
  if_2772_end:
.annotate 'line', 1834
    .return ($P2771)
  control_2757:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2848, exception, "payload"
    .return ($P2848)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2813"  :anon :subid("92_1308206306.49694") :outer("90_1308206306.49694")
.annotate 'line', 1861
    new $P2816, "Undef"
    set $P2815, $P2816
    .lex "$ops", $P2815
.annotate 'line', 1862
    new $P2818, "Undef"
    set $P2817, $P2818
    .lex "$fetchop", $P2817
.annotate 'line', 1863
    new $P2820, "Undef"
    set $P2819, $P2820
    .lex "$storeop", $P2819
.annotate 'line', 1856
    find_lex $P2822, "$bindpost"
    unless $P2822, if_2821_end
.annotate 'line', 1857
    new $P2823, "Exception"
    set $P2823['type'], .CONTROL_RETURN
    get_hll_global $P2824, ["POST"], "Op"
    find_lex $P2825, "$name"
    find_lex $P2826, "$bindpost"
    find_lex $P2827, "$bindpost"
    $P2828 = $P2824."new"($P2825, $P2826, "store_lex" :named("pirop"), $P2827 :named("result"))
    setattribute $P2823, 'payload', $P2828
    throw $P2823
  if_2821_end:
.annotate 'line', 1861
    get_hll_global $P2829, ["POST"], "Ops"
    find_lex $P2830, "$node"
    $P2831 = $P2829."new"($P2830 :named("node"))
    store_lex "$ops", $P2831
.annotate 'line', 1862
    get_hll_global $P2832, ["POST"], "Op"
    find_lex $P2833, "$ops"
    find_lex $P2834, "$name"
    $P2835 = $P2832."new"($P2833, $P2834, "find_lex" :named("pirop"))
    store_lex "$fetchop", $P2835
.annotate 'line', 1863
    get_hll_global $P2836, ["POST"], "Op"
    find_lex $P2837, "$name"
    find_lex $P2838, "$ops"
    $P2839 = $P2836."new"($P2837, $P2838, "store_lex" :named("pirop"))
    store_lex "$storeop", $P2839
.annotate 'line', 1864
    new $P2840, "Exception"
    set $P2840['type'], .CONTROL_RETURN
    find_lex $P2841, "self"
    find_lex $P2842, "$node"
    find_lex $P2843, "$ops"
    find_lex $P2844, "$fetchop"
    find_lex $P2845, "$storeop"
    $P2846 = $P2841."vivify"($P2842, $P2843, $P2844, $P2845)
    setattribute $P2840, 'payload', $P2846
    throw $P2840
.annotate 'line', 1855
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2774"  :anon :subid("91_1308206306.49694") :outer("90_1308206306.49694")
.annotate 'line', 1840
    new $P2777, "Undef"
    set $P2776, $P2777
    .lex "$lexreg", $P2776
.annotate 'line', 1841
    new $P2779, "Undef"
    set $P2778, $P2779
    .lex "$ops", $P2778
.annotate 'line', 1842
    new $P2781, "Undef"
    set $P2780, $P2781
    .lex "$viviself", $P2780
.annotate 'line', 1840
    find_lex $P2782, "self"
    $P2783 = $P2782."uniquereg"("P")
    store_lex "$lexreg", $P2783
.annotate 'line', 1841
    get_hll_global $P2784, ["POST"], "Ops"
    find_lex $P2785, "$node"
    $P2786 = $P2784."new"($P2785 :named("node"))
    store_lex "$ops", $P2786
.annotate 'line', 1842
    find_lex $P2787, "$node"
    $P2788 = $P2787."viviself"()
    store_lex "$viviself", $P2788
.annotate 'line', 1844
    find_lex $P2792, "$bindpost"
    isfalse $I2793, $P2792
    if $I2793, if_2791
    new $P2790, 'Integer'
    set $P2790, $I2793
    goto if_2791_end
  if_2791:
    find_lex $P2794, "$viviself"
    set $P2790, $P2794
  if_2791_end:
    unless $P2790, if_2789_end
.annotate 'line', 1845
    find_lex $P2795, "self"
    find_lex $P2796, "$viviself"
    $P2797 = $P2795."as_vivipost"($P2796, "P" :named("rtype"))
    store_lex "$bindpost", $P2797
.annotate 'line', 1846
    find_lex $P2798, "$ops"
    find_lex $P2799, "$bindpost"
    $P2798."push"($P2799)
  if_2789_end:
.annotate 'line', 1849
    find_lex $P2801, "$bindpost"
    unless $P2801, if_2800_end
    find_lex $P2802, "$ops"
    find_lex $P2803, "$lexreg"
    find_lex $P2804, "$bindpost"
    $P2802."push_pirop"("set", $P2803, $P2804)
  if_2800_end:
.annotate 'line', 1851
    find_lex $P2805, "$ops"
    find_lex $P2806, "$name"
    find_lex $P2807, "$lexreg"
    $P2805."push_pirop"(".lex", $P2806, $P2807)
.annotate 'line', 1852
    find_lex $P2808, "$ops"
    find_lex $P2809, "$lexreg"
    $P2808."result"($P2809)
.annotate 'line', 1853
    new $P2810, "Exception"
    set $P2810['type'], .CONTROL_RETURN
    find_lex $P2811, "$ops"
    setattribute $P2810, 'payload', $P2811
    throw $P2810
.annotate 'line', 1838
    .return ()
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "contextual"  :subid("93_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2852
    .param pmc param_2853
.annotate 'line', 1869
    .const 'Sub' $P2879 = "94_1308206306.49694" 
    capture_lex $P2879
    new $P2851, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2851, control_2850
    push_eh $P2851
    .lex "self", self
    .lex "$node", param_2852
    .lex "$bindpost", param_2853
.annotate 'line', 1874
    new $P2855, "Undef"
    set $P2854, $P2855
    .lex "$name", $P2854
.annotate 'line', 1876
    $P2857 = root_new ['parrot';'Hash']
    set $P2856, $P2857
    .lex "%symtable", $P2856
.annotate 'line', 1898
    new $P2859, "Undef"
    set $P2858, $P2859
    .lex "$ops", $P2858
.annotate 'line', 1899
    new $P2861, "Undef"
    set $P2860, $P2861
    .lex "$fetchop", $P2860
.annotate 'line', 1900
    new $P2863, "Undef"
    set $P2862, $P2863
    .lex "$storeop", $P2862
.annotate 'line', 1874
    find_lex $P2864, "$node"
    $P2865 = $P2864."name"()
    store_lex "$name", $P2865
.annotate 'line', 1876
    find_dynamic_lex $P2866, "@*BLOCKPAST"
    unless_null $P2866, vivify_380
    get_hll_global $P2866, "@BLOCKPAST"
    unless_null $P2866, vivify_381
    die "Contextual @*BLOCKPAST not found"
  vivify_381:
  vivify_380:
    set $P2867, $P2866[0]
    unless_null $P2867, vivify_382
    new $P2867, "Undef"
  vivify_382:
    $P2868 = $P2867."symtable"()
    store_lex "%symtable", $P2868
.annotate 'line', 1877
    find_lex $P2870, "%symtable"
    defined $I2871, $P2870
    unless $I2871, if_2869_end
.annotate 'line', 1878
    find_lex $P2872, "$name"
    find_lex $P2873, "%symtable"
    unless_null $P2873, vivify_383
    $P2873 = root_new ['parrot';'Hash']
  vivify_383:
    set $P2874, $P2873[$P2872]
    unless_null $P2874, vivify_384
    new $P2874, "Undef"
  vivify_384:
    store_lex "%symtable", $P2874
.annotate 'line', 1879
    find_lex $P2876, "%symtable"
    defined $I2877, $P2876
    unless $I2877, if_2875_end
    .const 'Sub' $P2879 = "94_1308206306.49694" 
    capture_lex $P2879
    $P2879()
  if_2875_end:
  if_2869_end:
.annotate 'line', 1888
    find_lex $P2900, "$node"
    $P2901 = $P2900."isdecl"()
    unless $P2901, if_2899_end
    new $P2902, "Exception"
    set $P2902['type'], .CONTROL_RETURN
    find_lex $P2903, "self"
    find_lex $P2904, "$node"
    find_lex $P2905, "$bindpost"
    $P2906 = $P2903."lexical"($P2904, $P2905)
    setattribute $P2902, 'payload', $P2906
    throw $P2902
  if_2899_end:
.annotate 'line', 1890
    find_lex $P2907, "self"
    find_lex $P2908, "$name"
    $P2909 = $P2907."escape"($P2908)
    store_lex "$name", $P2909
.annotate 'line', 1892
    find_lex $P2911, "$bindpost"
    unless $P2911, if_2910_end
.annotate 'line', 1893
    new $P2912, "Exception"
    set $P2912['type'], .CONTROL_RETURN
    get_hll_global $P2913, ["POST"], "Op"
    find_lex $P2914, "$name"
    find_lex $P2915, "$bindpost"
    find_lex $P2916, "$bindpost"
    $P2917 = $P2913."new"($P2914, $P2915, "store_dynamic_lex" :named("pirop"), $P2916 :named("result"))
    setattribute $P2912, 'payload', $P2917
    throw $P2912
  if_2910_end:
.annotate 'line', 1898
    get_hll_global $P2918, ["POST"], "Ops"
    find_lex $P2919, "$node"
    $P2920 = $P2918."new"($P2919 :named("node"))
    store_lex "$ops", $P2920
.annotate 'line', 1899
    get_hll_global $P2921, ["POST"], "Op"
    find_lex $P2922, "$ops"
    find_lex $P2923, "$name"
    $P2924 = $P2921."new"($P2922, $P2923, "find_dynamic_lex" :named("pirop"))
    store_lex "$fetchop", $P2924
.annotate 'line', 1900
    get_hll_global $P2925, ["POST"], "Op"
    find_lex $P2926, "$name"
    find_lex $P2927, "$ops"
    $P2928 = $P2925."new"($P2926, $P2927, "store_dynamic_lex" :named("pirop"))
    store_lex "$storeop", $P2928
.annotate 'line', 1901
    find_lex $P2929, "self"
    find_lex $P2930, "$node"
    find_lex $P2931, "$ops"
    find_lex $P2932, "$fetchop"
    find_lex $P2933, "$storeop"
    $P2934 = $P2929."vivify"($P2930, $P2931, $P2932, $P2933)
.annotate 'line', 1869
    .return ($P2934)
  control_2850:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2935, exception, "payload"
    .return ($P2935)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "_block2878"  :anon :subid("94_1308206306.49694") :outer("93_1308206306.49694")
.annotate 'line', 1880
    new $P2881, "Undef"
    set $P2880, $P2881
    .lex "$scope", $P2880
    find_lex $P2882, "%symtable"
    unless_null $P2882, vivify_385
    $P2882 = root_new ['parrot';'Hash']
  vivify_385:
    set $P2883, $P2882["scope"]
    unless_null $P2883, vivify_386
    new $P2883, "Undef"
  vivify_386:
    store_lex "$scope", $P2883
.annotate 'line', 1881
    find_lex $P2888, "$scope"
    if $P2888, if_2887
    set $P2886, $P2888
    goto if_2887_end
  if_2887:
    find_lex $P2889, "$scope"
    set $S2890, $P2889
    isne $I2891, $S2890, "contextual"
    new $P2886, 'Integer'
    set $P2886, $I2891
  if_2887_end:
    if $P2886, if_2885
    set $P2884, $P2886
    goto if_2885_end
  if_2885:
.annotate 'line', 1882
    new $P2892, "Exception"
    set $P2892['type'], .CONTROL_RETURN
    find_lex $P2893, "self"
    find_lex $P2894, "$node"
    find_lex $P2895, "$bindpost"
    find_lex $P2896, "$scope"
    set $S2897, $P2896
    $P2898 = $P2893.$S2897($P2894, $P2895)
    setattribute $P2892, 'payload', $P2898
    throw $P2892
  if_2885_end:
.annotate 'line', 1879
    .return ($P2884)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed"  :subid("95_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2939
    .param pmc param_2940
    .param pmc param_2941 :optional
    .param int has_param_2941 :opt_flag
.annotate 'line', 1905
    new $P2938, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2938, control_2937
    push_eh $P2938
    .lex "self", self
    .lex "$node", param_2939
    .lex "$bindpost", param_2940
    if has_param_2941, optparam_387
    new $P2942, "Undef"
    set param_2941, $P2942
  optparam_387:
    .lex "$keyrtype", param_2941
.annotate 'line', 1906

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
    
.annotate 'line', 1905
    .return ()
  control_2937:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2943, exception, "payload"
    .return ($P2943)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "keyed_int"  :subid("96_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2947
    .param pmc param_2948
.annotate 'line', 1974
    new $P2946, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2946, control_2945
    push_eh $P2946
    .lex "self", self
    .lex "$node", param_2947
    .lex "$bindpost", param_2948
.annotate 'line', 1975
    find_lex $P2949, "self"
    find_lex $P2950, "$node"
    find_lex $P2951, "$bindpost"
    $P2952 = $P2949."keyed"($P2950, $P2951, "i")
.annotate 'line', 1974
    .return ($P2952)
  control_2945:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2953, exception, "payload"
    .return ($P2953)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "attribute"  :subid("97_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2957
    .param pmc param_2958
.annotate 'line', 1979
    new $P2956, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2956, control_2955
    push_eh $P2956
    .lex "self", self
    .lex "$node", param_2957
    .lex "$bindpost", param_2958
.annotate 'line', 1980

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
    
.annotate 'line', 1979
    .return ()
  control_2955:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P2959, exception, "payload"
    .return ($P2959)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "register"  :subid("98_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Var"],_)
    .param pmc param_2963
    .param pmc param_2964
.annotate 'line', 2047
    .const 'Sub' $P2992 = "99_1308206306.49694" 
    capture_lex $P2992
    new $P2962, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P2962, control_2961
    push_eh $P2962
    .lex "self", self
    .lex "$node", param_2963
    .lex "$bindpost", param_2964
.annotate 'line', 2048
    new $P2966, "Undef"
    set $P2965, $P2966
    .lex "$name", $P2965
.annotate 'line', 2055
    new $P2968, "Undef"
    set $P2967, $P2968
    .lex "$ops", $P2967
.annotate 'line', 2048
    find_lex $P2969, "$node"
    $P2970 = $P2969."name"()
    store_lex "$name", $P2970
.annotate 'line', 2050
    find_lex $P2972, "$name"
    if $P2972, unless_2971_end
.annotate 'line', 2051
    find_lex $P2973, "self"
    $P2974 = $P2973."uniquereg"("P")
    store_lex "$name", $P2974
.annotate 'line', 2052
    find_lex $P2975, "$node"
    find_lex $P2976, "$name"
    $P2975."name"($P2976)
  unless_2971_end:
.annotate 'line', 2055
    get_hll_global $P2977, ["POST"], "Ops"
    find_lex $P2978, "$name"
    find_lex $P2979, "$node"
    $P2980 = $P2977."new"($P2978 :named("result"), $P2979 :named("node"))
    store_lex "$ops", $P2980
.annotate 'line', 2057
    find_lex $P2982, "$node"
    $P2983 = $P2982."isdecl"()
    unless $P2983, if_2981_end
    find_lex $P2984, "$ops"
    find_lex $P2985, "$ops"
    $P2984."push_pirop"(".local pmc", $P2985)
  if_2981_end:
.annotate 'line', 2059
    find_lex $P2987, "$bindpost"
    if $P2987, if_2986
.annotate 'line', 2062
    .const 'Sub' $P2992 = "99_1308206306.49694" 
    capture_lex $P2992
    $P2992()
    goto if_2986_end
  if_2986:
.annotate 'line', 2060
    find_lex $P2988, "$ops"
    find_lex $P2989, "$ops"
    find_lex $P2990, "$bindpost"
    $P2988."push_pirop"("set", $P2989, $P2990)
  if_2986_end:
.annotate 'line', 2059
    find_lex $P3014, "$ops"
.annotate 'line', 2047
    .return ($P3014)
  control_2961:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P3015, exception, "payload"
    .return ($P3015)
.end


.namespace ["PAST";"Compiler"]
.sub "_block2991"  :anon :subid("99_1308206306.49694") :outer("98_1308206306.49694")
.annotate 'line', 2062
    .const 'Sub' $P3001 = "100_1308206306.49694" 
    capture_lex $P3001
.annotate 'line', 2063
    new $P2994, "Undef"
    set $P2993, $P2994
    .lex "$viviself", $P2993
    find_lex $P2995, "$node"
    $P2996 = $P2995."viviself"()
    store_lex "$viviself", $P2996
.annotate 'line', 2064
    find_lex $P2999, "$viviself"
    if $P2999, if_2998
    set $P2997, $P2999
    goto if_2998_end
  if_2998:
    .const 'Sub' $P3001 = "100_1308206306.49694" 
    capture_lex $P3001
    $P3013 = $P3001()
    set $P2997, $P3013
  if_2998_end:
.annotate 'line', 2062
    .return ($P2997)
.end


.namespace ["PAST";"Compiler"]
.sub "_block3000"  :anon :subid("100_1308206306.49694") :outer("99_1308206306.49694")
.annotate 'line', 2065
    new $P3003, "Undef"
    set $P3002, $P3003
    .lex "$vivipost", $P3002
    find_lex $P3004, "self"
    find_lex $P3005, "$viviself"
    $P3006 = $P3004."as_vivipost"($P3005, "P" :named("rtype"))
    store_lex "$vivipost", $P3006
.annotate 'line', 2066
    find_lex $P3007, "$ops"
    find_lex $P3008, "$vivipost"
    $P3007."push"($P3008)
.annotate 'line', 2067
    find_lex $P3009, "$ops"
    find_lex $P3010, "$ops"
    find_lex $P3011, "$vivipost"
    $P3012 = $P3009."push_pirop"("set", $P3010, $P3011)
.annotate 'line', 2064
    .return ($P3012)
.end


.namespace ["PAST";"Compiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("101_1308206306.49694") :method :outer("11_1308206306.49694") :multi(_,["PAST";"Val"])
    .param pmc param_3019
    .param pmc param_3020 :slurpy :named
.annotate 'line', 2083
    new $P3018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P3018, control_3017
    push_eh $P3018
    .lex "self", self
    .lex "$node", param_3019
    .lex "%options", param_3020
.annotate 'line', 2084

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
    
.annotate 'line', 2083
    .return ()
  control_3017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P3021, exception, "payload"
    .return ($P3021)
.end


.namespace ["PAST";"Compiler"]
.sub "_block3023" :load :anon :subid("102_1308206306.49694")
.annotate 'line', 41
    .const 'Sub' $P3025 = "11_1308206306.49694" 
    $P3026 = $P3025()
    .return ($P3026)
.end


.namespace []
.sub "_block3217" :load :anon :subid("103_1308206306.49694")
.annotate 'line', 1
    .const 'Sub' $P3219 = "10_1308206306.49694" 
    $P3220 = $P3219()
    .return ($P3220)
.end

