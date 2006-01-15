# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::freebsd;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my $libs = $conf->data->get('libs');

    # get rid of old pthread-stuff, if any
    $libs =~ s/(-lpthreads|-lc_r)\b\s*//g;

    # The following test is from FreeBSD's /usr/ports/Mk/bsd.port.mk,
    # which must be assumed to do the right thing.

    my $osversion;
    if (-e "/sbin/sysctl") {
        $osversion = `/sbin/sysctl -n kern.osreldate`;
    } else {
        $osversion = `/usr/sbin/sysctl -n kern.osreldate`;
    }
    chomp $osversion;

    $libs .= ' -pthread';

    $conf->data->set(
        libs                    => $libs,
        link                    => 'g++',
        rpath                   => '-Wl,-R',

        has_dynamic_linking     => 1,
        parrot_is_shared        => (`uname -r` !~ /5\.4/ ? 1 : 0),
        libparrot_shared        => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias  => 'libparrot$(SHARE_EXT)',
        libparrot_soname        => '-Wl,-soname=libparrot$(SHARE_EXT).$(SOVERSION)',
    );
}

1;
