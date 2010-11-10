# Copyright (C) 2008-2009, Parrot Foundation.

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


.loadlib 'math_ops'
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
    window  = init_glut(argv, mode, 'Shapes: OpenGL 1.x NCI Test')
    set_global 'glut_window', window

    # Init miscellaneous globals
    init_globals()

    # Create particle effect
    init_particle_effect()

    # Set up GLUT callbacks
    .const 'Sub' draw       = 'draw'
    .const 'Sub' idle       = 'idle'
    .const 'Sub' reshape    = 'reshape'
    .const 'Sub' keyboard   = 'keyboard'
    .const 'Sub' visibility = 'visibility'
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

    # Load OpenGL library and a helper library for calling glutInit
    load_bytecode 'OpenGL.pbc'
    load_bytecode 'NCI/Utils.pbc'

    # Import all OpenGL/GLU/GLUT functions
    .local pmc import_gl
    import_gl = get_global ['OpenGL'], '_export_all_functions'
    import_gl()

    # Set larger default window size
    glutInitWindowSize(500, 500)

    # Initialize GLUT, overwriting argv in place
    .local pmc call_toolkit_init
    call_toolkit_init = get_global ['NCI';'Utils'], 'call_toolkit_init'

    .const 'Sub' glutInit = 'glutInit'
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
    .local pmc time_prev, time_curr, time_sim, time_sim_dt
    .local num now
    now         = time
    time_prev   = new 'Float'
    time_prev   = now
    time_curr   = new 'Float'
    time_curr   = now
    time_sim    = new 'Float'
    time_sim    = 0
    time_sim_dt = new 'Float'
    time_sim_dt = 0
    set_global 'time_prev',   time_prev
    set_global 'time_curr',   time_curr
    set_global 'time_sim',    time_sim
    set_global 'time_sim_dt', time_sim_dt

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

.sub init_particle_effect
    .local pmc pfx_pos, pfx_vel
    pfx_pos = new 'ResizablePMCArray'
    pfx_vel = new 'ResizablePMCArray'

    new_particle(0, pfx_pos, pfx_vel)

    set_global 'pfx_pos', pfx_pos
    set_global 'pfx_vel', pfx_vel
.end

.sub draw
    .local int buffers
    buffers  = .GL_COLOR_BUFFER_BIT | .GL_DEPTH_BUFFER_BIT
    buffers |= .GL_STENCIL_BUFFER_BIT
    glClear(buffers)

    set_3d_view()

    .local pmc time_sim_dt
    .local num dt
    time_sim_dt = get_global 'time_sim_dt'
    dt          = time_sim_dt
    update_particle_effect(dt)

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

    # Look at origin from (0,2,4), with +Y up
    glMatrixMode(.GL_MODELVIEW)
    glLoadIdentity()
    gluLookAt(0, 2, 4, 0, 0, 0, 0, 1, 0)

    # Rotate view around origin, to see objects from all angles
    .local pmc time_sim
    .local num angle
    time_sim  = get_global 'time_sim'
    angle     = time_sim
    angle    *= -24
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
    .local pmc time_sim
    .local num time
    time_sim = get_global 'time_sim'
    time     = time_sim

    draw_rgb_triangle   (time)
    draw_lit_teapot     ()
    draw_particle_effect()
.end

.sub draw_rgb_triangle
    .param num time

    # Unlit spinning RGB triangle at -Z

    .local num angle
    angle     = time
    angle    *= 45
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
    glTranslatef(1.5, .4, 0)
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

.sub new_particle
    .param int particle_num
    .param pmc pfx_pos
    .param pmc pfx_vel

    .local num x, y, z, vx, vy, vz
    x  = 4.0
    y  = 0.0
    z  = 0.0

    vx = 0.0
    vy = 0.135
    vz = 0.0

    .local num random
    random  = rand 0, 0.1
    x      += random
    random  = rand 0, 0.1
    y      += random
    random  = rand 0, 0.1
    z      += random

    random  = rand
    random -= .5
    random *= .01
    vx     += random
    random  = rand
    random -= .5
    random *= .01
    vy     += random
    random  = rand
    random -= .5
    random *= .01
    vz     += random

    .local pmc pos
    pos = new 'FixedFloatArray'
    pos = 3
    pos[0] = x
    pos[1] = y
    pos[2] = z

    .local pmc vel
    vel = new 'FixedFloatArray'
    vel = 3
    vel[0] = vx
    vel[1] = vy
    vel[2] = vz

    pfx_pos[particle_num] = pos
    pfx_vel[particle_num] = vel
.end

.sub update_particle_effect
    .param num dt

    # "Black hole" particle effect at +Z

    # Speed up time a little; this effect is *slow*
    dt *= 30.0

    # Global particle state arrays
    .local pmc pfx_pos, pfx_vel
    pfx_pos = get_global 'pfx_pos'
    pfx_vel = get_global 'pfx_vel'

    # Add a particle at random
    .local int count
    count = pfx_pos
    if count > 1000 goto update_particles
    .local num random
    random = rand 0, 4
    if random > dt goto update_particles
    new_particle(count, pfx_pos, pfx_vel)

    # Update all particles
  update_particles:
    dec count
    if count < 0 goto update_particles_end

    # Update particle states
    update_particle(pfx_pos, pfx_vel, count, dt)

    goto update_particles
  update_particles_end:
