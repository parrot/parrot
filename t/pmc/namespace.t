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
    plan(4)

    create_namespace_pmc()
    namespace_does_hash()
    get_global_function()
    verify_namespace_type()
.end

.sub 'create_namespace_pmc'
    push_eh eh
    $P0 = new ['NameSpace']
    pop_eh
    ok(1, "Create new Namespace PMC")
    goto end
  eh:
    ok(0, "Could not create Namespace PMC")
  end:
.end

# L<PDD21/Namespace PMC API/=head4 Untyped Interface>
.sub 'namespace_does_hash'
    new $P0, ['NameSpace']
    $I0 = does $P0, 'hash'
    ok($I0, "Namespace does hash")
.end

# L<PDD21//>
.sub 'get_global_function'
    push_eh eh
    $P0 = get_global "get_global_function_bar"
    $I0 = $P0()
    ok($I0, "Can get_global a .sub")
    goto _end
  eh:
    ok(0, "Cannot get_global a .sub")
  _end:
.end

.sub 'get_global_function_bar'
    .return(1)
.end

.sub 'verify_namespace_type'
    $P0 = get_global "verify_namespace_Foo"
    typeof $S0, $P0
    is($S0, "NameSpace", "A NameSpace is a NameSpace")
.end

.namespace ["verify_namespace_Foo"]
.sub 'bar'
    noop
.end
