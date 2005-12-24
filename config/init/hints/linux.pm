# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::linux;

use strict;

use Config;

sub runstep
{
    my ($self, $conf) = @_;

    my $libs      = $conf->data->get('libs');
    my $cflags    = $conf->data->get('ccflags');
    my $cc        = $conf->data->get('cc');
    my $linkflags = $conf->data->get('linkflags');

    # should find g++ in most cases
    my $link = 'c++';

    if ($libs !~ /-lpthread/) {
        $libs .= ' -lpthread';
    }
    my $ld_share_flags = $conf->data->get('ld_share_flags');
    if ($ld_share_flags !~ /-fPIC/) {
        $ld_share_flags .= ' -fPIC';
    }

    if ($cc =~ /icc/) {

        # Intel C++ compiler has the same name as its C compiler
        $link = 'icc';

        # don't allow icc to pretend it's gcc
        $cflags .= ' -no-gcc';

        # suppress sprintf warnings that don't apply
        $cflags .= ' -wd269';
    } else {

        # --export-dynamic, s. info gcc, ld
        $linkflags .= ' -Wl,-E';
    }

    if ($cflags !~ /-D_GNU_SOURCE/) {

        # Request visibility of all POSIX symbols
        # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
        # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
        $cflags .= ' -D_GNU_SOURCE';
    }

    $conf->data->set(
        ccflags        => $cflags,
        libs           => $libs,
        ld_share_flags => $ld_share_flags,
        ld_load_flags  => $ld_share_flags,
        i_lib_pthread  => 1,              # XXX fake a header entry
        linkflags      => $linkflags,
        link           => $link,
    );

    if ((split('-', $Config{archname}))[0] eq 'ia64') {
        $conf->data->set(platform_asm => 1);
    }
}

1;
