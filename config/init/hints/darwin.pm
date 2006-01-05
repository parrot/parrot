# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::darwin;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my ($ccflags, $ldflags, $libs) = $conf->data->get(qw(ccflags ldflags libs));

    my $OSVers = `uname -r`;
    chomp $OSVers;
    {
        local $^W;
        if ($OSVers >= 7) {
            $libs =~ s/-ldl//;
        }
    }

    $ccflags .= " -pipe -fno-common -Wno-long-double ";
    $ccflags =~ s/-flat_namespace\s*//;
    $ldflags =~ s/-flat_namespace\s*//;
    $ldflags .= " -flat_namespace ";

    $conf->data->set(
        ccflags             => $ccflags,
        ldflags             => $ldflags,
        ccwarn              => "-Wno-shadow",
        libs                => $libs,
        share_ext           => '.dylib',
        load_ext            => '.bundle',
        link                => 'c++',
        ld                  => 'c++',
        ld_share_flags      => '-dynamiclib -undefined suppress',
        ld_load_flags       => '-bundle -undefined suppress',
        memalign            => 'some_memalign',
	has_dynamic_linking     => 1,
        parrot_is_shared     => 1,
        libparrot_shared        => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias  => 'libparrot$(SHARE_EXT)',
        # This variable needs renaming to be more general
	# XXX ugly hack for rpath_lib in config/inter/libparrot.pm
        rpath                   => "-L",
        libparrot_soname    => "-install_name " .
                               $conf->data->get('build_dir') .
                               $conf->data->get('slash') .
                               $conf->data->get('blib_dir') .
                               $conf->data->get('slash') .
                               "libparrot" .
                               $conf->data->get('share_ext')
    );
}

1;
