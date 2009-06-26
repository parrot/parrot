use v6;

=begin pod

=head1 TITLE

shapes.p6 - Exercise basic OpenGL 1.1/GLUT 3 APIs by drawing animated shapes

=head1 SYNOPSIS

    $ cd rakudo-home
    $ export PERL6LIB=rakudo-home:parrot-home/runtime/parrot/library
    $ ./perl6 parrot-home/examples/opengl/shapes.p6

=head1 DESCRIPTION

NOTE: The conversion from F<shapes.pir> is still in progress; much is not
working yet.

This example is slightly more complex than F<triangle.p6>, and exercises more
of the OpenGL 1.1 and GLUT 3 APIs.  It is also a better behaved application,
correctly responding to reshape events, pausing on minimize, and so on.  It is
a fairly direct translation of F<shapes.pir> to Perl 6.

To quit the example, press C<Q> or the C<ESCAPE> key, or close the window using
your window manager (using the X in the corner of the window title bar, for
example).  To pause or restart the animation, press any other ASCII key.

=end pod

use OpenGL:from<parrot>;
use NCI::Utils:from<parrot>;

# XXX: Need a better way to import constants
# None of these currently work; they all create an inescapable new lexical pad
# require 'glutconst.p6';
# 'glutconst.p6'.evalfile;
# eval open('glutconst.p6').slurp;

# Parrot
constant DATATYPE_FLOAT         = -84;

# GLUT
constant GLUT_RGBA              = 0x0000;
constant GLUT_DOUBLE            = 0x0002;
constant GLUT_DEPTH             = 0x0010;
constant GLUT_STENCIL           = 0x0020;

# OpenGL
constant GL_DEPTH_BUFFER_BIT    = 0x0100;
constant GL_STENCIL_BUFFER_BIT  = 0x0400;
constant GL_COLOR_BUFFER_BIT    = 0x4000;

constant GL_POINTS              = 0x0000;
constant GL_FALSE               = 0x0000;
constant GL_TRUE                = 0x0001;
constant GL_ONE                 = 0x0001;
constant GL_TRIANGLES           = 0x0004;
constant GL_EQUAL               = 0x0202;
constant GL_ALWAYS              = 0x0207;
constant GL_SRC_ALPHA           = 0x0302;
constant GL_ONE_MINUS_SRC_ALPHA = 0x0303;
constant GL_FRONT               = 0x0404;
constant GL_BACK                = 0x0405;
constant GL_LIGHTING            = 0x0B50;
constant GL_DEPTH_TEST          = 0x0B71;
constant GL_STENCIL_TEST        = 0x0B90;
constant GL_NORMALIZE           = 0x0BA1;
constant GL_BLEND               = 0x0BE2;
constant GL_SPECULAR            = 0x1202;
constant GL_POSITION            = 0x1203;
constant GL_SHININESS           = 0x1601;
constant GL_AMBIENT_AND_DIFFUSE = 0x1602;
constant GL_MODELVIEW           = 0x1700;
constant GL_PROJECTION          = 0x1701;
constant GL_KEEP                = 0x1E00;
constant GL_REPLACE             = 0x1E01;
constant GL_LIGHT0              = 0x4000;

our $glut_window;

our $aspect      = 1.0;
our $frames      = 0;
our $paused      = 0;

our $time_prev   = time();
our $time_curr   = $time_prev;
our $time_sim    = 0.0;
our $time_sim_dt = 0.0;

our (@pfx_pos, @pfx_vel);


sub MAIN(*@ARGS is rw) {
    # Initialize GLUT and create GLUT window
    $glut_window = init_glut(@ARGS, 'Shapes: OpenGL 1.x NCI Test');

    # Set up GLUT callbacks
    glutIdleFunc(     &idle     );
    glutDisplayFunc(  &draw     );
    glutReshapeFunc(  &reshape  );
    glutKeyboardFunc( &keyboard );

    # Enter the GLUT main loop
    glutMainLoop();

    # XXX: Rakudo bug -- glutMainLoop() never returns, but Rakudo dies without this
    return;
}

sub init_glut(@args is rw, $window_title) {
    # We need a full-featured GL environment
    my $display_mode = [+|] GLUT_DOUBLE, GLUT_RGBA, GLUT_DEPTH, GLUT_STENCIL;

    # Set larger default window size
    glutInitWindowSize(500, 500);

    # Initialize GLUT, fixup command line args
    @args = call_toolkit_init(&glutInit, @args, $*PROGRAM_NAME);

    # Set display mode, create GLUT window, return window handle
    glutInitDisplayMode($display_mode);

    return glutCreateWindow($window_title);
}

sub idle {
    $time_prev = $time_curr;
    $time_curr = time();

    my $dt = $paused ?? 0 !! $time_curr - $time_prev;

    $time_sim_dt  = $dt;
    $time_sim    += $dt;

    glutPostRedisplay() unless $paused;
}

