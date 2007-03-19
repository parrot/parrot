# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

lib/luamath.pir - Lua Mathematical Library

=head1 DESCRIPTION

This library is an interface to the standard C math library. It provides all
its functions inside the table C<math>. The library provides the following
functions:

    math.abs     math.acos    math.asin    math.atan    math.atan2
    math.ceil    math.cos     math.cosh    math.deg     math.exp
    math.floor   math.fmod    math.frexp   math.ldexp   math.log
    math.log10   math.max     math.min     math.modf    math.pow
    math.rad     math.random  math.randomseed           math.sin
    math.sinh    math.sqrt    math.tan     math.tanh

plus a variable C<math.pi> and a variable C<math.huge>, with the value
C<HUGE_VAL>. Most of these functions are only interfaces to the corresponding
functions in the C library. All trigonometric functions work in radians. The
functions C<math.deg> and C<math.rad> convert between radians and degrees.

The function C<math.max> returns the maximum value of its numeric arguments.
Similarly, C<math.min> computes the minimum. Both can be used with 1, 2, or
more arguments.

The function C<math.modf> corresponds to the C<modf> C function. It returns
two values: The integral part and the fractional part of its argument.
The function C<math.frexp> also returns 2 values: The normalized fraction
and the exponent of its argument.

The functions C<math.random> and C<math.randomseed> are interfaces to the
simple random generator functions C<rand> and C<srand> that are provided by
ANSI C. (No guarantees can be given for their statistical properties.) When
called without arguments, C<math.random> returns a pseudo-random real number
in the range [0,1]. When called with a number I<n>, C<math.random> returns
a pseudo-random integer in the range I<[1,n]>. When called with two arguments,
I<l> and I<u>, C<math.random> returns a pseudo-random integer in the range
I<[l,u]>. The C<math.randomseed> function sets a "seed" for the pseudo-random
generator: Equal seeds produce equal sequences of numbers.

See "Lua 5.1 Reference Manual", section 5.6 "Mathematical Functions".

=cut

.HLL 'Lua', 'lua_group'

.sub 'init_math' :load :anon

    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua Math\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    new $P1, .LuaString

    .local pmc _math
    new _math, .LuaTable
    set $P1, 'math'
    _lua__GLOBAL[$P1] = _math

    _register($P1, _math)

    .const .Sub _math_abs = '_math_abs'
    set $P1, 'abs'
    _math[$P1] = _math_abs

    .const .Sub _math_acos = '_math_acos'
    set $P1, 'acos'
    _math[$P1] = _math_acos

    .const .Sub _math_asin = '_math_asin'
    set $P1, 'asin'
    _math[$P1] = _math_asin

    .const .Sub _math_atan = '_math_atan'
    set $P1, 'atan'
    _math[$P1] = _math_atan

    .const .Sub _math_atan2 = '_math_atan2'
    set $P1, 'atan2'
    _math[$P1] = _math_atan2

    .const .Sub _math_ceil = '_math_ceil'
    set $P1, 'ceil'
    _math[$P1] = _math_ceil

    .const .Sub _math_cos = '_math_cos'
    set $P1, 'cos'
    _math[$P1] = _math_cos

    .const .Sub _math_deg = '_math_deg'
    set $P1, 'deg'
    _math[$P1] = _math_deg

    .const .Sub _math_exp = '_math_exp'
    set $P1, 'exp'
    _math[$P1] = _math_exp

    .const .Sub _math_floor = '_math_floor'
    set $P1, 'floor'
    _math[$P1] = _math_floor

    .const .Sub _math_fmod = '_math_fmod'
    set $P1, 'fmod'
    _math[$P1] = _math_fmod

    # LUA_COMPAT_MOD
    set $P1, 'mod'
    _math[$P1] = _math_fmod

    .const .Sub _math_frexp = '_math_frexp'
    set $P1, 'frexp'
    _math[$P1] = _math_frexp

    .const .Sub _math_ldexp = '_math_ldexp'
    set $P1, 'ldexp'
    _math[$P1] = _math_ldexp

    .const .Sub _math_log = '_math_log'
    set $P1, 'log'
    _math[$P1] = _math_log

    .const .Sub _math_log10 = '_math_log10'
    set $P1, 'log10'
    _math[$P1] = _math_log10

    .const .Sub _math_max = '_math_max'
    set $P1, 'max'
    _math[$P1] = _math_max

    .const .Sub _math_min = '_math_min'
    set $P1, 'min'
    _math[$P1] = _math_min

    .const .Sub _math_modf = '_math_modf'
    set $P1, 'modf'
    _math[$P1] = _math_modf

    .const .Sub _math_pow = '_math_pow'
    set $P1, 'pow'
    _math[$P1] = _math_pow

    .const .Sub _math_rad = '_math_rad'
    set $P1, 'rad'
    _math[$P1] = _math_rad

    .const .Sub _math_random = '_math_random'
    set $P1, 'random'
    _math[$P1] = _math_random

    .const .Sub _math_randomseed = '_math_randomseed'
    set $P1, 'randomseed'
    _math[$P1] = _math_randomseed

    .const .Sub _math_sin = '_math_sin'
    set $P1, 'sin'
    _math[$P1] = _math_sin

    .const .Sub _math_sqrt = '_math_sqrt'
    set $P1, 'sqrt'
    _math[$P1] = _math_sqrt

    .const .Sub _math_tan = '_math_tan'
    set $P1, 'tan'
    _math[$P1] = _math_tan

    new $P0, .LuaNumber
    set $P0, 3.14159265358979323846
    $P1 = 'pi'
    _math[$P1] = $P0

    new $P0, .LuaNumber
    set $P0, 1.0
    new $P2, .LuaNumber
    set $P2, 0.0
    div $P0, $P2
    $P1 = 'huge'
    _math[$P1] = $P0

