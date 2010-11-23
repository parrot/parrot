# Copyright (C) 2008-2009, Parrot Foundation.

=head1 TITLE

triangle.pir - Initialize GLUT and render a simple OpenGL animation

=head1 SYNOPSIS

    $ cd parrot-home
    $ ./parrot examples/opengl/triangle.pir

=head1 DESCRIPTION

This simple example shows how to load the OpenGL/GLU/GLUT wrapper, create
a small GLUT window and register the appropriate callbacks, and finally
display a simple OpenGL animation until the user closes the window.

To quit the example, press C<Q> or the C<ESCAPE> key, or close the window
using your window manager (using the X in the corner of the window title
bar, for example).  To pause or restart the animation, press any other
ASCII key.

For a more complex and well-behaved example, try F<shapes.pir>.

=cut

.include 'opengl_defines.pasm'

.sub main :main
    .param pmc argv

    # Load OpenGL library and a helper library for calling glutInit
    load_bytecode 'OpenGL.pbc'
    load_bytecode 'NCI/Utils.pbc'

    # Import all OpenGL/GLU/GLUT functions
    .local pmc import_gl
    import_gl = get_global ['OpenGL'], '_export_all_functions'
    import_gl()

    # Initialize GLUT
    .local pmc call_toolkit_init
    call_toolkit_init = get_global ['NCI';'Utils'], 'call_toolkit_init'

    .const 'Sub' glutInit = 'glutInit'
    argv = call_toolkit_init(glutInit, argv)

    # Set display mode, create GLUT window, save window handle
    .local int mode
    mode = .GLUT_DOUBLE | .GLUT_RGBA
    glutInitDisplayMode(mode)

    .local pmc window
    window = new 'Integer'
    window = glutCreateWindow('Rotating Triangle NCI Test')
    set_global 'glut_window', window

    # Set up GLUT callbacks
    .const 'Sub' draw     = 'draw'
    .const 'Sub' idle     = 'idle'
    .const 'Sub' keyboard = 'keyboard'
    glutDisplayFunc (draw)
    glutIdleFunc    (idle)
    glutKeyboardFunc(keyboard)

    # Set up global flag for rotating/paused
    .local pmc rotating
    rotating = new 'Integer'
    rotating = 1
    set_global 'rotating', rotating

    # Set up global time to allow constant rotation speed regardless of FPS
    .local pmc prev_time
    .local num now
    now       = time
    prev_time = new 'Float'
    prev_time = now
    set_global 'prev_time', prev_time

    # Enter the GLUT main loop
    glutMainLoop()
.end

.sub draw
    .local int buffers
    buffers = .GL_COLOR_BUFFER_BIT | .GL_DEPTH_BUFFER_BIT
    glClear(buffers)

    glBegin(.GL_TRIANGLES)

    glColor3f(1, 0, 0)
    glVertex3f(-.5, -.5, 0)

    glColor3f(0, 1, 0)
    glVertex3f( .5, -.5, 0)

    glColor3f(0, 0, 1)
    glVertex3f(0  ,  .5, 0)

    glEnd()

    glutSwapBuffers()
.end

.sub idle
    .local pmc prev_time
    .local num prev, now, dt
    prev_time  = get_global 'prev_time'
    prev       = prev_time
    now        = time
    dt         = now - prev
    dt        *= 360
    prev_time  = now

    .local pmc rotating
    rotating = get_global 'rotating'
    if rotating goto do_rotation
    .return ()

  do_rotation:
    glRotatef(dt, 0, 1, 0)
    glutPostRedisplay()
.end

.sub keyboard
    .param int key
    .param int x
    .param int y

    # For ESCAPE, 'Q', and 'q', exit program
    if key ==  27 goto quit
    if key ==  81 goto quit
    if key == 113 goto quit
    goto toggle_rotation
  quit:
    .local pmc glut_window
    glut_window = get_global 'glut_window'
    glutDestroyWindow(glut_window)
    end

    # For all other keys, just toggle rotation
  toggle_rotation:
    .local pmc rotating
    rotating = get_global 'rotating'
    rotating = not rotating
    set_global 'rotating', rotating
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
