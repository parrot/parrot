# $Id$

# Copyright (C) 2006-2007, The Perl Foundation.

# Configuration script for Pipp.

# RT#31633: need to steal from gen::languages and tools/dev/reconfigure.pl
#           in order to make this work

package main;

# pragmata
use strict;
use warnings;
use 5.008;
use FindBin;
use lib "$FindBin::Bin/../../lib";

# Parrot specific Perl modules
use Parrot::Configure::Step  ();

# RT#31633: This is too simplistic
# Parrot::Configure::Step::genfile( 'config/makefiles/root.in' => 'Makefile' );

print <<'END_TEXT';
Hi,
I'm Configure.pl. Eventually I'll generate Makefile.
END_TEXT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
