# Copyright (C) 2008-2009, Parrot Foundation.

=head1 TITLE

float4.pir - Benchmark different ways of filling a float4 struct

=head1 SYNOPSIS

    $ cd parrot-home
    $ ./parrot examples/benchmarks/float4.pir

=head1 DESCRIPTION

This benchmark compares 5 different ways of defining and filling a float4
structure (a common vector length, especially for graphics).

=cut


.include 'datatypes.pasm'

.sub main :main
    .param pmc argv

    # count = argv[1] || 1_000_000
    .local int count
    $S0 = argv[1]
    count = $S0
    if count goto make_struct_defs
    count = 1000000

    # Create variant structure definitions
  make_struct_defs:
    .local pmc struct, named_struct, array, named_array

    struct = new 'ResizablePMCArray'
    push struct, .DATATYPE_FLOAT
    push struct, 0
    push struct, 0
    push struct, .DATATYPE_FLOAT
    push struct, 0
    push struct, 0
    push struct, .DATATYPE_FLOAT
    push struct, 0
    push struct, 0
    push struct, .DATATYPE_FLOAT
    push struct, 0
    push struct, 0

    named_struct = new 'OrderedHash'
    named_struct['a'] = .DATATYPE_FLOAT
    push named_struct, 0
    push named_struct, 0
    named_struct['b'] = .DATATYPE_FLOAT
    push named_struct, 0
    push named_struct, 0
    named_struct['c'] = .DATATYPE_FLOAT
    push named_struct, 0
    push named_struct, 0
    named_struct['d'] = .DATATYPE_FLOAT
    push named_struct, 0
    push named_struct, 0

    array = new 'ResizablePMCArray'
    push array, .DATATYPE_FLOAT
    push array, 4
    push array, 0

    named_array = new 'OrderedHash'
    named_array['a'] = .DATATYPE_FLOAT
    push named_array, 4
    push named_array, 0

    # Locals used for each timing loop
    .local num start, stop, elapsed
    .local pmc float4
    .local int i

    # Time named struct elements treated as array
    float4  = new 'ManagedStruct', named_struct
    i       = count
    start   = time

  named_struct_array_loop:
    float4[0] = start
    float4[1] = start
    float4[2] = start
    float4[3] = start
    dec i
    if i goto named_struct_array_loop

    stop    = time
    elapsed = stop - start
    print 'Array Struct: '
    say elapsed

    # Time struct element per array element
    float4  = new 'ManagedStruct', struct
    i       = count
    start   = time

  struct_loop:
    float4[0] = start
    float4[1] = start
    float4[2] = start
    float4[3] = start
    dec i
    if i goto struct_loop

    stop    = time
    elapsed = stop - start
    print '      Struct: '
    say elapsed

    # Time *named* struct element per array element
    float4  = new 'ManagedStruct', named_struct
    i       = count
    start   = time

  named_struct_loop:
    float4['a'] = start
    float4['b'] = start
    float4['c'] = start
    float4['d'] = start
    dec i
    if i goto named_struct_loop

    stop    = time
    elapsed = stop - start
    print 'Named Struct: '
    say elapsed

    # Time array packed into first element of struct
    float4  = new 'ManagedStruct', array
    i       = count
    start   = time

  array_loop:
    float4[0;0] = start
    float4[0;1] = start
    float4[0;2] = start
    float4[0;3] = start
    dec i
    if i goto array_loop

    stop    = time
    elapsed = stop - start
    print '       Array: '
    say elapsed

    # Time array packed into *named* first element of struct
    float4  = new 'ManagedStruct', named_array
    i       = count
    start   = time

  named_array_loop:
    float4['a';0] = start
    float4['a';1] = start
    float4['a';2] = start
    float4['a';3] = start
    dec i
    if i goto named_array_loop

    stop    = time
    elapsed = stop - start
    print 'Named  Array: '
    say elapsed
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
