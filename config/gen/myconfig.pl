package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Recording this configuration in myconfig...";

@args=();

sub runstep {
  genfile('config/gen/myconfig/myconfig.in',      'myconfig');
}

1;
