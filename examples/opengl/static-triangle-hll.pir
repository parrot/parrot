# Copyright (C) 2006-2009, Parrot Foundation.

=head1 TITLE

static-triangle-hll.pir - Minimal OpenGL/GLUT setup and render for NCI tests

=head1 SYNOPSIS

    $ cd parrot-home
    $ ./parrot examples/opengl/static-triangle-hll.pir

=head1 DESCRIPTION

This is a version of F<static-triangle.pir>, to examplify and test usage
from HLLs.

To quit the example, close the window using your window manager (using
the X in the corner of the window title bar, for example), since all
keyboard handling has been removed.

=cut


.include 'opengl_defines.pasm'

.HLL 'somelanguage'

.sub main :main
    .param pmc argv

    # Load OpenGL library and a helper library for calling glutInit
    load_bytecode 'OpenGL.pbc'
    load_bytecode 'NCI/Utils.pbc'

    # Import all OpenGL/GLU/GLUT functions to current namespace
    # (in this example, the HLL namespace).
    .local pmc import_gl
    import_gl = get_root_global ['parrot';'OpenGL'], '_export_all_functions'
    import_gl()

    # Initialize GLUT
    .local pmc call_toolkit_init
    call_toolkit_init = get_root_global ['parrot';'NCI'; 'Utils'], 'call_toolkit_init'

    .const 'Sub' glutInit = 'glutInit'
    argv = call_toolkit_init(glutInit, argv)

    # Set display mode, create GLUT window, save window handle
    .local int mode
    mode = .GLUT_DOUBLE | .GLUT_RGBA
    glutInitDisplayMode(mode)

    .local pmc window
    window = new 'Integer'
    window = glutCreateWindow('Static Triangle NCI Test')
    set_global 'glut_window', window

    # Set up GLUT callbacks
    .const 'Sub' draw     = 'draw'
    glutDisplayFunc (draw)

    # Enter the GLUT main loop
    glutMainLoop()
.end

.sub draw
    .local int buffers
    buffers = .GL_COLOR_BUFFER_BIT | .GL_DEPTH_BUFFER_BIT
    glClear(buffers)

    glBegin(.GL_TRIANGLES)

    glColor3d(1,0,0)
    glVertex3f(-1, -1, 0)

    glColor3d(0, 1, 0)
    glVertex3f(1, -1, 0)

    glColor3d(0, 0, 1)
    glVertex3f(0, 1, 0)

    glEnd()

    glutSwapBuffers()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
