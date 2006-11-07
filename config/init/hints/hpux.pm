# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::hpux;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my $libs = $conf->data->get('libs');
    if ($libs !~ /-lpthread/) {
        $libs .= ' -lpthread';
    }

    $conf->data->set(libs => $libs);
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
