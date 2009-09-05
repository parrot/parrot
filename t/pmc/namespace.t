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
    plan(1)

    create_namespace_pmc()
.end

.sub 'create_namespace_pmc'
    push_eh eh
    $P0 = new ['NameSpace']
    pop_eh
    ok(1, "Create new Namespace PMC")
    goto _end
  eh:
    ok(0, "Could not create Namespace PMC")
  _end:
.end