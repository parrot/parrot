# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hinits::irix;

use strict;

sub runstep {
    my ($self, $conf) = @_;

    my $ccflags = $conf->data->get('ccflags') || "";
    # 1185 An enumerated type is mixed with another type.
    if ($ccflags =~ /-woff /) {
      $ccflags =~ s/-woff (?:\d+,)*\d+/-woff 1185/;
    } else {
      $ccflags .= ' -woff 1185';
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

    my $cc   = $conf->data->get('cc');
    my $cxx  = $conf->data->get('cxx');
    my $ld   = $conf->data->get('ld');
    my $link = $conf->data->get('link');
    if ( $cc =~ /cc -64/ ) {
        $cxx  = 'CC -64';
        $ld   = 'CC -64';
        $link = 'CC -64';
        $conf->data->set(
            cxx  => $cxx,
            ld   => $ld,
            link => $link,
        );
    }
}

1;
