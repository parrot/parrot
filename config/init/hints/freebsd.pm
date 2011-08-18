# Copyright (C) 2005, Parrot Foundation.

package init::hints::freebsd;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $share_ext = $conf->option_or_data('share_ext');
    my $version   = $conf->option_or_data('VERSION');
    my $libs = $conf->data->get('libs');

    # get rid of old pthread-stuff, if any
    $libs =~ s/(-lpthreads|-lc_r)\b\s*//g;

    # The following test is from FreeBSD's /usr/ports/Mk/bsd.port.mk,
    # which must be assumed to do the right thing.

    my $osvers;
    if ( -e "/sbin/sysctl" ) {
        $osvers = `/sbin/sysctl -n kern.osreldate`;
    }
    else {
        $osvers = `/usr/sbin/sysctl -n kern.osreldate`;
    }
    chomp $osvers;

    $libs .= ' -pthread';

    $conf->data->set(
        libs  => $libs,
        link  => 'g++',
        rpath => '-Wl,-R',
        has_dynamic_linking     => 1,
        parrot_is_shared        => 1,
        libparrot_shared        => "libparrot$share_ext.$version",
        libparrot_shared_alias  => "libparrot$share_ext",
        libparrot_soname        => "-Wl,-soname=libparrot$share_ext.$version",
        osvers                  => $osvers,
        sha256sum               => 'sha256' || $conf->data->get('sha256sum'),
    );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
