#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/op/push_cached_eh.t - Test .annotate directive

=head1 SYNOPSIS

    % prove t/op/push_cached_eh.t

=head1 DESCRIPTION

Test various use cases of the push_cached_eh opcode.

=cut

.include "except_types.pasm"

.sub main :main
    .include 'test_more.pir'

    'test_handle'()
    'test_handle'() # Call second time
    'test_handle_twice'()

    'test_handle_typed'()
    'test_handle_typed'() # Call second time

    'done_testing'()
.end

.sub "test_handle"
    push_cached_eh catch

    $P0 = new ["Exception"]
    throw $P0
    nok(1, "Not caught")

    .return()

  catch:
    pop_eh
    ok(1, "Caught in simple case")
    .return()
.end

.sub "test_handle_typed"
    push_cached_eh .CONTROL_RETURN, catch

    $P0 = new ["Exception"]
    $P0["type"] = .CONTROL_RETURN
    throw $P0
    nok(1, "Not caught")

    goto try_again

  catch:
    pop_eh
    ok(1, "Caught typed")


  try_again:
    push_cached_eh .CONTROL_RETURN, catch_typed
    push_cached_eh .CONTROL_ERROR, catch_untyped

    $P0 = new ["Exception"]
    $P0["type"] = .CONTROL_RETURN
    throw $P0
    nok(1, "Not caught")
    .return()

  catch_untyped:
    pop_eh
    nok(1, "Caught wrong exception")
    .return()

  catch_typed:
    pop_eh
    ok(1, "Caught correct exception")
    .return()



    .return()
.end


.sub "test_handle_twice"
    diag("First")
    "_catch_untyped"("Caught first", "first")
    diag("Second")
    "_catch_untyped"("Caught second", "second")
.end

.sub '_throw'
    .param pmc payload
    $P0 = new ['Exception']
    $P0["type"]    = .CONTROL_RETURN
    $P0["payload"] = payload

    throw $P0
.end

.sub "_catch_untyped"
    .local string desc
    .local string payload

    push_cached_eh catch
    "_throw"(payload)
    nok(1, "Exception not caught")
    .return()

  catch:
    pop_eh
    ok(1, desc)
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
