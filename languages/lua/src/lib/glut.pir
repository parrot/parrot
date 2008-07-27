# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/glut.pir - GLUT library

=head1 DESCRIPTION

This file implements the GLUT binding for Lua.

See original on L<http://luagl.wikidot.com/>

This implementation is based on a wrapper over OpenGL,
see F<runtime/parrot/library/OpenGL.pir>.

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
    load_bytecode 'OpenGL.pir'
    load_bytecode 'NCI/call_toolkit_init.pir'

    # Import all OpenGL/GLU/GLUT functions
    $P0 = get_hll_global ['OpenGL'], '_export_all_functions'
    $P0()

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


.include 'opengl_defines.pasm'

=item C<glut.CreateWindow (title)>

=cut

.sub 'CreateWindow' :anon
    .param pmc title :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(title)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.CreateWindow'")
  L1:
    $S1 = title
    glutCreateWindow($S1)
.end


=item C<glut.DisplayFunc (funcname)>

=cut

.sub 'DisplayFunc' :anon
    .param pmc funcname :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(funcname)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.DisplayFunc'")
  L1:
    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    lua_error("Script error: cannot find ", funcname, " function.")
  L2:
    glutDisplayFunc($P0)
.end


=item C<glut.IdleFunc (funcname)>

=cut

.sub 'IdleFunc' :anon
    .param pmc funcname :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(funcname)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.IdleFunc'")
  L1:
    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    lua_error("Script error: cannot find ", funcname, " function.")
  L2:
    glutIdleFunc($P0)
.end


=item C<glut.Init ()>

=cut

.sub 'Init' :anon
    .param pmc extra :slurpy
    .local pmc argv
    new argv, 'ResizableStringArray'
    .const .Sub glutInit = 'glutInit'
    $P0 = get_hll_global ['NCI'], 'call_toolkit_init'
    $P0(glutInit, argv)
.end


=item C<glut.InitDisplayMode ()>

=cut

.sub 'InitDisplayMode' :anon
    .param pmc extra :slurpy
    $I0 = .GLUT_RGBA | .GLUT_DOUBLE
    glutInitDisplayMode($I0)
.end


=item C<glut.InitWindowSize (width, height)>

=cut

.sub 'InitWindowSize' :anon
    .param pmc width :optional
    .param pmc height :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(width)
    unless $I0 goto L1
    $I0 = lua_isnumber(height)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'glut.InitWindowSize'")
  L2:
    $I1 = width
    $I2 = height
    glutInitWindowSize($I1, $I2)
.end


=item C<glut.KeyboardFunc (funcname)>

=cut

.sub 'KeyboardFunc' :anon
    .param pmc funcname :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(funcname)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.KeyboardFunc'")
  L1:
    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    lua_error("Script error: cannot find ", funcname, " function.")
  L2:
    glutKeyboardFunc($P0)
.end


=item C<glut.MainLoop ()>

=cut

.sub 'MainLoop' :anon
    .param pmc extra :slurpy
    glutMainLoop()
.end


=item C<glut.PostRedisplay ()>

=cut

.sub 'PostRedisplay' :anon
    .param pmc extra :slurpy
    glutPostRedisplay()
.end


=item C<glut.ReshapeFunc (funcname)>

=cut

.sub 'ReshapeFunc' :anon
    .param pmc funcname :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(funcname)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.ReshapeFunc'")
  L1:
    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    lua_error("Script error: cannot find ", funcname, " function.")
  L2:
    glutFunc($P0)
.end


=item C<glut.SwapBuffers ()>

=cut

.sub 'SwapBuffers' :anon
    .param pmc extra :slurpy
    glutSwapBuffers()
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
