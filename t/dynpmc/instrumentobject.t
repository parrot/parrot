#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id: instrumentvtable.t 48171 2010-07-24 16:24:39Z khairul $

=head1 NAME

t/dynpmc/instrumentobject.t - test the InstrumentObject dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrumentobject.t

=head1 DESCRIPTION

Tests instrumenting per object as provided by InstrumentObject.
InstrumentObject inherits from InstrumentClass, and theoretically,
any instrumentation on this object will only affect this object.

=cut

.include 'call_bits.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(6)

    setup()
    test_notification()
    cleanup()

    .return()
.end


.sub setup
    # Create a simple program to test that events are raised.
    .local string program
    program = <<'PROG'
.sub main :main
    $P0 = new ['TestClass'] # To instrument.
    $P1 = new ['TestClass'] # Control, not instrumented
    $P0.'test'()
    $P1.'test'()
.end

.namespace ['TestClass']
.sub '' :anon :init :load
    $P0 = newclass ['TestClass']
.end

# Test methods.
.sub test :method
    # Do nothing.
.end

PROG

    # Write to file.
    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'('t/dynpmc/instrumentobject-test1.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/dynpmc/instrumentobject-test1.pir')
.end

.sub test_notification
    # Test if notifications is raised only for the object that is instrumented.
    # Check:
    # 1. Event is raised.
    # 2. The event is of type Object::address::method::Method_Name
    # 3. The class event still fires.
    $P0 = new ['Instrument']
    $P2 = $P0.'instrument_op'()

    $P2.'catchall'(1)
    $P2.'callback'('test_notification_probe_cb')
    $P0.'attach'($P2)

    $P4 = get_hll_global ['Instrument';'Event'], 'Class'
    $P5 = $P4.'new'()

    $P5.'inspect_class'('TestClass')
    $P5.'inspect_method'('test')
    $P5.'callback'('test_notification_class_cb')
    $P0.'attach'($P5)

    $P3 = new ['ResizableStringArray']
    push $P3, 't/dynpmc/instrumentobject-test1.pir'
    $S0 = $P3[0]

    # Prepare the globals.
    $P6 = new ['Hash']
    set_global '%notification', $P6
    $P7 = box 0
    set_global '$class_event', $P7

    $P0.'run'($S0, $P3)

    # Check that the callback was called.
    # Check that the event was fired.
    $P9 = get_global '%notification'

    # Event fired.
    $I0 = $P9['called']
    is($I0, 1, 'Event: Event fired.')

    # Test line.
    $I0 = $P9['line']
    is($I0, 4, 'Event: Line ok.')

    # Test file.
    $S0 = $P9['file']
    is($S0, 't/dynpmc/instrumentobject-test1.pir', 'Event: File ok.')

    # Test sub.
    $S0 = $P9['sub']
    is($S0, 'main', 'Event: Sub ok.')

    # Test event.
    $P12 = new ['ResizableStringArray']
    $P11 = get_global '$notification_object'
    push $P12, 'Object'
    push $P12, $P11
    push $P12, 'method'
    push $P12, 'test'
    $P10 = $P9['event']
    $S0  = $P10
    $S1  = $P12
    is($S0, $S1, 'Event: Event ok')

    # Check that the class event still fires.
    $P12 = get_global '$class_event'
    $I0  = $P12
    is($I0, 1, 'Event: Class event still fires.')
.end

.sub test_notification_class_cb
    $P0 = get_global '$class_event'
    $P0 = 1
.end

.sub test_notification_probe_cb
    .param pmc op
    .param pmc instr
    .param pmc probe

    # Look for op 'new'
    # Returns the invokable if new is found.
    # Invokable will disable the catchall probe
    #  and instrument the object.
    $S0 = op.'family'()
    if $S0 == 'new' goto INSTRUMENT
    .return()

    INSTRUMENT:

      $P0 = get_global 'test_notification_probe_instrument_obj'
      .return($P0)
.end

.sub test_notification_probe_instrument_obj
    .param pmc op
    .param pmc instr
    .param pmc probe

    # new op is found.
    # Disable the probe and instrument the object.
    # Object will now be in the register pointed to by the first argument.
    probe.'disable'()

    # Get the object.
    $P0 = op.'get_arg'(0)

    # Instrument the object.
    $P1  = instr.'instrument_object'($P0)
    $P1.'inspect_method'('test')
    $P1.'callback'('test_notification_cb')
    instr.'attach'($P1)

    # Build up the event string.
    $P2 = new ['ResizableStringArray']
    $S0 = $P1.'get_address'()
    push $P2, 'Object'
    push $P2, $S0
    push $P2, 'method'
    push $P2, 'test'
    $S1 = join '::', $P2

    $P9 = box $S0
    set_global '$notification_object', $P9
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
