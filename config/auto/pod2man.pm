# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/pod2man - Check whether pod2man works

=head1 DESCRIPTION

Determines whether F<pod2man> exists on the system and where.

More specifically, we look for the F<pod2man> associated with the
instance of F<perl> with which F<Configure.pl> was invoked.

=cut

package auto::pod2man;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is pod2man installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $cmd = $conf->data->get_p5('scriptdirexp') . q{/pod2man};
    my $content = capture_output("$cmd docs/parrot.pod") || undef;

    return 1 unless defined( $self->_initial_content_check($conf, $content) );
    $conf->data->set(
        has_pod2man => 1,
        pod2man => $cmd
    );
    return 1;
}

sub _initial_content_check {
    my $self = shift;
    my ($conf, $content) = @_;
    if (! defined $content) {
        $conf->data->set(
            has_pod2man => 0,
        );
        $self->set_result('no');
        return;
    }
    else {
        $self->set_result('yes');
        return 1;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
