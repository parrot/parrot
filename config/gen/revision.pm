# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/revision.pm - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's SVN revision.  In a release, there are no .svn directories,
so this field is empty.

=cut

package gen::revision;

use strict;
use vars qw($description $result);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Revision;

$description = "Determining Parrot's revision";

sub runstep
{
    my ($self, $conf) = @_;

    my $revision = $Parrot::Revision::current;
    my $entries  = $Parrot::Revision::svn_entries;

    $conf->data->set(
        revision    => $revision,
        SVN_ENTRIES => $entries
    );

    if ($revision >= 1) {
        $self->set_result("r$revision");
    } else {
        $self->set_result("done");
    }

    return $self;
}

1;
