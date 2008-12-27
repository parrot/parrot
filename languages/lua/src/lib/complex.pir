# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/complex.pir - complex library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lcomplex>

This implementation is based on F<src/pmc/complex.pmc>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'complex' ]

.sub '__onload' :anon :load
#    print "__onload complex\n"
    .const 'Sub' entry = 'luaopen_complex'
    set_hll_global 'luaopen_complex', entry
.end

.const string MYNAME = 'complex'
.const string MYTYPE = 'complex number'
.const string MYPMC = 'Complex'

.sub 'luaopen_complex'

#    print "luaopen_complex\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _complex
    _complex = lua_newmetatable(MYTYPE)

    new $P1, 'LuaString'
    set $P1, '__index'
    _complex[$P1] = _complex

    set $P1, MYNAME
    _lua__GLOBAL[$P1] = _complex

    $P2 = split "\n", <<'LIST'
__add
__div
__eq
__mul
__sub
__unm
abs
acos
acosh
arg
asin
asinh
atan
atanh
conj
cos
cosh
exp
imag
log
new
pow
proj
real
sin
sinh
sqrt
tan
tanh
tostring
LIST
    lua_register($P1, _complex, $P2)

    set $P1, 'tostring'
    $P0 = _complex[$P1]
    set $P1, '__tostring'
    _complex[$P1] = $P0

    set $P1, 'pow'
    $P0 = _complex[$P1]
    set $P1, '__pow'
    _complex[$P1] = $P0

    new $P2, 'LuaString'
    set $P2, "complex library for Lua on Parrot"
    set $P1, 'version'
    _complex[$P1] = $P2

    new $P0, MYPMC
    # $P0[0] = 0.0
    $P0[1] = 1.0
    $P2 = newcomplex($P0)
    set $P1, 'I'
    _complex[$P1] = $P2

    .return (_complex)
.end


.sub 'get' :anon
    .param int narg
    .param pmc z :optional
    if null z goto L1
    $I0 = isa z, 'LuaNumber'
    if $I0 goto L2
    $I0 = isa z, 'LuaString'
    if $I0 goto L2
    goto L1
  L2:
    $N0 = lua_checknumber(1, z)
    new $P0, MYPMC
    $P0[0] = $N0
    # $P0[1] = 0.0
    .return ($P0)
  L1:
    .tailcall lua_checkudata(narg, z, MYTYPE)
.end


.sub 'newcomplex' :anon
    .param pmc z
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    .tailcall lua_newuserdata(z, mt)
.end


=item C<complex.__add (z, w)>

=cut

.sub '__add'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $P0 = add $P1, $P2
    $P0 = newcomplex($P0)
    .return ($P0)
.end


=item C<complex.__div (z, w)>

=cut

.sub '__div'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $P0 = div $P1, $P2
    $P0 = newcomplex($P0)
    .return ($P0)
.end


=item C<complex.__eq (z, w)>

=cut

.sub '__eq'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $I0 = iseq $P1, $P2
    new $P0, 'LuaBoolean'
    set $P0, $I0
    .return ($P0)
.end


=item C<complex.__mul (z, w)>

=cut

.sub '__mul'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $P0 = mul $P1, $P2
    $P0 = newcomplex($P0)
    .return ($P0)
.end


=item C<complex.__sub (z, w)>

=cut

.sub '__sub'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $P0 = sub $P1, $P2
    $P0 = newcomplex($P0)
    .return ($P0)
.end


=item C<complex.__unm (z)>

=cut

.sub '__unm'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = neg $P1
    $P0 = newcomplex($P0)
    .return ($P0)
.end


=item C<complex.abs (z)>

=cut

.sub 'abs'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = abs $P1
    .return ($P0)
.end


=item C<complex.acos (z)>

=cut

.sub 'acos'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'acos'()
    .tailcall newcomplex($P0)
.end


=item C<complex.acosh (z)>

=cut

.sub 'acosh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'acosh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.arg (z)>

NOT YET IMPLEMENTED.

=cut

.sub 'arg'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    not_implemented()
    new $P0, 'LuaNumber'
    set $P0, $N0
    .return ($P0)
.end


=item C<complex.asin (z)>

=cut

.sub 'asin'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'asin'()
    .tailcall newcomplex($P0)
.end


=item C<complex.asinh (z)>

=cut

.sub 'asinh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'asinh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.atan (z)>

=cut

.sub 'atan'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'atan'()
    .tailcall newcomplex($P0)
.end


=item C<complex.atanh (z)>

=cut

.sub 'atanh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'atanh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.conj (z)>

=cut

.sub 'conj'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = clone $P1
    $N1 = $P0[1]
    neg $N1
    $P0[1] = $N1
    .tailcall newcomplex($P0)
.end


=item C<complex.cos (z)>

=cut

.sub 'cos'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'cos'()
    .tailcall newcomplex($P0)
.end


=item C<complex.cosh (z)>

=cut

.sub 'cosh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'cosh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.exp (z)>

=cut

.sub 'exp'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'exp'()
    .tailcall newcomplex($P0)
.end


=item C<complex.imag (z)>

=cut

.sub 'imag'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $N0 = $P1[1]
    new $P0, 'LuaNumber'
    set $P0, $N0
    .return ($P0)
.end


=item C<complex.log (z)>

=cut

.sub 'log'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'ln'()
    .tailcall newcomplex($P0)
.end


=item C<complex.new (x, y)>

=cut

.sub 'new'
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    $N1 = lua_optnumber(1, x, 0)
    $N2 = lua_optnumber(2, y, 0)
    new $P0, MYPMC
    $P0[0] = $N1
    $P0[1] = $N2
    .tailcall newcomplex($P0)
.end


=item C<complex.pow (z, w)>

=cut

.sub 'pow'
    .param pmc z :optional
    .param pmc w :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P2 = get(2, w)
    $P0 = pow $P1, $P2
    .tailcall newcomplex($P0)
.end


=item C<complex.proj (z)>

NOT YET IMPLEMENTED.

=cut

.sub 'proj'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    not_implemented()
    .tailcall newcomplex($P0)
.end


=item C<complex.real (z)>

=cut

.sub 'real'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $N0 = $P1[0]
    new $P0, 'LuaNumber'
    set $P0, $N0
    .return ($P0)
.end


=item C<complex.sin (z)>

=cut

.sub 'sin'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'sin'()
    .tailcall newcomplex($P0)
.end


=item C<complex.sinh (z)>

=cut

.sub 'sinh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'sinh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.sqrt (z)>

=cut

.sub 'sqrt'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'sqrt'()
    .tailcall newcomplex($P0)
.end


=item C<complex.tan (z)>

=cut

.sub 'tan'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'tan'()
    .tailcall newcomplex($P0)
.end


=item C<complex.tanh (z)>

=cut

.sub 'tanh'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $P0 = $P1.'tanh'()
    .tailcall newcomplex($P0)
.end


=item C<complex.tostring (z)>

=cut

.sub 'tostring'
    .param pmc z :optional
    .param pmc extra :slurpy
    $P1 = get(1, z)
    $S0 = $P1
    new $P0, 'LuaString'
    set $P0, $S0
    .return ($P0)
.end


=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
