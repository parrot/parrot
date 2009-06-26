use v6;

=begin pod

=head1 TITLE

triangle.p6 - Initialize GLUT and render a simple OpenGL animation

=head1 SYNOPSIS

    $ cd rakudo-home
    $ export PERL6LIB=rakudo-home:parrot-home/runtime/parrot/library
    $ ./perl6 parrot-home/examples/opengl/triangle.p6

=head1 DESCRIPTION

This simple example shows how to load the OpenGL/GLU/GLUT wrapper, create
a small GLUT window and register the appropriate callbacks, and finally
display a simple OpenGL animation until the user closes the window.  It is
a simple translation of F<triangle.pir> to Perl 6.

To quit the example, press C<Q> or the C<ESCAPE> key, or close the window
using your window manager (using the X in the corner of the window title
bar, for example).  To pause or restart the animation, press any other
ASCII key.

For a more complex and well-behaved example, try F<shapes.p6>.

=end pod


# None of these currently work; they all create an inescapable new lexical pad
# require 'glutconst.p6';
# 'glutconst.p6'.evalfile;
# eval open('glutconst.p6').slurp;

constant GLUT_RGBA           = 0x0000;
constant GLUT_DOUBLE         = 0x0002;
constant GL_TRIANGLES        = 0x0004;
constant GL_DEPTH_BUFFER_BIT = 0x0100;
constant GL_COLOR_BUFFER_BIT = 0x4000;

use OpenGL:from<parrot>;
use NCI::Utils:from<parrot>;

our $rotating  = 1;
our $prev_time = time();
our $window; 

sub MAIN(*@ARGS is rw) {
    # Initialize GLUT
    @ARGS = call_toolkit_init(&glutInit, @ARGS, $*PROGRAM_NAME);

    # Set display mode
    glutInitDisplayMode(GLUT_DOUBLE +| GLUT_RGBA);

    # Create GLUT window
    $window = glutCreateWindow('Rotating Triangle NCI Test');

    # Set up GLUT callbacks
    glutDisplayFunc(  &draw     );
    glutIdleFunc(     &idle     );
    glutKeyboardFunc( &keyboard );

    # Enter the GLUT main loop
    glutMainLoop();

    # Rakudo bug -- glutMainLoop() never returns, but Rakudo dies without this
    return;
}

sub draw {
    glClear(GL_COLOR_BUFFER_BIT +| GL_DEPTH_BUFFER_BIT);

    glBegin(GL_TRIANGLES);
    glColor3f(1, 0, 0); glVertex3f(-.5, -.5, 0);
    glColor3f(0, 1, 0); glVertex3f( .5, -.5, 0);
    glColor3f(0, 0, 1); glVertex3f(0  ,  .5, 0);
    glEnd();

    glutSwapBuffers();
}

sub idle {
    my $now    = time();
    my $dt     = 360 * ($now - $prev_time);
    $prev_time = $now;

    if ($rotating) {
	glRotatef($dt, 0, 1, 0);
	glutPostRedisplay();
    }
}

sub keyboard($key, $x, $y) {
    # For ESCAPE, 'Q', and 'q', exit program
    if ($key == 27 | 81 | 113) {
        glutDestroyWindow($window);
    }
    # For all other keys, just toggle rotation
    else {
	$rotating = !$rotating;
    }
}
    

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
