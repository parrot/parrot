# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/perldoc - Check whether perldoc works

=head1 DESCRIPTION

Determines whether perldoc exists on the system.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description = "Determining whether perldoc is installed...";

@args = qw(verbose);

sub runstep {
    my $a = `perldoc perldoc` || '';
    my $has_perldoc = ($a =~ m/perldoc/) ? 1 : 0;

    Configure::Data->set(has_perldoc => $has_perldoc);

    $Configure::Step::result = $has_perldoc ? 'yes' : 'no';
}

1;
