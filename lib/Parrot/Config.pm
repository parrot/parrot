=head1 NAME

Parrot::Config - Parrot Configuration Data

=head1 DESCRIPTION

This file is used for parrot's configuration data. If C<perl Configure.pl>
hasn't been run yet, it dies with a message explaining that parrot needs to be
configured first. It contains the C<%PConfig> hash which is exported with the
values loaded from F<lib/Parrot/Config/Generated.pm>.

=cut

package Parrot::Config;

eval 'use Parrot::Config::Generated';
if ($@) {
    die "\nParrot::Config is unavailable until you configure parrot.\n"
        ."Please run `perl Configure.pl`.\n\n";
}

use strict;
use Exporter;
 
use vars qw(@ISA @EXPORT %PConfig);

@ISA=qw(Exporter);

@EXPORT=qw(%PConfig);

%PConfig = %Parrot::Config::Generated::PConfig;

1;
