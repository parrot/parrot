# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/markdown.pir - Markdown library

=head1 DESCRIPTION

See L<http://daringfireball.net/projects/markdown/>.

This implementation is based on F<languages/markdown/markdown.pir>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'markdown' ]

.sub '__onload' :anon :load
#    print "__onload markdown\n"
    .const 'Sub' entry = 'luaopen_markdown'
    set_hll_global 'luaopen_markdown', entry
.end

.sub 'luaopen_markdown'

#    print "luaopen_markdown\n"
    load_bytecode 'languages/markdown/markdown.pbc'

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _markdown
    new _markdown, 'LuaTable'
    set $P1, 'markdown'
    _lua__GLOBAL[$P1] = _markdown

    $P2 = split "\n", <<'LIST'
markdown
LIST
    lua_register($P1, _markdown, $P2)

    .return (_markdown)
.end


=item C<markdown.markdown (str)>

=cut

.sub 'markdown'
    .param pmc str :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, str)
    $P0 = compreg 'markdown'
    $P1 = $P0.'compile'($S1)
    $S0 = $P1()
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
