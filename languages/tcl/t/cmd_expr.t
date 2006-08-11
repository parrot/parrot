#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 200

# simple scalars
is [expr 42]     42   {int}
is [expr 4.2]     4.2 {float}
is [expr 4.0]     4.0 {float stays float}
is [expr 3e2]   300.0 {scientific}
is [expr 3e0]     3.0 {scientific with 0 exponent}
is [expr 2.3e2] 230.0 {scientific with float base}
eval_is {expr 2e17}  2e+17 {scientific in, scientific out}
eval_is {expr 3e2.0} \
 {syntax error in expression "3e2.0": extra tokens at end of expression} \
 {can only e with an integer exponent}
is [expr true]  true  {true}
is [expr false] false {false}
eval_is {expr trues}  \
 {syntax error in expression "trues": the word "trues" requires a preceding $ if it's a variable or function arguments if it's a function} \
 {trues}
eval_is {expr falses} \
 {syntax error in expression "falses": the word "falses" requires a preceding $ if it's a variable or function arguments if it's a function} \
 {falses}

eval_is {expr {}} {syntax error in expression "": premature end of expression}

# simple unary ops.
is [expr -2]   -2 {unary -}
is [expr +2]    2 {unary +}
is [expr ~0]   -1 {unary ~}
is [expr !2]    0 {unary !}
is [expr !true] 0 {unary ! - boolean}
is [expr !!2]   1 {double unary !}

# simple unary ops - stringified args
is [expr {-"2"}]  -2 {unary -}
is [expr {+"2"}]   2 {unary +}
is [expr {~"0"}]  -1 {unary ~}
is [expr {!"2"}]   0 {unary !}
is [expr {!!"2"}]  1 {double unary !}

# simple unary ops  - octal

# simple binary ops - integer
is [expr 2 * 3]    6 {mul}
is [expr 6 / 2]    3 {times}
is [expr 3 % 2]    1 {remainder}
is [expr 2 + 3]    5 {plus}
is [expr 2 - 3]   -1 {minus}
is [expr 16 << 2] 64 {left shift}
is [expr 16 >> 2]  4 {right shift}
is [expr 5 & 6]    4 {&}
is [expr 5 | 6]    7 {|}
is [expr 5 ^ 6]    3 {^}

