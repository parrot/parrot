# Copyright (C) 2005-2008, The Perl Foundation.
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

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'math' ]

.sub 'luaopen_math'
#    print "init Lua Math\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _math
    new _math, 'LuaTable'
    set $P1, 'math'
    _lua__GLOBAL[$P1] = _math

    $P2 = split "\n", <<'LIST'
abs
acos
asin
atan
atan2
ceil
cos
deg
exp
floor
fmod
frexp
ldexp
log
log10
max
min
modf
pow
rad
random
randomseed
sin
sqrt
tan
LIST
    lua_register($P1, _math, $P2)

    # LUA_COMPAT_MOD
    set $P1, 'fmod'
    $P0 = _math[$P1]
    set $P1, 'mod'
    _math[$P1] = $P0

    new $P0, 'LuaNumber'
    set $P0, 3.14159265358979323846
    set $P1, 'pi'
    _math[$P1] = $P0

    new $P0, 'LuaNumber'
    set $P0, 1.0
    new $P2, 'LuaNumber'
    set $P2, 0.0
    div $P0, $P2
    set $P1, 'huge'
    _math[$P1] = $P0

.end


.sub 'abs'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = abs $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'acos'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = acos $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'asin'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = asin $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'atan'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = atan $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'atan2'
    .param pmc y :optional
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, y)
    $N2 = lua_checknumber(2, x)
    $N0 = atan $N1, $N2
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'ceil'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = ceil $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'cos'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = cos $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'deg'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = 3.14159265358979323846 / 180.0
    $N0 = $N1 / $N0
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'exp'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = exp $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'floor'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = floor $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'fmod'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N2 = lua_checknumber(1, y)
    $N0 = cmod $N1, $N2
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'frexp'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'frexp'()
    .return (res :flat)
.end


.sub 'ldexp'
    .param pmc x :optional
    .param pmc nexp :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, nexp)
    res = x.'ldexp'(nexp)
    .return (res)
.end


.sub 'log'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = ln $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'log10'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = log10 $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'max'
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


.sub 'min'
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


.sub 'modf'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'modf'()
    .return (res :flat)
.end


.sub 'pow'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N2 = lua_checknumber(2, y)
    $N0 = pow $N1, $N2
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'rad'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = 3.14159265358979323846 / 180.0
    $N0 = $N1 * $N0
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'random'
    .param pmc arg1 :optional
    .param pmc arg2 :optional
    .param pmc extra :slurpy
    .local pmc res
    .local int u
    .local int l
    new $P0, 'Random'
    $N0 = $P0
    new res, 'LuaNumber'
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


.sub 'randomseed'
    .param pmc seed :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, seed)
    new $P0, 'Random'
    set $P0, $I1
.end


.sub 'sin'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = sin $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'sqrt'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = sqrt $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


.sub 'tan'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = tan $N1
    new res, 'LuaNumber'
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
# vim: expandtab shiftwidth=4 ft=pir:
