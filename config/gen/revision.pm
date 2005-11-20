# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: revision.pl 7804 2005-04-11 14:12:16Z jrieks $

=head1 NAME

config/gen/revision.pl - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's SVN revision.  In a release, there
are no .svn directories, so this field is empty.

=cut

package Configure::Step;

use strict;
use vars qw($description);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Revision;

$description = "Determining Parrot's revision";

sub runstep {
    my $revision = $Parrot::Revision::current;
    my $entries  = $Parrot::Revision::svn_entries;

    Parrot::Configure::Data->set(
	revision => $revision,
	SVN_ENTRIES => $entries
    );
    
    if ($revision >= 1) {
	$Configure::Step::result = "r$revision";
    } else {
	$Configure::Step::result = "done";
    }
}

1;
