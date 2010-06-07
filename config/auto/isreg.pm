# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/isreg - S_ISREG

=head1 DESCRIPTION

Determines if the C library has a working C<S_ISREG>.

=cut

package auto::isreg;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your C library have a working S_ISREG};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $errormsg = _first_probe_for_isreg($conf);

    if (! $errormsg) {
        $errormsg = _second_probe_for_isreg($conf);
    }
    $conf->cc_clean();
    $self->_evaluate_isreg($conf, $errormsg);
    return 1;
}

sub _first_probe_for_isreg {
    my $conf = shift;
    my $errormsg;
    $conf->cc_gen('config/auto/isreg/test_c.in');
    eval { $conf->cc_build(); };
    $errormsg = 1 if  $@;
    return $errormsg;
}

sub _second_probe_for_isreg {
    my $conf = shift;
    my $ccrunfailure;
    $ccrunfailure++ if ( $conf->cc_run() !~ /ok/ );
    return $ccrunfailure;
}

sub _evaluate_isreg {
    my ($self, $conf, $anyerror) = @_;
    my $test;
    $test = (! defined $anyerror) ? 1 : 0;
    $conf->data->set( isreg => $test );
    my $test_str = $test ? " (Yep) " : " (no) ";
    $conf->debug($test_str);
    $self->set_result( $test ? 'yes' : 'no' );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
