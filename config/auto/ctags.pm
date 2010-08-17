# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/ctags - Check whether (exuberant) ctags works

=head1 DESCRIPTION

Determines whether exuberant ctags exists on the system. It is OK when it
doesn't exist.  This also checks if the ctags picked up is emacs ctags which
we B<don't> want to use.  On some systems exuberant ctags is called
C<ctags>, on some C<exuberant-ctags> and on others C<ctags-exuberant>.  This
test tries to work out which one we've got.

=cut

package auto::ctags;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is (exuberant) ctags installed};
    $data{result}      = q{};
    return \%data;
}

my @ctags_variations =
    defined( $ENV{TEST_CTAGS} )
    ? @{ $ENV{TEST_CTAGS} }
    : qw( ctags exuberant-ctags ctags-exuberant exctags );

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n");

    my ($ctags, $has_ctags) =
        _probe_for_ctags($conf, [ @ctags_variations ]);
    $self->_evaluate_ctags($conf, $ctags, $has_ctags);
    return 1;
}

sub _probe_for_ctags {
    my $conf = shift;
    my $variations_ref = shift;
    my ($ctags, $has_ctags);
    while (defined (my $t = shift(@$variations_ref))) {
        my $output = capture_output( $t, '--version' ) || '';
        $conf->debug("$output\n");
        $has_ctags = _probe_for_ctags_output($conf, $output);
        $ctags = $t if $has_ctags;
        last if $has_ctags;
    }
    return ($ctags, $has_ctags);
}

sub _probe_for_ctags_output {
    my ($conf, $output) = @_;
    my $has_ctags = ( $output =~ m/Exuberant Ctags/ ) ? 1 : 0;
    $conf->debug("$has_ctags\n");
    return $has_ctags;
}

sub _evaluate_ctags {
    my ($self, $conf, $ctags, $has_ctags) = @_;
    if ($has_ctags) {
        $conf->data->set( ctags => $ctags );
        $self->set_result( 'yes' );
    }
    else {
        $conf->data->set( ctags => 'ctags' );
        $self->set_result( 'no' );
    }
}

1;

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
