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
.end

# Compile a tree and return the main sub
.sub compile
    .param pmc node
	.param pmc adverbs :named :slurpy

    .local pmc compiler
    compiler = new ['PCT';'HLLCompiler']
    $P0 = split ' ', 'newpost pbc'
    #$P0 = split ' ', 'post evalpmc'
    compiler.'stages'($P0)

    .tailcall compiler.'compile'(node, adverbs :flat)
.end

# Some basic tests like typechecking and running an empty sub
.sub basic_tests
    .local pmc node
    $P0 = get_hll_global ['PAST'], 'Block'
    node = $P0.'new'('name' => 'main')
    node.'pirflags'(':main')
    node.'push'(42)

    $P0 = compile(node, 'target'=>'newpost')
    $I0 = defined $P0
    ok( $I0, 'got a return' )
    set $P1, ['POST';'File']
    isa_ok( $P0, $P1, 'newpost top-level' )
    _dumper($P0)

    $P0 = compile(node)
    isa_ok( $P0, 'Sub', 'compiler return' )
    $I0 = $P0()
    ok( 1, 'Sub seemed to run' )
    is( $I0, 42, 'Sub returned correct value' )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
