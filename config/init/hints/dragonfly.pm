# Copyright (C) 2007, Parrot Foundation.
# $Id$

package init::hints::dragonfly;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $libs = $conf->data->get('libs');

    $libs .= ' -pthread' unless $libs =~ /pthread/;

    $conf->data->set(
        libs  => $libs,
        link  => 'g++',
        rpath => '-Wl,-R',

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias => 'libparrot$(SHARE_EXT)',
        libparrot_soname       => '-Wl,-soname=libparrot$(SHARE_EXT).$(SOVERSION)',
    );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
