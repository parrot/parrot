# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

package init::hints::linux;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $libs      = $conf->option_or_data('libs');
    my $ccflags   = $conf->option_or_data('ccflags');
    my $cc        = $conf->option_or_data('cc');
    my $linkflags = $conf->option_or_data('linkflags');
    my $share_ext = $conf->option_or_data('share_ext');
    my $version   = $conf->option_or_data('VERSION');

    $conf->debug("\n");

    # should find g++ in most cases
    my $link = $conf->data->get('link') || 'c++';

    if ( $libs !~ /-lpthread\b/ ) {
        $libs .= ' -lpthread';
    }
    if ( $libs !~ /-lrt\b/ ) {
        $libs .= ' -lrt';
    }
    my $ld_share_flags = $conf->data->get('ld_share_flags');
    my $cc_shared      = $conf->data->get('cc_shared');

    if ( $cc =~ /icc/ ) {

        # Intel C++ compiler has the same name as its C compiler
        $link = $cc;
        $ld_share_flags = ' -shared -g -pipe -fexceptions -fPIC';
        $cc_shared .= ' -fPIC';

        $ccflags = _handle_icc_ccflags($conf, $ccflags);

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

    if ( $ccflags !~ /-D_GNU_SOURCE/ ) {

        # Request visibility of all POSIX symbols
        # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
        # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
        $ccflags .= ' -D_GNU_SOURCE';
    }

    $conf->data->set(
        ccflags        => $ccflags,
        libs           => $libs,
        ld_share_flags => $ld_share_flags,
        ld_load_flags  => $ld_share_flags,
        linkflags      => $linkflags,
        link           => $link,
        cc_shared      => $cc_shared,
        rpath          => '-Wl,-rpath=',

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => "libparrot$share_ext.$version",
        libparrot_shared_alias => "libparrot$share_ext",
        libparrot_soname       => "-Wl,-soname=libparrot$share_ext.$version",
    );

     if ( ( split( m/-/, $conf->data->get('archname_provisional'), 2 ) )[0] eq 'ia64' ) {

        $conf->data->set( platform_asm => 1 );
    }
    return;
}

sub _handle_icc_ccflags {
    my ($conf, $ccflags) = @_;

    # enable correct floating point behavior
    # which is *not* the default behavior. ahem.
    $ccflags .= ' -we147';

    # TT #1488. ICC optimizes floating-point too aggressively and loses support
    # for negative zero without this.
    $ccflags .= ' -fp-model source';

    $conf->debug(" ccflags: $ccflags\n");
    return $ccflags;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
