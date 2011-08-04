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

    # plan(?)

    empty_main()
    return_values()
.end

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

.sub wrap_tree
    .param pmc nodes :slurpy

    .local pmc main
    $P0 = get_hll_global ['POST'], 'Sub'
    main = $P0.'new'(nodes :flat, 'name' => 'main', 'main' => 1)

    .local pmc file
    $P0 = get_hll_global ['POST'], 'File'
    file = $P0.'new'(main)

    .return (file)
.end

.sub empty_main
    $P0 = wrap_tree()
    $P0 = compile($P0)
    isa_ok( $P0, 'Sub', 'compiled code' )
    $P0()
    ok( 1, 'Sub seemed to run' )
.end

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

    $P0 = wrap_tree(op, return)
    $P0.'push_pirop'('say', foo)
    $P0 = compile($P0)
    $S0 = $P0()
    is( $S0, 'foo', 'string return value', 'todo' => 1 )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
