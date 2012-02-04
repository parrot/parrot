#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/opcode.t - Opcode PMC

=head1 SYNOPSIS

    % prove t/pmc/opcode.t

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'
    plan(11)

    cannot_create_directly()
    cannot_set_integer()
    get_integer_keyed_int()
    get_data()
.end

.sub cannot_create_directly
    throws_substring(<<'CODE', 'Opcode must be created from OpLib.', 'creation of opcode fails')
    .sub main
        $P0 = new ['Opcode']
    .end
CODE
.end

.sub cannot_set_integer
    throws_substring(<<'CODE', 'Opcode has already been initialized', 'cannot re-initialize opcode')
    .sub main
        $P0 = box "core_ops"
        $P1 = new ['OpLib'], $P0
        $P2 = $P1['say_sc']
        set $P2, 4
    .end
CODE
.end

.sub get_integer_keyed_int
    .local pmc lib, op
    $P0 = box "core_ops"
    lib = new ['OpLib'], $P0
    op = lib['set_p_i']

    set $I0, op[0]
    set $I1, op[100]

    is($I0, 2, 'get_integer_keyed_int returns valid type enum.')
    is($I1, -1, 'get_integer_keyed_int nonexistent parameter type')
.end

.sub get_data
    .local pmc lib, op
    $P0 = box "core_ops"
    lib = new ['OpLib'], $P0
    op = lib['set_p_i']

    $S0 = op.'family_name'()
    is($S0, 'set', 'get family_name()')

    $S0 = op.'jump'()
    is($S0, '0', 'get jump() for non jump opcode')

    op = lib['branch_i']
    $S0 = op.'jump'()
    is($S0, '1', 'get jump() for jump-type opcode')

    op = lib['noop']
    $P0 = op.'dirs'()
    $I0 = elements $P0
    is($I0, 0, 'dirs list for opcode with no arguments is empty')

    $P0 = op.'labels'()
    $I0 = elements $P0
    is($I0, 0, 'labels list for opcode with no arguments is empty')

    op = lib['elements_i_p']
    $P0 = op.'dirs'()
    $I0 = elements $P0
    is($I0, 2, 'dirs list for opcode with 1 arguments has 2 elements (1 in 1 retval)')

    $P0 = op.'labels'()
    $I0 = elements $P0
    is($I0, 2, 'labels list for opcode with 1 arguments has 2 elements (1 in 1 retval)')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
