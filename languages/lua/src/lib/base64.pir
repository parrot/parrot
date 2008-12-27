# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/base64.pir - base64 library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lbase64/>

This implementation is based on F<runtime/parrot/library/MIME/Base64.pir>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'base64' ]

.sub '__onload' :anon :load
#    print "__onload base64\n"
    .const 'Sub' entry = 'luaopen_base64'
    set_hll_global 'luaopen_base64', entry
.end

.const string MYNAME = 'base64'

.sub 'luaopen_base64'

#    print "luaopen_base64\n"
    load_bytecode 'MIME/Base64.pir'

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _base64
    new _base64, 'LuaTable'
    set $P1, MYNAME
    _lua__GLOBAL[$P1] = _base64

    $P2 = split "\n", <<'LIST'
decode
encode
LIST
    lua_register($P1, _base64, $P2)

    new $P2, 'LuaString'

#    set $P2, "Copyright (C) 2008, The Perl Foundation"
#    set $P1, "_COPYRIGHT"
#    _base64[$P1] = $P2

    set $P2, "base64 library for Lua on Parrot"
#    set $P1, "_DESCRIPTION"
    set $P1, "version"
    _base64[$P1] = $P2

#    set $P2, "base64 ???"
#    set $P1, "_VERSION"
#    _base64[$P1] = $P2

    $P0 = get_hll_namespace ['MIME'; 'Base64']
    $P1 = get_namespace
    $P2 = split ' ', 'decode_base64 encode_base64'
    $P0.'export_to'($P1, $P2)

    .return (_base64)
.end


=item C<base64.decode (s)>

=cut

.sub 'decode'
    .param pmc str :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, str)
    $S0 = decode_base64($S1)
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<base64.encode (s)>

=cut

.sub 'encode'
    .param pmc str :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, str)
    $S0 = encode_base64($S1)
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
