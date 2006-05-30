# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/benchmarks/array_access.pir - benchmark reading from an array

=head1 SYNOPSIS

    ./parrot examples/benchmarks/array_access.pir --arr-size=2000

=head1 DESCRIPTION

Inspired by computer language shootout.

=cut

.sub main :main
    .param pmc argv

    load_bytecode "Getopt/Obj.pbc"
    
    # name of the program
    .local string program_name
    program_name = shift argv

    # Specification of command line arguments.
    .local pmc getopts
    getopts = new "Getopt::Obj"
    push getopts, "arr-size=i"

    .local pmc opt
    opt = getopts."get_options"(argv)

    .local int arr_size
    arr_size = 100
    .local int def
    def = defined opt["arr-size"]
    unless def goto use_default_arr_size
        arr_size = opt['arr-size']
use_default_arr_size:

    _bench( .Array, arr_size )
    _bench( .FixedFloatArray, arr_size )
    _bench( .FixedIntegerArray, arr_size )
    _bench( .FixedPMCArray, arr_size )
    _bench( .FixedStringArray, arr_size )
    _bench( .IntList, arr_size )
    _bench( .ResizableFloatArray, arr_size )
    _bench( .ResizableIntegerArray, arr_size )
    _bench( .ResizablePMCArray, arr_size )
    _bench( .ResizableStringArray, arr_size )
    _bench( .SArray, arr_size )
.end

=head2 void bench( int arr_class, int arr_size )

=cut

.sub _bench 
    .param int arr_class
    .param int arr_size

    # Two arrays with fixed size
    .local pmc arr_1, arr_2
    arr_1 = new arr_class
    arr_1 = arr_size
    arr_2 = new arr_class
    arr_2 = arr_size

    .local float start_time
    start_time = time

    # initialize arr_1 and arr_2
    .local int x_index, value
    x_index = 0
    value = 1
X_LOOP:
    if x_index >= arr_size goto X_DONE
    arr_1[x_index] = value
    arr_2[x_index] = 0
    inc x_index
    inc value
    goto X_LOOP
X_DONE:

    .local int max_index, z_index, y_index
    max_index = arr_size - 1
    y_index = 0
Y_LOOP:   # 1000 iterations 
    if y_index >= 1000 goto Y_DONE
    z_index = max_index
Z_LOOP:   # arr_size iterations
    if z_index < 0 goto Z_DONE
    set $I3, arr_2[z_index]
    set $I4, arr_1[z_index]
    add $I3, $I4
    arr_2[z_index] = $I3
    dec z_index
    branch Z_LOOP
Z_DONE:

    inc y_index
    branch Y_LOOP
Y_DONE:

    # final output
    print "1 * 1000 = "
    value = arr_2[0]
    print value
    print "\n"
    print arr_size
    print " * 1000 = "
    value = arr_2[max_index]
    print value
    print "\n"

    .local float start_time, end_time, span_time
    end_time = time
    span_time = end_time - start_time
    .local string arr_type
    arr_type = typeof arr_1
    print arr_type
    print ": "
    print span_time
    print "s\n\n"
.end

=head1 SEE ALSO

Computer language shootout. L<http://shootout.alioth.debian.org>

=cut
