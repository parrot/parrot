# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::aix;

use strict;

Parrot::Configure::Data->set(
    cc => 'cc_r',
    link => 'cc_r',
    platform_asm => 1,
);

1;
