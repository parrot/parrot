package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your compiler supports unaligned pointer access...";

@args=qw();

sub runstep {
  cc_gen('config/auto/alignptrs/test_c.in');
  cc_build();
  my $results=cc_run();
  cc_clean();

  #if there are warnings, they are in $results
  if ($results =~ /^\d+OK$/) {
    Configure::Data->set(
      aligned_ptrs => 0,
    );
  }
  else {
    Configure::Data->set(
      aligned_ptrs => 1,
    );
  }
}

1;
