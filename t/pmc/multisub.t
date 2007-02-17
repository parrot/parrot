#! parrot
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

.macro IMPORT ( lib, subname, TEMP )
	.TEMP = find_global .lib, .subname
	store_global .subname, .TEMP
.endm

.sub main
    load_bytecode 'library/Test/More.pir'

    .local pmc _
    .IMPORT( 'Test::More', 'plan', _ )
    .IMPORT( 'Test::More', 'ok',   _ )
    .IMPORT( 'Test::More', 'is',   _ )

    plan( 2 )

=head1 NAME

t/pmc/multisub.t - Multi Sub PMCs

=head1 SYNOPSIS

    % prove t/pmc/multisub.t

=head1 DESCRIPTION

Tests the creation and invocation of Perl6 multi subs.

=cut

    new P0, .MultiSub
    I0 = defined P0
    ok(I0, "create PMC")

    elements I0, P0
    is(I0, 0, "multisubs start empty")

.end

# Local Variables:
#   mode: pir
#   fill-column: 70
# End:
# vim: expandtab shiftwidth=4:
