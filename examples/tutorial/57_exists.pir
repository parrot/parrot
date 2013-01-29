# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's exists opcode.

=head1 EXISTS

The C<exists> opcode tells you whether an element of a container PMC
(array or hash for example) exists. It differs from C<defined>, because
C<defined> will return false on undefined values, which are valid entries.

It's important to think of an array or hash as being a collection of data
buckets. That bucket can exist but not contain a defined value. If the
bucket does not exist, there is no value to check.

In the example below, C<my_array[0]> exists and is defined, but
C<my_array[1]> only exists without ever being given a defined value.
C<my_array[2]> does not exist and is thus not defined. Similar to
C<defined>, the behavior of C<exists> for a given PMC depends on how
that PMC implements the related vtable functions.

=cut

.sub main :main

    # set up an array with two elements
    .local pmc my_array
    my_array = new ['ResizablePMCArray']
    $P0      = new ['String']
    $P0      = "Hello"
    $P1      = new ['Undef']
    push my_array, $P0
    push my_array, $P1

    # looking at the first element
    $I1 = defined my_array[0]
    unless $I1 goto not_def_0
        say "my_array[0] is defined"
        goto end_check_defined_0
    not_def_0:
        say "my_array[0] is not defined"
    end_check_defined_0:

    $I2 = exists my_array[0]
    unless $I2 goto not_exists_0
        say "my_array[0] exists"
        goto end_check_exists_0
    not_exists_0:
        say "my_array[1] does not exist"
    end_check_exists_0:


    # looking at the second element
    $I3 = defined my_array[1]
    unless $I3 goto not_def_1
        say "my_array[1] is defined"
        goto end_check_defined_1
    not_def_1:
        say "my_array[1] is not defined"
    end_check_defined_1:

    $I4 = exists my_array[1]
    unless $I4 goto not_exists_1
        say "my_array[1] exists"
        goto end_check_exists_1
    not_exists_1:
        say "my_array[1] does not exist"
    end_check_exists_1:


    # looking at the third element
    $I5 = defined my_array[2]
    unless $I5 goto not_def_2
        say "my_array[2] is defined"
        goto end_check_defined_2
    not_def_2:
        say "my_array[2] is not defined"
    end_check_defined_2:

    $I6 = exists my_array[2]
    unless $I6 goto not_exists_2
        say "my_array[2] exists"
        goto end_check_exists_2
    not_exists_2:
        say "my_array[2] does not exist"
    end_check_exists_2:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

