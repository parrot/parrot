# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/bc.pl - Check whether GNU bc works

=head1 DESCRIPTION

Determines whether GNU bc, the basic calculator, exists on the system.
It is OK when it doesn't exist. Currently GNU bc is only used for doublechecking
Parrot bc.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto', 'capture_output';

$description = "Determining whether GNU bc is installed...";

@args = qw(verbose);

sub runstep {
    # This seems to work for GNU bc 1.06
    my $a = capture_output( 'bc', '-v' ) || '';
    my $has_gnu_bc = ( $a =~ m/^bc / &&
                       $a =~ m/Free Software Foundation/ ) ? 1 : 0;

    Configure::Data->set(has_gnu_bc => $has_gnu_bc);

    $Configure::Step::result = $has_gnu_bc ? 'yes' : 'no';
}

1;
