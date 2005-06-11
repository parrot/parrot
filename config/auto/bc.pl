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
    my $has_gnu_bc;
    my $osname =  $Config{osname};

    # This is not really important, let's stick to Linux for now
    my %bc_does_not_hang = ( linux => 1 
                           );

    if ( $bc_does_not_hang{$osname} ) {
      # This seems to work for GNU bc 1.06
      my $answer = capture_output( 'bc', '-v' ) || '';
      $has_gnu_bc = ( $answer =~ m/^bc / &&
                      $answer =~ m/Free Software Foundation/ ) ? 1 : 0;

    } else {
      $has_gnu_bc = 0;
    }

    Configure::Data->set(has_gnu_bc => $has_gnu_bc);
    $Configure::Step::result = $has_gnu_bc ? 'yes' : 'no';
}

1;
