# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::aix;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    $conf->data->set(
        cc           => 'cc_r',
        link         => 'cc_r',
        platform_asm => 1,
    );
}

1;
