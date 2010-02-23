#! parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
