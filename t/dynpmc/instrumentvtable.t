#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/instrumentvtable.t - test the InstrumentVtable dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrumentvtable.t

=head1 DESCRIPTION

Tests the vtable notification interface provided by the InstrumentVtable pmc.

=cut

.include 'call_bits.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(22)

    setup()
    test_creation()
    test_attaching()
    test_insertion()
    test_removal()
    test_notification()
    cleanup()

    .return()
.end


.sub setup
    # Create a simple program to test that events are raised.
    .local string program
    program = <<'PROG'
.sub main :main
    $P0 = new ['TestClass']
    $I0 = isa $P0, 'TestClass'
.end

.namespace ['TestClass']
.sub '' :anon :init :load
    $P0 = newclass ['TestClass']
.end

# Test override.
.sub init :vtable :method
    # Do nothing.
.end

PROG

    # Write to file.
    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'('t/dynpmc/instrumentvtable-test1.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/dynpmc/instrumentvtable-test1.pir')
.end

.sub test_creation
    # InstrumentVtable is supposed to be instantiated with
    # an Instrument instance.
    # Check:
    # 1. init throws an exception.
    # 2. init_pmc initialises without any exception.
    $P0 = new ['Instrument']

    ## Scenario 1: Call init.

    # Set up exception handler.
    $P1 = new ['ExceptionHandler']
    set_addr $P1, INIT_OK
    push_eh $P1

    $P2 = new ['InstrumentVtable']

    ok(0, 'Creation: Init did not throw exception.')

    goto INIT_END

    INIT_OK:
      ok(1, 'Creation: Init threw exception.')
    INIT_END:

    ## Scenario 2: Call init_pmc.
    $P3 = new ['InstrumentVtable'], $P0
    $I0 = isa $P3, 'InstrumentVtable'
    is($I0, 1, 'Creation: init_pmc successful.')
.end

.sub test_attaching
    # Test attaching an InstrumentVtable instance to a class.
    # Check:
    # 1. Attaching to an exisiting class is fine.
    # 2. Attaching to a non-existent class throws an exception.
    $P0 = new ['Instrument']

    ## Scenario 1: Attach to an existing class (Sub)
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    ok(1, 'Attach: Existing class ok.')

    ## Scenario 2: Attach to a non-existing class (Suba)
    # Set up exception handler.
    $P2 = new ['ExceptionHandler']
    set_addr $P2, ATTACH_OK
    push_eh $P2

    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Suba')

    ok(0, 'Attach: Attaching to non-existent class did not throw exception.')

    goto ATTACH_END

    ATTACH_OK:
      ok(1, 'Attach: Attaching to non-existent class threw exception.')
    ATTACH_END:
.end

.sub test_insertion
    # Test inserting a hook into the vtables of a class.
    # Check:
    # 1. Insert 1 hook and check that there is 1 hook in the hook list.
    # 2. Insert 1 hook twice and check that there is only 1 entry in the hook list.
    # 3. Insert 2 different hooks and check that there are 2 entries in the hook list.
    # 4. Insert a hook group and check that the hook list matches that in the group.
    #    (Group is obtained by querying the get_hook_list method.)
    $P0 = new ['Instrument']

    ## Scenario 1: Insert 1 hook.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Insert: 1: Count ok.')
    is($S0, 'init', 'Insert: 1: Name ok.')

    ## Scenario 2: Insert 1 hook twice.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'insert_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Insert: 2: Count ok.')
    is($S0, 'init', 'Insert: 2: Name ok.')

    ## Scenario 3: Insert 2 different hooks.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'insert_hook'('init_pmc')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $I1 = find_in_list($P2, 'init')
    $I2 = find_in_list($P2, 'init_pmc')
    $I3 = $I1 + $I2
    is($I0, 2, 'Insert: 3: Count ok.')
    is($I3, 2, 'Insert: 3: Name ok.')

    ## Scenario 4: Insert a group of hooks.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('write')
    $P2 = $P1.'get_instrumented_list'()
    $P3 = $P1.'get_hook_list'('write')

    $I0 = $P2
    $I1 = $P3
    $I2 = is_same_set($P2, $P3)
    is($I0, $I1, 'Insert: 4: Count ok.')
    is($I2, 1, 'Insert: 4: Group ok.')
.end

