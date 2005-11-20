# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/exp.pl - Experimental Systems

=head1 DESCRIPTION

Asks the user whether to set up experimental networking.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description="Setting up experimental systems...";

@args=qw(ask expnetwork);

sub runstep {
  my $net=$_[1] || 'n';

  if($_[0]) {
    $net=prompt("\n\nEnable experimental networking?", $net) if $_[0];
  }

  if($net =~ /n/i || !$net) {
    $net=0;
  }
  else {
    $net=1;
  }
  
  Parrot::Configure::Data->set(expnetworking => $net);
}

1;
