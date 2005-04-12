# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id: revision.pl 7804 2005-04-11 14:12:16Z jrieks $

=head1 NAME

config/gen/revision.pl - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's revision.

=cut

package Configure::Step;

use strict;
use vars qw($description);
use Parrot::Revision;

$description="Determining Parrot's revision";

sub runstep {
    my $revision = $Parrot::Revision::current;

    Configure::Data->set(
	revision => $revision,
    );
    $Configure::Step::result = "r$revision";
}

1;
