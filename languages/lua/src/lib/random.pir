# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/random.pir - random library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lrandom/>

This implementation is based on the Mersenne Twisted random generator,
see F<runtime/parrot/library/Math/Random/mt19937ar.pir>.

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua::random'; 'Lua' ]

.sub '__onload' :anon :load
#    print "__onload random\n"
    .const .Sub entry = 'luaopen_random'
    set_hll_global 'luaopen_random', entry
.end

.const string MYTYPE = 'random handle'

.sub 'luaopen_random'

#    print "luaopen_random\n"
    load_bytecode 'Math/Random/mt19937ar.pbc'

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _random
    _random = lua_newmetatable(MYTYPE)

    new $P1, 'LuaString'
    set $P1, '__index'
    _random[$P1] = _random

    set $P1, 'random'
    _lua__GLOBAL[$P1] = _random
    lua_register($P1, _random)

    .const .Sub _random_clone = 'clone'
    _random_clone.'setfenv'(_lua__GLOBAL)
    set $P1, 'clone'
    _random[$P1] = _random_clone

    .const .Sub _random_new = 'new'
    _random_new.'setfenv'(_lua__GLOBAL)
    set $P1, 'new'
    _random[$P1] = _random_new

    .const .Sub _random_seed = 'seed'
    _random_seed.'setfenv'(_lua__GLOBAL)
    set $P1, 'seed'
    _random[$P1] = _random_seed

    .const .Sub _random_tostring = 'tostring'
    _random_tostring.'setfenv'(_lua__GLOBAL)
    set $P1, 'tostring'
    _random[$P1] = _random_tostring
    set $P1, '__tostring'
    _random[$P1] = _random_tostring

    .const .Sub _random_value = 'value'
    _random_value.'setfenv'(_lua__GLOBAL)
    set $P1, 'value'
    _random[$P1] = _random_value

    .const .Sub _random_valuei = 'valuei'
    _random_valuei.'setfenv'(_lua__GLOBAL)
    set $P1, 'valuei'
    _random[$P1] = _random_valuei

    .const .Sub _random_valuex = 'valuex'
    _random_valuex.'setfenv'(_lua__GLOBAL)
    set $P1, 'valuex'
    _random[$P1] = _random_valuex

    new $P2, 'LuaString'

#    set $P2, "Copyright (C) 2008, The Perl Foundation"
#    set $P1, "_COPYRIGHT"
#    _random[$P1] = $P2

    set $P2, "random library for Lua on Parrot"
#    set $P1, "_DESCRIPTION"
    set $P1, "version"
    _random[$P1] = $P2

#    set $P2, "random ???"
#    set $P1, "_VERSION"
#    _random[$P1] = $P2

    .return (_random)
.end

.const int SEED = 2007

=item C<random.clone (c)>

=cut

.sub 'clone' :anon
    .param pmc c :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    $P0 = clone $P1
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P0, mt)
    .return (res)
.end


=item C<random.new ([seed])>

=cut

.sub 'new' :anon
    .param pmc seed :optional
    .param pmc extra :slurpy
    .local pmc res
    $I1 = lua_optint(1, seed, SEED)
    $P0 = new [ 'Math'; 'Random'; 'MT' ]
    $P0.'init_genrand'($I1)
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P0, mt)
    .return (res)
.end


=item C<random.seed (c, [seed])>

=cut

.sub 'seed' :anon
    .param pmc c :optional
    .param pmc seed :optional
    .param pmc extra :slurpy
    $P1 = lua_checkudata(1, c, MYTYPE)
    $I2 = lua_optint(2, seed, SEED)
    $P1.'init_genrand'($I2)
.end


=item C<random.tostring (c)>

=cut

.sub 'tostring' :anon
    .param pmc c :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    $I1 = get_addr $P1
    new $P0, 'FixedPMCArray'
    set $P0, 2
    $P0[0] = MYTYPE
    $P0[1] = $I1
    $S0 = sprintf '%s %08p', $P0
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<random.value (c)>

=cut

.sub 'value' :anon
    .param pmc c :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    $N0 = $P1.'genrand_real1'()
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
.end


=item C<random.valuei (c, a, [b])>

=cut

.sub 'valuei' :anon
    .param pmc c :optional
    .param pmc a :optional
    .param pmc b :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    unless null b goto L1
    $I1 = 1
    $I2 = lua_checknumber(1, a)
    goto L2
  L1:
    $I1 = lua_checknumber(1, a)
    $I2 = lua_checknumber(2, b)
  L2:
    $N0 = $P1.'genrand_real2'()
    $I0 = $I2 - $I1
    inc $I0
    $N0 *= $I0
    $N0 += $I1
    $I0 = floor $N0
    new res, 'LuaNumber'
    set res, $I0
    .return (res)
.end


=item C<random.valuex (c)>

=cut

.sub 'valuex' :anon
    .param pmc c :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    $N0 = $P1.'genrand_res53'()
    new res, 'LuaNumber'
    set res, $N0
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
