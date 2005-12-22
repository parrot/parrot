# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::hpux;

use strict;

sub runstep {
    my ($self, $conf) = @_;

    my $libs = $conf->data->get('libs');
    if ( $libs !~ /-lpthread/ ) {
        $libs .= ' -lpthread';
    }

    $conf->data->set(
        libs => $libs,
    );
}

1;
