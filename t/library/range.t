#! parrot
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/library/range.t

=head1 SYNOPSIS

    % prove t/library/range.t

=head1 DESCRIPTION

Tests the Range class.

=cut

.sub main :main
    # load this library
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exports = split " ", "plan diag ok is is_deeply like isa_ok"

    test_namespace."export_to"(curr_namespace, exports)

    load_bytecode 'Range.pir' # XXX eventually convert to pbc.

    plan(47)

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
    clear_eh
    
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
    clear_eh

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
    clear_eh

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
    clear_eh
    
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
    clear_eh

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
    clear_eh

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
    clear_eh
    
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
    clear_eh
    
catch:
    # XXX should have more thorough exception check
    ok(1,'9 - exhausted')

finally:
    .return()
.end


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
