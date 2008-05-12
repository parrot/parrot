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

=cut


.include 'datatypes.pasm'
.include 'opengl_defines.pasm'

.sub main :main
    .param pmc argv

    load_bytecode 'library/OpenGL.pbc'
    load_bytecode 'library/NCI/call_toolkit_init.pbc'

    .local pmc glutInit, glutInitDisplayMode, glutCreateWindow, glutMainLoop
    .local pmc glutcbDisplayFunc, glutcbIdleFunc
    .local pmc glutcbKeyboardFunc, glutcbSpecialFunc
    .local pmc call_toolkit_init
    glutInit            = get_global ['OpenGL'], 'glutInit'
    glutInitDisplayMode = get_global ['OpenGL'], 'glutInitDisplayMode'
    glutCreateWindow    = get_global ['OpenGL'], 'glutCreateWindow'
    glutMainLoop        = get_global ['OpenGL'], 'glutMainLoop'
    glutcbDisplayFunc   = get_global ['OpenGL'], 'glutcbDisplayFunc'
    glutcbIdleFunc      = get_global ['OpenGL'], 'glutcbIdleFunc'
    glutcbKeyboardFunc  = get_global ['OpenGL'], 'glutcbKeyboardFunc'
    glutcbSpecialFunc   = get_global ['OpenGL'], 'glutcbSpecialFunc'
    call_toolkit_init   = get_global ['NCI'],    'call_toolkit_init'

    argv = call_toolkit_init(glutInit, argv)

    .local int mode
    mode = .GLUT_DOUBLE | .GLUT_RGBA
    glutInitDisplayMode(mode)

    .local pmc window
    window = new Integer
    window = glutCreateWindow('Test')
    set_global 'glut_window', window

    .const .Sub draw     = 'draw'
    .const .Sub idle     = 'idle'
    .const .Sub keyboard = 'keyboard'
    glutcbDisplayFunc (draw)
    glutcbIdleFunc    (idle)
    glutcbKeyboardFunc(keyboard)

    .local pmc rotating
    rotating = new 'Integer'
    rotating = 1
    set_global 'rotating', rotating

    .local pmc prev_time
    .local num now
    now       = time
    prev_time = new 'Float'
    prev_time = now
    set_global 'prev_time', prev_time

    glutMainLoop()
.end

.sub draw
    .local pmc glClear, glFlush
    .local pmc glBegin, glEnd
    .local pmc glColor3f, glVertex3f
    glClear    = get_global ['OpenGL'], 'glClear'
    glFlush    = get_global ['OpenGL'], 'glFlush'
    glBegin    = get_global ['OpenGL'], 'glBegin'
    glEnd      = get_global ['OpenGL'], 'glEnd'
    glColor3f  = get_global ['OpenGL'], 'glColor3f'
    glVertex3f = get_global ['OpenGL'], 'glVertex3f'

    .local pmc glutSwapBuffers
    glutSwapBuffers = get_global ['OpenGL'], 'glutSwapBuffers'

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

    glFlush()

    glutSwapBuffers()
.end

.sub idle
    .local pmc glutPostRedisplay
    .local pmc glRotatef
    glutPostRedisplay = get_global ['OpenGL'], 'glutPostRedisplay'
    glRotatef         = get_global ['OpenGL'], 'glRotatef'

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
    .local pmc glutDestroyWindow, glut_window
    glutDestroyWindow = get_global ['OpenGL'], 'glutDestroyWindow'
    glut_window       = get_global             'glut_window'
    glutDestroyWindow(glut_window)
    end

    # For all other keys, just toggle rotation
  toggle_rotation:
    .local pmc rotating
    rotating  = get_global 'rotating'
    rotating  = not rotating
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
