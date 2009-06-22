# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 TITLE

math.pir - Demo OpenGL::Math module

=head1 SYNOPSIS

    $ cd parrot-home
    $ ./parrot examples/opengl/math.pir

=head1 DESCRIPTION

NOTE: THIS IS JUST A STUB WHILE OpenGL::Math IS BEING DEVELOPED.  IT WILL BE
      FILLED OUT LATER.

This is a simple demo of functionality available from the C<OpenGL::Math>
Parrot module.

=cut

.sub main :main
    # Load OpenGL::Math and data dumping debug module
    load_bytecode 'OpenGL/Math.pbc'
    load_bytecode 'dumper.pbc'

    # Test some basics
    $P1 = new 'FixedFloatArray'
    $P1 = 4
    $P1[0] = 0.5
    $P1[1] = 1.0
    $P1[2] = 2.0
    $P1[3] = 4.0

    $P2 = new 'FixedFloatArray'
    $P2 = 4
    $P2[0] = 1.0
    $P2[1] = 2.0
    $P2[2] = 3.0
    $P2[3] = 4.0

    .local pmc Vec4
    Vec4 = get_class ['OpenGL';'Math';'Vec4']

    $P3 = new Vec4
    $P3.'set_vals'($P1)

    $P4 = new Vec4
    $P4.'set_vals'($P2)

    $P5 = $P3.'mult'($P4)

    _dumper($P3, 'Vec4')
    _dumper($P4, 'Vec4')
    _dumper($P5, 'Vec4')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
