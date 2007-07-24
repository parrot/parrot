# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

package init::hints::linux;

use strict;
use warnings;

use Config;

sub option_or_data {
    my $conf = shift;
    my $arg = shift;

    my $opt = $conf->options->get( $arg );
    return $opt ? $opt : $conf->data->get( $arg );
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $libs        = option_or_data($conf, 'libs');
    my $cc_flags      = option_or_data($conf, 'ccflags');
    my $cc          = option_or_data($conf, 'cc');
    my $linkflags   = option_or_data($conf, 'linkflags');

    # should find g++ in most cases
    my $link = $conf->data->get('link') || 'c++';

    if ( $libs !~ /-lpthread/ ) {
        $libs .= ' -lpthread';
    }
    my $ld_share_flags = $conf->data->get('ld_share_flags');
    my $cc_shared      = $conf->data->get('cc_shared');

    if ( $cc =~ /icc/ ) {
        # Intel C++ compiler has the same name as its C compiler
        $link = $cc;

        # don't allow icc to pretend it's gcc
        $cc_flags .= ' -no-gcc';

        # suppress sprintf warnings that don't apply
        $cc_flags .= ' -wd269';

        $cc_flags .= ' -Wall -Wcheck -w2';

        $ld_share_flags = ' -shared -g -pipe -fexceptions -fPIC';
        $cc_shared .= ' -fPIC';
    }
    elsif ( $cc =~ /suncc/ ) {
        $link = 'sunCC';
        if ( $ld_share_flags !~ /-KPIC/ ) {
            $ld_share_flags = '-KPIC';
        }
        if ( $cc_shared !~ /-KPIC/ ) {
            $cc_shared = '-KPIC';
        }
    }
    else {
        if ( $ld_share_flags !~ /-fPIC/ ) {
            $ld_share_flags .= ' -fPIC';
        }
        if ( $cc_shared !~ /-fPIC/ ) {
            $cc_shared .= ' -fPIC';
        }

        # --export-dynamic, s. info gcc, ld
        $linkflags .= ' -Wl,-E';
    }

    if ( $cc_flags !~ /-D_GNU_SOURCE/ ) {

        # Request visibility of all POSIX symbols
        # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
        # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
        $cc_flags .= ' -D_GNU_SOURCE';
    }

    $conf->data->set(
        ccflags        => $cc_flags,
        libs           => $libs,
        ld_share_flags => $ld_share_flags,
        ld_load_flags  => $ld_share_flags,
        i_lib_pthread  => 1,                 # RT#43149 fake a header entry
        linkflags      => $linkflags,
        link           => $link,
        cc_shared      => $cc_shared,
        rpath          => '-Wl,-rpath=',

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias => 'libparrot$(SHARE_EXT)',
        libparrot_soname       => '-Wl,-soname=libparrot$(SHARE_EXT).$(SOVERSION)',
    );

    if ( ( split( '-', $Config{archname} ) )[0] eq 'ia64' ) {
        $conf->data->set( platform_asm => 1 );
    }
    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
