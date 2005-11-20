# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/byteorder.pl - Native Byteorder

=head1 DESCRIPTION

Computes the native byteorder for Parrot's wordsize.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);


$description="Computing native byteorder for Parrot's wordsize...";

@args=();

sub runstep {
    my $self = shift;
  cc_gen('config/auto/byteorder/test_c.in');
  cc_build();
  my $byteorder=cc_run() or die "Can't run the byteorder testing program: $!";
  cc_clean();

  chomp $byteorder;

  if($byteorder =~ /^1234/) {
    Parrot::Configure::Data->set(
      byteorder => $byteorder,
      bigendian => 0
    );
    $result = 'little-endian';
  }
  elsif($byteorder =~ /^(8765|4321)/) {
    Parrot::Configure::Data->set(
      byteorder => $byteorder,
      bigendian => 1
    );
    $result = 'big-endian';
  }
  else {
    die "Unsupported byte-order [$byteorder]!";
  }
}

1;
