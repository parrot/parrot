# Copyright (C) 2001-2006, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/cpu.pm - CPU specific Files

=head1 DESCRIPTION

Runs C<runstep()> in F<config/auto/cpu/${cpuarch}/auto.pm> if it exists.

=cut

package auto::cpu;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Carp;


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate CPU specific stuff};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->data->add( ' ', TEMP_atomic_o => '' );    # assure a default

    my $hints = "auto::cpu::" . $conf->data->get('cpuarch') . "::auto";

    $conf->debug("\t(cpu hints = '$hints') ");

    eval "use $hints";
    unless ($@) {
        $hints->runstep( $conf, @_ );
    }
    else {
        $conf->debug("(no cpu specific hints)");
    }

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
