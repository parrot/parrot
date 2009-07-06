# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/gen/config_h.pm - Configuration Header

=head1 DESCRIPTION

Generates F<include/parrot/config.h> with platform-specific configuration
values, F<include/parrot/has_header.h> with platform-specific header
information, and F<include/parrot/feature.h> with information on optional
features.

=cut

package gen::config_h;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate C headers};
    $data{result}      = q{};
    $data{templates}    = {
        config_h        => 'config/gen/config_h/config_h.in',
        feature_h       => 'config/gen/config_h/feature_h.in',
        has_header_h    => 'config/gen/config_h/has_header_h.in',
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->genfile($self->{templates}->{config_h}, 'include/parrot/config.h',
        ignore_pattern    => 'PARROT_CONFIG_DATE',
        conditioned_lines => 1
    );

    $conf->genfile($self->{templates}->{feature_h}, 'include/parrot/feature.h',
        ignore_pattern => 'PARROT_CONFIG_DATE',
        feature_file   => 1
    );

    $conf->data->set( TEMP_header =>
        join "\n", map { $conf->data->get($_)
                       ? "#define PARROT_HAS_HEADER_" . uc(substr $_, 2) . " 1"
                       : "#undef  PARROT_HAS_HEADER_" . uc(substr $_, 2) }
                   grep { /^i_\w+/ }
                   sort $conf->data->keys()
    );

    $conf->data->set( TEMP_has_config =>
        join "\n", map { "#define PARROT_" . uc($_) . " 1" }
                   grep { /^HAS_\w+/ && $conf->data->get($_) }
                   sort $conf->data->keys()
    );

    $conf->data->set( TEMP_d_config =>
        join "\n", map { "#define PARROT_" . uc(substr $_, 2) . " " . $conf->data->get($_) }
                   grep { /^D_\w+/ }
                   sort $conf->data->keys()
    );

    $conf->data->set( TEMP_cli_define =>
        join "\n", map { "#define PARROT_DEF_" . uc($_) . " 1" }
                   split /,/, $conf->options->get('define') || ''
    );

    $conf->genfile($self->{templates}->{has_header_h}, 'include/parrot/has_header.h');

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
