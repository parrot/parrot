# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/inline.pm - Inline Compiler Support

=head1 DESCRIPTION

Determines whether the compiler supports C<inline>.

=cut

package auto::inline;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your compiler support inline};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $inline = $conf->options->get(qw(inline));
    if ( defined $inline ) {
        $conf->data->set( inline => $inline );
        return 1;
    }

    my $test = $self->_first_probe_for_inline($conf);
    unless ($test) {
        $test = $self->_second_probe_for_inline($conf, $test);
    }

    $self->_evaluate_inline($conf, $test);
    return 1;
}

sub _first_probe_for_inline {
    my $self = shift;
    my $conf = shift;
    my $test;
    $conf->cc_gen('config/auto/inline/test1_c.in');
    eval { $conf->cc_build(); };
    if ( !$@ ) {
        $test = $conf->cc_run();
        chomp $test if $test;
    }
    $conf->cc_clean();
    return $test;
}

sub _second_probe_for_inline {
    my $self = shift;
    my $conf = shift;
    my $test = shift;
    if ( !$test ) {
        $conf->cc_gen('config/auto/inline/test2_c.in');
        eval { $conf->cc_build(); };
        if ( !$@ ) {
            $test = $conf->cc_run();
            chomp $test if $test;
        }
        $conf->cc_clean();
    }
    return $test;
}

sub _evaluate_inline {
    my ($self, $conf, $test) = @_;
    if ($test) {
        $conf->debug(" ($test) ");
        $self->set_result('yes');
    }
    else {
        $conf->debug(" no ");
        $self->set_result('no');
        $test = '';
    }
    $conf->data->set( inline => $test );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
