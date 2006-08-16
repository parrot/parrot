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

.namespace [ 'Lua' ]
.HLL 'Lua', 'lua_group'


.sub 'init_math' :load :anon

#    load_bytecode 'languages/lua/lib/luaaux.pbc'
#    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua Math\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    $P1 = new .LuaString

    .local pmc _math
    _math = new .LuaTable
    $P1 = 'math'
    _lua__GLOBAL[$P1] = _math

    .const .Sub _math_abs = '_math_abs'
    $P1 = 'abs'
    _math[$P1] = _math_abs

    .const .Sub _math_acos = '_math_acos'
    $P1 = 'acos'
    _math[$P1] = _math_acos

    .const .Sub _math_asin = '_math_asin'
    $P1 = 'asin'
    _math[$P1] = _math_asin

    .const .Sub _math_atan = '_math_atan'
    $P1 = 'atan'
    _math[$P1] = _math_atan

    .const .Sub _math_atan2 = '_math_atan2'
    $P1 = 'atan2'
    _math[$P1] = _math_atan2

    .const .Sub _math_ceil = '_math_ceil'
    $P1 = 'ceil'
    _math[$P1] = _math_ceil

    .const .Sub _math_cos = '_math_cos'
    $P1 = 'cos'
    _math[$P1] = _math_cos

    .const .Sub _math_deg = '_math_deg'
    $P1 = 'deg'
    _math[$P1] = _math_deg

    .const .Sub _math_exp = '_math_exp'
    $P1 = 'exp'
    _math[$P1] = _math_exp

    .const .Sub _math_floor = '_math_floor'
    $P1 = 'floor'
    _math[$P1] = _math_floor

    .const .Sub _math_fmod = '_math_fmod'
    $P1 = 'fmod'
    _math[$P1] = _math_fmod

    .const .Sub _math_frexp = '_math_frexp'
    $P1 = 'frexp'
    _math[$P1] = _math_frexp

    .const .Sub _math_ldexp = '_math_ldexp'
    $P1 = 'ldexp'
    _math[$P1] = _math_ldexp

    .const .Sub _math_log = '_math_log'
    $P1 = 'log'
    _math[$P1] = _math_log

    .const .Sub _math_log10 = '_math_log10'
    $P1 = 'log10'
    _math[$P1] = _math_log10

    .const .Sub _math_max = '_math_max'
    $P1 = 'max'
    _math[$P1] = _math_max

    .const .Sub _math_min = '_math_min'
    $P1 = 'min'
    _math[$P1] = _math_min

    .const .Sub _math_modf = '_math_modf'
    $P1 = 'modf'
    _math[$P1] = _math_modf

    .const .Sub _math_pow = '_math_pow'
    $P1 = 'pow'
    _math[$P1] = _math_pow

    .const .Sub _math_rad = '_math_rad'
    $P1 = 'rad'
    _math[$P1] = _math_rad

    .const .Sub _math_random = '_math_random'
    $P1 = 'random'
    _math[$P1] = _math_random

    .const .Sub _math_randomseed = '_math_randomseed'
    $P1 = 'randomseed'
    _math[$P1] = _math_randomseed

    .const .Sub _math_sin = '_math_sin'
    $P1 = 'sin'
    _math[$P1] = _math_sin

    .const .Sub _math_sqrt = '_math_sqrt'
    $P1 = 'sqrt'
    _math[$P1] = _math_sqrt

    .const .Sub _math_tan = '_math_tan'
    $P1 = 'tan'
    _math[$P1] = _math_tan

    $P0 = new .LuaNumber
    $P0 = 3.14159265358979323846
    $P1 = 'pi'
    _math[$P1] = $P0

    $P0 = new .LuaNumber
    $P0 = 1.0
    $P2 = new .LuaNumber
    $P2 = 0.0
    div $P0, $P2
    $P1 = 'huge'
    _math[$P1] = $P0

.end


.sub '_math_abs' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = abs $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_acos' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = acos $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_asin' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = asin $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_atan' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = atan $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_atan2' :anon :outer(init_math)
    .param pmc y :optional
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(y)
    $N1 = checknumber(x)
    $N2 = atan $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end


.sub '_math_ceil' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ceil $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_cos' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = cos $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_deg' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 / $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end


.sub '_math_exp' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = exp $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_floor' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = floor $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_fmod' :anon :outer(init_math)
    .param pmc x :optional
    .param pmc y :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = cmod $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end


.sub '_math_frexp' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    checknumber(x)
    new $P0, .Lua
    ret = $P0.'frexp'(x)
    .return (ret :flat)
.end


.sub '_math_ldexp' :anon :outer(init_math)
    .param pmc x :optional
    .param pmc nexp :optional
    .local pmc ret
    checknumber(x)
    checknumber(nexp)
    new $P0, .Lua
    ret = $P0.'ldexp'(x, nexp)
    .return (ret)
.end


.sub '_math_log' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = ln $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_log10' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = log10 $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_max' :anon :outer(init_math)
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local float dmax
    .local float d
    .local pmc curr
    .local pmc ret
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", 'number')
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
    inc i
    goto L1
L3:
    new ret, .LuaNumber
    ret = dmax
    .return (ret)
.end


.sub '_math_min' :anon :outer(init_math)
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local float dmin
    .local float d
    .local pmc curr
    .local pmc ret
    argc = argv
    unless argc == 0 goto L0
    tag_error("no value", 'number')
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
    inc i
    goto L1
L3:
    new ret, .LuaNumber
    ret = dmin
    .return (ret)
.end


.sub '_math_modf' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    checknumber(x)
    new $P0, .Lua
    ret = $P0."modf"(x)
    .return (ret :flat)
.end


.sub '_math_pow' :anon :outer(init_math)
    .param pmc x :optional
    .param pmc y :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = checknumber(y)
    $N2 = pow $N0, $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end


.sub '_math_rad' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = 3.14159265358979323846 / 180.0
    $N2 = $N0 * $N1
    new ret, .LuaNumber
    ret = $N2
    .return (ret)
.end


.sub '_math_random' :anon :outer(init_math)
    .param pmc arg1 :optional
    .param pmc arg2 :optional
    .param pmc extra :slurpy
    .local pmc ret
    .local int u
    .local int l
    new $P0, .Random
    $N0 = $P0
    new ret, .LuaNumber
    unless_null arg1, L1
    ret = $N0
    goto L2
L1:
    unless_null arg2, L3
    u = checknumber(arg1)
    unless 1 <= u goto L4
    mul $N0, u
    $I0 = floor $N0
    inc $I0
    ret = $I0
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
    ret = $I0
    goto L2
L4:
    argerror("interval is empty")
L5:
    error("wrong number of arguments")
L2:
    .return (ret)    
.end


.sub '_math_randomseed' :anon :outer(init_math)
    .param pmc seed :optional
    $I0 = checknumber(seed)
    new $P0, .Random
    $P0 = $I0
.end


.sub '_math_sin' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sin $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_sqrt' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = sqrt $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


.sub '_math_tan' :anon :outer(init_math)
    .param pmc x :optional
    .local pmc ret
    $N0 = checknumber(x)
    $N1 = tan $N0
    new ret, .LuaNumber
    ret = $N1
    .return (ret)
.end


=head1 AUTHORS

Francois Perrad.

=cut

