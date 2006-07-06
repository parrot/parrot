# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/socklen_t.pm - Is there a socklen_t

=head1 DESCRIPTION

Determines whether there is a socklen_t

=cut

package auto::socklen_t;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Config;

use Parrot::Configure::Step ':auto';

our $description = 'Asking Perl5 whether there is socklen_t';
our @args = qw();

sub runstep
{
    my ($self, $conf) = @_;

    my $verbose = $conf->options->get('verbose');

    my $d_socklen_t = $Config{d_socklen_t} || $conf->data->get('has_socklen_t');
    my $has_socklen_t = ( $d_socklen_t && $d_socklen_t ne 'undef' ) ? 1 : 0; 
    $self->set_result( $has_socklen_t ? 'yes' : 'no' );
    $conf->data->set(
        has_socklen_t   => $has_socklen_t,
    );
    
    return $self;
}

1;
