#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.

=head1 NAME

config/auto/perldoc - Perldoc

=head1 DESCRIPTION

Determines if Perldoc exists on the system.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your system has perldoc installed...";

@args=qw(verbose);

sub runstep {
    
    my $a = `perldoc perldoc`;
    my $test;
    unless ($a =~ m/perldoc/) {
	Configure::Data->set(perldoc => 0);
	Configure::Data->set(notperldoc => 1);
    } else {
        $test = 1;
        Configure::Data->set(perldoc => 1);
	Configure::Data->set(notperldoc => 0);
    }

    $Configure::Step::result = $test ? 'yes' : 'no';
}

1;
