#! perl
# Copyright (C) 2001-2014, Parrot Foundation.

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use Parrot::Config;
use File::Spec;

warn 'ops2c.pl is deprecated. Use parrot-ops2c$(EXE) instead';
# Ignore "core"
shift @ARGV;
my $ops2c = File::Spec->catfile($PConfig{bindir}, 'parrot-ops2c');
exec $ops2c, @ARGV;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

