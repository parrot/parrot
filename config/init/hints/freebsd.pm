# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

my $libs = Parrot::Configure::Data->get('libs');

# get rid of old pthread-stuff, if any
$libs =~ s/(-lpthreads|-lc_r)\b\s*//g;

# The following test is from FreeBSD's /usr/ports/Mk/bsd.port.mk,
# which must be assumed to do the right thing.

my $osversion;
if (-e "/sbin/sysctl") {
    $osversion = `/sbin/sysctl -n kern.osreldate`;
}
else {
    $osversion = `/usr/sbin/sysctl -n kern.osreldate`;
}
chomp $osversion;

if ($osversion < 500016) { 
    $libs .= ' -pthread';
}
else {
    $libs =~ s/-lc\b\s*//;
    $libs .= ' -lc_r';
}

Parrot::Configure::Data->set(
    libs => $libs,
    link => 'g++',
);
