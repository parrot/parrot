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
  genfile('config/gen/makefiles/brainfuck.in', 'languages/bf/Makefile',
            commentType => '#');
	    }

1;
