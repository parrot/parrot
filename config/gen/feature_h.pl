package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating feature.h...";

@args=();

sub runstep {
  genfile('config/gen/feature_h/feature_h.in', 'include/parrot/feature.h',
          commentType => '/*',
          ignorePattern => 'PARROT_CONFIG_DATE',
  	  feature_file => 1);

}

1;
