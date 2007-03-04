#!./parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/smop_class.t - test the new SMOP Class PMC


=head1 SYNOPSIS

    % prove t/pmc/smop_class.t

=head1 DESCRIPTION

Tests the SMOP_Class PMC.

=cut

.macro IMPORT ( lib, subname, TEMP )
	.TEMP = find_global .lib, .subname
	store_global .subname, .TEMP
.endm

.sub _main :main
    load_bytecode 'library/Test/More.pir'

    .local pmc _
    .IMPORT( 'Test::More', 'plan', _ )
    .IMPORT( 'Test::More', 'ok',   _ )
    .IMPORT( 'Test::More', 'is',   _ )

    plan( 1 )

    $P0 = new 'SMOP_Class'
    ok (1)
#    ok ($P0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
