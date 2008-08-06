# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/bc.pir - big number library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lbc/>

This implementation is based on the PMC BigInt, a wrapper over gmp (GNU
multiple precision arithmetic library), see F<src/pmc/bigint.pmc>.

Use PMC BigFloat when available.

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua'; 'bc' ]

.sub '__onload' :anon :load
#    print "__onload bc\n"
    .const .Sub entry = 'luaopen_bc'
    set_hll_global 'luaopen_bc', entry
.end

.const string MYNAME = 'bc'
.const string MYTYPE = 'bc bignumber'
#.const string MYPMC = 'BigFloat'
.const string MYPMC = 'BigInt'

.sub 'luaopen_bc'

#    print "luaopen_bc\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _bc
    _bc = lua_newmetatable(MYTYPE)

    new $P1, 'LuaString'
    set $P1, '__index'
    _bc[$P1] = _bc

    set $P1, MYNAME
    _lua__GLOBAL[$P1] = _bc
    lua_register($P1, _bc)

    .const .Sub _bc___eq = '__eq'
    _bc___eq.'setfenv'(_lua__GLOBAL)
    set $P1, '__eq'
    _bc[$P1] = _bc___eq

    .const .Sub _bc___lt = '__lt'
    _bc___lt.'setfenv'(_lua__GLOBAL)
    set $P1, '__lt'
    _bc[$P1] = _bc___lt

    .const .Sub _bc___unm = '__unm'
    _bc___unm.'setfenv'(_lua__GLOBAL)
    set $P1, '__unm'
    _bc[$P1] = _bc___unm

    .const .Sub _bc_add = 'add'
    _bc_add.'setfenv'(_lua__GLOBAL)
    set $P1, 'add'
    _bc[$P1] = _bc_add
    set $P1, '__add'
    _bc[$P1] = _bc_add

    .const .Sub _bc_compare = 'compare'
    _bc_compare.'setfenv'(_lua__GLOBAL)
    set $P1, 'compare'
    _bc[$P1] = _bc_compare

    .const .Sub _bc_digits = 'digits'
    _bc_digits.'setfenv'(_lua__GLOBAL)
    set $P1, 'digits'
    _bc[$P1] = _bc_digits

    .const .Sub _bc_div = 'div'
    _bc_div.'setfenv'(_lua__GLOBAL)
    set $P1, 'div'
    _bc[$P1] = _bc_div
    set $P1, '__div'
    _bc[$P1] = _bc_div

    .const .Sub _bc_isneg = 'isneg'
    _bc_isneg.'setfenv'(_lua__GLOBAL)
    set $P1, 'isneg'
    _bc[$P1] = _bc_isneg

    .const .Sub _bc_iszero = 'iszero'
    _bc_iszero.'setfenv'(_lua__GLOBAL)
    set $P1, 'iszero'
    _bc[$P1] = _bc_iszero

    .const .Sub _bc_mod = 'mod'
    _bc_mod.'setfenv'(_lua__GLOBAL)
    set $P1, 'mod'
    _bc[$P1] = _bc_mod

    .const .Sub _bc_mul = 'mul'
    _bc_mul.'setfenv'(_lua__GLOBAL)
    set $P1, 'mul'
    _bc[$P1] = _bc_mul
    set $P1, '__mul'
    _bc[$P1] = _bc_mul

    .const .Sub _bc_number = 'number'
    _bc_number.'setfenv'(_lua__GLOBAL)
    set $P1, 'number'
    _bc[$P1] = _bc_number

    .const .Sub _bc_pow = 'pow'
    _bc_pow.'setfenv'(_lua__GLOBAL)
    set $P1, 'pow'
    _bc[$P1] = _bc_pow
    set $P1, '__pow'
    _bc[$P1] = _bc_pow

    .const .Sub _bc_sqrt = 'sqrt'
    _bc_sqrt.'setfenv'(_lua__GLOBAL)
    set $P1, 'sqrt'
    _bc[$P1] = _bc_sqrt

    .const .Sub _bc_sub = 'sub'
    _bc_sub.'setfenv'(_lua__GLOBAL)
    set $P1, 'sub'
    _bc[$P1] = _bc_sub
    set $P1, '__sub'
    _bc[$P1] = _bc_sub

    .const .Sub _bc_tostring = 'tostring'
    _bc_tostring.'setfenv'(_lua__GLOBAL)
    set $P1, 'tostring'
    _bc[$P1] = _bc_tostring
    set $P1, '__tostring'
    _bc[$P1] = _bc_tostring

    new $P2, 'LuaString'

#    set $P2, "Copyright (C) 2008, The Perl Foundation"
#    set $P1, "_COPYRIGHT"
#    _bc[$P1] = $P2

    set $P2, "bc library for Lua on Parrot"
#    set $P1, "_DESCRIPTION"
    set $P1, "version"
    _bc[$P1] = $P2

