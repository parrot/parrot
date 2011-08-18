# Copyright (C) 2005, Parrot Foundation.

package init::hints::openbsd;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $share_ext = $conf->option_or_data('share_ext');
    my $version   = $conf->option_or_data('VERSION');
    my $ccflags = $conf->data->get('ccflags');
    if ( $ccflags !~ /-pthread\b/ ) {
        $ccflags .= ' -pthread';
    }
    $conf->data->set( ccflags => $ccflags );

    my $libs = $conf->data->get('libs');
    if ( $libs !~ /-lpthread\b/ ) {
        $libs .= ' -lpthread';
    }

    my $ldflags = $conf->data->get('ldflags');
    if ( $ldflags !~ m|-L/usr/local/lib\b| ) {
        $ldflags .= ' -L/usr/local/lib';
    }

    $conf->data->set(
        ldflags => $ldflags,
        libs    => $libs,
        link    => 'g++',
        rpath   => '-Wl,-R',

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => "libparrot$share_ext.$version",
        libparrot_shared_alias => "libparrot$share_ext",
        libparrot_soname       => "-Wl,-soname=libparrot$share_ext.$version",
        sha256sum              => 'sha256' || $conf->data->get('sha256sum'),
    );

    if ( ( split( m/-/, $conf->data->get('archname_provisional'), 2 ) )[0] eq 'powerpc' ) {
        $conf->data->set( as => 'as -mregnames' );
    }

    $conf->data->set( clock_best => '-D_POSIX_TIMERS -DCLOCK_BEST=CLOCK_MONOTONIC' );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
