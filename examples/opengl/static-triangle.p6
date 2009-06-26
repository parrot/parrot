use v6;

=begin pod

=head1 TITLE

static-triangle.p6 - Minimal GL setup/render for Rakudo -> Parrot -> NCI tests

=head1 SYNOPSIS

    $ cd rakudo-home
    $ export PERL6LIB=rakudo-home:parrot-home/runtime/parrot/library
    $ ./perl6 parrot-home/examples/opengl/static-triangle.p6

=head1 DESCRIPTION

This is a Perl 6 conversion of F<static-triangle.pir>, itself a simplified
version of F<triangle.pir> which attempts to remove everything not absolutely
necessary to get a recognizeable success.  This should make it easier to
debug problems with the Parrot NCI system and Rakudo's ability to use Parrot
NCI modules.

To quit the example, close the window using your window manager (using the X
in the corner of the window title bar, for example), since all keyboard
handling has been removed.

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

sub MAIN(*@ARGS is rw) {
    # Initialize GLUT
    @ARGS = call_toolkit_init(&glutInit, @ARGS, $*PROGRAM_NAME);

    # Set display mode
    glutInitDisplayMode(GLUT_DOUBLE +| GLUT_RGBA);

    # Create GLUT window
    glutCreateWindow('Static Triangle NCI Test');

    # Set up GLUT callbacks
    glutDisplayFunc(&draw);

    # Enter the GLUT main loop
    glutMainLoop();

    # Rakudo bug -- glutMainLoop() never returns, but Rakudo dies without this
    return;
}

sub draw {
    glClear(GL_COLOR_BUFFER_BIT +| GL_DEPTH_BUFFER_BIT);

    glBegin(GL_TRIANGLES);
    glColor3f(1, 0, 0); glVertex3f(-1, -1, 0);
    glColor3f(0, 1, 0); glVertex3f( 1, -1, 0);
    glColor3f(0, 0, 1); glVertex3f( 0,  1, 0);
    glEnd();

    glutSwapBuffers();
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
