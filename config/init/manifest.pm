# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/manifest.pm - MANIFEST Check

=head1 DESCRIPTION

Uses C<ExtUtils::Manifest> to check that the distribution is complete.

=cut

package init::manifest;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;
use ExtUtils::Manifest qw(manicheck);

$description = 'Checking MANIFEST';

@args = qw(nomanicheck);

sub runstep
{
    my ($self, $conf) = @_;

    if ($conf->options->get('nomanicheck')) {
        $self->set_result('skipped');
        return $self;
    }

    my @missing = ExtUtils::Manifest::manicheck();

    if (@missing) {
        print <<"END";

Ack, some files were missing!  I can't continue running
without everything here.  Please try to find the above
files and then try running Configure again.

END

        return;
    }

    return $self;
}

1;