#    set $P2, "bc ???"
#    set $P1, "_VERSION"
#    _bc[$P1] = $P2

    new $P0, 'LuaNumber'
    set $P0, 0
    set_hll_global ['Lua::bc'], 'DIGITS', $P0

    .return (_bc)
.end


.sub 'get' :anon
    .param int narg
    .param pmc x :optional
    if null x goto L1
    $I0 = isa x, 'LuaNumber'
    if $I0 goto L2
    $I0 = isa x, 'LuaString'
    if $I0 goto L2
    goto L1
  L2:
    $S0 = x.'tostring'()
    new $P0, MYPMC
    set $P0, $S0
    .return ($P0)
  L1:
    $P1 = lua_checkudata(narg, x, MYTYPE)
    .return ($P1)
.end


.macro do1(op, a, b)
    $P1 = get(1, .a)
    $P2 = get(2, .b)
    new $P0, MYPMC
    $P0 = .op $P1, $P2
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    .local pmc res
    res = lua_newuserdata($P0, mt)
    .return (res)
.endm

.macro do2(op, a, b)
    $P1 = get(1, .a)
    $P2 = get(2, .b)
    new $P0, MYPMC
    push_eh _handler
    $P0 = .op $P1, $P2
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    .local pmc res
    res = lua_newuserdata($P0, mt)
    .return (res)
  _handler:
    .get_results ($P0, $S0)
    new res, 'LuaNil'
    .return (res)
.endm

.macro do3(op, a, b)
    $P1 = get(1, .a)
    $P2 = get(2, .b)
    $I0 = .op $P1, $P2
    .local pmc res
    new res, 'LuaBoolean'
    set res, $I0
    .return (res)
.endm


=item C<bc.digits ([n])>

=cut

.sub 'digits' :anon
    .param pmc n :optional
    .param pmc extra :slurpy
    .local pmc res
    .local int DIGITS
    $P0 = get_hll_global ['Lua::bc'], 'DIGITS'
    res = clone $P0
    DIGITS = $P0
    $I1 = lua_optint(1, n, DIGITS)
    set $P0, $I1
    .return (res)
.end


=item C<bc.tostring (x)>

=cut

.sub 'tostring' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    $P1 = get(1, x)
    $S0 = $P1
    .local pmc res
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<bc.iszero (x)>

=cut

.sub 'iszero' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    $P1 = get(1, x)
    $I0 = isfalse $P1
    .local pmc res
    new res, 'LuaBoolean'
    set res, $I0
    .return (res)
.end


=item C<bc.isneg (x)>

=cut

.sub 'isneg' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    $P1 = get(1, x)
    .local pmc zero
    new zero, MYPMC
    set zero, 0
    $I0 = islt $P1, zero
    .local pmc res
    new res, 'LuaBoolean'
    set res, $I0
    .return (res)
.end


=item C<bc.number (x)>

=cut

.sub 'number' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res, mt
    $P1 = get(1, x)
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P1, mt)
    .return (res)
.end


=item C<bc.compare (x, y)>

=cut

.sub 'compare' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    $P1 = get(1, x)
    $P2 = get(2, y)
    $I0 = cmp $P1, $P2
    .local pmc res
    new res, 'LuaNumber'
    set res, $I0
    .return (res)
.end


=item C<bc.__eq (x, y)>

=cut

.sub '__eq' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do3(iseq, x, y)
.end


=item C<bc.__lt (x, y)>

=cut

.sub '__lt' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do3(islt, x, y)
.end


=item C<bc.add (x, y)>

=cut

.sub 'add' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do1(add, x, y)
.end


=item C<bc.sub (x, y)>

=cut

.sub 'sub' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do1(sub, x, y)
.end


=item C<bc.mul (x, y)>

=cut

.sub 'mul' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do1(mul, x, y)
.end


=item C<bc.pow (x, y)>

=cut

.sub 'pow' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do1(pow, x, y)
.end


=item C<bc.div (x, y)>

=cut

.sub 'div' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do2(div, x, y)
.end


=item C<bc.mod (x, y)>

=cut

.sub 'mod' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc extra :slurpy
    .do2(mod, x, y)
.end


=item C<bc.sqrt (x)>

=cut

.sub 'sqrt' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res, mt
    $P1 = get(1, x)
    new $P0, MYPMC
    push_eh _handler
    $P0 = $P1.'sqrt'()
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P0, mt)
    .return (res)
  _handler:
    .get_results ($P0, $S0)
    new res, 'LuaNil'
    .return (res)
.end


=item C<bc.__unm (x)>

=cut

.sub '__unm' :anon
    .param pmc x :optional
    .param pmc extra :slurpy
    .local pmc res, mt
    $P1 = get(1, x)
    new $P0, MYPMC
    $P0 = neg $P1
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P0, mt)
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
