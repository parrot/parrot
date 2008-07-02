#!/usr/bin/env perl

# $Id$

# Copyright (C) 2006-2007, The Perl Foundation.

# A workaround for run-tests.php

use strict;
use warnings;

# possible values are qw( phc antlr3 pct );
my $variant = $ENV{PIPP_VARIANT} || 'pct';
exec './parrot', 'languages/pipp/pipp.pbc', "--variant=$variant", @ARGV;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
