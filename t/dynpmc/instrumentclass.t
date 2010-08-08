#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id: instrumentvtable.t 48171 2010-07-24 16:24:39Z khairul $

=head1 NAME

t/dynpmc/instrumentclass.t - test the InstrumentClass dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrumentvtable.t

=head1 DESCRIPTION

Tests the method notification interface provided by the InstrumentClass pmc.
InstrumentClass inherits from InstrumentVtable, so we would only be
testing method-related methods of InstrumentClass.

=cut

.include 'call_bits.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(39)

    setup()
    test_creation()
    test_attaching()
    test_insertion()
    test_removal()
    test_notification_vtable()
    test_insertion()
    test_removal()
    test_notification_methods()
    cleanup()

    .return()
.end


.sub setup
    # Create a simple program to test that events are raised.
    .local string program
    program = <<'PROG'
.sub main :main
    $P0 = new ['TestClass']
    $P0.'test'()
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

# Test methods.
.sub test :method
    # Do nothing.
.end

PROG

    # Write to file.
    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'('t/dynpmc/instrumentclass-test1.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/dynpmc/instrumentclass-test1.pir')
.end

.sub test_creation
    # InstrumentClass is supposed to be instantiated with
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

    $P2 = new ['InstrumentClass']

    ok(0, 'Creation: Init did not throw exception.')

    goto INIT_END

    INIT_OK:
      ok(1, 'Creation: Init threw exception.')
    INIT_END:

    ## Scenario 2: Call init_pmc.
    $P3 = new ['InstrumentClass'], $P0
    $I0 = isa $P3, 'InstrumentClass'
    is($I0, 1, 'Creation: init_pmc successful.')
.end

.sub test_attaching
    # Test attaching an InstrumentClass instance to a class.
    # Check:
    # 1. Attaching to an exisiting class is fine.
    $P0 = new ['Instrument']

    ## Scenario 1: Attach to an existing class (Sub)
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    ok(1, 'Attach: Existing class ok.')
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
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Insert: 1: Count ok.')
    is($S0, 'init', 'Insert: 1: Name ok.')

    ## Scenario 2: Insert 1 hook twice.
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'insert_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Insert: 2: Count ok.')
    is($S0, 'init', 'Insert: 2: Name ok.')

    ## Scenario 3: Insert 2 different hooks.
    $P1 = new ['InstrumentClass'], $P0
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
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('math')
    $P2 = $P1.'get_instrumented_list'()
    $P3 = $P1.'get_hook_list'('math')

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
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('init')
    $P1.'remove_hook'('init')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    is($I0, 0, 'Remove: 1: Count ok.')

    ## Scenario 2: Remove a hook inserted twice.
    $P1 = new ['InstrumentClass'], $P0
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
    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'insert_hook'('math')
    $P1.'remove_hook'('math')
    $P2 = $P1.'get_instrumented_list'()

    $I0 = $P2
    is($I0, 0, 'Remove: 3: Count ok.')

    ## Scenario 4: Remove a non-existent hook.
    $P2 = new ['ExceptionHandler']
    set_addr $P2, ATTACH_OK
    push_eh $P2

    $P1 = new ['InstrumentClass'], $P0
    $P1.'attach_to_class'('Sub')
    $P1.'remove_hook'('init')

    ok(0, 'Remove: 4: Removing a non-existent hook did not throw exception.')

    goto ATTACH_END

    ATTACH_OK:
      ok(1, 'Remove: 4: Removing a non-existent hook threw exception.')
    ATTACH_END:
.end

.sub test_insertion
    # Test insertion a method hook.
    # ResizablePMCArray has a push method.
    # Check:
    # 1. We can insert a hook for the method.
    # 2. Inserting on a non-existent method raises an exception.
    $P0 = new ['Instrument']

    ## Scenario 1: Insert a method hook.
    $P1 = $P0.'instrument_class'('ResizablePMCArray')
    $P1 = getattribute $P1, '$!hook_obj'

    $P1.'insert_method_hook'('push')
    $P2 = $P1.'get_instrumented_method_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Insert: 1: Count ok.')
    is($S0, 'push', 'Insert: 1: Name ok.')

    ## Scenario 2: Insert a non-existent hook.
    $P3 = new ['ExceptionHandler']
    set_addr $P3, INSERT_OK
    push_eh $P3

    $P1.'insert_method_hook'('pusha')

    ok(0, 'Insert: 2: Inserting a hook to a non-existent method did not throw exception.')

    goto INSERT_END

    INSERT_OK:
      ok(1, 'Insert: 2: Inserting a hook to a non-existent method threw exception.')
    INSERT_END:
.end

