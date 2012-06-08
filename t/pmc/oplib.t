#!./parrot
# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

t/pmc/oplib.t - OpLib PMC

=head1 SYNOPSIS

    % prove t/pmc/oplib.t

=head1 DESCRIPTION

This PIR code implements various oplib tests.

=cut

# Hardcoded assumptions for tests:
# * We have an op called end
# * It has no arguments
# * Is the only member of its familiy
.const string TESTED_OP = 'end'
.const int TESTED_OP_ELEMS = 0
.const int TESTED_OP_FAMILIY_ELEMS = 1
# Never have an op with this name:
.const string TESTED_NOSUCHOP = 'hopeweneverhaveopcodesnamedlikethis'

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'
    plan(13)
    new_oplib()
    check_elements()
    getint_end()
    getint_no_opcode()
    getop_end()
    family_end()
    family_no_opcode()
.end

.sub new_oplib
    $P0 = box "core_ops"
    $P1 = new ['OpLib'], $P0
    $I0 = isnull $P1
    nok($I0, "new OpLib")
.end

.sub check_elements
    .local pmc oplib, op, eh
    .local int n, i
    $P0 = box "core_ops"
    oplib = new ['OpLib'], $P0
    n = elements oplib
    i = n - 1
    op = oplib[i]
    i = isnull op
    is(i, 0, 'last opcode exists')
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_label eh, catch
    push_eh eh
    op = oplib[n]
    nok(1, 'out of bounds opcode number should throw')
    goto end
  catch:
    finalize eh
    pop_eh
    ok(1, 'out of bounds opcode number throws')
  end:
.end

.sub getint_end
    $P0 = box 'core_ops'
    $P0 = new ['OpLib'], $P0
    $I1 = $P0[TESTED_OP]
    $I0 = isne $I1, -1
    ok($I0, "got end opcode")
.end

.sub getint_no_opcode
    $P0 = box 'core_ops'
    $P0 = new ['OpLib'], $P0
    $I1 = $P0[TESTED_NOSUCHOP]
    $I0 = iseq $I1, -1
    ok($I0, "get non existent opcode fails")
.end

.sub getop_end
    .local pmc oplib, op, op2, name
    $P0 = box 'core_ops'
    oplib = new ['OpLib'], $P0

    # Using a string constant
    op = oplib[TESTED_OP]
    $I0 = isnull op
    is($I0, 0, "got end opcode data")

    $I0 = elements op
    is($I0, TESTED_OP_ELEMS, "the opcode tested has the expected length")

    # Using a String PMC
    name = new ['String']
    name = TESTED_OP
    op2 = oplib[name]
    $I0 = isnull op2
    is($I0, 0, "got end opcode data keyed pmc")

    $I0 = issame op, op2
    $S0 = "Implement cacheing, Opcode.is_same, or change comparison"
    todo($I0, "got same result from both ways", $S0)

    $I1 = op
    $I0 = oplib[TESTED_OP]
    is($I0, $I1, 'opcode number from Opcode and from OpLib is the same')

    $S0 = op
    is($S0, TESTED_OP, 'name from Opcode matches name searched for')
.end

.sub family_end
    $P0 = box 'core_ops'
    $P0 = new ['OpLib'], $P0
    $P1 = $P0.'op_family'(TESTED_OP)
    $I0 = isnull $P1
    dec $I0
    unless $I0 goto done
    $I0 = elements $P1
done:
    is($I0, TESTED_OP_FAMILIY_ELEMS, "'end' family is not null and has 1 element")
.end

.sub family_no_opcode
    $P0 = box 'core_ops'
    $P0 = new ['OpLib'], $P0
    $P1 = $P0.'op_family'(TESTED_NOSUCHOP)
    $I0 = isnull $P1
    ok($I0, "non existent opcode family is null")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

