package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining your minimum pointer alignment...";

@args=qw();

sub runstep {
  cc_gen('config/auto/alignptrs/test_c.in');
  cc_build();
  my $results=cc_run();
  cc_clean();

  #if there are warnings, they are in $results
  
  my $align = 999999;
  
  for my $result (split /\n/, $results) {
    $align = $result if ($result =~ /^\d+$/ &&$result < $align);
  }
  
  if ($align == 999999) {
    die "Can't determine alignment!\n";
  }
  
  Configure::Data->set(ptr_alignment => $align);
}

1;
