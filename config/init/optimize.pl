package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Enabling optimization...";

@args=();

sub runstep {
  if (Configure::Data->get('optimize')) {
    my($ccflags, $optimize) =
      Configure::Data->get(qw(ccflags optimize));
    $ccflags .= " $optimize";

    Configure::Data->set(
                         ccflags => $ccflags,
                        );
  }
  else {
    print "(none requested) ";
  }
}

1;
