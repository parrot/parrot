package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating CFLAGS...";

@args=();

sub runstep {
  genfile('config/gen/cflags/root.in',      'CFLAGS',
          commentType => '#');

  open(CFLAGS, ">> CFLAGS") or die "open >> CFLAGS: $!";

  if (Configure::Data->get('cpuarch') =~ /sun4|sparc64/) {
      print CFLAGS <<"EOF";
jit_cpu.c -{-Wcast-align}        # lots of noise!
nci.c     -{-Wstrict-prototypes} # lots of noise!
EOF
  }

  close CFLAGS
}

1;
