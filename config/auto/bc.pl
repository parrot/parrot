# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/bc - Check whether bc works

=head1 DESCRIPTION

Determines whether bc, the basic calculator, exists on the system.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description = "Determining whether bc is installed...";

@args = qw(verbose);

sub runstep {
    my $a = `bc -v`;
    # This seems to work for GNU bc 1.06
    my $has_bc = ($a =~ m/^bc /) ? 1 : 0;

    Configure::Data->set(has_bc => $has_bc);

    $Configure::Step::result = $has_bc ? 'yes' : 'no';
}

1;
