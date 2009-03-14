#!perl
# Copyright (C) 2006-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/pmc/packfileannotationkeys.t - test the PackfileAnnotationKeys PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileannotationkeys.t

=head1 DESCRIPTION

Tests the PackfileAnnotationKeys PMC.

=cut


# Packfile constructor

pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    .local pmc pf
    pf = new ['PackfileAnnotationKeys']
    $I0 = defined pf
    say $I0
.end
CODE
1
OUT
