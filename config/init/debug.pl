package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Enabling debugging...";

@args=();

sub runstep {
  if (! Configure::Data->get('debugging')) {
    print "(none requested) ";
  }
  my($ccflags, $ldflags)=Configure::Data->get(qw(ccflags ldflags));
  my($cc_debug, $ld_debug)=Configure::Data->get(qw(cc_debug ld_debug));
  $ccflags .= " $cc_debug";
  $ldflags .= " $ld_debug";

  Configure::Data->set(
                       ccflags => $ccflags,
                       ldflags => $ldflags,
                      );
}

1;
