# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

config/auto/env.pm - Probe get/setenv functions

=head1 DESCRIPTION

Determining if the C library has C<setenv()>, C<putenv_s()>, C<unsetenv()> and C<environ>.

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
    $data{description} = q{Probe for C library *env functions};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );
    my @probes = qw(setenv unsetenv putenv_s environ);
    my $args = {};

    for my $f (@probes) {
      $args->{$f} = 0;
      $conf->cc_gen("config/auto/env/test_${f}_c.in");
      eval { $conf->cc_build(); };
      unless ( $@ || $conf->cc_run() !~ /ok/ ) {
        $args->{$f} = 1;
      }
      $conf->cc_clean();
    }

    $self->_evaluate_env($conf, $args);
    return 1;
}

sub _evaluate_env {
    my ($self, $conf, $args) = @_;
    $conf->data->set( %$args );
    my $result = 0;
    my $string = '';

    my @probes = sort keys %$args;
    for my $f (@probes) {
      $conf->debug(" $f => $args->{$f} ");
      $result++ if $args->{$f};
      $string .= "$f," if $args->{$f};
    }
    $string = substr($string,0,-1) if $string;

    if ($result == @probes) {
        $conf->debug(" (all) ");
        $self->set_result('all');
    }
    elsif ($result > 0) {
      # only win32 + msvc is supposed to support _putenv_s
      if ($^O ne 'MSWin32' and $string eq 'environ,setenv,unsetenv') {
        $self->set_result('all');
      } else {
        $self->set_result($string);
      }
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
