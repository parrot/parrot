# Copyright (C) 2005, Parrot Foundation.
# $Id$

package init::hinits::irix;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $ccflags = $conf->data->get('ccflags') || "";

    # 1185 An enumerated type is mixed with another type.
    if ( $ccflags =~ /-woff / ) {
        $ccflags =~ s/-woff (?:\d+,)*\d+/-woff 1185/;
    }
    else {
        $ccflags .= ' -woff 1185';
    }
    $conf->data->set( ccflags => $ccflags );

    my $libs = $conf->data->get('libs');
    if ( $libs !~ /-lpthread\b/ ) {
        $libs .= ' -lpthread';
    }
    $conf->data->set( libs => $libs );

    my $cc   = $conf->data->get('cc');
    my $ld   = $conf->data->get('ld');
    my $link = $conf->data->get('link');
    if ( $cc =~ /cc -64/ ) {
        $ld   = 'CC -64';
        $link = 'CC -64';
        $conf->data->set(
            ld   => $ld,
            link => $link,
        );
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
