#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/parrotobject.t - test the ParrotObject PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotobject.t

=head1 DESCRIPTION

Tests the ParrotObject PMC.

=cut


pir_output_like(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
    new P0, .ParrotObject
    print "ok 1\n"
.end
CODE
/Can't create new ParrotObjects - use the registered class instead
current instr\.:/
OUT
# '



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
