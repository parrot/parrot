use v6;

=begin pod

=head1 TITLE

triangle.p6 - Initialize GLUT and render a simple OpenGL animation

=head1 SYNOPSIS

    $ cd parrot-home
    $ make perl6
    $ cd parrot-home/runtime/parrot/library
    $ ../../../perl6 ../../../examples/opengl/triangle.p6

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


use OpenGL;
use NCI::call_toolkit_init;

# .include 'opengl_defines.pasm'
my $GL_COLOR_BUFFER_BIT = 0x4000;
my $GL_DEPTH_BUFFER_BIT = 0x0100;
my $GL_TRIANGLES        = 4;
my $GLUT_DOUBLE         = 2;
my $GLUT_RGBA           = 0;


OpenGL::_export_all_functions();

@*ARGS = NCI::call_toolkit_init(&glutInit, @*ARGS);

glutInitDisplayMode($GLUT_DOUBLE +| $GLUT_RGBA);

my $window = glutCreateWindow('Test');

glutDisplayFunc(  &draw     );
glutIdleFunc(     &idle     );
glutKeyboardFunc( &keyboard );

my $rotating  = 1;
my $prev_time = time();

glutMainLoop();

sub draw {
    glClear($GL_COLOR_BUFFER_BIT +| $GL_DEPTH_BUFFER_BIT);

    glBegin($GL_TRIANGLES);
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
