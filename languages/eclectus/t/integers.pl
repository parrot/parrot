#!/usr/bin/env perl

# $Id$

# Copyright (C) 2007, The Perl Foundation.

# A wrapper around a Scheme test file

use strict;
use warnings;

# possible values are qw( phc antlr3 pct yacc );
my $variant = $ENV{PLUMHEAD_VARIANT} || 'pct';
chdir 'eclectus';
exec 'petite', '--script', 't/integers.t';

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
