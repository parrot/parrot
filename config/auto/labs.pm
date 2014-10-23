# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

config/auto/labs.pm - Test for C90 labs()

=head1 DESCRIPTION

Tests if labs is present in F<stdlib.h>.

=cut

package auto::labs;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test for labs};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $res = _probe($conf);
    $self->_check($conf, $res);
    return 1;
}

sub _probe {
    my $conf = shift;
    $conf->cc_gen('config/auto/labs/test_c.in');
    $conf->cc_build();
    my $res = $conf->cc_run() or $conf->debug("$!");
    $conf->cc_clean();
    return $res;
}

sub _check {
    my ($self, $conf, $res) = @_;
    $conf->debug(" ($res) ");
    if ( $res =~ /labs/ ) {
        $conf->data->set( HAS_LABS => 1 );
        $self->set_result('yes');
        return 1;
    }
    else {
        $self->set_result('no');
        return 0;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
