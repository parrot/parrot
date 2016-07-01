# Copyright (C) 2006-2007, Parrot Foundation.

=head1 NAME

Parrot::Config - Parrot Configuration Data

=head1 DESCRIPTION

This file is used for parrot's configuration data. If C<perl Configure.pl>
hasn't been run yet, it dies with a message explaining that parrot needs to be
configured first. It contains the C<%PConfig> hash which is exported with the
values loaded from F<lib/Parrot/Config/Generated.pm>.

A list of valid keys can be found from running

    parrot_config --dump

=head1 SYNOPSIS

    use Parrot::Config;
    my $has_ipv6 = $PConfig{HAS_IPV6};

=cut

package Parrot::Config;

use strict;
use warnings;

eval 'use Parrot::Config::Generated';
if ($@) {
    die "\nParrot::Config is unavailable until you configure parrot.\n"
        . "Please run `perl Configure.pl`.\n\n";
}

use Exporter;

use vars qw(@ISA @EXPORT %PConfig %PConfig_Temp);

@ISA = qw(Exporter);

@EXPORT = qw(%PConfig %PConfig_Temp);

%PConfig      = %Parrot::Config::Generated::PConfig;
%PConfig_Temp = %Parrot::Config::Generated::PConfig_Temp;

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
