package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating Makefiles...";

@args=();

sub runstep {
  genfile('config/gen/makefiles/root.in',      'Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/classes.in',   'classes/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/imcc.in',      'imcc/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/languages.in', 'languages/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/jako.in',      'languages/jako/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/miniperl.in',  'languages/miniperl/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/scheme.in',    'languages/scheme/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/m4.in',        'languages/m4/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/perl6.in',     'languages/perl6/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/bf.in',        'languages/bf/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/befunge.in',   'languages/befunge/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/ook.in',       'languages/ook/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/urm.in',       'languages/urm/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/tcl.in',       'languages/tcl/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/dynclasses.in',   'dynclasses/Makefile',
          commentType => '#', replace_slashes => 1);
  genfile('config/gen/makefiles/dynoplibs.in',   'dynoplibs/Makefile',
          commentType => '#', replace_slashes => 1);


  # set up docs/Makefile, partly based on the .ops in the root dir

  opendir OPS, "ops" or die "opendir ops: $!";
  my @ops = sort grep { /\.ops$/ } readdir OPS;
  closedir OPS;

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
ops/$pod: ../ops/$ops
	perldoc -u ../ops/$ops > ops/$pod
EOM
  }

  close MAKEFILE
}

1;
