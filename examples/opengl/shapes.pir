=head1 TITLE

shapes.pir - Exercise basic OpenGL 1.1/GLUT 3 APIs by drawing animated shapes

=head1 SYNOPSIS

    $ cd parrot-home
    $ ./parrot examples/opengl/shapes.pir

=head1 DESCRIPTION

This example is slightly more complex than F<triangle.pir>, and exercises more
of the OpenGL 1.1 and GLUT 3 APIs.  It is also a better behaved application,
correctly responding to reshape events, pausing on minimize, and so on.

To quit the example, press C<Q> or the C<ESCAPE> key, or close the window
using your window manager (using the X in the corner of the window title
bar, for example).  To pause or restart the animation, press any other
ASCII key.

=cut


.include 'datatypes.pasm'
.include 'opengl_defines.pasm'

.sub main :main
    .param pmc argv

    # Initialize GLUT, open main window, save window ID
    .local int mode
    .local pmc window
    mode    = .GLUT_DOUBLE | .GLUT_RGBA
    mode   |= .GLUT_DEPTH
    mode   |= .GLUT_STENCIL
    window  = new 'Integer'
    window  = init_glut(argv, mode, 'Test')
    set_global 'glut_window', window

    # Init miscellaneous globals
    init_globals()

    # Set up GLUT callbacks
    .const .Sub draw       = 'draw'
    .const .Sub idle       = 'idle'
    .const .Sub reshape    = 'reshape'
    .const .Sub keyboard   = 'keyboard'
    .const .Sub visibility = 'visibility'
    glutDisplayFunc   (draw)
    glutIdleFunc      (idle)
    glutReshapeFunc   (reshape)
    glutKeyboardFunc  (keyboard)
    glutVisibilityFunc(visibility)

    # Enter the GLUT main loop
    glutMainLoop()
.end

.sub init_glut
    .param pmc    argv
    .param int    display_mode
    .param string window_title

    # Load OpenGL libary and a helper library for calling glutInit
    load_bytecode 'library/OpenGL.pbc'
    load_bytecode 'library/NCI/call_toolkit_init.pbc'

    # Import all OpenGL/GLU/GLUT functions
    .local pmc import_gl
    import_gl = get_global ['OpenGL'], '_export_all_functions'
    import_gl()

    # Initialize GLUT, overwriting argv in place
    .local pmc call_toolkit_init
    call_toolkit_init = get_global ['NCI'], 'call_toolkit_init'

    .const .Sub glutInit = 'glutInit'
    $P0 = call_toolkit_init(glutInit, argv)
    copy argv, $P0

    # Set display mode, create GLUT window, return window handle
    glutInitDisplayMode(display_mode)

    .local int window_id
    window_id = glutCreateWindow(window_title)

    .return (argv, window_id)
.end

.sub init_globals
    # Set up global for current aspect ratio
    .local pmc aspect
    aspect = new 'Float'
    aspect = 1.0
    set_global 'aspect', aspect

    # Set up global frame count
    .local pmc frames
    frames = new 'Integer'
    frames = 0
    set_global 'frames', frames

    # Set up global flag for running/paused
    .local pmc paused
    paused = new 'Integer'
    paused = 0
    set_global 'paused', paused

    # Set up time bases to control animation
    .local pmc time_prev, time_curr, time_sim
    .local num now
    now       = time
    time_prev = new 'Float'
    time_prev = now
    time_curr = new 'Float'
    time_curr = now
    time_sim  = new 'Float'
    time_sim  = 0
    set_global 'time_prev', time_prev
    set_global 'time_curr', time_curr
    set_global 'time_sim',  time_sim

    # Create structure definition for float4 structure
    .local pmc float4
    float4 = new 'ResizablePMCArray'
    push float4, .DATATYPE_FLOAT
    push float4, 0
    push float4, 0
    push float4, .DATATYPE_FLOAT
    push float4, 0
    push float4, 0
    push float4, .DATATYPE_FLOAT
    push float4, 0
    push float4, 0
    push float4, .DATATYPE_FLOAT
    push float4, 0
    push float4, 0
    set_global 'float4', float4
.end

.sub draw
    .local int buffers
    buffers  = .GL_COLOR_BUFFER_BIT | .GL_DEPTH_BUFFER_BIT
    buffers |= .GL_STENCIL_BUFFER_BIT
    glClear(buffers)

    set_3d_view()

    draw_reflected_scene()

    draw_main_scene()

    set_2d_view()

    glutSwapBuffers()

    .local pmc frames
    frames = get_global 'frames'
    inc frames
