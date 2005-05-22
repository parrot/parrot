# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/m4 - Check whether GNU m4 works

=head1 DESCRIPTION

Determines whether GNU m4 exists on the system.
It is OK when it doesn't exist. Currently GNU m4 is only used for doublechecking
Parrot m4.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto', 'capture_output';

$description = "Determining whether GNU m4 is installed...";

@args = qw(verbose);

sub runstep {
    # This seems to work for GNU m4 1.4.2
    my $a = capture_output( 'm4', '--version' ) || '';
    my $has_gnu_m4 = ( $a =~ m/^GNU [mM]4 / ) ? 1 : 0;

    Configure::Data->set(has_gnu_m4 => $has_gnu_m4);

    $Configure::Step::result = $has_gnu_m4 ? 'yes' : 'no';
}

1;
