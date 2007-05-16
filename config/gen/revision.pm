# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/revision.pm - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's SVN revision.  In a release, there are no .svn directories,
so this field is empty.

=cut

package gen::revision;

use strict;
use warnings;
use vars qw($description $result);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Revision;

$description = "Determining Parrot's revision";

sub runstep {
    my ( $self, $conf ) = @_;

    my $revision = $Parrot::Revision::current;

    $conf->data->set(
        revision    => $revision,
    );

    if ( $revision >= 1 ) {
        $self->set_result("r$revision");
    }
    else {
        $self->set_result("done");
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
