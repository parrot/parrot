# Copyright (C) 2008, The Perl Foundation.
# $Id: $

=head1 NAME

lib/glut.pir - GLUT library

=head1 DESCRIPTION

This file implements the GLUT binding for Lua.

See original on L<http://luagl.wikidot.com/>

=over 4

=cut

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua::glut'; 'Lua' ]

.sub '__onload' :anon :load
#    print "__onload glut\n"
    .const .Sub entry = 'luaopen_glut'
    set_hll_global 'luaopen_glut', entry
.end

.sub 'luaopen_glut'

#    print "luaopen_glut\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _glut
    new _glut, 'LuaTable'
    set $P1, 'glut'
    _lua__GLOBAL[$P1] = _glut

    lua_register($P1, _glut)

    .const .Sub _glut_CreateWindow= 'CreateWindow'
    _glut_CreateWindow.'setfenv'(_lua__GLOBAL)
    set $P1, 'CreateWindow'
    _glut[$P1] = _glut_CreateWindow

    .const .Sub _glut_DisplayFunc= 'DisplayFunc'
    _glut_DisplayFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'DisplayFunc'
    _glut[$P1] = _glut_DisplayFunc

    .const .Sub _glut_IdleFunc= 'IdleFunc'
    _glut_IdleFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'IdleFunc'
    _glut[$P1] = _glut_IdleFunc

    .const .Sub _glut_Init= 'Init'
    _glut_Init.'setfenv'(_lua__GLOBAL)
    set $P1, 'Init'
    _glut[$P1] = _glut_Init

    .const .Sub _glut_InitDisplayMode= 'InitDisplayMode'
    _glut_InitDisplayMode.'setfenv'(_lua__GLOBAL)
    set $P1, 'InitDisplayMode'
    _glut[$P1] = _glut_InitDisplayMode

    .const .Sub _glut_InitWindowSize= 'InitWindowSize'
    _glut_InitWindowSize.'setfenv'(_lua__GLOBAL)
    set $P1, 'InitWindowSize'
    _glut[$P1] = _glut_InitWindowSize

    .const .Sub _glut_KeyboardFunc= 'KeyboardFunc'
    _glut_KeyboardFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'KeyboardFunc'
    _glut[$P1] = _glut_KeyboardFunc

    .const .Sub _glut_MainLoop= 'MainLoop'
    _glut_MainLoop.'setfenv'(_lua__GLOBAL)
    set $P1, 'MainLoop'
    _glut[$P1] = _glut_MainLoop

    .const .Sub _glut_PostRedisplay= 'PostRedisplay'
    _glut_PostRedisplay.'setfenv'(_lua__GLOBAL)
    set $P1, 'PostRedisplay'
    _glut[$P1] = _glut_PostRedisplay

    .const .Sub _glut_ReshapeFunc= 'ReshapeFunc'
    _glut_ReshapeFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'ReshapeFunc'
    _glut[$P1] = _glut_ReshapeFunc

    .const .Sub _glut_SwapBuffers= 'SwapBuffers'
    _glut_SwapBuffers.'setfenv'(_lua__GLOBAL)
    set $P1, 'SwapBuffers'
    _glut[$P1] = _glut_SwapBuffers

    .return (_glut)
.end


=item C<glut.CreateWindow ()>

=cut

.sub 'CreateWindow' :anon
    .param pmc extra :slurpy
.end


=item C<glut.DisplayFunc ()>

=cut

.sub 'DisplayFunc' :anon
    .param pmc extra :slurpy
.end


=item C<glut.IdleFunc ()>

=cut

.sub 'IdleFunc' :anon
    .param pmc extra :slurpy
.end


=item C<glut.Init ()>

=cut

.sub 'Init' :anon
    .param pmc extra :slurpy
.end


=item C<glut.InitDisplayMode ()>

=cut

.sub 'InitDisplayMode' :anon
    .param pmc extra :slurpy
.end


=item C<glut.InitWindowSize ()>

=cut

.sub 'InitWindowSize' :anon
    .param pmc extra :slurpy
.end


=item C<glut.KeyboardFunc ()>

=cut

.sub 'KeyboardFunc' :anon
    .param pmc extra :slurpy
.end


=item C<glut.MainLoop ()>

=cut

.sub 'MainLoop' :anon
    .param pmc extra :slurpy
.end


=item C<glut.PostRedisplay ()>

=cut

.sub 'PostRedisplay' :anon
    .param pmc extra :slurpy
.end


=item C<glut.ReshapeFunc ()>

=cut

.sub 'ReshapeFunc' :anon
    .param pmc extra :slurpy
.end


=item C<glut.SwapBuffers ()>

=cut

.sub 'SwapBuffers' :anon
    .param pmc extra :slurpy
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
