package Configure::Step;

use strict;
use vars qw($description @args);
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
  
  Configure::Data->set(expnetworking => $net);
}

1;