sub reshape($width, $height is copy) {
    $height = $height || 1;
    $aspect = $width / $height;

    glViewport(0, 0, $width, $height);

    # XXX: Rakudo bug -- Rakudo dies without this
    return;
}

sub keyboard($key, $x, $y) {
    # For ESCAPE, 'Q', and 'q', exit program
    if ($key == 27 | 81 | 113) {
        glutDestroyWindow($glut_window);

        say "FPS: { $frames / ($time_sim || .001) }";
    }
    # For all other keys, just toggle pause
    else {
        $paused = !$paused;
    }
}

sub draw {
    glClear(GL_COLOR_BUFFER_BIT +| GL_DEPTH_BUFFER_BIT +| GL_STENCIL_BUFFER_BIT);

    set_3d_view();
    update_particle_effect();
    draw_reflected_scene();
    draw_main_scene();
    set_2d_view();

    glutSwapBuffers();
    $frames++;
}

sub set_3d_view {
    # Simple 60 degree FOV perspective view
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(60, $aspect, 1, 100);

    # Look at origin from (0,2,4), with +Y up
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(0, 2, 4, 0, 0, 0, 0, 1, 0);

    # Rotate view around origin, to see objects from all angles
    my $angle = ($time_sim * -24) % 360;
    glRotatef($angle, 0, 1, 0);
}

sub draw_reflected_scene {
    # First, make a stencil of the floor, so that reflected scene
    # doesn't "leak out" of the reflective area

    # Turn off everything we don't need
    glDisable(GL_DEPTH_TEST);
    glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE);

    # Set stencil for just the reflecting area
    glEnable(GL_STENCIL_TEST);
    glStencilOp(GL_REPLACE, GL_REPLACE, GL_REPLACE);
    # XXX: Rakudo bug - decimalized constant in PIR code does wrong thing
    # glStencilFunc(GL_ALWAYS, 1, 0xffffffff);
    glStencilFunc(GL_ALWAYS, 1, +^0);

    # Draw the floor as the reflector
    draw_floor();

    # Now only draw where stencil is set
    glStencilOp(GL_KEEP, GL_KEEP, GL_KEEP);
    # XXX: Same Rakudo bug (wrong constant)
    # glStencilFunc(GL_EQUAL, 1, 0xffffffff);
    glStencilFunc(GL_EQUAL, 1, +^0);

    # Turn back on the stuff we turned off
    glEnable(GL_DEPTH_TEST);
    glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);

    # Flip reflection through the reflector
    glPushMatrix();
    glScalef(1, -1, 1);

    # Account for the reversed normals
    glEnable(GL_NORMALIZE);
    glCullFace(GL_FRONT);

    # Lights need to be reassigned after reflection
    set_lights();

    # Draw the reflected objects
    draw_objects();

    # Switch back to normal facing
    glDisable(GL_NORMALIZE);
    glCullFace(GL_BACK);
    glPopMatrix();

    # Done with stencil
    glDisable(GL_STENCIL_TEST);
}

sub draw_main_scene {
    #Draw floor blended over reflected scene
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    draw_floor();

    # Done with blending
    glDisable(GL_BLEND);

    # Set lights for upright view
    set_lights();

    # Draw objects (now in upright orientation)
    draw_objects();
}

sub draw_floor {
    # Partially transparent grey (so that reflection shows through)
    glColor4f(.7, .7, .7, .7);

    # Rotate quadric from +Z up to +Y up
    glPushMatrix();
    glRotatef(90, 1, 0, 0);

    # Annulus floor (shapes sit in various spots above it)
    my $glu_quadric = gluNewQuadric();
    gluDisk($glu_quadric, 1, 2, 128, 1);
    gluDeleteQuadric($glu_quadric);

    glPopMatrix();
}

sub make_float4($a = 0.0, $b = 0.0, $c = 0.0, $d = 1.0) {
    my @float4_layout = (DATATYPE_FLOAT, 0, 0) xx 4;

    # XXX: How do I do this in pure Perl 6 in Rakudo?
    return Q:PIR{
        $P0 = find_lex '@float4_layout'
        $P1 = new 'ManagedStruct', $P0
        $P2 = find_lex '$a'
        $N0 = $P2
        $P1[0] = $N0
        $P2 = find_lex '$b'
        $N0 = $P2
        $P1[1] = $N0
        $P2 = find_lex '$c'
        $N0 = $P2
        $P1[2] = $N0
        $P2 = find_lex '$d'
        $N0 = $P2
        $P1[3] = $N0
        %r  = $P1
    };
}

sub set_lights {
    my $position := make_float4(0.0, 2.0, 0.0, 1.0);

    glEnable(GL_LIGHT0);
    glLightfv(GL_LIGHT0, GL_POSITION, $position);
}

sub draw_objects {
    draw_rgb_triangle();
    draw_lit_teapot();
    draw_particle_effect();
}

