package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Loading platform and local hints files...";

@args=();

sub runstep {
  my $hints = "config/init/hints/" . lc($^O) . ".pl";
  my $hints_used = 0;
  if(-e $hints) {
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  $hints = "config/init/hints/local.pl";
  if(-e $hints) {
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  if ($hints_used == 0) {
    print "(no hints) ";
  }
}

1;
