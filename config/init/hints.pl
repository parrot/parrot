package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Loading platform hints file...";

@args=();

sub runstep {
  my $hints = "config/init/hints/" . lc($^O) . ".pl";
  if(-e $hints) {
    do $hints;
    die $@ if $@;
  }
  else {
    print "(no hints) ";
  }
}

1;
