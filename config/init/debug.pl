package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Enabling debugging...";

@args=();

sub runstep {
  if (Configure::Data->get('debugging')) {
    my($ccflags, $linkflags, $ldflags) = 
      Configure::Data->get(qw(ccflags linkflags ldflags));
    my($cc_debug, $link_debug, $ld_debug) = 
      Configure::Data->get(qw(cc_debug link_debug ld_debug));
    $ccflags .= " $cc_debug";
    $linkflags .= " $link_debug";
    $ldflags .= " $ld_debug";

    Configure::Data->set(
                         ccflags => $ccflags,
                         linkflags => $linkflags,
                         ldflags => $ldflags,
                        );
  } else {
    print "(none requested) ";
  }
}

1;
