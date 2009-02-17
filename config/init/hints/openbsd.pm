# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::openbsd;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $ccflags = $conf->data->get('ccflags');
    if ( $ccflags !~ /-pthread/ ) {
        $ccflags .= ' -pthread';
    }
    $conf->data->set( ccflags => $ccflags );

    my $libs = $conf->data->get('libs');
    if ( $libs !~ /-lpthread/ ) {
        $libs .= ' -lpthread';
    }
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

    if ( ( split( m/-/, $conf->data->get_p5('archname'), 2 ) )[0] eq 'powerpc' ) {
        $conf->data->set( as => 'as -mregnames' );
    }

}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
