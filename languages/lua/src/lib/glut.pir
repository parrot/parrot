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
.namespace [ 'glut' ]

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

    .const .Sub _glut_DestroyWindow= 'DestroyWindow'
    _glut_DestroyWindow.'setfenv'(_lua__GLOBAL)
    set $P1, 'DestroyWindow'
    _glut[$P1] = _glut_DestroyWindow

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
    $I0 = glutCreateWindow($S1)
    new $P0, 'LuaNumber'
    set $P0, $I0
    .return ($P0)
.end


=item C<glut.DestroyWindow (window)>

not LuaGL

=cut

.sub 'DestroyWindow' :anon
    .param pmc window :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(window)
    if $I0 goto L1
    lua_error("incorrect argument to function 'glut.DestroyWindow'")
  L1:
    $I1 = window
    glutDestroyWindow($I1)
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
    set_hll_global 'displayFunc.name', funcname
    .const .Sub display = 'display'
    glutDisplayFunc(display)
.end

.sub 'display' :anon
    .local pmc _lua__GLOBAL, funcname
    _lua__GLOBAL = get_hll_global '_G'
    funcname = get_hll_global 'displayFunc.name'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    printerr "Script error: cannot find "
    printerr funcname
    printerr " function.\n\n"
  L2:
    push_eh _handler
    $P0()
    .return ()
  _handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    printerr "Error running lua script:\n\n  "
    printerr s
    printerr " \n\n"
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
    set_hll_global 'idleFunc.name', funcname
    .const .Sub idle = 'idle'
    glutIdleFunc(idle)
.end

.sub 'idle' :anon
    .local pmc _lua__GLOBAL, funcname
    _lua__GLOBAL = get_hll_global '_G'
    funcname = get_hll_global 'idleFunc.name'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    printerr "Script error: cannot find "
    printerr funcname
    printerr " function.\n\n"
  L2:
    push_eh _handler
    $P0()
    .return ()
  _handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    printerr "Error running lua script:\n\n  "
    printerr s
    printerr " \n\n"
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
    set_hll_global 'keyboardFunc.name', funcname
    .const .Sub keyboard = 'keyboard'
    glutKeyboardFunc(keyboard)
.end

.sub 'keyboard' :anon
    .param int key
    .param int x
    .param int y
    .local pmc _lua__GLOBAL, funcname
    _lua__GLOBAL = get_hll_global '_G'
    funcname = get_hll_global 'keyboardFunc.name'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    printerr "Script error: cannot find "
    printerr funcname
    printerr " function.\n\n"
  L2:
    new $P1, 'LuaNumber'
    set $P1, key
    new $P2, 'LuaNumber'
    set $P2, x
    new $P3, 'LuaNumber'
    set $P3, y
    push_eh _handler
    $P0($P1, $P2, $P3)
    .return ()
  _handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    printerr "Error running lua script:\n\n  "
    printerr s
    printerr " \n\n"
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
    set_hll_global 'reshapeFunc.name', funcname
    .const .Sub reshape = 'reshape'
    glutReshapeFunc(reshape)
.end

.sub 'reshape' :anon
    .param int width
    .param int height
    .local pmc _lua__GLOBAL, funcname
    _lua__GLOBAL = get_hll_global '_G'
    funcname = get_hll_global 'reshapeFunc.name'
    $P0 = _lua__GLOBAL[funcname]
    $I0 = lua_isfunction($P0)
    if $I0 goto L2
    printerr "Script error: cannot find "
    printerr funcname
    printerr " function.\n\n"
  L2:
    new $P1, 'LuaNumber'
    set $P1, width
    new $P2, 'LuaNumber'
    set $P2, height
    push_eh _handler
    $P0($P1, $P2)
    .return ()
  _handler:
    .local pmc e
    .local string s
    .get_results (e, s)
    printerr "Error running lua script:\n\n  "
    printerr s
    printerr " \n\n"
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
