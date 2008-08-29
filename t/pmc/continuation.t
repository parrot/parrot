#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/continuation.t - test Continuation PMC

=head1 SYNOPSIS

    % prove t/pmc/continuation.t

=head1 DESCRIPTION

Tests the Continuation PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'
    plan(2)

    test_new()
    invoke_with_init()
.end

.sub test_new
    new $P0, 'Continuation'
    ok(1, "new Continuation didn't explode")
.end

.sub invoke_with_init
    new $P0, 'Continuation'
    set_addr $P0, L1
    $P0()
    ok(0, "didn't call continuation")
    goto end
L1:
    ok(1, "called continuation")
    goto end
end:
.end

# end of tests.

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
