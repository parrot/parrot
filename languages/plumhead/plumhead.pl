#!/usr/bin/env perl

# $Id$

# A workaround for run-tests.php

use strict;
use warnings;

# possible values are qw( phc antlr3 partridge yacc perl5re );
my $variant = $ENV{PLUMHEAD_VARIANT} || 'partridge';
exec './parrot', 'languages/plumhead/plumhead.pbc', "--variant=$variant", @ARGV;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