sub draw_rgb_triangle {
    # Unlit spinning RGB triangle at -Z

    my $angle = ($time_sim * 45) % 360;

    glPushMatrix();
    glTranslatef(0, 0.04, -1.5);
    glRotatef($angle, 0, 1, 0);

    glBegin(GL_TRIANGLES);
    glColor3f(1, 0, 0); glVertex3f(-.5, 0, 0);
    glColor3f(0, 1, 0); glVertex3f( .5, 0, 0);
    glColor3f(0, 0, 1); glVertex3f(0  , 1, 0);
    glEnd();

    glPopMatrix();
}

sub draw_lit_teapot {
    # Lit cyan teapot at +X

    glPushMatrix();
    glTranslatef(1.5, .4, 0);
    glRotatef(90, 0, 1, 0);

    glEnable(GL_LIGHTING);

    my $color := make_float4(0.0, 0.8, 0.8, 1.0);
    glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE, $color);

    $color := make_float4(1.0, 1.0, 1.0, 1.0);
    glMaterialfv(GL_FRONT, GL_SPECULAR,  $color);
    glMaterialf( GL_FRONT, GL_SHININESS, 64);

    glutSolidTeapot(.5);

    glDisable(GL_LIGHTING);

    glPopMatrix();
}

sub set_2d_view {
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

sub update_particle_effect {
    # Speed up time a little; this effect is *slow*
    my $dt = $time_sim_dt * 30;

    # Add a particle at random
    my $count = @pfx_pos.elems;
    new_particle($count) if $count < 1000 && $dt > rand * 4;

    # Update all particles
    update_particle($_, $dt) for ^$count;
}

sub new_particle($particle_num) {
    @pfx_pos[$particle_num] = [ 4.0 + rand * .1,
                                0.0 + rand * .1,
                                0.0 + rand * .1 ];
    @pfx_vel[$particle_num] = [ 0.0   + (rand - .5) * .01,
                                0.135 + (rand - .5) * .01,
                                0.0   + (rand - .5) * .01 ];

    return;
}

sub update_particle($particle_num, $dt) {
    # Constants
    constant G           = -.075;   # Gravitational force constant
    constant Cd          = -.00033; # Coefficient of drag
    constant event_grav  = -.3;     # Gravity at "event horizon"
    constant min_dist2   =  .001;   # Minimum distance**2 before calc blows up
    constant escape_dist = 30;      # Distance at which "escape" occurs

    # Particle states
    my @pos := @pfx_pos[$particle_num];
    my @vel := @pfx_vel[$particle_num];

    # Calculate distance and distance squared
    my $dist_squared = [+] @pos >>*<< @pos;
       $dist_squared = min_dist2 unless $dist_squared > min_dist2;
    my $distance     = sqrt($dist_squared);

    # If distance is too great, particle has "escaped"; regenerate it
    return new_particle($particle_num) if $distance > escape_dist;

    # Compute gravity force
    my $gravity = G / $dist_squared;

    # If gravity is too strong, it has "passed the event horizon"; regenerate it
    return new_particle($particle_num) if $gravity <= event_grav;

    # Calculate gravity vector (always directed toward center of "hole")
    my @grav = @pos >>/>> $distance >>*>> $gravity;

    # Calculate drag vector (always directed opposite of velocity)
    # NOTE: Using drag proportional to velocity, instead of velocity squared
    my @drag = @vel >>*>> Cd;

    # Acceleration is gravity + drag
    my @acc = @grav >>+<< @drag;

    # Update velocity and position with simple Euler integration
    @vel = @vel >>+<< @acc >>*>> $dt;
    @pos = @pos >>+<< @vel >>*>> $dt;
}

sub draw_particle_effect {
    # "Black hole" particle effect at +Z

    # Make it visually interesting
    glPushMatrix();
    glTranslatef(0, .3, 1.5);
    glRotatef(-20, 0, 0, 1);
    glRotatef( 90, 1, 0, 0);
    glScalef(.15, .15, .15);

    # OpenGL state for "glowing transparent particles"
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    glDepthMask(GL_FALSE);
    glPointSize(4);

    # XXX: Disabled for now because it's broken on many systems;
    #      will replace later with textured quads
    # glEnable(GL_POINT_SMOOTH);

#     # Show plane of effect
#     glColor4f(1, 1, 1, .2);
#     glBegin(GL_QUADS);
#     glVertex3f(-2, -2, 0);
#     glVertex3f( 2, -2, 0);
#     glVertex3f( 2,  2, 0);
#     glVertex3f(-2,  2, 0);
#     glEnd();

    # White color, but semi-transparent
    glColor4f(1, 1, 1, .5);

    # Draw all particles
    glBegin(GL_POINTS);
    for @pfx_pos -> $pos {
        # XXX: Rakudo bug - appears not to properly unpack for NCI calls
        # glVertex3f(|$pos);
        my ($x, $y, $z) = @($pos)[0..2];
        glVertex3f($x, $y, $z);
    }
    glEnd();

    # Done, return to normal OpenGL state
    glDepthMask(GL_TRUE);
    glDisable(GL_BLEND);

    glPopMatrix();
}


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