.sub test_removal
    # Test removal of inserted hooks into the vtable of a class.
    # Check:
    # 1. Removal of an inserted hook.
    # 2. A hook inserted twice and removed once will still be active.
    # 3. Removing a group of hooks.
    # 4. Removing a non-existent hook will throw an exception.
    $P0 = new ['Instrument']

    ## Scenario 1: Remove a single hook.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'remove_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    is($I0, 0, 'Remove: 1: Count ok.')

    ## Scenario 2: Remove a hook inserted twice.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'insert_hook'('init')
    $P1.'remove_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Remove: 2: Count ok.')
    is($S0, 'init', 'Remove: 2: Name ok.')

    ## Scenario 3: Remove a group of hooks.
    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('write')
    $P1.'remove_hook'('write')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    is($I0, 0, 'Remove: 3: Count ok.')

    ## Scenario 4: Remove a non-existent hook.
    $P2 = new ['ExceptionHandler']
    set_addr $P2, ATTACH_OK
    push_eh $P2

    $P1 = new ['InstrumentVtable'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'remove_hook'('init')

    ok(0, 'Remove: 4: Removing a non-existent hook did not throw exception.')

    goto ATTACH_END

    ATTACH_OK:
      ok(1, 'Remove: 4: Removing a non-existent hook threw exception.')
    ATTACH_END:
.end

.sub test_notification
    # Test that notifications work, a class that is defined/loaded at runtime
    #  is instrumented and also vtable overrides work.
    # In short, TestClass is only defined at runtime, has vtable overrides,
    #  and this tests all of it.
    # Uses Instrument::Event::Class.
    # Check:
    # 1. The event is raised.
    $P0 = new ['Instrument']
    $P1 = get_hll_global ['Instrument';'Event'], 'Class'
    $P2 = $P1.'new'()

    $P2.'inspect_class'('TestClass')
    $P2.'inspect_vtable'('init')
    $P2.'callback'('test_notification_cb')

    $P0.'attach'($P2)

    # Set the arg list.
    $S0  = 't/dynpmc/instrumentvtable-test1.pir'
    $P3 = new ['ResizableStringArray']
    push $P3, $S0

    # Prepare the globals.
    $P4 = new ['Hash']
    set_global '%notification', $P4

    $P0.'run'($S0, $P3)

    # Check that the callback was called.
    # Check that the event was fired.
    $P9 = get_global '%notification'

    # Event fired.
    $I0 = $P9['called']
    is($I0, 1, 'Event: Event fired.')

    # Test line.
    $I0 = $P9['line']
    is($I0, 2, 'Event: Line ok.')

    # Test file.
    $S0 = $P9['file']
    is($S0, 't/dynpmc/instrumentvtable-test1.pir', 'Event: File ok.')

    # Test sub.
    $S0 = $P9['sub']
    is($S0, 'main', 'Event: Sub ok.')

    # Test event.
    $P10 = $P9['event']
    $S0  = join '::', $P10
    is($S0, 'Class::TestClass::vtable::core::init', 'Event: Event ok')
.end

.sub test_notification_cb
    .param pmc data

    $P0 = get_global '%notification'
    $P0['called'] = 1

    $P1 = data['event']
    $P0['event']  = $P1

    $I0 = data['line']
    $P0['line']   = $I0

    $S0 = data['file']
    $P0['file']   = $S0

    $S0 = data['sub']
    $P0['sub']    = $S0
.end


## Helper: Find an item in the list.
.sub find_in_list
    .param pmc list
    .param pmc item

    $I0 = list

    TOP:
        dec $I0
        unless $I0 >= 0 goto END

        $P0 = list[$I0]
        if $P0 == item goto FOUND

        goto TOP
    END:

    # Not found.
    .return(0)

    FOUND:
    .return(1)
.end

# Helper sub: Check if 2 sets with unique items are the same.
.sub is_same_set
    .param pmc arr1
    .param pmc arr2
    .local pmc hash

    $I0 = arr1
    $I1 = arr2
    if $I0 != $I1 goto NO

    hash = new ['Hash']

    # Build the comparison hash
    $I3 = 0
    INSERT_LOOP:
      if $I3 >= $I0 goto END_INSERT_LOOP

      $S0       = arr1[$I3]
      hash[$S0] = 1

      inc $I3
      goto INSERT_LOOP
    END_INSERT_LOOP:

    # Check the contents of arr2
    $I3 = 0
    CHECK_LOOP:
      if $I3 >= $I0 goto END_CHECK_LOOP

      $S0 = arr2[$I3]
      $I4 = exists hash[$S0]

      if $I4 == 0 goto NO

      inc $I3
      goto CHECK_LOOP
    END_CHECK_LOOP:

    YES:
      .return(1)

    NO:
      .return(0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
