package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Loading platform and local hints files...";

@args = qw( cc );

sub runstep {
  my $hints = "config/init/hints/" . lc($^O) . ".pl";
  my $hints_used = 0;
  print "[ ";
  if(-e $hints) {
    print "$hints ";
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  $hints = "config/init/hints/local.pl";
  if(-e $hints) {
    print "$hints ";
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  if ($hints_used == 0) {
    print "(no hints) ";
  }
  print "]";
}

1;
