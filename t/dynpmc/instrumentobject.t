#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

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

    plan(8)

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
    $P0 = new ['TestClass']  # To instrument.
    $P1 = new ['TestClass']  # Control, not instrumented.
    $P2 = new ['TestClass2'] # Test inheritance.

    $P0.'test'(10)
    $P1.'test'(20)
    $P2.'test'(30)

    $P0 = 100
    $P1 = 200
    $P2 = 300
.end

.namespace ['TestClass']
.sub '' :anon :init :load
    $P0 = subclass ['Integer'], ['TestClass']
.end

# Test methods.
.sub test :method
    .param int foo
    # Do nothing.
.end

.namespace ['TestClass2']
.sub '' :anon :init :load
    $P0 = subclass ['TestClass'], ['TestClass2']
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
    # 4. When a subclass's instance invokes parent's method, it also fires.
    # 5. Vtable instrumentation on the object only applies to the object itself.
    $P0 = new ['Instrument']
    $P2 = $P0.'instrument_op'()

    $P2.'catchall'(1)
    $P2.'callback'('test_notification_probe_cb')
    $P0.'attach'($P2)

    $P5 = $P0.'instrument_class'('TestClass')
    $P5.'inspect_method'('test')
    $P5.'callback'('test_notification_class_cb')
    $P0.'attach'($P5)

    $P3 = new ['ResizableStringArray']
    push $P3, 't/dynpmc/instrumentobject-test1.pir'
    $S0 = $P3[0]

    # Prepare the globals.
    $P6 = new ['Hash']
    set_global '%notification', $P6
    $P7 = new ['Hash']
    set_global '%class_event', $P7
    $P8 = box 0
    set_global '$object_vtable', $P8

    $P0.'run'($S0, $P3)

    # Check that the callback was called.
    # Check that the event was fired.
    $P9 = get_global '%notification'

    # Event fired.
    $I0 = $P9['called']
    is($I0, 1, 'Event: Event fired.')

    # Test line.
    $I0 = $P9['line']
    is($I0, 6, 'Event: Line ok.')

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
    $P12 = get_global '%class_event'
    $I0  = $P12['TestClass']
    is($I0, 2, 'Event: Class method event for TestClass fires as expected.')
    $I0  = $P12['TestClass2']
    is($I0, 1, 'Event: Class method event for TestClass2 fires as expected.')

    # Check that the vtable event is only called once.
    $P12 = get_global '$object_vtable'
    $I0 = $P12
    is($I0, 1, 'Event: Vtable event for object fires as expected.')
.end

.sub test_notification_class_cb
    .param pmc data
    .param pmc instr
    .param pmc probe

    $P1 = data['invocant']
    $S0 = typeof $P1

    $P0 = get_global '%class_event'
    $I0 = $P0[$S0]
    inc $I0
    $P0[$S0] = $I0
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

    $P2 = instr.'instrument_object'($P0)
    $P2.'inspect_vtable'('set_integer_native')
    $P2.'callback'('test_vtable_notification_cb')
    instr.'attach'($P2)

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

.sub test_vtable_notification_cb
    $P0 = get_global '$object_vtable'
    inc $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
