package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating Makefiles...";

@args=();

sub runstep {
  genfile('config/gen/makefiles/root.in',      'Makefile', '#');
  genfile('config/gen/makefiles/classes.in',   'classes/Makefile', '#');
  genfile('config/gen/makefiles/docs.in',      'docs/Makefile', '#');
  genfile('config/gen/makefiles/languages.in', 'languages/Makefile', '#');
  genfile('config/gen/makefiles/jako.in',      'languages/jako/Makefile', '#');
  genfile('config/gen/makefiles/miniperl.in',  'languages/miniperl/Makefile', '#');
  genfile('config/gen/makefiles/scheme.in',    'languages/scheme/Makefile', '#');
  genfile('config/gen/makefiles/perl6.in',     'languages/perl6/Makefile', '#');
  genfile('config/gen/makefiles/imcc.in',      'languages/imcc/Makefile', '#');
}

1;
