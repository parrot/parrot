#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/integer-old.t - Perl tests for Integer basic type

=head1 SYNOPSIS

    % prove t/pmc/integer.t

=head1 DESCRIPTION

Perl tests the Integer PMC. These should be translated to PIR when possible.

=cut


pir_error_output_like( <<'CODE',qr/get_as_base: base out of bounds/ms, "get_as_base() bounds check" );
.sub main :main
    $P0 = new ['Integer']
    $P0 = 42

    $S0 = $P0.'get_as_base'(1)

    say $S0
.end
CODE

pir_error_output_like( <<'CODE', qr/get_as_base: base out of bounds/ms,"get_as_base() bounds check" );
.sub main :main
    $P0 = new ['Integer']
    $P0 = 42

    $S0 = $P0.'get_as_base'(37)

    say $S0
.end
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
