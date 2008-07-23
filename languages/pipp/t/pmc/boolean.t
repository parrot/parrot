#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/boolean.t - Boolean PMC

=head1 SYNOPSIS

    % prove t/pmc/boolean.t

=head1 DESCRIPTION

Tests C<PhpBoolean> PMC.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More   tests => 1;
use Parrot::Test;

pir_output_is( << 'CODE', << 'OUTPUT', "stringification" );
.loadlib 'php_group'

.sub 'main' :main
    .local pmc true
    true = new 'PhpBoolean'
    true = 1
   
    .local pmc false
    false = new 'PhpBoolean'
    false = 0

    $S0 = true
    say $S0
    $S0 = false
    say $S0

.end
CODE
1

OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
