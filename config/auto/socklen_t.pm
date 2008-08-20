# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/socklen_t.pm - Is there a socklen_t

=head1 DESCRIPTION

Determines whether there is a socklen_t

=cut

package auto::socklen_t;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine whether there is socklen_t};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $d_socklen_t = _probe_for_socklen_t($conf);

    $self->_evaluate_socklen_t($conf, $d_socklen_t);

    return 1;
}

sub _probe_for_socklen_t {
    my $conf = shift;
    return $conf->data->get('has_socklen_t')
            ||
           $conf->data->get_p5('d_socklen_t');
}

sub _evaluate_socklen_t {
    my ($self, $conf, $d_socklen_t) = @_;
    my $has_socklen_t = $d_socklen_t ? 1 : 0;
    $self->set_result( $has_socklen_t ? 'yes' : 'no' );
    $conf->data->set( has_socklen_t => $has_socklen_t );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
