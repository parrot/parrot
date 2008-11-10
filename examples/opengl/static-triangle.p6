use v6;

=begin pod

=head1 TITLE

static-triangle.p6 - Minimal GL setup/render for Rakudo -> Parrot -> NCI tests

=head1 SYNOPSIS

    $ cd parrot-home
    $ make perl6
    $ cd parrot-home/runtime/parrot/library
    $ ../../../perl6 ../../../examples/opengl/static-triangle.p6

=head1 DESCRIPTION

This is a Perl 6 conversion of F<static-triangle.pir>, itself a simplified
version of F<triangle.pir> which attempts to remove everything not absolutely
necessary to get a recognizeable success.  This should make it easier to
debug problems with the Parrot NCI system and Rakudo's ability to use Parrot
NCI modules.

To quit the example, close the window using your window manager (using
the X in the corner of the window title bar, for example), since all
keyboard handling has been removed.

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

glutDisplayFunc(&draw);

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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
