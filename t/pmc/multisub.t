#!./parrot
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/multisub.t - Multi Sub PMCs

=head1 SYNOPSIS

    % prove t/pmc/multisub.t

=head1 DESCRIPTION

Tests the creation and invocation of Perl6 multi subs.

=cut


.sub main :main
    load_bytecode 'library/Test/More.pir'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan ok is"
    test_namespace.export_to(curr_namespace, exports)

    plan( 6 )

    $P0 = new .MultiSub
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

# Local Variables:
#   mode: pir
#   fill-column: 70
# End:
# vim: expandtab shiftwidth=4:
