# Copyright (C) 2005, The Perl Foundation.
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
	
	$ldflags .= " -L".$conf->data->get('build_dir')."/blib/lib";
	$ccflags .= " -pipe -fno-common -Wno-long-double ";
    $ccflags =~ s/-flat_namespace\s*//;
    $ldflags =~ s/-flat_namespace\s*//;
    $ldflags .= " -flat_namespace ";

    $conf->data->set(
        darwin              => 1,
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
        # XXX when built against a dynamic libparrot installable_parrot records
        # the path to the blib version of the library
        parrot_is_shared     => 0,
        libparrot_shared        => 'libparrot.$(SOVERSION)$(SHARE_EXT)',
        libparrot_shared_alias  => 'libparrot$(SHARE_EXT)',
        # This variable needs renaming to be more general
        # XXX ugly hack for rpath_lib in config/inter/libparrot.pm
        rpath                   => "-L",
        libparrot_soname    => "-install_name " .
                               $conf->data->get('lib_dir') .
                               $conf->data->get('slash') .
                               "libparrot" .
                               $conf->data->get('share_ext')
    );
}

1;
