package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating Makefiles...";

@args=();

sub runstep {
  genfile('config/gen/makefiles/root.in',      'Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/classes.in',   'classes/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/docs.in',      'docs/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/languages.in', 'languages/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/jako.in',      'languages/jako/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/miniperl.in',  'languages/miniperl/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/scheme.in',    'languages/scheme/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/perl6.in',     'languages/perl6/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/imcc.in',      'languages/imcc/Makefile',
          commentType => '#');
  system("$^X -pi -e's/ -Wwrite-strings//' 	languages/imcc/Makefile");
  system("$^X -pi -e's/ -Wcast-qual//' 	  	languages/imcc/Makefile");
  system("$^X -pi -e's/ -Wno-unused/ -Wunused/' languages/imcc/Makefile");
  genfile('config/gen/makefiles/bf.in',        'languages/bf/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/befunge.in',   'languages/befunge/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/ook.in',       'languages/ook/Makefile',
          commentType => '#');
}

1;
