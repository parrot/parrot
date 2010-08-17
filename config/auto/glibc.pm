# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/glibc.pm - find GNU libc

=head1 DESCRIPTION

Discovers GNU libc, if it exists.

=cut

package auto::glibc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is GNU libc installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $test = $self->_probe_for_glibc($conf);

    $self->_evaluate_glibc($conf, $test);

    return 1;
}

sub _probe_for_glibc {
    my ( $self, $conf ) = @_;
    my %glibc;
    $conf->cc_gen("config/auto/glibc/test_c.in");
    eval { $conf->cc_build(); };
    if ( !$@ ) {
        %glibc = eval $conf->cc_run() or die "Can't run the test program: $!";
    }
    $conf->cc_clean();
    return \%glibc;
}

sub _evaluate_glibc {
    my ( $self, $conf, $test ) = @_;

    if ( defined $test->{glibc} ) {
        $self->set_result("yes");
        $conf->data->set( glibc => $test->{glibc} );
    }
    else {
        $self->set_result("no");
        $conf->data->set( glibc => undef );
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
