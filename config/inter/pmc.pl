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

  # names of class files for classes/Makefile
  (my $pmc_o = $pmc) =~ s/\.pmc/\$(O)/g;
  # calls to pmc2c.pl for classes/Makefile
  (my $pmc_build = $pmc) =~ s{(.*?)\.pmc ?}{
    # make each pmc depend upon its parent. Only one level PMC hierarchies exist at the moment
    my $parent = "";
    $parent = "default.pmc" if ($1 ne "default");
    "$1.c $1.h: $parent $1.pmc\n\t\$(PMC2C) $1.pmc\n\n$1\$(O): \$(H_FILES)\n\n"
  }eg;
  # build list of libraries for link line in Makfile
  (my $pmc_classes_o = $pmc_o) =~ s/^| / classes\//g;
  
  Configure::Data->set(
    pmc           => $pmc,
    pmc_o         => $pmc_o,
    pmc_build     => $pmc_build,
    pmc_classes_o => $pmc_classes_o
  );
}

1;
