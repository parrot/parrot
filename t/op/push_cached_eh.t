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
    'test_handle_twice'()

    'done_testing'()
.end

.sub "test_handle"
    push_cached_eh catch

    $P0 = new ["Exception"]
    throw $P0
    nok("Not caught")

    .return()

  catch:
    pop_eh
    ok("Caught in simple case")
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
    nok("Exception not caught")
    .return()

  catch:
    pop_eh
    ok(desc)
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
