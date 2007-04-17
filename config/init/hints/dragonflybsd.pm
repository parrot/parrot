# Copyright (C) 2007, The Perl Foundation.
# $Id $

package init::hints::dragonflybsd;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my $libs = $conf->data->get('libs');

    $libs .= ' -pthread' unless $libs =~ /pthread/;

    $conf->data->set(
        libs                    => $libs,
        link                    => 'g++',
        rpath                   => '-Wl,-R',

        has_dynamic_linking     => 1,
        parrot_is_shared        => 1,
        libparrot_shared        => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias  => 'libparrot$(SHARE_EXT)',
        libparrot_soname        => '-Wl,-soname=libparrot$(SHARE_EXT).$(SOVERSION)',
    );
}

1;
