# Copyright (C) 2005-2007, The Perl Foundation.
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

See "Lua 5.1 Reference Manual", section 5.6 "Mathematical Functions",
L<http://www.lua.org/manual/5.1/manual.html#5.6>.

=cut

.HLL 'Lua', 'lua_group'

.sub 'luaopen_math'
#    print "init Lua Math\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_global '_G'
    new $P1, .LuaString

    .local pmc _math
    new _math, .LuaTable
    set $P1, 'math'
    _lua__GLOBAL[$P1] = _math

    lua_register($P1, _math)

    .const .Sub _math_abs = 'abs'
    _math_abs.'setfenv'(_lua__GLOBAL)
    set $P1, 'abs'
    _math[$P1] = _math_abs

    .const .Sub _math_acos = 'acos'
    _math_acos.'setfenv'(_lua__GLOBAL)
    set $P1, 'acos'
    _math[$P1] = _math_acos

    .const .Sub _math_asin = 'asin'
    _math_asin.'setfenv'(_lua__GLOBAL)
    set $P1, 'asin'
    _math[$P1] = _math_asin

    .const .Sub _math_atan = 'atan'
    _math_atan.'setfenv'(_lua__GLOBAL)
    set $P1, 'atan'
    _math[$P1] = _math_atan

    .const .Sub _math_atan2 = 'atan2'
    _math_atan2.'setfenv'(_lua__GLOBAL)
    set $P1, 'atan2'
    _math[$P1] = _math_atan2

    .const .Sub _math_ceil = 'ceil'
    _math_ceil.'setfenv'(_lua__GLOBAL)
    set $P1, 'ceil'
    _math[$P1] = _math_ceil

    .const .Sub _math_cos = 'cos'
    _math_cos.'setfenv'(_lua__GLOBAL)
    set $P1, 'cos'
    _math[$P1] = _math_cos

    .const .Sub _math_deg = 'deg'
    _math_deg.'setfenv'(_lua__GLOBAL)
    set $P1, 'deg'
    _math[$P1] = _math_deg

    .const .Sub _math_exp = 'exp'
    _math_exp.'setfenv'(_lua__GLOBAL)
    set $P1, 'exp'
    _math[$P1] = _math_exp

    .const .Sub _math_floor = 'floor'
    _math_floor.'setfenv'(_lua__GLOBAL)
    set $P1, 'floor'
    _math[$P1] = _math_floor

    .const .Sub _math_fmod = 'fmod'
    _math_fmod.'setfenv'(_lua__GLOBAL)
    set $P1, 'fmod'
    _math[$P1] = _math_fmod

    # LUA_COMPAT_MOD
    set $P1, 'mod'
    _math[$P1] = _math_fmod

    .const .Sub _math_frexp = 'frexp'
    _math_frexp.'setfenv'(_lua__GLOBAL)
    set $P1, 'frexp'
    _math[$P1] = _math_frexp

    .const .Sub _math_ldexp = 'ldexp'
    _math_ldexp.'setfenv'(_lua__GLOBAL)
    set $P1, 'ldexp'
    _math[$P1] = _math_ldexp

    .const .Sub _math_log = 'log'
    _math_log.'setfenv'(_lua__GLOBAL)
    set $P1, 'log'
    _math[$P1] = _math_log

    .const .Sub _math_log10 = 'log10'
    _math_log10.'setfenv'(_lua__GLOBAL)
    set $P1, 'log10'
    _math[$P1] = _math_log10

    .const .Sub _math_max = 'max'
    _math_max.'setfenv'(_lua__GLOBAL)
    set $P1, 'max'
    _math[$P1] = _math_max

    .const .Sub _math_min = 'min'
    _math_min.'setfenv'(_lua__GLOBAL)
    set $P1, 'min'
    _math[$P1] = _math_min

    .const .Sub _math_modf = 'modf'
    _math_modf.'setfenv'(_lua__GLOBAL)
    set $P1, 'modf'
    _math[$P1] = _math_modf

    .const .Sub _math_pow = 'pow'
    _math_pow.'setfenv'(_lua__GLOBAL)
    set $P1, 'pow'
    _math[$P1] = _math_pow

    .const .Sub _math_rad = 'rad'
    _math_rad.'setfenv'(_lua__GLOBAL)
    set $P1, 'rad'
    _math[$P1] = _math_rad

    .const .Sub _math_random = 'random'
    _math_random.'setfenv'(_lua__GLOBAL)
    set $P1, 'random'
    _math[$P1] = _math_random

    .const .Sub _math_randomseed = 'randomseed'
    _math_randomseed.'setfenv'(_lua__GLOBAL)
    set $P1, 'randomseed'
    _math[$P1] = _math_randomseed

    .const .Sub _math_sin = 'sin'
    _math_sin.'setfenv'(_lua__GLOBAL)
    set $P1, 'sin'
    _math[$P1] = _math_sin

    .const .Sub _math_sqrt = 'sqrt'
    _math_sqrt.'setfenv'(_lua__GLOBAL)
    set $P1, 'sqrt'
    _math[$P1] = _math_sqrt

    .const .Sub _math_tan = 'tan'
    _math_tan.'setfenv'(_lua__GLOBAL)
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


