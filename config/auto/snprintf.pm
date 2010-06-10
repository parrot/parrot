# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/snprintf.pm - Test for snprintf

=head1 DESCRIPTION

Tests if snprintf is present and if it's C99 compliant.

=cut

package auto::snprintf;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test snprintf};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $res = _probe_for_snprintf($conf);

    $self->_evaluate_snprintf($conf, $res);

    return 1;
}

sub _probe_for_snprintf {
    my $conf = shift;
    $conf->cc_gen('config/auto/snprintf/test_c.in');
    $conf->cc_build();
    my $res = $conf->cc_run() or die "Can't run the snprintf testing program: $!";
    $conf->cc_clean();
    return $res;
}

sub _evaluate_snprintf {
    my ($self, $conf, $res) = @_;
    if ( $res =~ /snprintf/ ) {
        $conf->data->set( HAS_SNPRINTF => 1 );
    }
    if ( $res =~ /^C99 snprintf/ ) {
        $conf->data->set( HAS_C99_SNPRINTF => 1 );
    }
    elsif ( $res =~ /^old snprintf/ ) {
        $conf->data->set( HAS_OLD_SNPRINTF => 1 );
    }
    $conf->debug(" ($res) ");
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
