#! perl

# Copyright (C) 2009, Parrot Foundation.

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
        step              => 'gen::makefiles',
        mode              => 'reconfigure',
    }
);
exit(1) unless ( defined $args );

my $template = $ARGV[0];
my $makefile = $ARGV[1];

my $conf = Parrot::Configure->new();
$conf->options->set( %{$args} );
$conf->data()->get_PConfig(); #load configuration data
foreach (@ARGV) {
    next unless (/--(\w+)=(\w+)/);
    $conf->data->set( $1 => $2 );
}
$conf->genfile(
    $template           => $makefile,
    file_type           => 'makefile',
    expand_gmake_syntax => 1,
);

exit(0);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
