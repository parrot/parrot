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
        libs => $libs,
        link => 'g++',
    );
}

1;
