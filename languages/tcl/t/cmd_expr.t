#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 294

# namespace
namespace eval test { variable x 5 }
is [namespace eval test {expr {$x}}] 5 {correct namespace}

# simple scalars
is [expr 42]     42   {int}
is [expr 4.2]     4.2 {float}
is [expr 4.0]     4.0 {float stays float}
is [expr 3e2]   300.0 {scientific}
is [expr 3e0]     3.0 {scientific with 0 exponent}
is [expr 2.3e2] 230.0 {scientific with float base}
is [expr 2.3E2] 230.0 {scientific with float base (upper E)}
is [expr 2e17]  2e+17 {scientific in, scientific out}
eval_is {expr 3e2.0} \
 {syntax error in expression "3e2.0": extra tokens at end of expression} \
 {can only e with an integer exponent}

# booleans
is [expr TrUe]    TrUe  {true}
is [expr !!TrUe]  1  {true}
is [expr !!TrU]   1  {tru}
is [expr !!Tr]    1  {tr}
is [expr !!T]     1  {t}
is [expr !!FaLsE] 0  {false}
is [expr !!FaLs]  0  {fals}
is [expr !!FaL]   0  {fal}
is [expr !!Fa]    0  {fa}
is [expr !!F]     0  {f}
is [expr !!On]    1  {on}
is [expr !!OfF]   0  {off}
is [expr !!Of]    0  {of}
is [expr !!YeS]   1  {yes}
is [expr !!Ye]    1  {ye}
is [expr !!Y]     1  {y}
is [expr !!No]    0  {no}
is [expr !!N]     0  {n}

eval_is {expr trues}  \
 {syntax error in expression "trues": the word "trues" requires a preceding $ if it's a variable or function arguments if it's a function} \
 {trues}
eval_is {expr falses} \
 {syntax error in expression "falses": the word "falses" requires a preceding $ if it's a variable or function arguments if it's a function} \
 {falses}
is [expr 0b1001]    9 {binary}
is [expr 0b10]      2 {binary}
is [expr 0b101010] 42 {binary}

eval_is {expr {}} {syntax error in expression "": premature end of expression}

# simple unary ops.
is [expr -2]   -2   {unary -}
is [expr +2]    2   {unary +}
is [expr +2.0]  2.0 {unary + (float)}
is [expr ~0]   -1   {unary ~}
is [expr !2]    0   {unary !}
is [expr !true] 0   {unary ! - boolean}
is [expr !!2]   1   {double unary !}

# simple unary ops - stringified args
is [expr {-"2"}]  -2 {unary -}
is [expr {+"2"}]   2 {unary +}
is [expr {~"0"}]  -1 {unary ~}
is [expr {!"2"}]   0 {unary !}
is [expr {!!"2"}]  1 {double unary !}

# simple unary ops  - octal

# simple binary ops - integer
is [expr 2 ** 3]   8 {pow}
is [expr 0 ** 1]   0 {pow}
is [expr 0 ** 0]   1 {pow}
eval_is {expr 0 ** -1} {exponentiation of zero by negative power} \
  {pow of 0 with neg exp}
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

set j 7
is [expr {${j}}]      7 {braced variable names}
is [expr {"$j"}]      7 {variables in quotes}
is [expr {"#$j"}]    #7 {variables in quotes after literal}
is [expr {"$"}]       $ {dollar-sign in quotes}
is [expr {"[set j]"}] 7 {commands in quotes}
is [
  set foo a
  set hash(abar) 5
  expr {$hash(${foo}bar)}
] 5 {variables - complex array index}

is [expr {1 ? 14 : [expr {}]}] 14 \
  {make sure expr errors happen at runtime}

# numification
is [expr {"foo"}] foo {non-numeric string}
is [expr {"0001234"}] 668 {string octal}
is [expr {"0o1234"}]  668 {string 0o octal}
set j 0001234
is [expr {$j}] 668 {variable octal}

