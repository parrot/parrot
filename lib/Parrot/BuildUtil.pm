# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/Parrot/BuildUtil.pm - Build Utility

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

use strict;

package Parrot::BuildUtil;


BEGIN {
  use Exporter;
  use vars qw(@ISA @EXPORT);
  @ISA = qw(Exporter);
  @EXPORT = qw(&parrot_version);
}

=item C<parrot_version()>

Returns the current version number for Parrot.

=cut

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

  die "Too few components to VERSION file contents: '$parrot_version' (should be 3 or 4)!"
    if scalar(@parrot_version) < 3;

  die "Too many components to VERSION file contents: '$parrot_version' (should be 3 or 4)!"
    if scalar(@parrot_version) > 4;

  foreach (@parrot_version) {
    die "Illegal version component: '$_' in VERSION file!"
      unless m/^[1-9]*\w*$/;
  }

  if (@parrot_version == 4) {
#    $parrot_version[2] = $parrot_version[2] . "_" . $parrot_version[3];
    $#parrot_version = 3;
  }
  $parrot_version = join('.', @parrot_version);
  if (wantarray) { return @parrot_version; }
  else           { return $parrot_version; }
}

=back

=cut

1;

