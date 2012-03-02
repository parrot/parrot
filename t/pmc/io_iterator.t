#!perl
# Copyright (C) 2006-2007, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/io_iterator.t - test the I/O Iterator PMC described in PDD22

=head1 SYNOPSIS

    % prove t/pmc/io_iterator.t

=head1 DESCRIPTION

Tests the I/O Iterator PMC described in PDD22.

=cut

# L<PDD22/I\/O Iterator PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new', todo => 'not yet implemented' );
.sub 'test' :main
    $P99 = 1 # GH #633 replace with io object
    $P0 = iter $P99
    say "ok 1 - $P0 = iter $P1"
.end
CODE
ok 1 - $P0 = iter $P1
OUT

# L<PDD22/I\/O Iterator PMC API/=item shift>
pir_output_is( <<'CODE', <<'OUT', 'shift', todo => 'not yet implemented: GH #549' );
.sub 'test' :main
    $P99 = 1 # GH #633 replace with io object
    $P0 = iter $P99

    $S0 = shift $P0

    if $S0 == 'abc' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = shift $P1 # success'

    # GH #549  test more return values, including end of file
.end
CODE
ok 1 - $I0 = shift $P1 # success
OUT

# L<PDD22/I\/O Iterator PMC API/=item get_bool (vtable)>
pir_output_is( <<'CODE', <<'OUT', 'get_bool (vtable)', todo => 'not yet implemented' );
.sub 'test' :main
    $P99 = 1 # GH #633 replace with io object
    $P0 = iter $P99

    # empty i/o object
    unless $P0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $P0 # empty i/o object returns false'

    # GH #633 setup i/o object with two lines
    if $P0 got ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $P0 # i/o object with data returns true

    $S0 = shift $P0
    $I0 = length $S0
    unless $I0 goto nok_3
    if $P0 goto ok_3

  nok_3:
    print 'not '
  ok_3:
    say 'ok 3 - $P0 # i/o object with more data returns true'

    $S0 = shift $P0
    $I0 = length $S0
    unless $I0 goto nok_4
    unless $P0 goto ok_4

  nok_4:
    print 'not '
  ok_4:
    say 'ok 4 - $P0 # i/o object with no more data returns false'

    if $P0 goto ok_1
    print 'not '
.end
CODE
ok 1 - $P0 # empty i/o object returns false
ok 2 - $P0 # i/o object with data returns true
ok 3 - $P0 # i/o object with more data returns true
ok 4 - $P0 # i/o object with no more data returns false
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
