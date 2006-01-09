# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/luamath.pir - Lua Mathematical Library

=head1 DESCRIPTION

This library is an interface to most of the functions of the standard C math
library. (Some have slightly different names.) It provides all its functions
inside the table C<math>. In addition, it registers the global C<__pow> for
the binary exponentiation operator C<^>. The library provides the following
functions:

    math.abs math.acos math.asin math.atan math.atan2
    math.ceil math.cos math.deg math.exp math.floor
    math.log math.log10 math.max math.min math.mod
    math.pow math.rad math.sin math.sqrt math.tan
    math.frexp math.ldexp math.random math.randomseed

plus a variable C<math.pi>. Most of them are only interfaces to the
corresponding functions in the C library. All trigonometric functions work
in radians (previous versions of Lua used degrees). The functions C<math.deg>
and C<math.rad> convert between radians and degrees.

The function C<math.max> returns the maximum value of its numeric arguments.
Similarly, C<math.min> computes the minimum. Both can be used with 1, 2, or
more arguments.

The functions C<math.random> and C<math.randomseed> are interfaces to the
simple random generator functions C<rand> and C<srand> that are provided by
ANSI C. (No guarantees can be given for their statistical properties.) When
called without arguments, C<math.random> returns a pseudo-random real number
in the range [0, 1]. When called with a number I<n>, C<math.random> returns
a pseudorandom integer in the range [1, I<n>]. When called with two arguments,
I<l> and I<u>, C<math.random> returns a pseudo-random integer in the range
[I<l, u>]. The C<math.randomseed> function sets a "seed" for the pseudo-random
generator: Equal seeds produce equal sequences of numbers.

See "Lua 5.0 Reference Manual", section 5.5 "Mathematical Functions".

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luapir.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua Math\n"

    .local pmc _lua__G
    _lua__G = global "_G"
    $P1 = new .LuaString

    .local pmc _math
    _math = new .LuaTable
    $P1 = "math"
    _lua__G[$P1] = _math

    .const .Sub _math_abs = "_math_abs"
    $P0 = _math_abs
    $P1 = "abs"
    _math[$P1] = $P0

    .const .Sub _math_acos = "_math_acos"
    $P0 = _math_acos
    $P1 = "acos"
    _math[$P1] = $P0

    .const .Sub _math_asin = "_math_asin"
    $P0 = _math_asin
    $P1 = "asin"
    _math[$P1] = $P0

    .const .Sub _math_atan = "_math_atan"
    $P0 = _math_atan
    $P1 = "atan"
    _math[$P1] = $P0

    .const .Sub _math_atan2 = "_math_atan2"
    $P0 = _math_atan2
    $P1 = "atan2"
    _math[$P1] = $P0

    .const .Sub _math_ceil = "_math_ceil"
    $P0 = _math_ceil
    $P1 = "ceil"
    _math[$P1] = $P0

    .const .Sub _math_cos = "_math_cos"
    $P0 = _math_cos
    $P1 = "cos"
    _math[$P1] = $P0

    .const .Sub _math_deg = "_math_deg"
    $P0 = _math_deg
    $P1 = "deg"
    _math[$P1] = $P0

    .const .Sub _math_exp = "_math_exp"
    $P0 = _math_exp
    $P1 = "exp"
    _math[$P1] = $P0

    .const .Sub _math_floor = "_math_floor"
    $P0 = _math_floor
    $P1 = "floor"
    _math[$P1] = $P0

    .const .Sub _math_log = "_math_log"
    $P0 = _math_log
    $P1 = "log"
    _math[$P1] = $P0

    .const .Sub _math_log10 = "_math_log10"
    $P0 = _math_log10
    $P1 = "log10"
    _math[$P1] = $P0

    .const .Sub _math_max = "_math_max"
    $P0 = _math_max
    $P1 = "max"
    _math[$P1] = $P0

    .const .Sub _math_min = "_math_min"
    $P0 = _math_min
    $P1 = "min"
    _math[$P1] = $P0

    .const .Sub _math_mod = "_math_mod"
    $P0 = _math_mod
    $P1 = "mod"
    _math[$P1] = $P0

    .const .Sub _math_pow = "_math_pow"
    $P0 = _math_pow
    $P1 = "pow"
    _math[$P1] = $P0
    _lua__G[$P1] = $P0

    .const .Sub _math_rad = "_math_rad"
    $P0 = _math_rad
    $P1 = "rad"
    _math[$P1] = $P0

    .const .Sub _math_sin = "_math_sin"
    $P0 = _math_sin
    $P1 = "sin"
    _math[$P1] = $P0

    .const .Sub _math_sqrt = "_math_sqrt"
    $P0 = _math_sqrt
    $P1 = "sqrt"
    _math[$P1] = $P0

    .const .Sub _math_tan = "_math_tan"
    $P0 = _math_tan
    $P1 = "tan"
    _math[$P1] = $P0

    .const .Sub _math_frexp = "_math_frexp"
    $P0 = _math_frexp
    $P1 = "frexp"
    _math[$P1] = $P0

    .const .Sub _math_ldexp = "_math_ldexp"
    $P0 = _math_ldexp
    $P1 = "ldexp"
    _math[$P1] = $P0

    .const .Sub _math_random = "_math_random"
    $P0 = _math_random
    $P1 = "random"
    _math[$P1] = $P0

    .const .Sub _math_randomseed = "_math_randomseed"
    $P0 = _math_randomseed
    $P1 = "randomseed"
    _math[$P1] = $P0

    $P0 = new .LuaNumber
    $P0 = 3.14159265358979323846
    $P1 = "pi"
    _math[$P1] = $P0

