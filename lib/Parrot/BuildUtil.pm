#
# BuildUtil.pm
#

use strict;

package Parrot::BuildUtil;


BEGIN {
  use Exporter;
  use vars qw(@ISA @EXPORT);
  @ISA = qw(Exporter);
  @EXPORT = qw(&parrot_version);
}


#
# parrot_version()
#

my $parrot_version;
my @parrot_version;

sub parrot_version
{
  if (defined $parrot_version) {
    if (wantarray) { return @parrot_version; }
    else           { return $parrot_version; }
  }

  #
  # Obtain the official version number from the VERSION file.
  #

  open VERSION, "<VERSION" or die "Could not open VERSION file!";
  $parrot_version = <VERSION>;
  chomp $parrot_version;
  close VERSION;

  $parrot_version =~ s/\s+//g;

  @parrot_version = split(/\./, $parrot_version);

  die "Too few components to VERSION file contents: '$parrot_version' (should be 3)!"
    if scalar(@parrot_version) < 3;

  die "Too many components to VERSION file contents: '$parrot_version' (should be 3)!"
    if scalar(@parrot_version) > 3;

  foreach (@parrot_version) {
    die "Illegal version component: '$_' in VERSION file!"
      unless m/^[1-9]*[0-9]$/;
  }

  if (wantarray) { return @parrot_version; }
  else           { return $parrot_version; }
}

1;

