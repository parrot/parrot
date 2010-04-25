#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/oplib.t - OpLib PMC

=head1 SYNOPSIS

    % prove t/pmc/oplib.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(5)
    new_oplib()
    get_end()
    get_no_opcode()
    family_end()
    family_no_opcode()
.end

.sub new_oplib
    $P0 = new ['OpLib']
    $I0 = isnull $P0
    nok($I0, "new OpLib")
.end

.sub get_end
    $P0 = new ['OpLib']
    # Assumption: we'll always have an end opcode.
    $I1 = $P0['end']
    $I0 = isne $I1, -1
    ok($I0, "got end opcode")
.end

.sub get_no_opcode
    $P0 = new ['OpLib']
    $I1 = $P0['hopeweneverhaveopcodesnamedlikethis']
    $I0 = iseq $I1, -1
    ok($I0, "get non existent opcode fails")
.end

.sub family_end
    $P0 = new ['OpLib']
    # Assumption: we'll always have an end opcode.
    $P1 = $P0.'op_family'('end')
    $I0 = isnull $P1
    dec $I0
    unless $I0 goto done
    $I0 = elements $P1
done:
    is($I0, 1, "'end' family is not null and has 1 element")
.end

.sub family_no_opcode
    $P0 = new ['OpLib']
    $P1 = $P0.'op_family'('hopeweneverhaveopcodesnamedlikethis')
    $I0 = isnull $P1
    ok($I0, "non existent opcode family is null")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

