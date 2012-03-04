# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

OpenGL;Math - Parrot extension for linear algebra following OpenGL conventions

=head1 SYNOPSIS

For more examples, look in F<examples/opengl/>, starting with
F<examples/opengl/math.pir>.

  # During init ...
  load_bytecode 'OpenGL/Math.pbc'

  # Later ...
  XXX - NEED CODE HERE

=head1 DESCRIPTION

NOTE: THIS IS A WORK IN PROGRESS, AND SHOULD NOT BE CONSIDERED USABLE YET.

Any 3D API has to pick certain conventions for handling of vectors and
matrices, such as the handedness of the default coordinate systems,
whether matrices are packed in column-major or row-major order, and
so forth.

This module implements the basic operations of linear algebra according
to the conventions chosen by OpenGL, and attempts to do so efficiently
within the bounds set by a pure PIR implementation.  It also provides
efficient packing and unpacking of matrix and vector elements so that
users need not directly understand the vagaries of OpenGL NCI structures.

Finally, it is a primary goal that users of this module should not need to
provide any hand-written versions of standard OpenGL matrix manipulations.
Thus, methods are provided to perform rotations, translations, projections,
etc.

=cut

.namespace ['OpenGL';'Math']

=head2 OpenGL;Math

The OpenGL;Math class/namespace handles the necessary housekeeping to make
everything else work smoothly.

=head3 Initialization

The initialization routines are mostly for internal use only.  They
include:

=over 4

=cut

=item _opengl_math_init()

At module load time, calls the other initialization routines in the proper
order.

=cut

.sub _opengl_math_init :tag('load')
    _create_classes()
.end

=item _create_classes()

Creates Parrot classes to match each of the OpenGL;Math namespaces, and
sets up their attributes.

=cut

.sub _create_classes
    .local pmc Vec4
    Vec4 = newclass ['OpenGL';'Math';'Vec4']
    addattribute Vec4, 'vals'
.end

=back

=cut


.namespace ['OpenGL';'Math';'Vec4']

=head2 OpenGL;Math;Vec4

=head3 Instantiation

=over 4

=item Vec4 vec4 = new Vec4

Create a new object representing a four-element vector.  You will need
to set the initial values using the C<set_vals()> method.

=item Vec4 vec4 = Vec4.'new'('vals' => vals)

Create a new object representing a four-element vector, setting the
initial values to the array PMC C<vals>.

=back


=head3 Accessors

=over 4

=item pmc vals = vector.get_vals()

Return a four element array representing the current vector value.

=cut

.sub get_vals :method
    $P0 = getattribute self, 'vals'
    .return($P0)
.end

=item vector.set_vals(pmc vals)

Set the current vector value to a four element array.

=cut
.sub set_vals :method
    .param pmc vals

    $I0 = vals
    unless $I0 == 4 goto wrong_vector_length

    setattribute self, 'vals', vals
    .return()

  wrong_vector_length:
    $S0  = 'Input vector is wrong length ('
    $S1  = $I0
    $S0 .= $S1
    $S0 .= ')'
    die $S0
.end

=back


=head3 Elementwise Operations

=cut

# Standard header for vec4-vec4 binop methods
.macro vec4_extract_self_plus_vec_arg
    .param pmc vec2

    .local pmc v1, v2
    v1 = getattribute self, 'vals'
    v2 = getattribute vec2, 'vals'

    $N10 = v1[0]
    $N11 = v1[1]
    $N12 = v1[2]
    $N13 = v1[3]

    $N20 = v2[0]
    $N21 = v2[1]
    $N22 = v2[2]
    $N23 = v2[3]
.endm

# Standard header for vec3-vec3 binop methods
.macro vec3_extract_self_plus_vec_arg
    .param pmc vec2

    .local pmc v1, v2
    v1 = getattribute self, 'vals'
    v2 = getattribute vec2, 'vals'

    $N10 = v1[0]
    $N11 = v1[1]
    $N12 = v1[2]

    $N20 = v2[0]
    $N21 = v2[1]
    $N22 = v2[2]
.endm

# Standard header for vec4-num binop methods
.macro vec4_extract_self_plus_num_arg
    .param num N

    .local pmc v1
    v1 = getattribute self, 'vals'

    $N10 = v1[0]
    $N11 = v1[1]
    $N12 = v1[2]
    $N13 = v1[3]
.endm

# Standard header for vec3-num binop methods
.macro vec3_extract_self_plus_num_arg
    .param num N

    .local pmc v1
    v1 = getattribute self, 'vals'

    $N10 = v1[0]
    $N11 = v1[1]
    $N12 = v1[2]
.endm

# Standard footer for binop methods returning a vec4
.macro vec4_return_new_result
    .local pmc v3
    v3 = new 'FixedFloatArray'
    v3 = 4

    v3[0] = $N30
    v3[1] = $N31
    v3[2] = $N32
    v3[3] = $N33

    .local pmc result
    $P0 = typeof self
    result = new $P0
    setattribute result, 'vals', v3

    .return(result)
.endm

# Standard footer for binop methods returning a vec4 = (vec3, w)
.macro vec4_return_new_result_with_w(w)
    .local pmc v3
    v3 = new 'FixedFloatArray'
    v3 = 4

    v3[0] = $N30
    v3[1] = $N31
    v3[2] = $N32
    v3[3] = .w

    .local pmc result
    $P0 = typeof self
    result = new $P0
    setattribute result, 'vals', v3

    .return(result)
.endm

# A standard elementwise vec4 binop (vec4 op vec4 --> vec4)
.macro vec4_vec4_vec4_binop(name, op)
.sub .name :method
    .vec4_extract_self_plus_vec_arg

    $N30 = $N10 .op $N20
    $N31 = $N11 .op $N21
    $N32 = $N12 .op $N22
    $N33 = $N13 .op $N23

    .vec4_return_new_result
.end
.endm


# A standard elementwise vec4-num binop (vec4 op num --> vec4)
.macro vec4_num_vec4_binop(name, op)
.sub .name :method
    .vec4_extract_self_plus_num_arg

    $N30 = $N10 .op N
    $N31 = $N11 .op N
    $N32 = $N12 .op N
    $N33 = $N13 .op N

    .vec4_return_new_result
.end
.endm


=over 4

=item Vec4 result = vec1.add(Vec4 vec2)

=item Vec4 result = vec1.sub(Vec4 vec2)

=item Vec4 result = vec1.mul(Vec4 vec2)

=item Vec4 result = vec1.div(Vec4 vec2)

=item Vec4 result = vec1.mod(Vec4 vec2)

Calculate the elementwise addition, subtraction, multiplication, division,
or modulus (C<vec1 [ + - * / % ] vec2>) and return a new C<Vec4> vector
C<result>. No attempt is made in C<div> and C<mod> to prevent division by
zero, XXX - SO WHAT HAPPENS?

=cut

.vec4_vec4_vec4_binop(add, +)

.vec4_vec4_vec4_binop(sub, -)

.vec4_vec4_vec4_binop(mul, *)

.vec4_vec4_vec4_binop(div, /)

.vec4_vec4_vec4_binop(mod, %)


=item Vec4 result = vector.add_num(num N)

=item Vec4 result = vector.sub_num(num N)

=item Vec4 result = vector.mul_num(num N)

=item Vec4 result = vector.div_num(num N)

=item Vec4 result = vector.mod_num(num N)

Calculate the elementwise addition, subtraction, multiplication, division,
or modulus (C<vector [ + - * / % ] N>) and return a new C<Vec4> vector
C<result>.  No attempt is made in C<div_num> and C<mod_num> to prevent
division by zero, XXX - SO WHAT HAPPENS?

=cut

.vec4_num_vec4_binop(add_num, +)

.vec4_num_vec4_binop(sub_num, -)

.vec4_num_vec4_binop(mul_num, *)

.vec4_num_vec4_binop(div_num, /)

.vec4_num_vec4_binop(mod_num, %)


=back


=head3 Other Operations

=over 4

=item Vec4 cp = vec1.cross(Vec4 vec2)

Calculate the cross product C<vec1 cross vec2> (using only the first three
elements of each vector), and return the result as a new C<Vec4> whose
first three elements are the cross product and whose last element is 1.0.

=cut

.sub cross :method
    .vec3_extract_self_plus_vec_arg

    $N0  = $N11 * $N22
    $N1  = $N21 * $N12
    $N30 = $N0 - $N1

    $N2  = $N20 * $N12
    $N3  = $N10 * $N22
    $N31 = $N2 - $N3

    $N4  = $N10 * $N21
    $N5  = $N20 * $N11
    $N32 = $N4 - $N5

    .vec4_return_new_result_with_w(1.0)
.end


=item num dp = vec1.dot(Vec4 vec2)

Calculate the dot product C<vec1 dot vec2> and return the result as a num.

=cut

.sub dot :method
    .vec4_extract_self_plus_vec_arg

    $N30 = $N10 * $N20
    $N31 = $N11 * $N21
    $N32 = $N12 * $N22
    $N33 = $N13 * $N23

    .local num result
    result  = $N30 + $N31
    result += $N32
    result += $N33

    .return(result)
.end


=item num dp3 = vec1.dot3(Vec4 vec2)

Calculate the dot product C<vec1 dot vec2>, considering only the first
three elements of each vector, and return the result as a num.

=cut

.sub dot3 :method
    .vec3_extract_self_plus_vec_arg

    $N30 = $N10 * $N20
    $N31 = $N11 * $N21
    $N32 = $N12 * $N22

    .local num result
    result  = $N30 + $N31
    result += $N32

    .return(result)
.end


=item num len = vector.length()

Calculate the length of C<vector> as C<sqrt(vector dot vector)>, and return
the result as a num.

=cut

.sub length :method
    $N0 = self.'dot'(self)
    $N1 = sqrt $N0

    .return($N1)
.end


=item num len3 = vector.length3()

Calculate the length of C<vector> as C<sqrt(vector dot3 vector)> (thus
considering only the first three elements), and return the result as a num.

=cut

.sub length3 :method
    $N0 = self.'dot3'(self)
    $N1 = sqrt $N0

    .return($N1)
.end


=item Vec4 result = vector.normalize()

Calculate a normalized version of C<vector> as C<vector / length(vector)>,
returning the result as a new C<Vec4>.

=cut

.sub normalize :method
    $N0 = self.'length'()
    $P0 = self.'div_num'($N0)

    .return($P0)
.end

=item num dist = vec1.distance(vec2)

Treat two vectors C<vec1> and C<vec2> as points and determine the distance
between them as C<length(vec1 - vec2)>, returning the result as a num.

=cut

.sub distance :method
    .param pmc vec2

    $P0 = self.'sub'(vec2)
    $N0 = $P0.'length'()

    .return($N0)
.end


=item num dist3 = vec1.distance3(vec2)

Treat two vectors C<vec1> and C<vec2> as points and determine the distance
between them as C<length3(vec1 - vec2)> (thus considering only the first
three elements), and returning the result as a num.

=cut

.sub distance3 :method
    .param pmc vec2

    $P0 = self.'sub'(vec2)
    $N0 = $P0.'length3'()

    .return($N0)
.end

=back



=head3 Miscellaneous Methods

=over 4

=item __dump(pmc dumper, str label)

Callback function for Parrot's C<Data::Dumper> clone.

=cut

.sub __dump :method
    .param pmc    dumper
    .param string label

    $P0 = getattribute self, 'vals'

    print '[ '
    $I0 = 0
  dump_loop:
    $S0 = $P0[$I0]
    print $S0
    inc $I0
    if $I0 >= 4 goto dump_loop_end
    print ', '
    goto dump_loop
  dump_loop_end:
    print ' ]'
.end

=back


=head1 ROADMAP

Over time, the API provided by this module will grow to incorporate
related low-level operations, such as quaternion ops.  However, it will
B<not> include high level components such as particle systems and physics
simulations.  These are properly the domain of other modules that use
this one, or NCI wrappers for libraries such as ODE (L<http://www.ode.org/>)
and Bullet (L<http://www.bulletphysics.com/wordpress/>).

In order to allow the greatest audience of users, this module will track
the evolving experimental API for HLL access to PIR modules.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
