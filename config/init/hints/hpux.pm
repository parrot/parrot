# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::hpux;

use strict;

my $libs = Parrot::Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}

Parrot::Configure::Data->set(
    libs => $libs,
);

1;
