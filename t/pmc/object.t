#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/object.t - test the Object PMC

=head1 SYNOPSIS

    % prove t/pmc/object.t

=head1 DESCRIPTION

Tests the Object PMC.

=cut

# L<PDD15/Object PMC API>
# TODO fix smartlinks once this is specced
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    push_eh ok_1
    $P0 = new 'Object'
    clear_eh
    print "not "
ok_1:
    say "ok 1 - $P0 = new 'Object' throws exception"
.end
CODE
ok 1 - $P0 = new 'Object' throws exception
OUT

## TODO add more tests as this is documented and implemented

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