.end

.sub _math_abs :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = abs $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_acos :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = acos $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_asin :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = asin $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_atan :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = atan $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_atan2 :anon
    .param pmc y
    .param pmc x
    .local pmc ret
    $N0 = checknumber(y)
    $N1 = checknumber(x)
    $N2 = atan $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end

.sub _math_ceil :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ceil $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_cos :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = cos $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_deg :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 / $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end

.sub _math_exp :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = exp $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_floor :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = floor $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_log :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ln $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_log10 :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = log10 $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_max :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local float dmax
    .local float d
    .local pmc curr
    .local pmc ret
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", "number")
L0:    
    curr = argv[0]
    dmax = checknumber(curr)
    i = 1
L1:
    if i >= argc goto L3
    curr = argv[i]
    d = checknumber(curr)
    if dmax > d goto L2
    dmax = d
L2:
    i = i + 1
    goto L1
L3:
    new ret, .LuaNumber
    ret = dmax
    .return (ret)
.end

.sub _math_min :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local float dmin
    .local float d
    .local pmc curr
    .local pmc ret
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", "number")
L0:    
    curr = argv[0]
    dmin = checknumber(curr)
    i = 1
L1:
    if i >= argc goto L3
    curr = argv[i]
    d = checknumber(curr)
    if dmin < d goto L2
    dmin = d
L2:
    i = i + 1
    goto L1
L3:
    new ret, .LuaNumber
    ret = dmin
    .return (ret)
.end

.sub _math_mod :anon
    .param pmc x
    .param pmc y
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = cmod $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end

.sub _math_pow :anon
    .param pmc x
    .param pmc y
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = pow $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end

.sub _math_rad :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 * $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end

.sub _math_sin :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sin $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_sqrt :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sqrt $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_tan :anon
    .param pmc x
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = tan $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end

.sub _math_frexp :anon
    .param pmc x
    $N0 = checknumber(x)
    not_implemented()
.end

.sub _math_ldexp :anon
    .param pmc x
    .param pmc exp
    $N0 = checknumber(x)
    $I0 = checkint(exp)
    not_implemented()
.end

.sub _math_random :anon
    not_implemented()
.end

.sub _math_randomseed :anon
    .param pmc seed
    $I0 = checkint(seed)
    not_implemented()
.end

=head1 AUTHORS

Francois Perrad.

=cut

