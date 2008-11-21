# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/md5.pir - md5 library

=head1 DESCRIPTION

See original on L<http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#lmd5/>

This implementation is based on a wrapper over libcrypto (a part of libssl),
see F<src/dynpmc/mdx.pmc>.

=head2 Functions

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'md5' ]

.sub '__onload' :anon :load
#    print "__onload md5\n"
    .const 'Sub' entry = 'luaopen_md5'
    set_hll_global 'luaopen_md5', entry
.end

.const string MYNAME = 'md5'
.const string MYTYPE = 'md5 context'
.const string MYPMC = 'MD5'

.sub 'luaopen_md5'

#    print "luaopen_md5\n"
    $P0 = loadlib 'digest_group'

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _md5
    _md5 = lua_newmetatable(MYTYPE)

    new $P1, 'LuaString'
    set $P1, '__index'
    _md5[$P1] = _md5

    set $P1, MYNAME
    _lua__GLOBAL[$P1] = _md5

    $P2 = split "\n", <<'LIST'
clone
digest
new
reset
tostring
update
LIST
    lua_register($P1, _md5, $P2)

    set $P1, 'tostring'
    $P0 = _md5[$P1]
    set $P1, '__tostring'
    _md5[$P1] = $P0

    new $P2, 'LuaString'

#    set $P2, "Copyright (C) 2008, The Perl Foundation"
#    set $P1, "_COPYRIGHT"
#    _md5[$P1] = $P2

    set $P2, "md5 library for Lua on Parrot"
#    set $P1, "_DESCRIPTION"
    set $P1, "version"
    _md5[$P1] = $P2

#    set $P2, "md5 ???"
#    set $P1, "_VERSION"
#    _md5[$P1] = $P2

    .return (_md5)
.end


=item C<md5.clone (c)>

=cut

.sub 'clone'
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


=item C<md5.digest (c or s, [raw])>

=cut

.sub 'digest'
    .param pmc c :optional
    .param pmc raw :optional
    .param pmc extra :slurpy
    .local pmc md
    .local pmc res
    $I0 = isa c, 'LuaUserdata'
    unless $I0 goto L1
    md = lua_checkudata(1, c, MYTYPE)
    $S0 = md.'Final'()
    goto L2
  L1:
    $S1 = lua_checkstring(1, c)
    new md, MYPMC
    md.'Init'()
    md.'Update'($S1)
    $S0 = md.'Final'()
  L2:
    new res, 'LuaString'
    if null raw goto L3
    $I0 = istrue raw
    if $I0 goto L5
  L3:
    new $P1, 'FixedPMCArray'
    set $P1, 1
    $P0 = split '', $S0
    $S0 = ''
  L4:
    unless $P0 goto L5
    $S1 = shift $P0
    $I1 = ord $S1
    $P1[0] = $I1
    $S1 = sprintf '%2x', $P1
    $S0 .= $S1
    goto L4
  L5:
    set res, $S0
    .return (res)
.end


=item C<md5.new ()>

=cut

.sub 'new'
    .param pmc extra :slurpy
    .local pmc res
    new $P0, MYPMC
    $P0.'Init'()
    .local pmc mt
    mt = lua_getmetatable(MYTYPE)
    res = lua_newuserdata($P0, mt)
    .return (res)
.end


=item C<md5.reset (c)>

=cut

.sub 'reset'
    .param pmc c :optional
    .param pmc extra :slurpy
    .local pmc res
    $P1 = lua_checkudata(1, c, MYTYPE)
    $P1.'Init'()
    .return ()
.end


=item C<md5.tostring (c)>

=cut

.sub 'tostring'
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


=item C<md5.update (c, s)>

=cut

.sub 'update'
    .param pmc c :optional
    .param pmc s :optional
    .param pmc extra :slurpy
    $P1 = lua_checkudata(1, c, MYTYPE)
    $S2 = lua_checkstring(2, s)
    $P1.'Update'($S2)
    .return ()
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
