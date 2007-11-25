#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/task.t - Concurrent Task

=head1 SYNOPSIS

    % prove t/pmc/task.t

=head1 DESCRIPTION

Tests the task PMC used by the concurrency scheduler.

=cut

pir_output_is( <<'CODE', <<'OUT', "create a task and set attributes" );
  .sub main :main
    $P0 = new "Task"
    $P1 = getattribute $P0, 'status'
    print $P1
    print "\n"

    $P2 = new "String"
    $P2 = "inprocess"
    setattribute $P0, 'status', $P2

    $P3 = getattribute $P0, 'status'
    print $P3
    print "\n"
    end
  .end
CODE
created
inprocess
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
