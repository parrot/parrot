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

  # Gather the actual names (with MixedCase) of all of the
  # non-abstract built-in PMCs (which currently means everything but
  # 'default'.)
  my @names;
  PMC: foreach my $pmc_file (split(/ /, $pmc)) {
      my $name;
      open(PMC, "classes/$pmc_file") or die "open classes/$pmc_file: $!";
      while (<PMC>) {
          if (/^pmclass (\w+)(.*)/) {
              $name = $1;
              my $decl = $2;
              $decl .= <PMC> until ($decl =~ s/\{.*//);
              next PMC if $decl =~ /\babstract\b/;
              next PMC if $decl =~ /\bextension\b/;
              last;
          }
      }
      close PMC;
      die "No pmclass declaration found in $pmc_file"
        if ! defined $name;
      push @names, $name;
  }

  Configure::Data->set(
    pmc           => $pmc,
    pmc_names     => join(" ", @names),
    pmc_o         => $pmc_o,
    pmc_build     => $pmc_build,
    pmc_classes_o => $pmc_classes_o
  );
}

1;
