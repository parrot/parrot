package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description = "Determining some sizes...";

@args=qw(miniparrot);

sub runstep {

    if (defined $_[0]) {
        Configure::Data->set(
          'doublesize'    => 8,
          'numvalsize'    => 8,
          'nvsize'        => 8,
          'floatsize'     => 4,
          'opcode_t_size' => 4,
          'ptrsize'       => 4,
          'intvalsize'    => 4,
          'intsize'       => 4,
          'longsize'      => 4,
          'shortsize'     => 2);
        return;
    }

  cc_gen('config/auto/sizes/test_c.in');
  cc_build();
  my %results=eval cc_run();
  cc_clean();
  
  for(keys %results) {
    Configure::Data->set($_ => $results{$_});
  }
  
  if($results{ptrsize} != $results{intvalsize}) {
    print <<"END";

Hmm, I see your chosen INTVAL isn't the same size as your pointers.  Parrot should
still compile and run, but you may see a ton of warnings.
END
  }
}

1;
