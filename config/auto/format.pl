package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description = "Figuring out what formats should be used for sprintf...";

@args=();

sub runstep {
  my($ivformat, $nvformat, $nvsize);
  my($iv, $nv, $floatsize, $doublesize, $ldsize)=Configure::Data->get(
    qw(iv nv floatsize doublesize hugefloatvalsize)
  );

  if ($iv eq "int") {
    $ivformat = "%d";
  } elsif (($iv eq "long") || ($iv eq "long int")) {
    $ivformat = "%ld";
  } elsif (($iv eq "long long") || ($iv eq "long long int")) {
    $ivformat = "%lld";
  } else {
    die "Configure.pl:  Can't find a printf-style format specifier for type \"$iv\"\n";
  }

  $nvsize = $floatsize;
  if ($nv eq "double") {
    $nvsize = $doublesize;
    $nvformat = "%f";
  } elsif ($nv eq "long double") {
    # Stay way from long double for now (it may be 64 or 80 bits)
    # die "long double not supported at this time, use double.";
    $nvsize = $ldsize;
    $nvformat = "%Lf";
  } else {
    die "Configure.pl:  Can't find a printf-style format specifier for type \"$nv\"\n";
  }

  Configure::Data->set(
    intvalfmt   => $ivformat,
    floatvalfmt => $nvformat,
    nvsize      => $nvsize
  );
}

1;
