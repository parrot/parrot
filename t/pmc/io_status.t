#!perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/pmc/io_status.t - test the Status PMC described in PDD22

=head1 SYNOPSIS

    % prove t/pmc/io_status.t

=head1 DESCRIPTION

Tests the Status PMC described in PDD22.

=cut

# L<PDD22/Status Object PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new', todo => 'not yet implemented' );
.sub 'test' :main
    new P0, 'Status'
    say "ok 1 - $P0 = new 'Status'"
.end
CODE
ok 1 - $P0 = new 'Status'
OUT

# L<PDD22/Status Object PMC API/=item get_integer (vtable)>
pir_output_is( <<'CODE', <<'OUT', 'get_integer (vtable)', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new 'Status'

    # TODO test more return values
    # TODO figure out how to set the values to make testing possible
    $I0 = $P0

    if $I0 == 1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $I0 = $P1 # success'

    if $I0 == 0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $I0 = $P1 # still running'

    if $I0 == -1 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $I0 = $P1 # failure
.end
CODE
ok 1 - $I0 = $P0 # success
ok 2 - $I0 = $P0 # still running
ok 3 - $I0 = $P0 # failure
OUT

# L<PDD22/Status Object PMC API/=item get_bool (vtable)>
pir_output_is( <<'CODE', <<'OUT', 'get_bool (vtable)', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new 'Status'

    # TODO figure out how to set the values to make testing possible

    if $P0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $P0 # success'

    if $P0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $P0 # still running'

    unless $P0 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $P0 # failure
.end
CODE
ok 1 - $P0 # success
ok 2 - $P0 # still running
ok 3 - $P0 # failure
OUT

# L<PDD22/Status Object PMC API/=item return>
pir_output_is( <<'CODE', <<'OUT', 'return', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new 'Status'

    # TODO test all return values
    # TODO figure out how to set the values to make testing possible

    $P1 = $P0.return()

    if $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $P0 = $P1.return() # success'

    # TODO test return value is expected value

    if null $P1 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $P0 = $P1.return() # still running'

    if null $P1 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $P0 = $P1.return() # no return value
.end
CODE
ok 1 - $P0 = $P1.return() # success
ok 2 - $P0 = $P1.return() # still running
ok 3 - $P0 = $P1.return() # no return value
OUT

# L<PDD22/Status Object PMC API/=item error>
pir_output_is( <<'CODE', <<'OUT', 'error', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new 'Status'

    # TODO test all error values
    # TODO figure out how to set the values to make testing possible

    $P1 = $P0.error()

    if null $P1 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $P0 = $P1.error() # success'

    $P1 = $P0.error() # need still running here

    if null $P1 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $P0 = $P1.error() # still running'

    $P1 = $P0.error() # need real error here

    unless null $P1 goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $P0 = $P1.error() # got an error'

    $I0 = isa $P1, 'Exception'
    if $I0 goto ok_4
    print 'not '
  ok_4:
    say 'ok 4 - $P0 = $P1.error() # error isa Exception'

    # TODO test error value is expected value

    $P1 = $P0.error() # need no error here

    if null $P1 goto ok_5
    print 'not '
  ok_5:
    say 'ok 5 - $P0 = $P1.error() # no error
.end
CODE
ok 1 - $P0 = $P1.error() # success
ok 2 - $P0 = $P1.error() # still running
ok 3 - $P0 = $P1.error() # got an error
ok 4 - $P0 = $P1.error() # error isa Exception
ok 5 - $P0 = $P1.error() # no error
OUT

# L<PDD22/Status Object PMC API/=item throw>
pir_output_is( <<'CODE', <<'OUT', 'throw', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new 'Status'

    # TODO figure out how to set the values to make testing possible

    push_eh eh_no_error
    $P0.throw()
    pop_eh eh_no_error

    say 'ok 1 - $P0.throw() # no error'

  test_2:
    $P0 = new 'Status' # need error here

    push_eh eh_error
    $P0.throw()
    pop_eh

    say 'not ok 2 - $P0.throw() # error'

    goto end

  eh_no_error:
    say 'not ok 1 - $P0.throw() # no error'
    goto test_2

  eh_error:
    say 'ok 2 - $P0.throw() # error'

  end:
.end
CODE
ok 1 - $P1.throw() # no error
ok 2 - $P1.throw() # error
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
