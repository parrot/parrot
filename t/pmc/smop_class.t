#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id: /parrot/cc/t/pmc/pmethod_test.t 2562 2007-02-24T15:21:50.392350Z tewk  $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/smop_class.t - test the new SMOP Class PMC


=head1 SYNOPSIS

    % prove t/pmc/smop_class.t

=head1 DESCRIPTION

Tests the SMOP_Class PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'create a SMOP_Class' );
.sub main :main
  $P0 = new 'SMOP_Class'
.end
CODE
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
