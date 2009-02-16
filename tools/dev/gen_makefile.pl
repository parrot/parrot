#! perl

# Copyright (C) 2009, Parrot Foundation.
# $Id$

use 5.008;
use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use lib "$Bin/../../lib"; # build location
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );

$| = 1;    # $OUTPUT_AUTOFLUSH = 1;

my $args = process_options(
    {
        step => 'gen::makefiles',
        mode => 'reconfigure',
        conditioned_lines => 1,
        replace_slashes => 1,
    }
);
exit(1) unless ( defined $args );

my $template = $ARGV[0];
my $makefile = $ARGV[1];

my $conf = Parrot::Configure->new;
$conf->options->set( %{$args} );
$conf->data()->get_PConfig(); #load configuration data
$conf->genfile( $template => $makefile);

exit(0);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