# simple binary ops - stringified integers
is [expr {2 ** "3"}]   8 {pow "}
is [expr {"2" ** 3}]   8 {pow "}
is [expr {2 * "3"}]    6 {mul "}
is [expr {"2" * 3}]    6 {mul "}
is [expr {6 / "2"}]    3 {times "}
is [expr {"6" / 2}]    3 {times "}
is [expr {3 % "2"}]    1 {remainder "}
is [expr {"3" % 2}]    1 {remainder "}
is [expr {2 + "3"}]    5 {plus "}
is [expr {"2" + 3}]    5 {plus "}
is [expr {2 - "3"}]   -1 {minus "}
is [expr {"2" - 3}]   -1 {minus "}
is [expr {16 << "2"}] 64 {left shift "}
is [expr {"16" << 2}] 64 {left shift "}
is [expr {16 >> "2"}]  4 {right shift "}
is [expr {"16" >> 2}]  4 {right shift "}
is [expr {5 & "6"}]    4 {& "}
is [expr {"5" & 6}]    4 {& "}
is [expr {5 | "6"}]    7 {| "}
is [expr {"5" | 6}]    7 {| "}
is [expr {5 ^ "6"}]    3 {^ "}
is [expr {"5" ^ 6}]    3 {^ "}

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

is [expr {[list \;] == {{;}}}] 1 {==, string and list}
is [expr {[list \;] != {{;}}}] 0 {!=, string and list}

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

# invalid (string) operands for some unary ops
set ops_list [list - + ~ !]
foreach operator $ops_list {
  eval_is "expr {${operator}\"a\"}" \
    "can't use non-numeric string as operand of \"$operator\"" \
    "string unary $operator"
  eval_is "expr {${operator}\"\"}" \
    "can't use empty string as operand of \"$operator\"" \
    "string unary $operator"
}

# invalid (string) operands for some binary ops
set ops_list [list ** * / % + - << >> & | ^]
foreach operator $ops_list {
  eval_is "expr {\"a\" $operator \"b\"}" \
    "can't use non-numeric string as operand of \"$operator\"" \
    "string $operator"
  eval_is "expr {\"\" $operator \"\"}" \
    "can't use empty string as operand of \"$operator\"" \
    "string $operator"
}

# invalid (string) operands for logical ops
set logic_ops_list [list && ||]
foreach operator $logic_ops_list {
  eval_is "expr {\"a\" $operator \"b\"}" \
    {expected boolean value but got "a"} \
    "string $operator"
  eval_is "expr {\"\" $operator \"\"}" \
    {expected boolean value but got ""} \
    "string $operator"
}

is [expr bool(4)]       1 {bool - true}
is [expr bool("yes")]   1 {bool - yes}
is [expr bool(0)]       0 {bool - false}
is [expr bool("no")]    0 {bool - no}
eval_is {expr bool("foo")} {expected boolean value but got "foo"} {bool - bad value}
eval_is {expr entier("foo")} {expected number but got "foo"} {entier - bad value}

set TODO {TODO "correct precision"}

# math functions, happy path
is [expr abs(-1)]       1
is [expr abs(1)]        1
is [expr abs(1.0)]      1.0
is [expr abs(-1.0)]     1.0
is [expr acos(0)]       1.5707963267948966 {} $TODO
is [expr asin(1)]       1.5707963267948966 {} $TODO
is [expr atan(1)]       0.7853981633974483
is [expr atan2(4,5)]    0.6747409422235526
is [expr ceil(4.6)]     5.0
is [expr ceil(-1.6)]   -1.0
is [expr cos(0)]        1.0
is [expr cosh(1)]       1.5430806348152437 {} $TODO
is [expr double(5)]     5.0
is [expr entier(3)]     3
is [expr entier(3.5)]   3
is [expr exp(1)]        2.718281828459045
is [expr floor(0.1)]    0.0
is [expr floor(0.0)]    0.0
is [expr floor(-0.1)]   -1.0
is [expr fmod(3,2)]     1.0
is [expr fmod(-4, -1)] -0.0 {} $TODO
is [expr hypot(3,4)]    5.0
is [expr hypot(-3,4)]   5.0
is [expr int(4.6)]      4
is [expr log(32)]       3.4657359027997265 {} $TODO
is [expr log10(32)]     1.505149978319906
is [expr max(1,4,2)]    4
is [expr min(1,4,2)]    1
is [expr pow(2,10)]  1024.0
is [expr round(4.5)]    5
is [expr round(5.5)]    6
is [expr round(4.4)]    4
is [expr round(2)]      2
is [expr sin(1)]        0.8414709848078965
is [expr sinh(1)]       1.1752011936438014 {} $TODO
is [expr sqrt(64)]      8.0
is [expr tan(1)]        1.5574077246549023 {} $TODO
is [expr tanh(1)]       0.7615941559557649

# math functions, stringified numeric args
is [expr abs("-1")]       1
is [expr acos("0")]       1.5707963267948966 {} $TODO
is [expr asin("1")]       1.5707963267948966 {} $TODO
is [expr atan("1")]       0.7853981633974483
is [expr atan2("4",5)]    0.6747409422235526
is [expr atan2(4,"5")]    0.6747409422235526
is [expr atan2("4","5")]  0.6747409422235526
is [expr ceil("4.6")]     5.0
is [expr ceil("-1.6")]   -1.0
is [expr cos("0")]        1.0
is [expr cosh("1")]       1.5430806348152437 {} $TODO
is [expr double("5")]     5.0
is [expr entier("3.4")]   3
is [expr exp("1")]        2.718281828459045
is [expr fmod("3",2)]     1.0
is [expr fmod(3,"2")]     1.0
is [expr fmod("3","2")]   1.0
is [expr hypot("3",4)]    5.0
is [expr hypot(3,"4")]    5.0
is [expr hypot("3","4")]  5.0
is [expr int("4.6")]      4
is [expr log("32")]       3.4657359027997265 {} $TODO
is [expr log10("32")]     1.505149978319906
is [expr pow("2",10)]  1024.0
is [expr pow(2,"10")]  1024.0
is [expr pow("2","10")] 1024.0
is [expr round("4.5")]    5
is [expr sin("1")]        0.8414709848078965
is [expr sinh("1")]       1.1752011936438014 {} $TODO
is [expr sqrt("64")]      8.0
is [expr tan("1")]        1.5574077246549023 {} $TODO
is [expr tanh("1")]       0.7615941559557649

eval_is {expr exp(exp(50))} Inf Inf {TODO unimplemented}

# unary math functions, invalid string ops.
set function_list \
  [list acos asin atan cos cosh exp floor log log10 sin sinh sqrt tan tanh]
foreach function $function_list {
  eval_is "expr ${function}(\"a\")" \
    {expected floating-point number but got "a"} \
    "string $function"
}
eval_is {expr {~2.0}} {can't use floating-point value as operand of "~"} \
  {can't use floating-point value as operand of "~"}

# test namespaces with operators
is [namespace eval lib {if {+2} {}}] {} {[expr] in a namespace}

# infinity tests
set TODO {TODO "pending Inf implementation"}

eval_is {expr inf} Inf {infinity lc} $TODO
eval_is {expr iNf} Inf {infinity mixed case} $TODO
eval_is {expr inf + inf} Inf {infinity add} $TODO
eval_is {expr inf - inf} \
  {domain error: argument not in valid range} {infinity subtract} \
  $TODO
eval_is {expr sin(inf)} \
  {domain error: argument not in valid range} {infinity function} \
  $TODO
eval_is {expr inf/0} Inf {infinity trumps div by 0} $TODO
eval_is {expr 0/inf} 0.0 {div by infinity} $TODO
eval_is {expr 0 < inf} 1 {infinite comparison} $TODO

eval_is {expr 3/0} {divide by zero} {divide by zero}


# not a number tests.
set TODO {TODO "pending NaN implementation"}

eval_is {expr nan} \
  {domain error: argument not in valid range} {NaN lc} \
  $TODO
eval_is {expr nAn} \
  {domain error: argument not in valid range} {NaN mixed case} \
  $TODO
eval_is {expr nan/0} \
  {can't use non-numeric floating-point value as operand of "/"} \
  {nan trumps div by 0} \
  $TODO
foreach function $function_list {
  eval_is "expr ${function}(nan)" \
    {floating point value is Not a Number} \
    "${function}(nan)" \
    $TODO
}
foreach operator $ops_list {
  eval_is "expr nan $operator nan" \
    "can't use non-numeric floating-point value as operand of \"$operator\"" \
    "nan $operator nan" \
    $TODO
}


# variable expansions..
is [
  set q(1) 2
  expr {$q(1)}
] 2 {array variables}
is [
  set under_score0 3
  expr {$under_score0}
] 3 {_, 0 in varnames}

#command expansions
is [expr {[]}] {} {empty command}
is [
  expr {[list a] eq [list a]}
] 1 {command expansion inside, list types.}
is [
  expr {[set a a] eq [set b a]}
] 1 {command expansion inside, string types}


# XXX  add tests for ::tcl::mathfunc

# tcl_precision
is [set tcl_precision 3; expr 1/3.] 0.333 { precision 3}
is [set tcl_precision 7; expr 1/3.] 0.3333333 { precision 7}
is [set tcl_precision 12; expr 1/3.] 0.333333333333 { precision 12}

# blocker bugs for t_tcl/expr.t parsing.
set TODO {TODO "awaiting real bigint support"}
eval_is {expr (1<<63)-1} 9223372036854775807 {expr-32.4} $TODO
eval_is {expr -2147483648} -2147483648 {expr-46.17} $TODO
eval_is {expr 9223372036854775808} 9223372036854775808 {expr-46.19} $TODO
