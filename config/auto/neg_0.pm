# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/neg_0.pm - can print negative zero

=head1 DESCRIPTION

Determines whether print -0.0 can print "-0" or just prints "0"

This needs workarounds on older win32 (msvcrt.dll) and openbsd.

=cut

package auto::neg_0;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine whether negative zero can be printed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    $conf->cc_gen('config/auto/neg_0/test_c.in');
    eval { $conf->cc_build( q{} ); };
    my $has_neg_0 = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_neg_0 = $self->_evaluate_cc_run(
            $conf,
            $test,
            $has_neg_0,
        );
    }
    $conf->cc_clean();
    $conf->data->set( has_negative_zero => $has_neg_0 );

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($conf, $test, $has_neg_0) = @_;
    $has_neg_0 = ($test =~ m/^-0/ ? 1 : 0);
    $self->set_result( $has_neg_0 ? 'yes' : 'no' );
    my $output = $has_neg_0 ? ' (yes) ' : ' (no) ';
    $conf->debug($output);
    return $has_neg_0;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
