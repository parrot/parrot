#! parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id: fixedpmcarray.t 42684 2009-11-21 13:40:19Z jkeenan $

=head1 NAME

t/pmc/opcode.t - Opcode PMC

=head1 SYNOPSIS

    % prove t/pmc/opcode.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)
    cannot_create_directly()
.end

.sub cannot_create_directly
    push_eh cannot_create
    $P0 = new ['Opcode']
    ok(0, "shouldn't be able to create new opcode")
    goto create_end
  cannot_create:
    ok(1)
  create_end:
.end
