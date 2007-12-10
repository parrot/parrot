#!/usr/bin/env perl

# Copyright (C) 2007, The Perl Foundation.
# $Id$

# A wrapper around a Scheme test file

use strict;
use warnings;

use FindBin;

( my $t_fn = $FindBin::Script ) =~ s/\.pl$/\.t/;

chdir 'eclectus';
exec 'petite', '--script', "t/$t_fn";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
