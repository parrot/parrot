package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what pmc files should be compiled in...';

@args=qw(ask pmc);

sub runstep {
  my @pmc=(
    sort 
    map  { m{\./classes/(.*)} }
    glob "./classes/*.pmc"
  );
  
  
  my $pmc=join ' ', @pmc;
  
  $pmc=$_[1] if defined $_[1];
  
  if($_[0]) {
  print <<"END";


The following PMC files are available:
  @pmc
END
    {
      $pmc=prompt('Which PMC files would you like?', $pmc);
    }
  }

  (my $pmc_o = $pmc) =~ s/\.pmc/\$(O)/g;
  (my $pmc_build = $pmc) =~ s/(.*?)\.pmc ?/$1.c $1.h: $1.pmc\n\t\$(PMC2C) $1.pmc\n\n$1\$(O): \$(H_FILES)\n\n/g;
  
  Configure::Data->set(
    pmc       => $pmc,
    pmc_o     => $pmc_o,
    pmc_build => $pmc_build
  );
}

1;