.sub 'abs' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = abs $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'acos' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = acos $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'asin' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = asin $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'atan' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = atan $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'atan2' :anon
    .param pmc y :optional
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, y)
    $N2 = lua_checknumber(2, x)
    $N0 = atan $N1, $N2
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'ceil' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = ceil $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'cos' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = cos $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'deg' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = 3.14159265358979323846 / 180.0
    $N0 = $N1 / $N0
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'exp' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = exp $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'floor' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = floor $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'fmod' :anon
    .param pmc x :optional
    .param pmc y :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N2 = lua_checknumber(1, y)
    $N0 = cmod $N1, $N2
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'frexp' :anon
    .param pmc x :optional
    .local pmc res
    lua_checknumber(1, x)
    new $P0, .Lua
    res = $P0.'frexp'(x)
    .return (res :flat)
.end


.sub 'ldexp' :anon
    .param pmc x :optional
    .param pmc nexp :optional
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, nexp)
    new $P0, .Lua
    res = $P0.'ldexp'(x, nexp)
    .return (res)
.end


.sub 'log' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = ln $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'log10' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = log10 $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'max' :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc dmax
    argc = argv
    unless argc == 0 goto L1
    lua_typerror(1, "no value", 'number')
  L1:
    $P0 = argv[0]
    i = 1
    dmax = lua_checknumber(i, $P0)
  L2:
    if i >= argc goto L3
    $P0 = argv[i]
    inc i
    $P1 = lua_checknumber(i, $P0)
    if dmax > $P1 goto L2
    dmax = $P1
    goto L2
  L3:
    $P0 = clone dmax
    .return ($P0)
.end


.sub 'min' :anon
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc dmin
    argc = argv
    unless argc == 0 goto L1
    lua_typerror(1, "no value", 'number')
  L1:
    $P0 = argv[0]
    i = 1
    dmin = lua_checknumber(i, $P0)
  L2:
    if i >= argc goto L3
    $P0 = argv[i]
    inc i
    $P1 = lua_checknumber(i, $P0)
    if dmin < $P1 goto L2
    dmin = $P1
    goto L2
  L3:
    $P0 = clone dmin
    .return ($P0)
.end


.sub 'modf' :anon
    .param pmc x :optional
    .local pmc res
    lua_checknumber(1, x)
    new $P0, .Lua
    res = $P0.'modf'(x)
    .return (res :flat)
.end


.sub 'pow' :anon
    .param pmc x :optional
    .param pmc y :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N2 = lua_checknumber(2, y)
    $N0 = pow $N1, $N2
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'rad' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = 3.14159265358979323846 / 180.0
    $N0 = $N1 * $N0
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'random' :anon
    .param pmc arg1 :optional
    .param pmc arg2 :optional
    .param pmc extra :slurpy
    .local pmc res
    .local int u
    .local int l
    new $P0, .Random
    $N0 = $P0
    new res, .LuaNumber
    unless null arg1 goto L1
    set res, $N0
    goto L2
  L1:
    unless null arg2 goto L3
    u = lua_checknumber(1, arg1)
    unless 1 <= u goto L4
    mul $N0, u
    $I0 = floor $N0
    inc $I0
    set res, $I0
    goto L2
  L3:
    if extra goto L5
    l = lua_checknumber(1, arg1)
    u = lua_checknumber(2, arg2)
    unless l <= u goto L4
    $I0 = u - l
    inc $I0
    mul $N0, $I0
    $I0 = floor $N0
    add $I0, l
    set res, $I0
    goto L2
  L4:
    lua_argerror(1, "interval is empty")
  L5:
    lua_error("wrong number of arguments")
  L2:
    .return (res)
.end


.sub 'randomseed' :anon
    .param pmc seed :optional
    $I1 = lua_checknumber(1, seed)
    new $P0, .Random
    set $P0, $I1
.end


.sub 'sin' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = sin $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'sqrt' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = sqrt $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


.sub 'tan' :anon
    .param pmc x :optional
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = tan $N1
    new res, .LuaNumber
    set res, $N0
    .return (res)
.end


=head1 AUTHORS

Francois Perrad.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