.end

.sub set_3d_view
    # Simple 60 degree FOV perspective view
    .local pmc aspect
    aspect = get_global 'aspect'

    glMatrixMode(.GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(60, aspect, 1, 100)

    # Look at origin from (0,3,3), with +Y up
    glMatrixMode(.GL_MODELVIEW)
    glLoadIdentity()
    gluLookAt(0, 3, 3, 0, 0, 0, 0, 1, 0)

    # Rotate view around origin, to see objects from all angles
    .local pmc time_sim
    .local num angle
    time_sim  = get_global 'time_sim'
    angle     = time_sim
    angle    *= -36
    angle    %= 360

    glRotatef(angle, 0, 1, 0)
.end

.sub draw_reflected_scene
    # First, make a stencil of the floor, so that reflected scene
    # doesn't "leak out" of the reflective area

    # Turn off everything we don't need
    glDisable(.GL_DEPTH_TEST)
    glColorMask(.GL_FALSE, .GL_FALSE, .GL_FALSE, .GL_FALSE)

    # Set stencil for just the reflecting area
    glEnable(.GL_STENCIL_TEST)
    glStencilOp(.GL_REPLACE, .GL_REPLACE, .GL_REPLACE)
    glStencilFunc(.GL_ALWAYS, 1, 0xffffffff)

    # Draw the floor as the reflector
    draw_floor()

    # Now only draw where stencil is set
    glStencilOp(.GL_KEEP, .GL_KEEP, .GL_KEEP)
    glStencilFunc(.GL_EQUAL, 1, 0xffffffff)

    # Turn back on the stuff we turned off
    glEnable(.GL_DEPTH_TEST)
    glColorMask(.GL_TRUE, .GL_TRUE, .GL_TRUE, .GL_TRUE)

    # Flip reflection through the reflector
    glPushMatrix()
    glScalef(1, -1, 1)

    # Account for the reversed normals
    glEnable(.GL_NORMALIZE)
    glCullFace(.GL_FRONT)

    # Lights need to be reassigned after reflection
    set_lights()

    # Draw the reflected objects
    draw_objects()

    # Switch back to normal facing
    glDisable(.GL_NORMALIZE)
    glCullFace(.GL_BACK)
    glPopMatrix()

    # Done with stencil
    glDisable(.GL_STENCIL_TEST)
.end

.sub draw_main_scene
    #Draw floor blended over reflected scene
    glEnable(.GL_BLEND)
    glBlendFunc(.GL_SRC_ALPHA, .GL_ONE_MINUS_SRC_ALPHA)

    draw_floor()

    # Done with blending
    glDisable(.GL_BLEND)

    # Set lights for upright view
    set_lights()

    # Draw objects (now in upright orientation)
    draw_objects()
.end

.sub draw_floor
    # Partially transparent grey (so that reflection shows through)
    glColor4f(.7, .7, .7, .7)

    # Rotate quadric from +Z up to +Y up
    glPushMatrix()
    glRotatef(90, 1, 0, 0)

    # Annulus floor (shapes sit in various spots above it)
    .local pmc glu_quadric
    glu_quadric = gluNewQuadric()
    gluDisk(glu_quadric, 1, 2, 128, 1)
    gluDeleteQuadric(glu_quadric)

    glPopMatrix()
.end

.sub set_lights
    glEnable(.GL_LIGHT0)

    # Light above origin
    .local pmc float4, position
    float4   = get_global 'float4'
    position = new 'ManagedStruct', float4
    position[0] = 0.0
    position[1] = 2.0
    position[2] = 0.0
    position[3] = 1.0

    glLightfv(.GL_LIGHT0, .GL_POSITION, position)
.end

.sub draw_objects
    draw_rgb_triangle()
    draw_lit_teapot()
    draw_particle_effect()
.end

.sub draw_rgb_triangle
    # Unlit spinning RGB triangle at -Z

    .local pmc time_sim
    .local num angle
    time_sim  = get_global 'time_sim'
    angle     = time_sim
    angle    *= 90
    angle    %= 360

    glPushMatrix()
    glTranslatef(0, 0.04, -1.5)
    glRotatef(angle, 0, 1, 0)

    glBegin(.GL_TRIANGLES)

    glColor3f(1, 0, 0)
    glVertex3f(-.5, 0, 0)

    glColor3f(0, 1, 0)
    glVertex3f( .5, 0, 0)

    glColor3f(0, 0, 1)
    glVertex3f(0  , 1, 0)

    glEnd()

    glPopMatrix()
.end

.sub draw_lit_teapot
    # Lit cyan teapot at +X

    glPushMatrix()
    glTranslatef(1.5, .5, 0)
    glRotatef(90, 0, 1, 0)

    glEnable(.GL_LIGHTING)

    .local pmc float4, color
    float4 = get_global 'float4'
    color  = new 'ManagedStruct', float4
    color[0] = 0.0
    color[1] = 0.8
    color[2] = 0.8
    color[3] = 1.0
    glMaterialfv(.GL_FRONT, .GL_AMBIENT_AND_DIFFUSE, color)

    color[0] = 1.0
    color[1] = 1.0
    color[2] = 1.0
    color[3] = 1.0
    glMaterialfv(.GL_FRONT, .GL_SPECULAR,  color)
    glMaterialf (.GL_FRONT, .GL_SHININESS, 64)

    glutSolidTeapot(.5)

    glDisable(.GL_LIGHTING)

    glPopMatrix()
.end

.sub draw_particle_effect
    # Particle effect at +Z

    glPushMatrix()
    glTranslatef(0, .5, 1.5)
    glRotatef(-30, 0, 0, 1)

    glBegin(.GL_QUADS)
    glVertex3f(-.5, 0,  .5)
    glVertex3f( .5, 0,  .5)
    glVertex3f( .5, 0, -.5)
    glVertex3f(-.5, 0, -.5)
    glEnd()

    glPopMatrix()
.end

.sub set_2d_view
    glMatrixMode(.GL_PROJECTION)
    glLoadIdentity()

    glMatrixMode(.GL_MODELVIEW)
    glLoadIdentity()
.end

.sub idle
    # Update wall clock times
    .local pmc time_prev, time_curr
    .local num prev, now, dt
    time_prev  = get_global 'time_prev'
    time_curr  = get_global 'time_curr'
    prev       = time_curr
    time_prev  = prev
    now        = time
    time_curr  = now
    dt         = now - prev

    # Update simulation time, if unpaused
    .local pmc paused
    paused = get_global 'paused'
    unless paused goto update_time_sim
    .return ()

  update_time_sim:
    .local pmc time_sim
    time_sim  = get_global 'time_sim'
    time_sim += dt

    # Request redraw if sim time updated
    glutPostRedisplay()
.end

.sub reshape
    .param int width
    .param int height

    # Avoid division by 0
    if height goto height_ok
    height = 1
  height_ok:

    # Set global aspect ratio
    .local pmc aspect
    .local num ratio
    aspect = get_global 'aspect'
    ratio  = width / height
    aspect = ratio

    # Set drawing viewport
    glViewport(0, 0, width, height)
.end

.sub keyboard
    .param int key
    .param int x
    .param int y

    # For ESCAPE, 'Q', and 'q', exit program
    if key ==  27 goto quit
    if key ==  81 goto quit
    if key == 113 goto quit
    goto toggle_pause

  quit:
    # Show FPS
    .local pmc time_sim, frames
    time_sim = get_global 'time_sim'
    frames   = get_global 'frames'

    if frames goto frames_ok
    frames = 1
  frames_ok:

    .local num f, s, fps
    f   = frames
    s   = time_sim
    fps = f / s
    print 'FPS: '
    say fps

    # Destroy window and exit
    .local pmc glut_window
    glut_window = get_global 'glut_window'
    glutDestroyWindow(glut_window)
    end

    # For all other keys, just toggle pause
  toggle_pause:
    .local pmc paused
    paused = get_global 'paused'
    paused = not paused
.end

.sub visibility
    .param int state

    # XXXX: Weirdly, on Debian-testing/GNOME minimize doesn't
    #       properly trigger the callback, but hide/show does.
    # print 'Visibility change; new state: '
    # say state

    if state == .GLUT_NOT_VISIBLE goto hidden
    .const .Sub idle = 'idle'
    glutIdleFunc(idle)
    .return ()

  hidden:
    # XXXX: Idle callbacks are indeed being turned off, but
    #       this just seems to shift most user CPU to system CPU
    $P0 = null
    glutIdleFunc($P0)
.end


#
# OLD AND UNUSED
#

.sub draw_floor_old
    glColor4f(.7, .7, .7, .7)

    glBegin(.GL_QUADS)
    glVertex3f( 2, 0,  2)
    glVertex3f( 2, 0, -2)
    glVertex3f(-2, 0, -2)
    glVertex3f(-2, 0,  2)
    glEnd()
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
