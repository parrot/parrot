package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use ExtUtils::Manifest qw(manicheck);

$description="Checking MANIFEST...";

@args=qw(nomanicheck);

sub runstep {
  return if $_[0];

  my(@missing)=manicheck();

  if(@missing) {
     print <<"END";

Ack, some files were missing!  I can't continue running
without everything here.  Please try to find the above
files and then try running Configure again.

END

    exit 1;
  }
}
