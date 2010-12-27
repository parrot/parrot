#!./parrot
# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

t/pmc/multisub.t - Multi Sub PMCs

=head1 SYNOPSIS

    % prove t/pmc/multisub.t

=head1 DESCRIPTION

Tests the creation and invocation of Perl6 multi subs.

=cut

.sub main :main
    .include 'test_more.pir'

    plan( 15 )

    test_multisub()
    test_handling_flat_parameters()
    test_set_pmc_keyed_int()
    test_get_pmc_keyed()
    test_exception_set_pmc_keyed_int()
    test_exception_set_integer_keyed_int()
    test_exception_set_string_keyed_int()
    test_exception_set_number_keyed_int()
    test_exception_push_pmc()
.end

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub test_multisub
    $P0 = new ['MultiSub']
    $I0 = defined $P0
    ok($I0, "create PMC")

    $I0 = elements $P0
    is($I0, 0, "multisubs start empty")

    $S0 = foo()
    is($S0, "testing no arg", "no argument variant")
    $S0 = foo("hello")
    is($S0, "testing hello", "single string variant")
    $S0 = foo(5)
    is($S0, "testing 5", "single int variant")
    $S0 = foo(42, "goodbye")
    is($S0, "testing 42, goodbye", "int and string variant")
.end

.sub test_handling_flat_parameters
    ## Test handling of :flat parameters.
    $P0 = new ['ResizablePMCArray']
    push $P0, 42
    push $P0, "goodbye"
    $S0 = foo($P0 :flat)
    is($S0, "testing 42, goodbye", "Int and String :flat")
    ## Now try double :flat
    $P1 = new ['ResizablePMCArray']
    push $P1, 42
    $P2 = new ['ResizablePMCArray']
    push $P2, "goodbye"
    $S0 = foo($P1 :flat, $P2 :flat)
    is($S0, "testing 42, goodbye", "Int and String double :flat")
.end

.sub test_set_pmc_keyed_int
    $P0 = new ['MultiSub']
    $P1 = new ['Sub']

    $P0[0] = $P1
    ok($P0, "set pmc_keyed_int")
.end

.sub test_get_pmc_keyed
    get_global $P0, "foo"
    $P1 = $P0[0]

    $S0 = typeof $P1
    is($S0, 'Sub', 'get pmc_keyed' )
.end

.sub test_exception_set_pmc_keyed_int
    $P0 = new ['MultiSub']
    $P1 = new ['String']
    $P1 = "foo"

    push_eh handler
        $P0[0] = $P1
handler:
    .exception_is( 'attempt to set non Sub PMC' )
.end

.sub test_exception_set_integer_keyed_int
    $P0 = new ['MultiSub']

    push_eh handler
        $P0[0] = 42
handler:
    .exception_is( 'attempt to set non Sub PMC' )
.end

.sub test_exception_set_string_keyed_int
    $P0 = new ['MultiSub']

    push_eh handler
        $P0[0] = "abcd"
handler:
    .exception_is( 'attempt to set non Sub PMC' )
.end

.sub test_exception_set_number_keyed_int
    $P0 = new ['MultiSub']

    push_eh handler
        $P0[0] = 42.2
handler:
    .exception_is( 'attempt to set non Sub PMC' )
.end

.sub test_exception_push_pmc
    $P0 = new ['MultiSub']
    $P1 = new ['Complex']
    $P1 = "1+1i"

    push_eh handler
        push $P0, $P1
handler:
    .exception_is( 'attempt to push non Sub PMC' )
.end

.sub foo :multi()
    .return ('testing no arg')
.end

.sub foo :multi(string)
    .param string bar
    $S0 = "testing " . bar
    .return ($S0)
.end

.sub foo :multi(int)
    .param int bar
    $S1 = bar
    $S0 = "testing " . $S1
    .return ($S0)
.end

.sub foo :multi(int, string)
    .param int bar
    .param string baz
    $S1 = bar
    $S0 = "testing " . $S1
    $S0 .= ", "
    $S0 .= baz
    .return ($S0)
.end

.sub foo :multi(Integer, String)
    .param pmc bar
    .param pmc baz
    $S1 = bar
    $S2 = baz
    $S0 = "testing " . $S1
    $S0 .= ", "
    $S0 .= $S2
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
