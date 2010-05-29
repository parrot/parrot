#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id: time_old.t 47051 2010-05-27 08:45:23Z plobsing $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/op/time.t - Time and Sleep

=head1 SYNOPSIS

    % prove t/op/time.t

=head1 DESCRIPTION

Tests the C<time> and C<sleep> operations.

=cut

my $year;
( undef, undef, undef, undef, undef, $year ) = localtime();
$year += 1900;

# don't run this test 1 tick before the year changes #'

pasm_output_is( <<'CODE', $year, "decodelocaltime" );
.loadlib 'sys_ops'
    time I0
    decodelocaltime P0, I0
    .include "tm.pasm"
    set I0, P0[.TM_YEAR]
    print I0
    end
CODE


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
