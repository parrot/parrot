package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining your minimum pointer alignment...";

@args=qw();

sub runstep {
  return if (defined(Configure::Data->get('ptr_alignment')));
  cc_gen('config/auto/alignptrs/test_c.in');
  cc_build();

  my $align = 999999;

  for my $try_align (64, 32, 16, 8, 4, 2, 1) {
      my $results=cc_run_capture($try_align);
      if ($results =~ /OK/ && $results !~ /align/i) {
        $align = $try_align;
      }
  }

  cc_clean();

  if ($align == 999999) {
    die "Can't determine alignment!\n";
  }
  
  Configure::Data->set(ptr_alignment => $align);
}

1;
