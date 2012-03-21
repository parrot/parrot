#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.

=head1 NAME

t/library/range.t

=head1 SYNOPSIS

    % prove t/library/range.t

=head1 DESCRIPTION

Tests the Range class.

=cut

.include 'load_bytecode.pir'

.sub main :main
    .include 'test_more.pir'
    '__load_bytecode'('Range.pbc')

    plan(78)

    # XXX Convert this to the PDD15 way of creating an object
    # at the same time you specify the attributes...

    test_1() # 5 tests
    test_2() # 5 tests
    test_3() # 5 tests
    test_4() # 5 tests
    test_5() # 5 tests
    test_6() # 5 tests
    test_7() # 5 tests
    test_8() # 6 tests
    test_9() # 6 tests
    test_10() # 7 tests
    test_11() # 7 tests
    test_12() # 7 tests
    test_13() # 5 tests
    test_14() # 5 tests
.end

.sub 'test_1'
    .local string test_desc
    test_desc = "1..3, shift until exhausted"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, test_desc)
    $I0 = $P0.'shift'()
    is($I0, 1, '1 - 1st')
    $I0 = $P0.'shift'()
    is($I0, 2, '1 - 2nd')
    $I0 = $P0.'shift'()
    is($I0, 3, '1 - 3rd')

    push_eh catch
      $I0 = $P0.'shift'()
      ok(0,'1 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'1 - exhausted')

finally:
    .return()
.end


.sub 'test_2'
    .local string test_desc
    test_desc = "-1..3:by(2), shift until exhausted"
    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = -1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    $P1 = new 'Integer'
    $P1 = 2
    setattribute $P0, 'by', $P1

    ok(1, test_desc)
    $I0 = $P0.'shift'()
    is($I0, -1, '2 - 1st')
    $I0 = $P0.'shift'()
    is($I0, 1, '2 - 2nd')
    $I0 = $P0.'shift'()
    is($I0, 3, '2 - 3rd')

    push_eh catch
      $I0 = $P0.'shift'()
      ok(0,'2 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'2 - exhausted')

finally:
    .return()
.end

.sub 'test_3'
    .local string test_desc
    test_desc = "-1..4:by(2), shift until exhausted"
    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = -1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 4
    setattribute $P0, 'to', $P1
    $P1 = new 'Integer'
    $P1 = 2
    setattribute $P0, 'by', $P1

    ok(1, test_desc)
    $I0 = $P0.'shift'()
    is($I0, -1, '3 - 1st')
    $I0 = $P0.'shift'()
    is($I0, 1, '3 - 2nd')
    $I0 = $P0.'shift'()
    is($I0, 3, '3 - 3rd')

    push_eh catch
      $I0 = $P0.'shift'()
      ok(0,'3 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'3 - exhausted')

finally:
    .return()
.end

.sub 'test_4'
    .local string test_desc
    test_desc = "1..3, pop until exhausted"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, test_desc)
    $I0 = $P0.'pop'()
    is($I0, 3, '4 - 1st')
    $I0 = $P0.'pop'()
    is($I0, 2, '4 - 2nd')
    $I0 = $P0.'pop'()
    is($I0, 1, '4 - 3rd')

    push_eh catch
      $I0 = $P0.'pop'()
      ok(0,'4 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'4 - exhausted')

finally:
    .return()
.end

.sub 'test_5'
    .local string test_desc
    test_desc = "-1..3:by(2), pop until exhausted"
    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = -1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    $P1 = new 'Integer'
    $P1 = 2
    setattribute $P0, 'by', $P1

    ok(1, test_desc)
    $I0 = $P0.'pop'()
    is($I0, 3, '5 - 1st')
    $I0 = $P0.'pop'()
    is($I0, 1, '5 - 2nd')
    $I0 = $P0.'pop'()
    is($I0, -1, '5 - 3rd')

    push_eh catch
      $I0 = $P0.'pop'()
      ok(0,'5 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'5 - exhausted')

finally:
    .return()
.end

.sub 'test_6'
    .local string test_desc
    test_desc = "-1..4:by(2), pop until exhausted"
    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = -1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 4
    setattribute $P0, 'to', $P1
    $P1 = new 'Integer'
    $P1 = 2
    setattribute $P0, 'by', $P1

    ok(1, test_desc)
    $I0 = $P0.'pop'()
    is($I0, 4, '6 - 1st')
    $I0 = $P0.'pop'()
    is($I0, 2, '6 - 2nd')
    $I0 = $P0.'pop'()
    is($I0, 0, '6 - 3rd')

    push_eh catch
      $I0 = $P0.'pop'()
      ok(0,'6 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'6 - exhausted')

finally:
    .return()
.end

.sub 'test_7'
    .local string test_desc
    test_desc = "1..42.5, shift & pop"
    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 42.5
    setattribute $P0, 'to', $P1

    ok(1, test_desc)
    $N0 = $P0.'shift'()
    is($N0, 1, '7 - 1st')
    $N0 = $P0.'pop'()
    is($N0, 42.5, '7 - last')

    $N0 = $P0.'get_from'()
    is($N0, 2, '7 - from')

    $N0 = $P0.'get_to'()
    is($N0, 41.5, '7 - to')

finally:
    .return()
.end

.sub 'test_8'
    .local string test_desc
    test_desc = "1..3, reverse, shift until exhausted"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, test_desc)

    $P0.'reverse'()
    ok(1, '8 - reversed')

    $I0 = $P0.'shift'()
    is($I0, 3, '8 - 1st')
    $I0 = $P0.'shift'()
    is($I0, 2, '8 - 2nd')
    $I0 = $P0.'shift'()
    is($I0, 1, '8 - 3rd')

    push_eh catch
      $I0 = $P0.'shift'()
      ok(0,'8 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'8 - exhausted')

finally:
    .return()
.end

.sub 'test_9'
    .local string test_desc
    test_desc = "1..3, reverse, pop until exhausted"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, test_desc)

    $P0.'reverse'()
    ok(1, '9 - reversed')

    $I0 = $P0.'pop'()
    is($I0, 1, '9 - 1st')
    $I0 = $P0.'pop'()
    is($I0, 2, '9 - 2nd')
    $I0 = $P0.'pop'()
    is($I0, 3, '9 - 3rd')

    push_eh catch
      $I0 = $P0.'pop'()
      ok(0,'9 - exhausted')
      goto finally
    pop_eh

catch:
    # XXX should have more thorough exception check
    ok(1,'9 - exhausted')

finally:
    .return()
.end

.sub 'test_10'
    .local string test_desc
    test_desc = "1..3, get attributes..."

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    ok(1, test_desc)

    $I0 = $P0.'get_from'()
    is($I0, 1, '10 - from')
    $I0 = $P0.'get_to'()
    is($I0, 3, '10 - to')
    $I0 = $P0.'get_min'()
    is($I0, 1, '10 - min')
    $I0 = $P0.'get_max'()
    is($I0, 3, '10 - max')
    $P0 = $P0.'get_minmax'()
    $I0 = $P0[0]
    is($I0, 1, '10 - min of minmax')
    $I0 = $P0[1]
    is($I0, 3, '10 - max of minmax')

finally:
    .return()
.end

.sub 'test_11'
    .local string test_desc
    test_desc = "3..1:by(-1), get attributes"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'to', $P1
    $P1 = new 'Integer'
    $P1 = -1
    setattribute $P0, 'by', $P1
    ok(1, test_desc)

    $I0 = $P0.'get_from'()
    is($I0, 3, '11 - from')
    $I0 = $P0.'get_to'()
    is($I0, 1, '11 - to')
    $I0 = $P0.'get_min'()
    is($I0, 1, '11 - min')
    $I0 = $P0.'get_max'()
    is($I0, 3, '11 - max')
    $P0 = $P0.'get_minmax'()
    $I0 = $P0[0]
    is($I0, 1, '11 - min of minmax')
    $I0 = $P0[1]
    is($I0, 3, '11 - max of minmax')

finally:
    .return()
.end

.sub 'test_12'
    .local string test_desc
    test_desc = "1..3, reverse, get attributes"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 3
    setattribute $P0, 'to', $P1
    $P0.'reverse'()
    ok(1, test_desc)

    $I0 = $P0.'get_from'()
    is($I0, 3, '11 - from')
    $I0 = $P0.'get_to'()
    is($I0, 1, '11 - to')
    $I0 = $P0.'get_min'()
    is($I0, 1, '11 - min')
    $I0 = $P0.'get_max'()
    is($I0, 3, '11 - max')
    $P0 = $P0.'get_minmax'()
    $I0 = $P0[0]
    is($I0, 1, '11 - min of minmax')
    $I0 = $P0[1]
    is($I0, 3, '11 - max of minmax')

finally:
    .return()
.end

.sub 'test_13'
    .local string test_desc
    test_desc = "1..4, vtable shift, all varieties"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 4
    setattribute $P0, 'to', $P1
    ok(1, test_desc)

    $P1 = shift $P0
    is($P1, 1, '13 - 1st')
    $I0 = shift $P0
    is($I0, 2, '13 - 2nd')
    $N0 = shift $P0
    is($N0, 3.0, '13 - 3rd')
    $S0 = shift $P0
    is($S0, "4", '13 - 4th')

finally:
    .return()
.end

.sub 'test_14'
    .local string test_desc
    test_desc = "1..4, vtable pop, all varieties"

    $P0 = new 'Range'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute $P0, 'from', $P1
    $P1 = new 'Integer'
    $P1 = 4
    setattribute $P0, 'to', $P1
    ok(1, test_desc)

    $P1 = pop $P0
    is($P1, 4, '14 - 1st')
    $I0 = pop $P0
    is($I0, 3, '14 - 2nd')
    $N0 = pop $P0
    is($N0, 2.0, '14 - 3rd')
    $S0 = pop $P0
    is($S0, "1", '14 - 4th')

finally:
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

