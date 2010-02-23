#! parrot
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/attributes.t - Test OO attributes

=head1 SYNOPSIS

    % prove t/oo/attributes.t

=head1 DESCRIPTION

Tests OO features related to adding and removing attributes.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(3)

    remove_1()
.end

.sub remove_1
    .local pmc class, object, init_hash
    .local pmc exception, message

    init_hash = new 'Hash'
    $P1 = new 'String'
    $P1 = 'data for Foo'
    init_hash['data'] = $P1

    # First pass, adding an attribute.
    class = newclass "Foo"
    addattribute class, 'data'
    object = new class, init_hash
    $P2 = getattribute object, 'data'
    is($P2, 'data for Foo', 'class attribute retrieved via the instance')

    # Second pass, removing the attribute after adding it.
    class = newclass "Bar"
    addattribute class, 'data'
    removeattribute class, 'data'
    push_eh catch_bad_attr_init
    object = new class, init_hash
    pop_eh
    ok(0)

  try_access:
    object = new class
    push_eh catch_bad_attr_access
    $P2 = getattribute object, 'data'
    pop_eh
    ok(0)

    end

  catch_bad_attr_init:
    .get_results (exception)
    message = exception
    is(message, "No such attribute 'data'", 'class attribute deleted')
    pop_eh
    goto try_access

  catch_bad_attr_access:
    .get_results (exception)
    message = exception
    is(message, "No such attribute 'data'", 'class attribute deleted')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
