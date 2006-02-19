# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/exp.pm - Experimental Systems

=head1 DESCRIPTION

Asks the user whether to set up experimental networking.

=cut

package inter::exp;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = "Setting up experimental systems...";

@args = qw(ask expnetwork);

sub runstep
{
    my ($self, $conf) = @_;

    my $net = $conf->options->get('expnetwork') || 'n';

    if ($conf->options->get('ask')) {
        $net = prompt("\n\nEnable experimental networking?", $net);
    }

    if ($net =~ /n/i || !$net) {
        $net = 0;
    } else {
        $net = 1;
    }

    $conf->data->set(expnetworking => $net);

    return $self;
}

1;
