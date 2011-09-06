# Copyright (C) 2005-2007, Parrot Foundation.

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

    # On Linux, we'll start by assuming that 'cc' is a symlink to 'gcc'
    my $cc_shared      = $conf->option_or_data('cc_shared') || '-fPIC';
    my $ld_share_flags = $conf->option_or_data('ld_share_flags') ||
        '-shared -fPIC';
    my $ld_load_flags  = $ld_share_flags;

    if ( $cc =~ /icc/ ) {

        # Intel C++ compiler has the same name as its C compiler
        $link = $cc;

        $ccflags = _handle_icc_ccflags($conf, $ccflags);

    }
    elsif ( $cc =~ /suncc/ ) {
        $link = 'sunCC';
        if ( $ld_share_flags !~ /-G/ ) {
            $ld_share_flags = '-G';
        }
        if ( $cc_shared !~ /-KPIC/ ) {
            $cc_shared = '-KPIC';
        }
    }

    if ( $ccflags !~ /-D_GNU_SOURCE/ ) {

        # Request visibility of all POSIX symbols
        # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
        # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
        $ccflags .= ' -D_GNU_SOURCE';
    }

    my $osvers = `/sbin/sysctl -n kernel.osrelease`;
    chomp $osvers;

    my %linux_selections = (
        ccflags         => $ccflags,
        libs            => $libs,
        cc_shared       => $cc_shared,
        ld_share_flags  => $ld_share_flags,
        ld_load_flags   => $ld_load_flags,
        linkflags       => $linkflags,
        link            => $link,
        rpath           => '-Wl,-rpath=',
        osvers          => $osvers,

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => "libparrot$share_ext.$version",
        libparrot_shared_alias => "libparrot$share_ext",
        libparrot_soname       => "-Wl,-soname=libparrot$share_ext.$version",
    );
    if ( ( split( m/-/, $conf->data->get('archname_provisional'), 2 ) )[0] eq 'ia64' ) {

        $linux_selections{platform_asm} = 1;
    }
    my $linux_hints = "Linux hints settings:\n";
    for my $k (sort keys %linux_selections) {
        $linux_hints .= sprintf("  %-24s => %s\n" => (
                $k, qq|'$linux_selections{$k}'|,
        ) );
    }
    $conf->debug($linux_hints);

    $conf->data->set( %linux_selections );
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
