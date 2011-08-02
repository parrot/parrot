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
.end

# Note: Runs two tests
.sub compile
    .param pmc node
    .local pmc compiler
    compiler = new ['POST';'PBCCompiler']

    # New compiler method:
    # TODO: Fix segfaults
    # $P0 = compiler.'packfile'(node)
    # isa_ok( $P0, 'Packfile', 'compiled code' )
    # $P0 = compiler.'mainpmc'($P0)
    # isa_ok( $P0, 'Sub', 'main sub' )
    # .return ($P0)

    .tailcall compiler.'pbc'(node)
.end

.sub empty_main
    .local pmc main
    $P0 = get_hll_global ['POST'], 'Sub'
    main = $P0.'new'('name' => 'main', 'main' => 1)

    .local pmc file
    $P0 = get_hll_global ['POST'], 'File'
    file = $P0.'new'(main)

    $P0 = compile(file)
    $P0()
    ok( 1, 'Sub seemed to run' )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
