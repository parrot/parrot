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

    plan(9)

    basic_tests()
    test_return()
    test_val()
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

# Create a main block with the given children
.sub main_block
    .param pmc nodes :slurpy

    $P0 = get_hll_global ['PAST'], 'Block'
    $P0 = $P0.'new'(nodes :flat)
    $P0.'pirflags'(':main')
    .return ($P0)
.end

# Some basic tests like typechecking and running an empty sub
.sub basic_tests
    .local pmc node
    $P0 = get_hll_global ['PAST'], 'Block'
    node = $P0.'new'()

    $P0 = compile(node, 'target'=>'newpost')
    set $P1, ['POST';'File']
    isa_ok( $P0, $P1, 'newpost top-level' )

    $P0 = compile(node)
    isa_ok( $P0, 'Sub', 'compiler return' )
    $P0()
    ok( 1, 'Sub seemed to run' )
.end

# Test return values
.sub test_return
    $P0 = main_block(42)
    $P0 = compile($P0)
    $I0 = $P0()
    is( $I0, 42, 'integer return' )

    $P0 = main_block(3.14)
    $P0 = compile($P0)
    $N0 = $P0()
    is( $N0, 3.14, 'float return' )

    $P0 = main_block('foo')
    $P0 = compile($P0)
    $S0 = $P0()
    is( $S0, 'foo', 'string return' )
.end

# Test val nodes
.sub test_val
    .local pmc val
    val = get_hll_global ['PAST'], 'Val'

    $P0 = val.'new'('value' => 42, 'returns' => 'Integer')
    $P0 = main_block($P0)
    $P0 = compile($P0)
    $I0 = $P0()
    is( $I0, 42, 'integer val' )

    $P0 = val.'new'('value' => 3.14, 'returns' => 'Float')
    $P0 = main_block(3.14)
    $P0 = compile($P0)
    $N0 = $P0()
    is( $N0, 3.14, 'float val' )

    $P0 = val.'new'('value' => 'foo', 'returns' => 'String')
    $P0 = main_block($P0)
    $P0 = compile($P0)
    $S0 = $P0()
    is( $S0, 'foo', 'string val' )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
