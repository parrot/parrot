# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/cgoto.pm - Computed C<goto>

=head1 DESCRIPTION

Determines whether the compiler supports computed C<goto>.

=cut

package auto::cgoto;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    return {
        'description' => 'Does your compiler support computed goto',
        'result'      => '',
    };
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $test = _probe_for_cgoto( $conf );

    $self->_evaluate_cgoto($conf, $test);

    return 1;
}

sub _probe_for_cgoto {
    my $conf = shift;
    my $cgoto = $conf->options->get('cgoto');
    my $test;
    if ( defined $cgoto ) {
        $test = $cgoto;
    }
    else {
        $conf->cc_gen('config/auto/cgoto/test_c.in');
        $test = eval { $conf->cc_build(); 1; } || 0;
        $conf->cc_clean();
    }
    return $test;
}

sub _evaluate_cgoto {
    my ($self, $conf, $test) = @_;
    my $verbose = $conf->options->get('verbose');
    if ($test) {
        $conf->data->set(
            cg_flag => '-DHAVE_COMPUTED_GOTO'
        );
        print " (yes) " if $verbose;
        $self->set_result('yes');
    }
    else {
        $conf->data->set(
            cg_flag   => ''
        );
        print " (no) " if $verbose;
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
