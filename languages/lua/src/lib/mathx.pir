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
    set $P0, 0 # TODO
    set $P1, 'infinity'
    _mathx[$P1] = $P0

    new $P0, 'LuaNumber'
    set $P0, 0 # TODO
    set $P1, 'nan'
    _mathx[$P1] = $P0

    .return (_mathx)
.end


=item C<math.acosh ()>

NOT YET IMPLEMENTED.

=cut

.sub 'acosh'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.asinh ()>

NOT YET IMPLEMENTED.

=cut

.sub 'asinh'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.atanh ()>

NOT YET IMPLEMENTED.

=cut

.sub 'atanh'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.cbrt ()>

NOT YET IMPLEMENTED.

=cut

.sub 'cbrt'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.copysign ()>

NOT YET IMPLEMENTED.

=cut

.sub 'copysign'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.erf ()>

NOT YET IMPLEMENTED.

=cut

.sub 'erf'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.erfc ()>

NOT YET IMPLEMENTED.

=cut

.sub 'erfc'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.exp2 ()>

NOT YET IMPLEMENTED.

=cut

.sub 'exp2'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.expm1 ()>

NOT YET IMPLEMENTED.

=cut

.sub 'expm1'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.fdim ()>

NOT YET IMPLEMENTED.

=cut

.sub 'fdim'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.fma ()>

NOT YET IMPLEMENTED.

=cut

.sub 'fma'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.fmax ()>

NOT YET IMPLEMENTED.

=cut

.sub 'fmax'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.fmin ()>

NOT YET IMPLEMENTED.

=cut

.sub 'fmin'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.fpclassify ()>

NOT YET IMPLEMENTED.

=cut

.sub 'fpclassify'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.gamma ()>

NOT YET IMPLEMENTED.

=cut

.sub 'gamma'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.hypot ()>

NOT YET IMPLEMENTED.

=cut

.sub 'hypot'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.ilogb ()>

NOT YET IMPLEMENTED.

=cut

.sub 'ilogb'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.isinf ()>

NOT YET IMPLEMENTED.

=cut

.sub 'isinf'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.isnan ()>

NOT YET IMPLEMENTED.

=cut

.sub 'isnan'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.isnormal ()>

NOT YET IMPLEMENTED.

=cut

.sub 'isnormal'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.lgamma ()>

NOT YET IMPLEMENTED.

=cut

.sub 'lgamma'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.log1p ()>

NOT YET IMPLEMENTED.

=cut

.sub 'log1p'
    .param pmc extra :slurpy
    not_implemented()
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


=item C<math.logb ()>

NOT YET IMPLEMENTED.

=cut

.sub 'logb'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.nearbyint ()>

NOT YET IMPLEMENTED.

=cut

.sub 'nearbyint'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.nextafter ()>

NOT YET IMPLEMENTED.

=cut

.sub 'nextafter'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.nexttoward ()>

NOT YET IMPLEMENTED.

=cut

.sub 'nexttoward'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.remainder ()>

NOT YET IMPLEMENTED.

=cut

.sub 'remainder'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.rint ()>

NOT YET IMPLEMENTED.

=cut

.sub 'rint'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.round ()>

NOT YET IMPLEMENTED.

=cut

.sub 'round'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.scalbn ()>

NOT YET IMPLEMENTED.

=cut

.sub 'scalbn'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.signbit ()>

NOT YET IMPLEMENTED.

=cut

.sub 'signbit'
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<math.trunc ()>

NOT YET IMPLEMENTED.

=cut

.sub 'trunc'
    .param pmc extra :slurpy
    not_implemented()
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
