# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::openbsd;

use strict;

sub runstep {
    my ($self, $conf) = @_;

    my $ccflags = $conf->data->get('ccflags');
    if ( $ccflags !~ /-pthread/ ) {
        $ccflags .= ' -pthread';
    }
    $conf->data->set(
        ccflags => $ccflags,
    );

    my $libs = $conf->data->get('libs');
    if ( $libs !~ /-lpthread/ ) {
        $libs .= ' -lpthread';
    }
    $conf->data->set(
        libs => $libs,
    );
}

1;
