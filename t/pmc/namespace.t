#! parrot
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/namepspace.t - test NameSpace PMC

=head1 SYNOPSIS

    % prove t/pmc/namespace.t

=head1 DESCRIPTION

Tests the NameSpace PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(8)

    create_namespace_pmc()
    verify_namespace_type()
    get_global_opcode()
    get_sub_from_namespace_hash()
    get_namespace_from_sub()
.end

# L<PDD21/Namespace PMC API/=head4 Untyped Interface>
.sub 'create_namespace_pmc'
    push_eh eh1
    $P0 = new ['NameSpace']
    pop_eh
    ok(1, "Create new Namespace PMC")
    $I0 = does $P0, 'hash'
    ok($I0, "Namespace does hash")
    goto _end
  eh1:
    ok(0, "Could not create Namespace PMC")
    ok(0, "NameSpace does not does hash")
  _end:
.end

.sub 'verify_namespace_type'
    $P0 = get_global "Foo"
    typeof $S0, $P0
    is($S0, "NameSpace", "A NameSpace is a NameSpace")
.end

# L<PDD21//>
.sub 'get_global_opcode'
    push_eh eh1
    $P0 = get_global "bar"
    $S0 = $P0()
    pop_eh
    is($S0, "", "Can get_global a .sub")
    goto test2
  eh1:
    ok(0, "Cannot get_global a .sub")

  test2:
    push_eh eh2
    $P0 = get_global ["Foo"], "bar"
    $S0 = $P0()
    pop_eh
    is($S0, "Foo", "Get Sub from NameSpace")
    goto _end
  eh2:
    ok(0, "Cannot get Sub from NameSpace")
  _end:
.end

.sub 'get_sub_from_namespace_hash'
    $P0 = get_global "Foo"
    $P1 = $P0["bar"]
    $S0 = $P1()
    is($S0, "Foo", "Get the Sub from the NameSpace as a Hash")
.end

.sub 'get_namespace_from_sub'
    $P0 = get_global ["Foo"], "bar"
    $P1 = $P0."get_namespace"()
    $S0 = $P1
    is($S0, "Foo", "Get the namespace from a Sub in the NameSpace")

    $P0 = get_global "bar"
    $P1 = $P0."get_namespace"()
    $S0 = $P1
    is($S0, "parrot", "Get the root namespace from a sub in the root namespace")
.end


##### TEST NAMESPACES AND FUNCTIONS #####
# These functions and namespaces are used for the tests above

.namespace []

.sub 'bar'
    .return("")
.end

.namespace ["Foo"]
.sub 'bar'
    .return("Foo")
.end
