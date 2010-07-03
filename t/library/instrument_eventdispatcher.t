#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/instrument_eventdispatcher.t - test the EventDispatcher used by Instrument.

=head1 SYNOPSIS

        % prove t/library/instrument_eventlibrary.t

=head1 DESCRIPTION

Tests the workings of EventDispatcher used by instruments.
Ensure that it dispatches correctly based on category, subtype and fulltype.

=cut

.include 'except_severity.pasm'
.include 'except_types.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(18)

    test_register()
    test_deregister()
    test_handlers()

    .return()
.end

.sub test_register
    .local pmc dispatcher, dispatcher_class

    dispatcher_class = get_hll_global ['Instrument'], 'EventDispatcher'
    dispatcher       = dispatcher_class.'new'()
    addhandler dispatcher

    ## Test that handlers are registered.
    #  3 scenarios: 1. Category.
    #               2. Group.
    #               3. Specific.

    # Test specific.
    # Sample: Test::Test2::Test3
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test::Test2::Test3', $P0)

    $P1 = dispatcher.'get_handlers'('Test::Test2::Test3')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 1, 'Register: Specific count ok.')
    is($S0, 'stub_handler', 'Register: Specific name ok.')

    dispatcher.'deregister'('Test::Test2::Test3', $P0)

    # Test group.
    # Handler registered for group should appear in the
    #  list of handlers for specific.
    # Sample: Register to Test::Test2.
    #         Ask for Test::Test2::Test3
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test::Test2', $P0)

    $P1 = dispatcher.'get_handlers'('Test::Test2::Test3')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 1, 'Register: Group count ok.')
    is($S0, 'stub_handler', 'Register: Group name ok.')

    dispatcher.'deregister'('Test::Test2', $P0)

    # Test category.
    # Handler registered for category should appear in the
    #  list of handlers for group and specific.
    # Sample: Register to Test
    #         Ask for Test::Test2 and Test::Test2::Test3
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test', $P0)

    $P1 = dispatcher.'get_handlers'('Test::Test2::Test3')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 1, 'Register: (Specific) Category count ok.')
    is($S0, 'stub_handler', 'Register: (Specific) Category name ok.')

    $P1 = dispatcher.'get_handlers'('Test::Test2')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 1, 'Register: (Group) Category count ok.')
    is($S0, 'stub_handler', 'Register: (Group) Category name ok.')

    dispatcher.'deregister'('Test', $P0)
.end

.sub test_deregister
    .local pmc dispatcher, dispatcher_class

    dispatcher_class = get_hll_global ['Instrument'], 'EventDispatcher'
    dispatcher       = dispatcher_class.'new'()
    addhandler dispatcher

    # Test simple removal.
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)

    $P1 = dispatcher.'get_handlers'('Test')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 0, 'Deregister: (Category) Simple removal count ok.')

    dispatcher.'register'('Test::Test2', $P0)
    dispatcher.'deregister'('Test::Test2', $P0)

    $P1 = dispatcher.'get_handlers'('Test::Test2')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 0, 'Deregister: (Group) Simple removal count ok.')

    dispatcher.'register'('Test::Test2::Test3', $P0)
    dispatcher.'deregister'('Test::Test2::Test3', $P0)

    $P1 = dispatcher.'get_handlers'('Test::Test2::Test3')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 0, 'Deregister: (Specific) Simple removal count ok.')

    # Test add 2 and remove 1 of the same handler.
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test', $P0)
    dispatcher.'register'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)

    $P1 = dispatcher.'get_handlers'('Test')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 1, 'Deregister: Double add and single removal count ok.')
    is($S0, 'stub_handler', 'Deregister: Double add and single removal name ok.')

    dispatcher.'deregister'('Test', $P0)

    # Test add 2 and remove 2 of the same handler.
    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test', $P0)
    dispatcher.'register'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)

    $P1 = dispatcher.'get_handlers'('Test')
    $I0 = $P1
    $S0 = $P1[0]
    is($I0, 0, 'Deregister: Double add and removal count ok.')

    # Test add 1 and remove 2.
    .local pmc eh
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.CONTROL_ERROR, .CONTROL_EXIT)
    eh.'min_severity'(.EXCEPT_NORMAL)
    eh.'max_severity'(.EXCEPT_EXIT)
    set_addr eh, DOUBLE_REMOVAL_OK
    push_eh eh

    $P0 = get_global 'stub_handler'
    dispatcher.'register'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)
    dispatcher.'deregister'('Test', $P0)

    ok(0, 'Deregister: Double removal not ok.')
    goto DOUBLE_REMOVAL_END

    DOUBLE_REMOVAL_OK:
      ok(1, 'Deregister: Double removal ok.')

    DOUBLE_REMOVAL_END:

    # Done
.end

.sub test_handlers
    .local pmc dispatcher, dispatcher_class

    dispatcher_class = get_hll_global ['Instrument'], 'EventDispatcher'
    dispatcher       = dispatcher_class.'new'()
    addhandler dispatcher

    ## Test that the handlers are called.
    #  Events are listed hierarchially, in the manner Category::Group::Specific.
    #  Handlers can be registered to handle any event in a Category, Category::Group,
    #   or only specific events.
    #  So we test the three scenarios here.

    # Set up callbacks for the following event:
    # Category::Group::Specific
    $P0 = get_global 'handler_category'
    dispatcher.'register'('Category', $P0)

    $P0 = get_global 'handler_group'
    dispatcher.'register'('Category::Group', $P0)

    $P0 = get_global 'handler_specific'
    dispatcher.'register'('Category::Group::Specific', $P0)

    # Prepare globals for test results.
    $P0 = new ['Integer']
    $P1 = new ['Integer']
    $P2 = new ['Integer']
    $P0 = 0
    $P1 = 0
    $P2 = 0
    set_global '$handler_category', $P0
    set_global '$handler_group',    $P1
    set_global '$handler_specific', $P2

    # Raise the event.
    $P0 = new ['Hash']
    $P0['event_category'] = 'Category'
    $P0['event_subtype']  = 'Group'
    $P0['event_fulltype'] = 'Specific'
    $P0['otherdata']      = 'Can be anything else'

    $P1 = new ['Hash']
    $P1['type']    = 'event'
    $P1['subtype'] = 'Instrument'
    $P1['data']    = $P0

    $P2 = new ['Task'], $P1
    schedule $P2

    # Check the results.
    $P0 = get_global '$handler_category'
    $P1 = get_global '$handler_group'
    $P2 = get_global '$handler_specific'
    ok($P0, 'Handler: Category handler called.')
    ok($P1, 'Handler: Group handler called.')
    ok($P2, 'Handler: Specific handler called.')
.end

.sub handler_category
    $P0 = get_global '$handler_category'
    $P0 = 1
.end

.sub handler_group
    $P0 = get_global '$handler_group'
    $P0 = 1
.end

.sub handler_specific
    $P0 = get_global '$handler_specific'
    $P0 = 1
.end

# Stub handler.
.sub stub_handler
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
