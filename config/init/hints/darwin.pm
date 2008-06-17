# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::darwin;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $ccflags, $ldflags, $libs ) = $conf->data->get(qw(ccflags ldflags libs));

    my $OSVers = `uname -r`;
    chomp $OSVers;
    {
        local $^W;
        $OSVers =~ /(\d+)/;
        if ( $1 >= 7 ) {
            $libs =~ s/-ldl//;
        }
    }

    unless (exists $ENV{'MACOSX_DEPLOYMENT_TARGET'}) {
        my $OSX_vers = `sw_vers -productVersion`;
        chomp $OSX_vers;
        # remove minor version
        $OSX_vers =join '.', (split /[.]/, $OSX_vers)[0,1]; 
        $ENV{'MACOSX_DEPLOYMENT_TARGET'} = $OSX_vers;
    }

    my $lib_dir = $conf->data->get('build_dir') . "/blib/lib";
    $ldflags .= " -L$lib_dir";
    $ccflags .= " -pipe -fno-common -Wno-long-double ";

    $conf->data->set(
        darwin              => 1,
        osx_version         => $ENV{'MACOSX_DEPLOYMENT_TARGET'},
        ccflags             => $ccflags,
        ldflags             => $ldflags,
        ccwarn              => "-Wno-shadow",
        libs                => $libs,
        share_ext           => '.dylib',
        load_ext            => '.bundle',
        link                => 'c++',
        linkflags           => '-undefined dynamic_lookup',
        ld                  => 'c++',
        ld_share_flags      => '-dynamiclib -undefined dynamic_lookup',
        ld_load_flags       => '-bundle -undefined dynamic_lookup',
        memalign            => 'some_memalign',
        has_dynamic_linking => 1,

        # RT#43147 when built against a dynamic libparrot installable_parrot records
        # the path to the blib version of the library
        parrot_is_shared       => 1,
        libparrot_shared       => 'libparrot.$(SOVERSION)$(SHARE_EXT)',
        libparrot_shared_alias => 'libparrot$(SHARE_EXT)',
        rpath                  => "-L",
        libparrot_soname       => "-install_name "
            . $lib_dir
            . $conf->data->get('slash')
            . "libparrot"
            . $conf->data->get('share_ext')
    );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
