# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::aix;

use strict;

sub runstep {
    my ($self, $conf) = @_;

    $conf->data->set(
        cc => 'cc_r',
        link => 'cc_r',
        platform_asm => 1,
    );
}

1;
