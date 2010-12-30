#!./parrot
# Copyright (C) 2006-2008, Parrot Foundation.

=head1 NAME

t/pmc/parrotlibrary.t - test the ParrotLibrary PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotlibrary.t

=head1 DESCRIPTION

Tests the ParrotLibrary PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(2)

    new $P0, ['ParrotLibrary']
    ok(1, 'Instantiated a ParrotLibrary PMC')

    set_addr $P0, 123

    push_eh broken_clone
        $P1 = clone $P0
    pop_eh
    goto end
  
  broken_clone:
    nok(1, "ParrotLibrary Clone fails")
  
  end:
    ok (1,"Parrot Clone OK")
    null $P0
    sweep 1
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
