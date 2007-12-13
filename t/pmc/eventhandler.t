#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/eventhandler.t - Parrot Event Handling

=head1 SYNOPSIS

    % prove t/pmc/eventhandler.t

=head1 DESCRIPTION

Tests the EventHandler PMC used by the event system.

=cut

pir_output_is( <<'CODE', <<'OUT', "create an event and set attributes" );
  .sub main :main
    .local pmc eh
    eh  = new 'EventHandler'
    $S0 = typeof eh
    say $S0

    .local pmc init
    init = new 'Hash'

    .local pmc type
    type         = new 'String'
    type         = 'cool event'
    init['type'] = type

    .local pmc priority
    priority         = new 'Integer'
    priority         = 10
    init['priority'] = priority

    .local pmc code
    code         = find_global 'my_handler'
    init['code'] = code

    eh  = new 'EventHandler', init
    $S0 = typeof eh
    say $S0

    $S1 = eh
    say $S1

    push_eh bad_args
        eh = new 'EventHandler', code
    pop_eh

    say "All clear!"
    end

  bad_args:
    say "No exception with bad initializer"
    end
  .end

  .sub my_handler
  .end
CODE
EventHandler
EventHandler
cool event
All clear!
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