.sub test_removal
    # Test removing a method hook.
    # Check:
    # 1. Removal is ok.
    # 2. Insert twice and remove once the hook is still in place.
    # 3. Insert once and remove twice throws an exception.
    # 4. Try to remove a non-existent hook throws exception.
    $P0 = new ['Instrument']
    $P1 = $P0.'instrument_class'('ResizablePMCArray')
    $P1 = getattribute $P1, '$!hook_obj'

    ## Scenario 1: Insert once and remove once.
    $P1.'insert_method_hook'('push')
    $P1.'remove_method_hook'('push')

    $P2 = $P1.'get_instrumented_method_list'()

    $I0 = $P2
    is($I0, 0, 'Remove: 1: Count ok.')

    ## Scenario 2: Insert twice and remove once.
    $P1.'insert_method_hook'('push')
    $P1.'insert_method_hook'('push')
    $P1.'remove_method_hook'('push')

    $P2 = $P1.'get_instrumented_method_list'()

    $I0 = $P2
    $S0 = $P2[0]
    is($I0, 1, 'Remove: 2: Count ok.')
    is($S0, 'push', 'Remove: 2: Name ok.')

    # Cleanup, remove the existing hook.
    $P1.'remove_method_hook'('push')

    ## Scenario 3: Insert once and remove twice.
    $P3 = new ['ExceptionHandler']
    set_addr $P3, TOO_MANY_OK
    push_eh $P3

    $P1.'insert_method_hook'('push')
    $P1.'remove_method_hook'('push')
    $P1.'remove_method_hook'('push')

    ok(0, 'Remove: 3: Removing a hook too many times did not throw an exception.')

    goto TOO_MANY_END

    TOO_MANY_OK:
        ok(1, 'Remove: 3: Removing a hook too many times threw an exception.')
    TOO_MANY_END:

    ## Scenario 4: Remove a non-existing hook.
    $P3 = new ['ExceptionHandler']
    set_addr $P3, NON_EXIST_OK
    push_eh $P3

    $P1.'remove_method_hook'('pusha')

    ok(0, 'Remove: 4: Removing a non-existing hook did not throw an exception.')

    goto NON_EXIST_END

    NON_EXIST_OK:
        ok(1, 'Remove: 4: Removing a non-existing hook threw an exception.')
    NON_EXIST_END:
.end

.sub test_notification_vtable
    # Test that notifications work, a class that is defined/loaded at runtime
    #  is instrumented and also vtable overrides work.
    # In short, TestClass is only defined at runtime, has vtable overrides,
    #  and this tests all of it.
    # Uses Instrument::Event::Class.
    # Check:
    # 1. The event is raised.
    $P0 = new ['Instrument']
    $P2 = $P0.'instrument_class'('TestClass')
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
    is($I0, 1, 'Vtable: Event fired.')

    # Test line.
    $I0 = $P9['line']
    is($I0, 2, 'Vtable: Line ok.')

    # Test file.
    $S0 = $P9['file']
    is($S0, 't/dynpmc/instrumentvtable-test1.pir', 'Vtable: File ok.')

    # Test sub.
    $S0 = $P9['sub']
    is($S0, 'main', 'Vtable: Sub ok.')

    # Test event.
    $P10 = $P9['event']
    $S0  = join '::', $P10
    is($S0, 'Class::TestClass::vtable::main::init', 'Vtable: Event ok')
.end

.sub test_notification_methods
    # Test if notification is raised after a method is instrumented.
    # Check:
    # 1. Event is raised.
    # 2. The event is of type Class::Class_Name::method::Method_Name
    $P0 = new ['Instrument']

    $P2 = $P0.'instrument_class'('TestClass')
    $P2.'inspect_method'('test')
    $P2.'callback'('test_notification_cb')

    $P0.'attach'($P2)

    $P3 = new ['ResizableStringArray']
    push $P3, 't/dynpmc/instrumentclass-test1.pir'
    $S0 = $P3[0]

    # Prepare the globals.
    $P4 = new ['Hash']
    set_global '%notification', $P4

    $P0.'run'($S0, $P3)

    # Check that the callback was called.
    # Check that the event was fired.
    $P9 = get_global '%notification'

    # Event fired.
    $I0 = $P9['called']
    is($I0, 1, 'Method: Event fired.')

    # Test line.
    $I0 = $P9['line']
    is($I0, 3, 'Method: Line ok.')

    # Test file.
    $S0 = $P9['file']
    is($S0, 't/dynpmc/instrumentclass-test1.pir', 'Method: File ok.')

    # Test sub.
    $S0 = $P9['sub']
    is($S0, 'main', 'Method: Sub ok.')

    # Test event.
    $P10 = $P9['event']
    $S0  = join '::', $P10
    is($S0, 'Class::TestClass::method::test', 'Method: Event ok')

.end

.sub test_notification_cb
    .param pmc data
    .param pmc instr
    .param pmc probe

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
