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
  genfile('config/gen/makefiles/bf.in',        'languages/bf/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/befunge.in',   'languages/befunge/Makefile',
          commentType => '#');
  genfile('config/gen/makefiles/ook.in',       'languages/ook/Makefile',
          commentType => '#');

  # set up docs/Makefile, partly based on the .ops in the root dir

  opendir ROOT, "." or die "opendir .: $!";
  my @ops = sort grep { -f $_ and /\.ops$/ } readdir ROOT;
  closedir ROOT;

  my $pod = join " ", map { my $t = $_; $t =~ s/\.ops$/.pod/; "ops/$t" } @ops;

  Configure::Data->set(pod => $pod);

  genfile('config/gen/makefiles/docs.in',      'docs/Makefile',
          commentType => '#');

  Configure::Data->set(pod => undef);

  open MAKEFILE, ">> docs/Makefile" or die "open >> docs/Makefile: $!";
  
  foreach my $ops (@ops) {
      my $pod = $ops;
      $pod =~ s/\.ops$/.pod/;
      print MAKEFILE <<"EOM";
ops/$pod: ../$ops
	perldoc -u ../$ops > ops/$pod
EOM
  }

  close MAKEFILE
}

1;