.end


.sub '_math_abs' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = abs $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_acos' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = acos $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_asin' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = asin $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_atan' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = atan $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_atan2' :anon
    .param pmc y :optional
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(y)
    $N1 = checknumber(x)
    $N2 = atan $N0, $N1
    new ret, .LuaNumber
    set ret, $N2
    .return (ret)
.end


.sub '_math_ceil' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ceil $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_cos' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = cos $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_deg' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 / $N1
    new ret, .LuaNumber
    set ret, $N2
    .return (ret)
.end


.sub '_math_exp' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = exp $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_floor' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = floor $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_fmod' :anon
    .param pmc x :optional
    .param pmc y :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = cmod $N0, $N1
    new ret, .LuaNumber
    set ret, $N2
    .return (ret)
.end


.sub '_math_frexp' :anon
    .param pmc x :optional
    .local pmc ret
    checknumber(x)
    new $P0, .Lua
    ret = $P0.'frexp'(x)
    .return (ret :flat)
.end


.sub '_math_ldexp' :anon
    .param pmc x :optional
    .param pmc nexp :optional
    .local pmc ret
    checknumber(x)
    checknumber(nexp)
    new $P0, .Lua
    ret = $P0.'ldexp'(x, nexp)
    .return (ret)
.end


.sub '_math_log' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ln $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_log10' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = log10 $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_max' :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc dmax
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", 'number')
L0:
    $P0 = argv[0]
    dmax = checknumber($P0)
    i = 1
L1:
    if i >= argc goto L3
    $P0 = argv[i]
    $P1 = checknumber($P0)
    if dmax > $P1 goto L2
    dmax = $P1
L2:
    inc i
    goto L1
L3:
    $P0 = clone dmax
    .return ($P0)
.end


.sub '_math_min' :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc dmin
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", 'number')
L0:
    $P0 = argv[0]
    dmin = checknumber($P0)
    i = 1
L1:
    if i >= argc goto L3
    $P0 = argv[i]
    $P1 = checknumber($P0)
    if dmin < $P1 goto L2
    dmin = $P1
L2:
    inc i
    goto L1
L3:
    $P0 = clone dmin
    .return ($P0)
.end


.sub '_math_modf' :anon
    .param pmc x :optional
    .local pmc ret
    checknumber(x)
    new $P0, .Lua
    ret = $P0."modf"(x)
    .return (ret :flat)
.end


.sub '_math_pow' :anon
    .param pmc x :optional
    .param pmc y :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = pow $N0, $N1
    new ret, .LuaNumber
    set ret, $N2
    .return (ret)
.end


.sub '_math_rad' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 * $N1
    new ret, .LuaNumber
    set ret, $N2
    .return (ret)
.end


.sub '_math_random' :anon
    .param pmc arg1 :optional
    .param pmc arg2 :optional
    .param pmc extra :slurpy
    .local pmc ret
    .local int u
    .local int l
    new $P0, .Random
    $N0 = $P0
    new ret, .LuaNumber
    unless null arg1 goto L1
    set ret, $N0
    goto L2
L1:
    unless null arg2 goto L3
    u = checknumber(arg1)
    unless 1 <= u goto L4
    mul $N0, u
    $I0 = floor $N0
    inc $I0
    set ret, $I0
    goto L2
L3:
    if extra goto L5
    l = checknumber(arg1)
    u = checknumber(arg2)
    unless l <= u goto L4
    $I0 = u - l
    inc $I0
    mul $N0, $I0
    $I0 = floor $N0
    add $I0, l
    set ret, $I0
    goto L2
L4:
    argerror("interval is empty")
L5:
    error("wrong number of arguments")
L2:
    .return (ret)
.end


.sub '_math_randomseed' :anon
    .param pmc seed :optional
    $I0 = checknumber(seed)
    new $P0, .Random
    set $P0, $I0
.end


.sub '_math_sin' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sin $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_sqrt' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sqrt $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


.sub '_math_tan' :anon
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = tan $N0
    new ret, .LuaNumber
    set ret, $N1
    .return (ret)
.end


=head1 AUTHORS

Francois Perrad.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
