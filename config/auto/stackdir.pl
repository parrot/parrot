package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description = "Determining stack growth direction...";

@args=qw(miniparrot);

sub runstep {

  cc_gen('config/auto/stackdir/test_c.in');
  cc_build();
  my %results=eval cc_run();
  cc_clean();
  
  for(keys %results) {
    Configure::Data->set($_ => $results{$_});
  }
}

1;