.end

.sub update_particle
    .param pmc pfx_pos
    .param pmc pfx_vel
    .param int particle_num
    .param num dt

    .local pmc pos, vel
    pos = pfx_pos[particle_num]
    vel = pfx_vel[particle_num]

    # Constants
    .const num G           = -.075   # Gravitational force constant
    .const num Cd          = -.00033 # Coefficient of drag
    .const num event_grav  = -.3     # Gravity at "event horizon"
    .const num min_dist2   =  .001   # Minimum distance**2 before calc blows up
    .const num escape_dist = 30      # Distance at which "escape" occurs

    # Particle states
    .local num x, y, z, vx, vy, vz
    x  = pos[0]
    y  = pos[1]
    z  = pos[2]
    vx = vel[0]
    vy = vel[1]
    vz = vel[2]

    # Calculate distance and distance squared
    .local num x2, y2, z2, dist2, dist
    x2     = x * x
    y2     = y * y
    z2     = z * z
    dist2  = x2 + y2
    dist2 += z2
    if dist2 >= min_dist2 goto dist2_ok
    dist2  = min_dist2
  dist2_ok:
    dist   = sqrt dist2

    # If distance is too great, particle has "escaped"; regenerate it
    if dist < escape_dist goto dist_ok
    new_particle(particle_num, pfx_pos, pfx_vel)
    .return ()
  dist_ok:

    # Compute gravity force
    .local num grav
    grav = G / dist2

    # If gravity is too strong, it has "passed the event horizon"; regenerate it
    if grav > event_grav goto grav_ok
    new_particle(particle_num, pfx_pos, pfx_vel)
    .return ()
  grav_ok:

    # Calculate gravity vector (always directed toward center of "hole")
    .local num gx, gy, gz
    gx  = x / dist
    gy  = y / dist
    gz  = z / dist
    gx *= grav
    gy *= grav
    gz *= grav

    # Calculate drag vector (always directed opposite of velocity)
    # NOTE: Using drag proportional to velocity, instead of velocity squared
    .local num dragx, dragy, dragz
    dragx = Cd * vx
    dragy = Cd * vy
    dragz = Cd * vz

    # Acceleration is gravity + drag
    .local num ax, ay, az
    ax = gx + dragx
    ay = gy + dragy
    az = gz + dragz

    # Update velocity and position with simple Euler integration
    .local num dvx, dvy, dvz
    .local num  dx,  dy,  dz
    dvx  = ax * dt
    dvy  = ay * dt
    dvz  = az * dt
    vx  += dvx
    vy  += dvy
    vz  += dvz
    dx   = vx * dt
    dy   = vy * dt
    dz   = vz * dt
    x   += dx
    y   += dy
    z   += dz

    # Save new values back to particle state
    vel[0] = vx
    vel[1] = vy
    vel[2] = vz
    pos[0] = x
    pos[1] = y
    pos[2] = z
.end

.sub draw_particle_effect
    # "Black hole" particle effect at +Z

    # Make it visually interesting
    glPushMatrix()
    glTranslatef(0, .3, 1.5)
    glRotatef(-20, 0, 0, 1)
    glRotatef( 90, 1, 0, 0)
    glScalef(.15, .15, .15)

    # OpenGL state for "glowing transparent particles"
    glEnable(.GL_BLEND)
    glBlendFunc(.GL_SRC_ALPHA, .GL_ONE)
    glDepthMask(.GL_FALSE)
    glPointSize(4)

    # XXXX: Disabled for now because it's broken on many systems;
    #       will replace later with textured quads
    # glEnable(.GL_POINT_SMOOTH)

#     # Show plane of effect
#     glColor4f(1, 1, 1, .2)
#     glBegin(.GL_QUADS)
#     glVertex3f(-2, -2, 0)
#     glVertex3f( 2, -2, 0)
#     glVertex3f( 2,  2, 0)
#     glVertex3f(-2,  2, 0)
#     glEnd()

    # Start drawing particles
    glColor4f(1, 1, 1, .5)
    glBegin(.GL_POINTS)

    # Global particle state arrays
    .local pmc pfx_pos, pfx_vel
    pfx_pos = get_global 'pfx_pos'
    pfx_vel = get_global 'pfx_vel'

    # Loop over all particles, updating and drawing them
    .local int count
    count = pfx_pos
  draw_particle_loop:
    dec count
    if count < 0 goto draw_particle_loop_end

    # Draw particle
    .local pmc pos
    .local num x, y, z
    pos = pfx_pos[count]
    x   = pos[0]
    y   = pos[1]
    z   = pos[2]
    glVertex3f(x, y, z)

    goto draw_particle_loop

    # Finished with all particles
  draw_particle_loop_end:
    glEnd()

    # Done, return to normal OpenGL state
    glDepthMask(.GL_TRUE)
    glDisable(.GL_BLEND)

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
    dt     = 0
  update_time_sim:
    .local pmc time_sim, time_sim_dt
    time_sim     = get_global 'time_sim'
    time_sim_dt  = get_global 'time_sim_dt'
    time_sim_dt  = dt
    time_sim    += dt

    # Request redraw if sim time updated
    unless paused goto post_redisplay
    .return ()
  post_redisplay:
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
    .const 'Sub' idle = 'idle'
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
