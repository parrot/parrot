package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating config.h...";

@args=();

sub runstep {
  genfile('config/gen/libparrot_def/libparrot_def.in', 'libparrot.def');
}

1;
