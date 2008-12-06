# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/math.pir - math library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lmathx>.

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'mathx' ]

.sub '__onload' :anon :load
#    print "__onload mathx\n"
    .const 'Sub' entry = 'luaopen_mathx'
    set_hll_global 'luaopen_mathx', entry
.end

.sub 'luaopen_mathx'

#    print "luaopen_mathx\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _mathx
    new $P1, 'LuaString'
    set $P1, 'math'
    _mathx  = _lua__GLOBAL[$P1]

    $P2 = split "\n", <<'LIST'
acosh
asinh
atanh
cbrt
copysign
erf
erfc
exp2
expm1
fdim
fma
fmax
fmin
fpclassify
gamma
hypot
ilogb
isfinite
isinf
isnan
isnormal
lgamma
log1p
log2
logb
nearbyint
nextafter
nexttoward
remainder
rint
round
scalbn
signbit
trunc
LIST
    lua_register($P1, _mathx, $P2)

    new $P0, 'LuaNumber'
    set $N0, 'Inf'
    set $P0, $N0
    set $P1, 'infinity'
    _mathx[$P1] = $P0

    new $P0, 'LuaNumber'
    set $N0, 'NaN'
    set $P0, $N0
    set $P1, 'nan'
    _mathx[$P1] = $P0

    .return (_mathx)
.end


=item C<math.acosh (x)>

=cut

.sub 'acosh'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'acosh'()
    .return (res)
.end


=item C<math.asinh (x)>

=cut

.sub 'asinh'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'asinh'()
    .return (res)
.end


=item C<math.atanh (x)>

=cut

.sub 'atanh'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'atanh'()
    .return (res)
.end


=item C<math.cbrt (x)>

=cut

.sub 'cbrt'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'cbrt'()
    .return (res)
.end


=item C<math.copysign (x, y)>

=cut

.sub 'copysign'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'copysign'(y)
    .return (res)
.end


=item C<math.erf (x)>

=cut

.sub 'erf'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'erf'()
    .return (res)
.end


=item C<math.erfc (x)>

=cut

.sub 'erfc'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'erfc'()
    .return (res)
.end


=item C<math.exp2 (x)>

=cut

.sub 'exp2'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'exp2'()
    .return (res)
.end


=item C<math.expm1 (x)>

=cut

.sub 'expm1'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'expm1'()
    .return (res)
.end


=item C<math.fdim (x, y)>

=cut

.sub 'fdim'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'fdim'(y)
    .return (res)
.end


=item C<math.fma (x, y, z)>

=cut

.sub 'fma'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc z :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    lua_checknumber(3, z)
    res = x.'fma'(y, z)
    .return (res)
.end


=item C<math.fmax (x1, x2, ..., xn)>

=cut

.sub 'fmax'
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc m, y
    argc = argv
    $P0 = argv[0]
    i = 1
    lua_checknumber(i, $P0)
    m = $P0
  L1:
    if i >= argc goto L2
    $P0 = argv[i]
    inc i
    lua_checknumber(i, $P0)
    m = m.'fmax'($P0)
    goto L1
  L2:
    .return (m)
.end


=item C<math.fmin ()>

=cut

.sub 'fmin'
    .param pmc argv :slurpy
    .local int argc
    .local int i
    .local pmc m, y
    argc = argv
    $P0 = argv[0]
    i = 1
    lua_checknumber(i, $P0)
    m = $P0
  L1:
    if i >= argc goto L2
    $P0 = argv[i]
    inc i
    lua_checknumber(i, $P0)
    m = m.'fmin'($P0)
    goto L1
  L2:
    .return (m)
.end


=item C<math.fpclassify (x)>

=cut

.sub 'fpclassify'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'fpclassify'()
    .return (res)
.end


=item C<math.gamma (x)>

=cut

.sub 'gamma'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'tgamma'()
    .return (res)
.end


=item C<math.hypot (x, y)>

=cut

.sub 'hypot'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'hypot'(y)
    .return (res)
.end


=item C<math.ilogb (x)>

=cut

.sub 'ilogb'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'ilogb'()
    .return (res)
.end


=item C<math.isfinite (x)>

=cut

.sub 'isfinite'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'isfinite'()
    .return (res)
.end


=item C<math.isinf (x)>

=cut

.sub 'isinf'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'isinf'()
    .return (res)
.end


=item C<math.isnan (x)>

=cut

.sub 'isnan'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'isnan'()
    .return (res)
.end


=item C<math.isnormal (x)>

=cut

.sub 'isnormal'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'isnormal'()
    .return (res)
.end


=item C<math.lgamma (x)>

=cut

.sub 'lgamma'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'lgamma'()
    .return (res)
.end


=item C<math.log1p (x)>

=cut

.sub 'log1p'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'log1p'()
    .return (res)
.end


=item C<math.log2 (x)>

=cut

.sub 'log2'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    $N1 = lua_checknumber(1, x)
    $N0 = log2 $N1
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


=item C<math.logb (x)>

=cut

.sub 'logb'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'logb'()
    .return (res)
.end


=item C<math.nearbyint (x)>

=cut

.sub 'nearbyint'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'nearbyint'()
    .return (res)
.end


=item C<math.nextafter (x, y)>

=cut

.sub 'nextafter'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'nextafter'(y)
    .return (res)
.end


=item C<math.nexttoward (x, y)>

=cut

.sub 'nexttoward'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'nexttoward'(y)
    .return (res)
.end


=item C<math.remainder (x, y)>

=cut

.sub 'remainder'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, y)
    res = x.'remainder'(y)
    .return (res)
.end


=item C<math.rint (x)>

=cut

.sub 'rint'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'rint'()
    .return (res)
.end


=item C<math.round (x)>

=cut

.sub 'round'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'round'()
    .return (res)
.end


=item C<math.scalbn (x, ex)>

=cut

.sub 'scalbn'
    .param pmc x :optional
    .param pmc ex :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    lua_checknumber(2, ex)
    res = x.'scalbn'(ex)
    .return (res)
.end


=item C<math.signbit (x)>

=cut

.sub 'signbit'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'signbit'()
    .return (res)
.end


=item C<math.trunc (x)>

=cut

.sub 'trunc'
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res
    lua_checknumber(1, x)
    res = x.'trunc'()
    .return (res)
.end


=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
