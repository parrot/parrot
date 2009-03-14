#!perl
# Copyright (C) 2006-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/pmc/packfileannotations.t - test the PackfileAnnotations PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileannotations.t

=head1 DESCRIPTION

Tests the PackfileAnnotations PMC.

=cut


# Packfile constructor

pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    .local pmc pf
    pf = new ['PackfileAnnotations']
    $I0 = defined pf
    say $I0
.end
CODE
1
OUT
