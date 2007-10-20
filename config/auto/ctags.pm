# Copyright (C) 2005-2007, The Perl Foundation.
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

use base qw(Parrot::Configure::Step::Base);

use Config;
use Parrot::Configure::Step ':auto', 'capture_output';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining whether (exuberant) ctags is installed};
    $data{args}        = [ qw( verbose ) ];
    $data{result}      = q{};
    return \%data;
}

our $verbose;

sub runstep {
    my ( $self, $conf ) = @_;

    $verbose = $conf->options->get( 'verbose' );
    print $/ if $verbose;

    my @ctags_variations = qw( ctags exuberant-ctags ctags-exuberant );
    for my $ctags ( @ctags_variations ) {
        my $output = capture_output( $ctags, '--version' ) || '';
        print $output, "\n" if $verbose;
        my $has_ctags = ( $output =~ m/Exuberant Ctags/ ) ? 1 : 0;
        print $has_ctags, "\n" if $verbose;

        if ( $has_ctags ) {
            $conf->data->set( ctags => $ctags );
            $self->set_result( 'yes' );
            return 1;
        }
    }

    # if we get to here, we didn't find a decent ctags; so just set it to
    # ctags so that the Makefile is happy
    $conf->data->set( ctags => 'ctags' );
    $self->set_result( 'no' );

    return 1;
}

1;

=head AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
