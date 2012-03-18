#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/pir/interop.t - Tests for HLL interoperability from PIR

=head1 SYNOPSIS

    % prove t/pir/macro.t

=head1 DESCRIPTION

Tests for HLL interoperability from PIR.

=cut


.sub main :main
    .include 'test_more.pir'
    plan(3)

    $P0 = load_language 'parrot'
    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:
    $P0.'mark_initialized'('load')

    ok(1, 'loaded parrot language')
    .local pmc c
    c = compreg 'parrot'
    $P0 = get_class [ 'Parrot'; 'Compiler' ]
    isa_ok(c, $P0)

    c.'export'('foo bar')
    ok(1, 'can call export on parrot compiler')

.end

.sub foo
.end

.sub bar
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

