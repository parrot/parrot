#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/packfileopmap.t - test the PackfileOpMap PMC

=head1 SYNOPSIS

    % make test_prep
    % prove t/pmc/packfileopmap.t

=head1 DESCRIPTION

Tests the PackfileOpMap PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned from get_type look right, and that the corresponding
# fetches for the found types don't crash.


.include 't/pmc/testlib/packfile_common.pir'

.sub 'main' :main
    .include 'test_more.pir'

    'sanity'()
    'basic'()
    'load_lib'()
    'reverse_mapping'()

    'done_testing'()
.end


# sanity check we have a PackfilOpMap
.sub 'sanity'
    .local pmc opmap
    opmap = new ['PackfileOpMap']
    isa_ok(opmap, "PackfileOpMap", "PackfileOpMap is a PackfileOpMap")
.end

.sub 'basic'
    .local pmc opmap
    opmap = new ['PackfileOpMap']

    push_eh fake_op_eh
    $I0 = opmap['THIS IS NOT A REAL OP']
    ok(0, "opmap throws an exception for invalid op names")
    goto done_with_fake_op

  fake_op_eh:
    ok(1, "opmap throws an exception for invalid op names")
  done_with_fake_op:
    pop_eh

    push_eh short_op_eh
    $I0 = opmap['say']
    ok(0, "opmap does not attempt to map short op names")
    goto done_with_short_op


  short_op_eh:
    ok(1, "opmap does not attempt to map short op names")
  done_with_short_op:
    pop_eh

    $I0 = opmap['say_sc']
    # First mapped op should be 0
    is($I0, 0, "First mapped op is 0")
    $I1 = opmap['say_sc']
    is($I0, $I1, "opmap always return same value for a given op")

    $I0 = opmap['returncc']
    is($I0, 1, "Second mapped op is 1")
    $I0 = opmap['issame_i_p_p']
    $I0 = opmap['cmp_i_i_i']
    is($I0, 3, "Forth mapped op is 3")

    $I0 = opmap
    is($I0, 4, "opmap correctly reports the number of mapped ops")

    $P0 = opmap['say_sc']
    $S0 = $P0
    is($S0, 'say_sc', 'opmap returns the correct named op')

    push_eh invalid_op_name
    $P0 = opmap['speak_ne']
    ok(0, 'opmap throws an exception on invalid op name')

  invalid_op_name:
    ok(1, 'caught invalid op name')
    pop_eh
.end

.sub 'load_lib'
    .local pmc opmap
    opmap = new ['PackfileOpMap']

    ($I0) = opmap.'load_lib'('core_ops')
    ok(1, "load_lib works with 'core_ops'")

    ($I0) = opmap.'load_lib'('core_ops')
    ok(1, "load_lib works with 'core_ops' a second time")


    $I0 = opmap['say_sc']
    # First mapped op should be 0
    is($I0, 0, "Can map say_sc from core_ops")

    # After make corevm dynoplib isn't built yet.
    # Catch exception and ignore rest of tests.
    push_eh no_math_ops
    $P0 = loadlib 'math_ops'
    ($I0) = opmap.'load_lib'('math_ops')
    ok(1, "load_lib works with 'math_ops'")

    $I0 = opmap['cmod_i_i_i']
    is($I0, 1, "Can map cmod_i_i_i from math_ops")
    .return ()

  no_math_ops:
    pop_eh
    skip(2, 'No math_ops library')
    .return ()
.end

.sub 'reverse_mapping'
    .local pmc opmap
    opmap = new ['PackfileOpMap']

    # Map few ops.
    $I0 = opmap['say_sc']
    $I1 = opmap['returncc']
    $I2 = opmap['issame_i_p_p']
    $I3 = opmap['cmp_i_i_i']

    $S0 = opmap[$I0]
    is( $S0, "say_sc", "say_sc")

    $S0 = opmap[$I1]
    is( $S0, "returncc", "returncc")

    $S0 = opmap[$I2]
    is( $S0, "issame_i_p_p", "issame_i_p_p")

    $S0 = opmap[$I3]
    is( $S0, "cmp_i_i_i", "cmp_i_i_i")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
