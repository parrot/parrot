#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/compilers/pct/newpost.t - newPOST tests

=head1 SYNOPSIS

    % prove t/compilers/pct/newpost.t

=head1 DESCRIPTION

Tests compiling some basic POST structures to PBC

=cut

.sub main :main
    .include 'test_more.pir'

    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'

    # plan(?) TODO: Add numer of tests

    basic_tests()
    return_values()
.end

# Compile a tree and return the main sub
.sub compile
    .param pmc node
    .local pmc compiler
    compiler = new ['POST';'PBCCompiler']

    $P0 = compiler.'packfile'(node)

    # New method: Generate view directly
    # TODO: Fix segfaults
    # .tailcall compiler.'mainpmc'($P0)

    # Old method: Write to file, load from file
    .tailcall compiler.'pbc'($P0)
.end

# Put arguments into a main sub inside a file
# Helps when testing fragments
.sub wrap_main
    .param pmc nodes :slurpy

    .local pmc main
    $P0 = get_hll_global ['POST'], 'Sub'
    main = $P0.'new'(nodes :flat, 'name' => 'main', 'main' => 1)

    .local pmc file
    $P0 = get_hll_global ['POST'], 'File'
    file = $P0.'new'(main)

    .return (file)
.end

# Some basic tests like typechecking and running an empty sub
.sub basic_tests
    $P0 = wrap_main()

    .local pmc compiler
    compiler = get_hll_global ['POST'], 'PBCCompiler'

    .local pmc packfile
    packfile = compiler.'packfile'($P0)
    isa_ok( packfile, 'Packfile', 'compiled code' )

    $P0 = compiler.'pbc'(packfile)
    isa_ok( $P0, 'Sub', 'pbc return' )
    $P0()
    ok( 1, 'pbc Sub seemed to run' )

    # TODO: Fix segfaults
    #$P0 = compiler.'mainpmc'(packfile)
    #isa_ok( $P0, 'Sub', 'mainpmc return' )
    #$P0()
    #ok( 1, 'mainpmc Sub seemed to run' )
.end

# Test returning values
.sub return_values
    .local pmc foo
    $P0 = get_hll_global ['POST'], 'String'
    foo = $P0.'new'('type' => 'sc', 'value' => 'foo', 'encoding' => 'binary', 'charset' => 'ascii')

    .local pmc return
    $P0 = get_hll_global ['POST'], 'Call'
    return = $P0.'new'('calltype' => 'return')
    $P0 = new 'ResizablePMCArray'
    push $P0, foo
    return.'params'($P0)

    .local pmc op
    $P0 = get_hll_global ['POST'], 'Op'
    op = $P0.'new'(foo, 'pirop' => 'say')

    $P0 = wrap_main(op, return)
    $P0 = compile($P0)
    $S0 = $P0()
    is( $S0, 'foo', 'string return value' )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
