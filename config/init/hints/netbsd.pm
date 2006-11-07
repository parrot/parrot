# Copyright (C) 2006, The Perl Foundation.
# $Id$

package init::hints::netbsd;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my $ccflags = $conf->data->get('ccflags');
    if ($ccflags !~ /-pthread/) {
        $ccflags .= ' -pthread';
    }
    $conf->data->set(ccflags => $ccflags);

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