# simple binary ops - stringified integers
# XXX any eval_is's in this section are written that way because the 
# test errors wrongly.
is [expr {2 * "3"}]    6 {mul "}
is [expr {"2" * 3}]    6 {mul "}
is [expr {6 / "2"}]    3 {times "}
is [expr {"6" / 2}]    3 {times "}
# eval because it fails.
eval_is {expr {3 % "2"}} 1 {remainder "} 
eval_is {expr {"3" % 2}} 1 {remainder "} 
is [expr {2 + "3"}]    5 {plus "}
is [expr {"2" + 3}]    5 {plus "}
is [expr {2 - "3"}]   -1 {minus "}
is [expr {"2" - 3}]   -1 {minus "}
eval_is {expr {16 << "2"}} 64 {left shift "}
eval_is {expr {"16" << 2}} 64 {left shift "}
eval_is {expr {16 >> "2"}}  4 {right shift "}
eval_is {expr {"16" >> 2}}  4 {right shift "}
eval_is {expr {5 & "6"}}    4 {& "}
eval_is {expr {"5" & 6}}    4 {& "}
eval_is {expr {5 | "6"}}    7 {| "}
eval_is {expr {"5" | 6}}    7 {| "}
eval_is {expr {5 ^ "6"}}    3 {^ "}
eval_is {expr {"5" ^ 6}}    3 {^ "}

# comparison ops.
is [expr 10<9] 0 {lt, numeric, not alpha}
is [expr 2<3]  1 {lt, true}
is [expr 3<2]  0 {lt, false}
is [expr 3>2]  1 {gt, true}
is [expr 2>3]  0 {gt, false}
is [expr 2<=3] 1 {lte, lt}
is [expr 3<=2] 0 {lte, gt}
is [expr 3<=3] 1 {lte, eq}
is [expr 3>=2] 1 {gte, gt}
is [expr 2>=3] 0 {gte, lt}
is [expr 3>=3] 1 {gte, eq}
is [expr 2==2] 1 {==, eq}
is [expr 2==1] 0 {==, ne}
is [expr 1!=1] 0 {!=, eq}
is [expr 2!=1] 1 {!=, ne}

# short circuting ops
is [expr 2&&2] 1 {&&}
is [expr {2>=2 && 2>=2}] 1 {&&}
is [expr 2&&0] 0 {&&}
is [expr 0&&2] 0 {&&}
is [expr 0&&0] 0 {&&}
is [expr 2||2] 1 {||}
is [expr 2||0] 1 {||}
is [expr 0||2] 1 {||}
is [expr 0||0] 0 {||}

# invalid (string) operators for some unary ops
set ops_list [list - + ~ !]
foreach operator $ops_list {
  eval_is "expr {${operator}\"a\"}" \
    "can't use non-numeric string as operand of \"$operator\"" \
    "string unary $operator" 
}

# invalid (string) operators for some binary ops
set ops_list [list * / % + - << >> & | ^]
foreach operator $ops_list {
  eval_is "expr {\"a\" $operator \"b\"}" \
    "can't use non-numeric string as operand of \"$operator\"" \
    "string $operator" 
}

# math functions, happy path
is [expr abs(-1)]       1
is [expr acos(0)]       1.5707963267948966
is [expr asin(1)]       1.5707963267948966
is [expr atan(1)]       0.7853981633974483
is [expr atan2(4,5)]    0.6747409422235527
is [expr ceil(4.6)]     5.0
is [expr ceil(-1.6)]   -1.0
is [expr cos(0)]        1.0
is [expr cosh(1)]       1.5430806348152437
is [expr double(5)]     5.0
is [expr exp(1)]        2.718281828459045
is [expr fmod(3,2)]     1.0
is [expr fmod(-4, -1)] -0.0
is [expr hypot(3,4)]    5.0
is [expr hypot(-3,4)]   5.0
is [expr int(4.6)]      4
is [expr log(32)]       3.4657359027997265
is [expr log10(32)]     1.505149978319906
is [expr pow(2,10)]  1024.0
is [expr round(4.5)]    5
is [expr round(5.5)]    6
is [expr round(4.4)]    4
is [expr round(2)]      2
is [expr sin(1)]        0.8414709848078965
is [expr sinh(1)]       1.1752011936438014
is [expr sqrt(64)]      8.0
is [expr tan(1)]        1.5574077246549023
is [expr tanh(1)]       0.7615941559557649

# math functions, stringified numeric args
is [expr abs("-1")]       1
is [expr acos("0")]       1.5707963267948966
is [expr asin("1")]       1.5707963267948966
is [expr atan("1")]       0.7853981633974483
is [expr atan2("4",5)]    0.6747409422235527
is [expr atan2(4,"5")]    0.6747409422235527
is [expr atan2("4","5")]  0.6747409422235527
is [expr ceil("4.6")]     5.0
is [expr ceil("-1.6")]   -1.0
is [expr cos("0")]        1.0
is [expr cosh("1")]       1.5430806348152437
is [expr double("5")]     5.0
is [expr exp("1")]        2.718281828459045
is [expr fmod("3",2)]     1.0
is [expr fmod(3,"2")]     1.0
is [expr fmod("3","2")]   1.0
is [expr hypot("3",4)]    5.0
is [expr hypot(3,"4")]    5.0
is [expr hypot("3","4")]  5.0
is [expr int("4.6")]      4
is [expr log("32")]       3.4657359027997265
is [expr log10("32")]     1.505149978319906
is [expr pow("2",10)]  1024.0
is [expr pow(2,"10")]  1024.0
is [expr pow("2","10")] 1024.0
is [expr round("4.5")]    5
is [expr sin("1")]        0.8414709848078965
is [expr sinh("1")]       1.1752011936438014
is [expr sqrt("64")]      8.0
is [expr tan("1")]        1.5574077246549023
is [expr tanh("1")]       0.7615941559557649

# unary math functions, invalid string ops.
set function_list \
  [list acos asin atan cos cosh exp log log10 sin sinh sqrt tan tanh]
foreach function $function_list {
  eval_is "expr ${function}(\"a\")" \
    {expected floating-point number but got "a"} \
    "string $function"
}

# infinity tests
eval_is {expr inf} Inf {infinity lc}
eval_is {expr iNf} Inf {infinity mixed case}
eval_is {expr inf + inf} Inf {infinity add}
eval_is {expr inf - inf} \
  {domain error: argument not in valid range} {infinity subtract}
eval_is {expr sin(inf)} \
  {domain error: argument not in valid range} {infinity function} 
eval_is {expr inf/0} Inf {infinity trumps div by 0}
eval_is {expr 0/inf} 0.0 {div by infinity}
eval_is {expr 0 < inf} 1 {infinite comparison}

# not a number tests.
eval_is {expr nan} \
  {domain error: argument not in valid range} {NaN lc}
eval_is {expr nAn} \
  {domain error: argument not in valid range} {NaN mixed case}
eval_is {expr nan/0} \
  {can't use non-numeric floating-point value as operand of "/"} \
  {nan trumps div by 0}
foreach function $function_list {
  eval_is "expr ${function}(nan)" \
    {floating point value is Not a Number} \
    "${function}(nan)"
}
foreach operator $ops_list {
  eval_is "expr nan $operator nan" \
    "can't use non-numeric floating-point value as operand of \"$operator\"" \
    "nan $operator nan" 
}


# variable expansions..
eval_is {
  set q(1) 2
  expr {$q(1)}
} 2 {array variables}
eval_is {
  set under_score0 3
  expr {$under_score0}
} 3 {_, 0 in varnames}

# TD-    add tet   for ::tcl::mathfunc 



