# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/env.pm - System Environment

=head1 DESCRIPTION

Determining if the C library has C<setenv()> and C<unsetenv()>.

More information about these functions can be found at
L<http://www.gnu.org/software/libc/manual/html_node/Environment-Access.html>,
among other locations.

=cut

package auto::env;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your C library have setenv / unsetenv};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );

    my ( $setenv, $unsetenv ) = ( 0, 0 );

    $conf->cc_gen('config/auto/env/test_setenv_c.in');
    eval { $conf->cc_build(); };
    unless ( $@ || $conf->cc_run() !~ /ok/ ) {
        $setenv = 1;
    }
    $conf->cc_clean();
    $conf->cc_gen('config/auto/env/test_unsetenv_c.in');
    eval { $conf->cc_build(); };
    unless ( $@ || $conf->cc_run() !~ /ok/ ) {
        $unsetenv = 1;
    }
    $conf->cc_clean();

    $self->_evaluate_env($conf, $setenv, $unsetenv);

    return 1;
}

sub _evaluate_env {
    my ($self, $conf, $setenv, $unsetenv) = @_;
    $conf->data->set(
        setenv   => $setenv,
        unsetenv => $unsetenv
    );

    if ( $setenv && $unsetenv ) {
        $conf->debug(" (both) ");
        $self->set_result('both');
    }
    elsif ($setenv) {
        $conf->debug(" (setenv) ");
        $self->set_result('setenv');
    }
    elsif ($unsetenv) {
        $conf->debug(" (unsetenv) ");
        $self->set_result('unsetenv');
    }
    else {
        $conf->debug(" (no) ");
        $self->set_result('no');
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
