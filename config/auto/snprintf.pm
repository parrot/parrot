# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

config/auto/snprintf.pm - Test for snprintf and %+u

=head1 DESCRIPTION

Tests if snprintf is present and if it's C99 compliant.

Also tests for broken %+u on mingw

=cut

package auto::snprintf;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test for snprintf and %+u};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $res = _probe_for_snprintf($conf);
    $self->_evaluate_snprintf($conf, $res);

    $res = _probe_for_broken_uplus($conf);
    $self->_evaluate_broken_uplus($conf, $res);

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

sub _probe_for_broken_uplus {
    my $conf = shift;
    $conf->cc_gen('config/auto/snprintf/test_c.in');
    my $has_snprintf = $conf->data->get('HAS_SNPRINTF');
    $conf->cc_build('-DBROKEN_SPRINTF_UPLUS ' . ($has_snprintf ? ' -DHAS_SNPRINTF' : ''));
    my $res = $conf->cc_run() or die "Can't run the snprintf testing program: $!";
    $conf->cc_clean();
    return $res;
}

sub _evaluate_snprintf {
    my ($self, $conf, $res) = @_;
    if ( $res =~ /snprintf/ ) {
        $conf->data->set( HAS_SNPRINTF => 1 );
        $self->set_result('yes');
    }
    if ( $res =~ /^C99 snprintf/ ) {
        $conf->data->set( HAS_C99_SNPRINTF => 1 );
        $self->set_result('yes, C99');
    }
    elsif ( $res =~ /^old snprintf/ ) {
        $conf->data->set( HAS_OLD_SNPRINTF => 1 );
        $self->set_result('yes, old');
    }
    $conf->debug(" ($res) ");
    return 1;
}

sub _evaluate_broken_uplus {
    my ($self, $conf, $res) = @_;
    if ( $res =~ /^not ok/ ) {
        $conf->data->set( HAS_BROKEN_SPRINTF_UPLUS => 1 );
    }
    elsif ( $res =~ /^ok/ ) {
        return 1;
    }
    else {
        die "\nConfigure.pl: probe_for_broken_uplus failed\n";
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
