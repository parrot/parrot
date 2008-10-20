#!./parrot
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/multisub.t - Multi Sub PMCs

=head1 SYNOPSIS

    % prove t/pmc/multisub.t

=head1 DESCRIPTION

Tests the creation and invocation of Perl6 multi subs.

=cut


.sub main :main
    .include 'include/test_more.pir'

    plan( 8 )

    $P0 = new 'MultiSub'
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

    ## Test handling of :flat parameters.
    $P0 = new 'ResizablePMCArray'
    push $P0, 42
    push $P0, "goodbye"
    $S0 = foo($P0 :flat)
    is($S0, "testing 42, goodbye", "Int and String :flat")
    ## Now try double :flat (regression test for RT #43869).
    $P1 = new 'ResizablePMCArray'
    push $P1, 42
    $P2 = new 'ResizablePMCArray'
    push $P2, "goodbye"
    $S0 = foo($P1 :flat, $P2 :flat)
    is($S0, "testing 42, goodbye", "Int and String double :flat")

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
