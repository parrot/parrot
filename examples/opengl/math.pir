# Copyright (C) 2009, Parrot Foundation.

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

    # Create some sample data
    .local pmc vec1, vec2
    (vec1, vec2) = make_test_vectors()

    # Run a few simple tests
    sanity(vec1, vec2)
    normalize(vec1)
.end

.sub make_test_vectors
    # Test some basics
    $P0 = new 'FixedFloatArray'
    $P0 = 4
    $P0[0] = 0.5
    $P0[1] = 1.0
    $P0[2] = 2.0
    $P0[3] = 4.0

    $P1 = new 'FixedFloatArray'
    $P1 = 4
    $P1[0] = 1.0
    $P1[1] = 2.0
    $P1[2] = 3.0
    $P1[3] = 4.0

    .local pmc Vec4
    Vec4 = get_class ['OpenGL';'Math';'Vec4']

    $P2 = new Vec4
    $P2.'set_vals'($P0)

    $P3 = Vec4.'new'('vals' => $P1)

    .return ($P2, $P3)
.end

.sub sanity
    .param pmc vec1
    .param pmc vec2

    .local pmc vec3
    vec3 = vec1.'mul'(vec2)

    say "\nvec1 * vec2 => vec3"
    _dumper(vec1, 'vec1')
    _dumper(vec2, 'vec2')
    _dumper(vec3, 'vec3')

    .local pmc scaled
    scaled = vec1.'mul_num'(3)

    say "\nvector * 3 => scaled"
    _dumper(vec1,   'vector')
    _dumper(scaled, 'scaled')
.end

.sub normalize
    .param pmc vector

    .local pmc normalized
    normalized = vector.'normalize'()

    say "\nnormalize(vector) => normalized"
    _dumper(vector,     'vector')
    _dumper(normalized, 'normalized')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
