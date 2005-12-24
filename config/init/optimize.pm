# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/optimize.pm - Optimization

=head1 DESCRIPTION

Enables optimization by adding the appropriate flags for the local
platform to the C<CCFLAGS>.
Should this be part of config/inter/progs.pm ? XXX

=cut

package init::optimize;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = "Enabling optimization...";

@args = qw(verbose optimize);

sub runstep
{
    my ($self, $conf) = @_;

    if ($conf->data->get('optimize')) {
        $result = 'yes';
        $conf->data->add(' ', ccflags => "-DDISABLE_GC_DEBUG=1 -DNDEBUG");
    } else {
        $result = 'no';
        print "(none requested) " if $conf->options->get('verbose');
    }
}

1;
