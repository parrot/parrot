package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use Config;

$description="Probing for C headers...";

@args=();

sub runstep {
  for(keys %Config) {
    next unless /^i_/;
    Configure::Data->set($_, $Config{$_});
  }
}

1;